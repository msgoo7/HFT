ALTER TABLE ${appmaster}.indices ALTER COLUMN close_price type bigint;
ALTER TABLE ${appmaster}.scrip_master ALTER COLUMN close_price type bigint;
ALTER TABLE ${appmaster}.scrip_master ALTER COLUMN security_id1 type bigint;
ALTER TABLE ${appmaster}.scrip_master ALTER COLUMN security_id2 type bigint;
