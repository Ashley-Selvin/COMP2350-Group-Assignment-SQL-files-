# COMP2350-Group-Assignment-SQL-files-

### Screenshot 1 — Verification of Trigger Creation

The `SHOW TRIGGERS` statement confirms that both `Prevent_Terminal_Status_Change` and `Record_Shipment_Status` have been successfully created in the `comp2350_assignment2` database. The first trigger enforces the restriction on changing terminal shipment statuses, while the second automatically records shipment status changes in `ShipmentStatusHistory`.

### Screenshot 2 — Successful Status Change and History Recording

Shipment 1 was successfully updated from `DRAFT` to `QUOTED`. The corresponding record in `ShipmentStatusHistory` confirms that the `Record_Shipment_Status` trigger automatically captured the shipment ID, previous status, new status, user responsible for the change, and timestamp. This verifies that the trigger records valid status transitions.

### Screenshot 3 — No History Record for an Unchanged Status

Shipment 1 was updated while its status was already `QUOTED`. The update did not change the stored status, and the number of history records remained unchanged. This confirms that `Record_Shipment_Status` only records actual status changes and does not generate duplicate history entries for updates that leave the status unchanged.

### Screenshot 4 — Rejection of a Status Change from DELIVERED

An attempt to change shipment 15 from `DELIVERED` to `CANCELLED` was rejected by the `Prevent_Terminal_Status_Change` trigger. The resulting error message identified the BR16 restriction. A subsequent query confirmed that the shipment remained `DELIVERED`, demonstrating that the trigger prevents changes to terminal shipment statuses.

### Screenshot 5 — Successful Cancellation of a Non-Terminal Shipment

Shipment 5 was successfully updated from `BOOKED` to `CANCELLED`. The corresponding entry in `ShipmentStatusHistory` recorded the previous and new statuses, confirming that the history trigger operates alongside the terminal-status restriction. This demonstrates that cancellation is permitted when the shipment has not already reached a terminal status.

### Screenshot 6 — Rejection of a Status Change from CANCELLED

An attempt to change shipment 5 from `CANCELLED` back to `BOOKED` was rejected by the `Prevent_Terminal_Status_Change` trigger. The BR16 error message confirmed that a cancelled shipment cannot transition to another status. This verifies that the trigger enforces the terminal-status restriction for both `DELIVERED` and `CANCELLED` shipments.
