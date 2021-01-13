ALTER TABLE appmaster.global_rms_settings RENAME COLUMN discard_profit_for_mtm to orders_per_second;
ALTER TABLE appmaster.global_rms_settings ADD COLUMN mapping_checks boolean DEFAULT true;
