-- TEST 1: A valid status change creates a history record 
-- Check initial status and history
SELECT shipmentID, shipmentStatus
FROM Shipment
WHERE shipmentID = 1;

SELECT COUNT(*) AS historyBefore
FROM ShipmentStatusHistory
WHERE shipmentID = 1;

-- Change status
UPDATE Shipment 
SET shipmentStatus = 'QUOTED'
WHERE shipmentID = 1;

-- Verify new status 
SELECT shipmentID, shipmentStatus
FROM Shipment
WHERE shipmentID = 1;

-- Verify history record 
SELECT shipmentID, oldStatus, newStatus, changedBy, changedAt, changeReason
FROM ShipmentStatusHistory
ORDER BY changedAt;

-- TEST 2: An unchanged status creates no history record
SELECT COUNT(*) AS historyBefore
FROM ShipmentStatusHistory
WHERE shipmentID = 1;

SELECT COUNT(*) AS historyAfter 
FROM ShipmentStatusHistory
WHERE shipmentID = 1;

-- TEST 3: A delivered shipment cannot change status
SELECT shipmentID, shipmentStatus
FROM Shipment
WHERE shipmentID = 15;

UPDATE Shipment 
SET shipmentStatus = 'CANCELLED'
WHERE shipmentID = 15;

-- TEST 4: A cancelled shipment cannot change status
-- Record initial status 
SELECT shipmentID, shipmentStatus
FROM Shipment 
WHERE shipmentID = 5;

-- Establish the CANCELLED test state 
UPDATE Shipment 
SET shipmentStatus = 'CANCELLED'
WHERE shipmentID = 5;

-- Verify that cancellation was recorded 
SELECT shipmentID, oldStatus, newStatus, changedBy, changedAt
FROM ShipmentStatusHistory
WHERE shipmentID = 5
ORDER BY changedAt;

-- Attempt an invalid change (run separately)
UPDATE Shipment
SET shipmentStatus = 'BOOKED'
WHERE shipmentID = 5;








 