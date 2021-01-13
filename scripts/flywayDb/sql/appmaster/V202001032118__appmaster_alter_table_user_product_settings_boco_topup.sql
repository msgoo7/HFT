ALTER TABLE ${appmaster}.user_product_settings 
ADD COLUMN is_boco_cash_topup boolean DEFAULT false, 
ADD COLUMN is_boco_fut_topup boolean DEFAULT false,
ADD COLUMN is_boco_option_topup boolean DEFAULT false;

ALTER TABLE ${appmaster}.user_product_settings_history 
ADD COLUMN is_boco_cash_topup boolean DEFAULT false, 
ADD COLUMN is_boco_fut_topup boolean DEFAULT false,
ADD COLUMN is_boco_option_topup boolean DEFAULT false;
