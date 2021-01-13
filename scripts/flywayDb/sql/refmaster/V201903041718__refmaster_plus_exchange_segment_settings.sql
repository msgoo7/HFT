INSERT INTO ${refmaster}.exchange_segment_settings VALUES('PLUS', 'f', '100', 12, 0, 0, 'PLUS', 'PLUS', 'DEFAULT', 'C', 'f', 'SUPERADMIN');
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('PLUS', 'f', '100', 12, 0, 0, 'PLUS', 'PLUS', 'DEFAULT', 'F', 'f', 'SUPERADMIN');

-- Order type and Validity Settings for PLUS
 INSERT INTO ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT',      'PLUS','C','Market','IOC','SUPERADMIN');
 INSERT INTO ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by) VALUES('DEFAULT',      'PLUS','C','Limit','DAY','SUPERADMIN');
 INSERT INTO ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by)                       VALUES('DEFAULT',      'PLUS','F','Market','IOC','SUPERADMIN');
 INSERT INTO ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by)                       VALUES('DEFAULT',      'PLUS','F','Limit','DAY','SUPERADMIN');
--
