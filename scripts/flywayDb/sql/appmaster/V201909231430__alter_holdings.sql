ALTER TABLE ${appmaster}.holdings
DROP COLUMN holding_type ,
DROP COLUMN pending_quantity ,
DROP COLUMN sold_quantity ,
ADD COLUMN t1_quantity bigint NOT NULL DEFAULT 0;

ALTER TABLE ${appmaster}.holdings_history
DROP COLUMN holding_type ,
DROP COLUMN pending_quantity ,
DROP COLUMN sold_quantity ,
ADD COLUMN t1_quantity bigint NOT NULL DEFAULT 0;
