-- Alter user_bank_info & user_bank_info_history table and change account number from bigint to varchar --

ALTER TABLE ${appmaster}.user_bank_info
  ALTER COLUMN account_number TYPE VARCHAR;

ALTER TABLE ${appmaster}.user_bank_info_history
  ALTER COLUMN account_number TYPE VARCHAR;

-- Alter online_transaction_summary & online_transaction_summary_history table and change account number from bigint to varchar --

ALTER TABLE ${appmaster}.online_transaction_summary
  ALTER COLUMN account_number TYPE VARCHAR;

ALTER TABLE ${appmaster}.online_transaction_summary_history
  ALTER COLUMN account_number TYPE VARCHAR;
