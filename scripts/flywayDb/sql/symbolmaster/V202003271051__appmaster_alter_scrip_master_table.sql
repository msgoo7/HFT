-- Add new column in scrip master table "Cash Unique Key"

ALTER TABLE appmaster.scrip_master ADD COLUMN cash_unique_key character varying(20) default '';

-- Updating column data type to Bigint

ALTER TABLE appmaster.scrip_master ALTER COLUMN low_price_range SET DATA TYPE bigint;

ALTER TABLE appmaster.scrip_master ALTER COLUMN high_price_range SET DATA TYPE bigint;
