-- DELETING Stop Loss Limit and Stop Loss Market from DB 
DELETE FROM ${refmaster}.exchange_segment_order_type_and_validity_settings WHERE order_type in ('Stop Loss Limit', 'Stop Loss Market');

-- Stop Loss Order type and Validity Settings for NSE, BSE & MSE
INSERT INTO ${refmaster}.exchange_segment_order_type_and_validity_settings(broker, exchange, instrument, order_type, order_validity, updated_by)
VALUES
    ('DEFAULT','NSECM','C','Stop Loss Limit','DAY','SUPERADMIN' ),
    ('DEFAULT','NSECM','C','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','NSEFO','F','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','NSEFO','O','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','NSEFO','F','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','NSEFO','O','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','NSECDS','F','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','NSECDS','O','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','NSECDS','F','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','NSECDS','O','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','BSECM','C','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','BSECM','C','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','BSEFO','F','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','BSEFO','O','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','BSEFO','F','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','BSEFO','O','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','BSECDS','F','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','BSECDS','O','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','BSECDS','F','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','BSECDS','O','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','MSECM','C','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','MSECM','C','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','MSEFO','F','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','MSEFO','O','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','MSEFO','F','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','MSEFO','O','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','MSECD','F','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','MSECD','O','Stop Loss Limit','DAY','SUPERADMIN'),
    ('DEFAULT','MSECD','F','Stop Loss Market','DAY','SUPERADMIN'),
    ('DEFAULT','MSECD','O','Stop Loss Market','DAY','SUPERADMIN');
