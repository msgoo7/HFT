ALTER TABLE ${refmaster}.exchange_segment_settings ADD COLUMN instrument character varying,
                                                   ADD COLUMN is_disclosed_quantity bool,
                                                   ADD COLUMN updated_by character varying;

ALTER TABLE ${refmaster}.exchange_segment_settings DROP CONSTRAINT exchange_segment_settings_pkey ; 


UPDATE ${refmaster}.exchange_segment_settings set instrument = 'C', is_disclosed_quantity = 'f', updated_by = 'SUPERADMIN' where exchange = 'NSECM';
UPDATE ${refmaster}.exchange_segment_settings set instrument = 'F', is_disclosed_quantity = 'f', updated_by = 'SUPERADMIN' where exchange = 'NSEFO';
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('NSEFO', 't', '100', 12, 111111111111100, 333333333333100, 'NSEFO', 'NSE', 'DEFAULT', 'O', 'f', 'SUPERADMIN');
UPDATE ${refmaster}.exchange_segment_settings set instrument = 'F', is_disclosed_quantity = 'f', updated_by = 'SUPERADMIN' where exchange = 'NSECDS';
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('NSECDS', 't', '100', 12, 1111111111111021, 3333333333333021, 'NSECDS', 'NSE', 'DEFAULT', 'O', 'f', 'SUPERADMIN');
UPDATE ${refmaster}.exchange_segment_settings set instrument  = 'C', is_disclosed_quantity = 'f', updated_by = 'SUPERADMIN' where exchange = 'BSECM';
UPDATE ${refmaster}.exchange_segment_settings set instrument = 'F', is_disclosed_quantity = 'f', updated_by = 'SUPERADMIN' where exchange = 'BSEFO';
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('BSEFO', 't', '021', 13, 1111111111111021, 3333333333333021, 'BSEFO', 'BSE', 'DEFAULT', 'O', 'f', 'SUPERADMIN');
UPDATE ${refmaster}.exchange_segment_settings set instrument = 'F', is_disclosed_quantity = 'f', updated_by = 'SUPERADMIN' where exchange = 'BSECDS';
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('BSECDS', 't', '021', 13, 1111111111111021, 3333333333333021, 'BSECDS', 'BSE', 'DEFAULT', 'O', 'f', 'SUPERADMIN');
UPDATE ${refmaster}.exchange_segment_settings set instrument = 'F', is_disclosed_quantity = 'f', updated_by = 'SUPERADMIN' where exchange = 'BSEINX';
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('BSEINX', 't', '006', 13, 0, 0, 'BSEINX', 'BSE', 'DEFAULT', 'O', 'f', 'SUPERADMIN');
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('ESM', 'f', '', 12, 0, 0, 'ESM', 'ESM', 'DEFAULT', 'C', 'f', 'SUPERADMIN');
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('ESM', 'f', '', 12, 0, 0, 'ESM', 'ESM', 'DEFAULT', 'F', 'f', 'SUPERADMIN');
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('ESM', 'f', '', 12, 0, 0, 'ESM', 'ESM', 'DEFAULT', 'O', 'f', 'SUPERADMIN');

ALTER TABLE ${refmaster}.exchange_segment_settings ADD CONSTRAINT exchange_segment_settings_pkey PRIMARY KEY (broker, exchange, instrument);
