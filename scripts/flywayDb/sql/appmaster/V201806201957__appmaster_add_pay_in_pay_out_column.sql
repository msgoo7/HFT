ALTER TABLE ${appmaster}.user_deposit 
ADD COLUMN pay_in bigint DEFAULT 0,
ADD COLUMN pay_out bigint DEFAULT 0;

ALTER TABLE ${appmaster}.user_deposit_history 
ADD COLUMN pay_in bigint DEFAULT 0,
ADD COLUMN pay_out bigint DEFAULT 0;
