-- Adding instrument type auction for MSECM
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('MSECM', 't', '100', 12, 111111111111100, 333333333333100, 'MSECM', 'MSE','DEFAULT', 'U', 'f', 'SUPERADMIN');

-- Order type and Validity Settings for MSECM
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECM','U','Market','DAY','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECM','U','Market','IOC','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECM','U','Limit','DAY','SUPERADMIN');
insert into ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT','MSECM','U','Limit','IOC','SUPERADMIN');
