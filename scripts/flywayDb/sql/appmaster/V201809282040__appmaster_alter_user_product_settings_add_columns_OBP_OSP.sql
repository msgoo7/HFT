ALTER TABLE ${appmaster}.user_product_settings ADD COLUMN option_buy_premium_percentage smallint DEFAULT 0, ADD COLUMN option_sell_premium_percentage smallint DEFAULT 0;

ALTER TABLE ${appmaster}.user_product_settings_history ADD COLUMN option_buy_premium_percentage smallint DEFAULT 0, ADD COLUMN option_sell_premium_percentage smallint DEFAULT 0;
