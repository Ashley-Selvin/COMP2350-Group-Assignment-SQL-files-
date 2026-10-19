-- Trigger 1: Prevent Terminal Status Change 
DELIMITER $$
USE COMP2350-group-assignment
CREATE TRIGGER Prevent_Terminal_Status_Change
BEFORE UPDATE ON Shipment 
FOR EACH ROW
BEGIN 
	IF OLD.shipmentStatus IN ('DELIVERED', 'CANCELLED')
		AND NEW.shipmentStatus <> OLD.shipmentStatus THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'BR16: Cannot change the status of a DELIVERED or CANCELLED shipment';
	END IF;
END$$

DELIMITER ;

-- Trigger 2: Record Shipment Status 
DELIMITER $$

CREATE TRIGGER Record_Shipment_Status 
AFTER UPDATE ON Shipment 
FOR EACH ROW 
BEGIN 
	IF OLD.shipmentStatus <> NEW.shipmentStatus THEN
		INSERT INTO ShipmentStatusHistory
			(shipmentID, oldStatus, changedBy, changeReason)
		VALUES
			(NEW.shipmentID,
            OLD.shipmentStatus, 
            NEW.shipmentStatus,
            CURRENT_USER(),
            NULL);
	END IF;
END $$
DELIMITER ;


    
    
    
    
    
    
    
    