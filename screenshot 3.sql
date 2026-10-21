SELECT COUNT(*) AS history_count
FROM ShipmentStatusHistory
WHERE shipmentID = 1;

UPDATE Shipment
SET shipmentStatus = 'QUOTED'
WHERE shipmentID = 1;

SELECT COUNT(*) AS history_count
FROM ShipmentStatusHistory
WHERE shipmentID = 1;