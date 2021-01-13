INSERT INTO ${refmaster}.exchange_segment_settings VALUES('MSECM', 't', '100', 12, 111111111111100, 333333333333100, 'MSECM', 'MSE',          'DEFAULT', 'C', 'f', 'SUPERADMIN');
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('MSEFO', 't', '100', 12, 111111111111100, 333333333333100, 'MSEFO', 'MSE',          'DEFAULT', 'F', 'f', 'SUPERADMIN');
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('MSEFO', 't', '100', 12, 111111111111100, 333333333333100, 'MSEFO', 'MSE',          'DEFAULT', 'O', 'f', 'SUPERADMIN');
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('MSECD', 't', '100', 12, 111111111111100, 333333333333100, 'MSECD', 'MSE',          'DEFAULT', 'F', 'f', 'SUPERADMIN');
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('MSECD', 't', '100', 12, 111111111111100, 333333333333100, 'MSECD', 'MSE',          'DEFAULT', 'O', 'f', 'SUPERADMIN');

-- Order type and Validity Settings for MSECM
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECM','C','Market','DAY','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECM','C','Market','IOC','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECM','C','Limit','DAY','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECM','C','Limit','IOC','SUPERADMIN');

-- Order type and Validity Settings for MSEFO
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSEFO','F','Market','DAY','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSEFO','F','Market','IOC','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSEFO','F','Limit','DAY','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSEFO','F','Limit','IOC','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSEFO','O','Market','IOC','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSEFO','O','Market','DAY','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSEFO','O','Limit','IOC','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSEFO','O','Limit','DAY','SUPERADMIN');

-- Order type and Validity Settings for MSECD
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECD','F','Market','DAY','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECD','F','Market','IOC','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECD','F','Limit','DAY','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECD','F','Limit','IOC','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECD','O','Market','IOC','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECD','O','Market','DAY','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECD','O','Limit','IOC','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECD','O','Limit','DAY','SUPERADMIN');
