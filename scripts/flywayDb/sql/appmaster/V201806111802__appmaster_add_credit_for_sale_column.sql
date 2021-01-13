ALTER TABLE ${appmaster}.user_deposit ADD COLUMN credit_for_sale bigint DEFAULT 0;
ALTER TABLE ${appmaster}.user_deposit_history ADD COLUMN credit_for_sale bigint DEFAULT 0;
