UPDATE Shipment
SET shipmentStatus = 'CANCELLED'
WHERE shipmentID = 5;

SELECT shipmentID, oldStatus, newStatus, changedAt
FROM ShipmentStatusHistory
WHERE shipmentID = 5
ORDER BY changedAt DESC;