--- DELETING MCX records from Table.
DELETE FROM ${refmaster}.exchange_segment_settings WHERE exchange = 'MCX';

--- INSERTING default record into the table.
INSERT INTO ${refmaster}.exchange_segment_settings(exchange, is_ctcl_applicable, vendor_code, max_location_id_length, ctcl_for_web_exe, ctcl_for_mobile, exchange_desc, parent_exchange, broker,instrument, is_disclosed_quantity, updated_by)
VALUES
    ('MCX', 't', '012', 12, 111111111111012, 333333333333012, 'MCX', 'MCX', 'DEFAULT', 'F', 'f', 'SUPERADMIN'),
    ('MCX', 't', '012', 12, 111111111111012, 333333333333012, 'MCX', 'MCX', 'DEFAULT', 'O', 'f', 'SUPERADMIN');

-- DELETING MCX records from Table.
DELETE FROM ${refmaster}.exchange_segment_order_type_and_validity_settings WHERE exchange = 'MCX';

-- DELETING ESM StopLoss Limit/Market records from Table.
DELETE FROM ${refmaster}.exchange_segment_order_type_and_validity_settings WHERE exchange = 'ESM' AND order_type in ('Stop Loss Limit', 'Stop Loss Market');

-- Order type and Validity Settings Entry for MCX and ESM.
INSERT INTO ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by)
VALUES
    ('DEFAULT','MCX','F','Limit','DAY','SUPERADMIN'),
    ('DEFAULT','MCX','F','Market','DAY','SUPERADMIN'),
    ('DEFAULT','MCX','F','Limit','IOC','SUPERADMIN'),
    ('DEFAULT','MCX','F','Market','IOC','SUPERADMIN'),
    ('DEFAULT','MCX','F','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','MCX','F','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','MCX','O','Limit','DAY','SUPERADMIN'),
    ('DEFAULT','MCX','O','Market','DAY','SUPERADMIN'),
    ('DEFAULT','MCX','O','Limit','IOC','SUPERADMIN'),
    ('DEFAULT','MCX','O','Market','IOC','SUPERADMIN'),
    ('DEFAULT','MCX','O','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','MCX','O','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','ESM','F','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','ESM','F','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','ESM','O','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','ESM','O','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','ESM','C','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','ESM','C','Stop Loss Market','DAY','SUPERADMIN');




