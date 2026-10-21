SELECT
    shipmentID,
    oldStatus,
    newStatus,
    changedBy,
    changedAt
FROM ShipmentStatusHistory
WHERE shipmentID = 1;