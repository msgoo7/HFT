ALTER TABLE ${appmaster}.user_product_settings ADD COLUMN is_collateral boolean DEFAULT false;
ALTER TABLE ${appmaster}.user_product_settings_history ADD COLUMN is_collateral boolean DEFAULT false;
