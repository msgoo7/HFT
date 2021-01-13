-- =====================================
-- -- Pan column added in  tables:
-- -- client_exchange_settings
-- -- client_exchange_settings_history
-- -- =====================================

ALTER TABLE ${appmaster}.client_exchange_settings ADD COLUMN IF NOT EXISTS PAN text DEFAULT ''::text;
ALTER TABLE ${appmaster}.client_exchange_settings_history ADD COLUMN IF NOT EXISTS PAN text DEFAULT ''::text;
