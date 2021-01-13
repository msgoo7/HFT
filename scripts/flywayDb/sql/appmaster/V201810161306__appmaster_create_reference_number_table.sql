CREATE TABLE ${appmaster}.reference_number_table
(
  exchange_value char varying NOT NULL,
  ref_num bigint NOT NULL,
  PRIMARY KEY ( exchange_value )
);

INSERT INTO ${appmaster}.reference_number_table VALUES ('SGX_scrip_ref', -1) ; 
