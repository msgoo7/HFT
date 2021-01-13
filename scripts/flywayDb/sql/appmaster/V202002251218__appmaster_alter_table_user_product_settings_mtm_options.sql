-- Add column in user_product_settings & user_product_settings_history --
-- is_mtm_option_buy --
-- is_mtm_option_sell --

ALTER TABLE ${appmaster}.user_product_settings
  ADD COLUMN is_mtm_option_buy boolean DEFAULT true, 
  ADD COLUMN is_mtm_option_sell boolean DEFAULT true;

ALTER TABLE ${appmaster}.user_product_settings_history 
  ADD COLUMN is_mtm_option_buy boolean DEFAULT true, 
  ADD COLUMN is_mtm_option_sell boolean DEFAULT true;
