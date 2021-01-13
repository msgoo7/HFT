-- Table for Storing Users Bank Information --

CREATE TABLE ${appmaster}.user_bank_info
(
  bank_unique_id BIGSERIAL NOT NULL,
  client_code VARCHAR NOT NULL,
  bank_name VARCHAR NOT NULL,
  bank_address VARCHAR NOT NULL,
  account_number BIGINT NOT NULL,
  ifsc_code VARCHAR NOT NULL,
  effective_timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  updated_by VARCHAR,
  PRIMARY KEY( bank_unique_id ),
  FOREIGN KEY ( client_code ) REFERENCES
  ${appmaster}.unique_id( id )
  ON DELETE CASCADE
);

CREATE TABLE ${appmaster}.user_bank_info_history
(
  bank_unique_id BIGSERIAL NOT NULL,
  client_code VARCHAR NOT NULL,
  bank_name VARCHAR NOT NULL,
  bank_address VARCHAR NOT NULL,
  account_number BIGINT NOT NULL,
  ifsc_code VARCHAR NOT NULL,
  effective_timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  updated_by VARCHAR
);

-- Alter user_deposit & user_deposit_history table and add blocked_pay_out column --

ALTER TABLE ${appmaster}.user_deposit
  ADD COLUMN blocked_pay_out BIGINT DEFAULT 0;

ALTER TABLE ${appmaster}.user_deposit_history
  ADD COLUMN blocked_pay_out BIGINT DEFAULT 0;

