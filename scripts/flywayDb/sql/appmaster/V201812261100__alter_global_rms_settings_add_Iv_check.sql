-- =======================================================
-- Global IV checks at INFRA level
-- =======================================================

ALTER TABLE appmaster.global_rms_settings ADD COLUMN IV_check boolean DEFAULT true;
