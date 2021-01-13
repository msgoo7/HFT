-- New Columns to be added for MCX in scrip_master
-- contract_start_date : First trading date of the product
-- contract_end_date : Last trading date of the product
-- tendor_start_date : First Date from which delivery intention shall be
-- accepted for the product
-- tendor_end_date : Last date upto which delivery intention shall be accepted
-- for the product

ALTER table ${appmaster}.scrip_master 
ADD COLUMN contract_start_date int default 0,
ADD COLUMN contract_end_date int default 0,
ADD COLUMN tendor_start_date int default 0,
ADD COLUMN tendor_end_date int default 0;
