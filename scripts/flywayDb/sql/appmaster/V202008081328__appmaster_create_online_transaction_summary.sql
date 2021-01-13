-- Drop Old Table for Storing Online transaction Summary --

DROP TABLE ${appmaster}.online_transaction_summary;

-- Table for Storing Online transaction Summary --

CREATE TABLE ${appmaster}.online_transaction_summary
(
  client_code VARCHAR NOT NULL,
  client_name VARCHAR,
  start_time TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  acc_deposit_type SMALLINT,
  amount BIGINT NOT NULL,
  bank_name VARCHAR,
  transfer_status SMALLINT,
  ut_transaction_id VARCHAR NOT NULL,
  account_number BIGINT,
  bank_transaction_id VARCHAR,
  remark VARCHAR,
  last_updated_time TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  complete_time TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  PRIMARY KEY( ut_transaction_id ),
  FOREIGN KEY ( client_code ) REFERENCES
  ${appmaster}.unique_id( id )
  ON DELETE CASCADE
);


CREATE TABLE ${appmaster}.online_transaction_summary_history
(
  client_code VARCHAR NOT NULL,
  client_name VARCHAR,
  start_time TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  acc_deposit_type SMALLINT,
  amount BIGINT NOT NULL,
  bank_name VARCHAR,
  transfer_status SMALLINT,
  ut_transaction_id VARCHAR NOT NULL,
  account_number BIGINT,
  bank_transaction_id VARCHAR,
  remark VARCHAR,
  last_updated_time TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  complete_time TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
);
