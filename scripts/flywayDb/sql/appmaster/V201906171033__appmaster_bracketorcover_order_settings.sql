-- Adding Columns in ${appmaster}.user_product_settings for cover order
ALTER TABLE ${appmaster}.user_product_settings
ADD COLUMN is_bracketorcoverorder_allowed_equity boolean DEFAULT false,
ADD COLUMN min_margin_equity integer DEFAULT 0,
ADD COLUMN max_stopLoss_equity integer DEFAULT 0,
ADD COLUMN topup_equity integer DEFAULT 0,
ADD COLUMN is_bracketorcoverorder_allowed_future boolean DEFAULT false,
ADD COLUMN min_margin_future integer DEFAULT 0,
ADD COLUMN max_stopLoss_future integer DEFAULT 0,
ADD COLUMN topup_future integer DEFAULT 0,
ADD COLUMN is_bracketorcoverorder_allowed_option boolean DEFAULT false,
ADD COLUMN min_margin_option integer DEFAULT 0,
ADD COLUMN max_stopLoss_option integer DEFAULT 0,
ADD COLUMN topup_option integer DEFAULT 0;


-- Adding Columns in ${appmaster}.user_product_settings_history for cover order
ALTER TABLE ${appmaster}.user_product_settings_history
ADD COLUMN is_bracketorcoverorder_allowed_equity boolean DEFAULT false,
ADD COLUMN min_margin_equity integer DEFAULT 0,
ADD COLUMN max_stopLoss_equity integer DEFAULT 0,
ADD COLUMN topup_equity integer DEFAULT 0,
ADD COLUMN is_bracketorcoverorder_allowed_future boolean DEFAULT false,
ADD COLUMN min_margin_future integer DEFAULT 0,
ADD COLUMN max_stopLoss_future integer DEFAULT 0,
ADD COLUMN topup_future integer DEFAULT 0,
ADD COLUMN is_bracketorcoverorder_allowed_option boolean DEFAULT false,
ADD COLUMN min_margin_option integer DEFAULT 0,
ADD COLUMN max_stopLoss_option integer DEFAULT 0,
ADD COLUMN topup_option integer DEFAULT 0;

-- Adding Column in ${appmaster}.product table for bracket and cover order
ALTER TABLE ${appmaster}.product ADD COLUMN product_order_category integer DEFAULT 0;

-- Inserting Bracket and Cover Order in ${appmaster}.product table
INSERT INTO ${appmaster}.product(product_id,
  product_name,
  square_off_status,
  order_mode_allowed,
  check_stocks_on_sell,
  product_multiplier,
  updated_by, 
  effective_time_stamp,
  product_order_category) Select max(product_id)+1,'BO',2, 3,'f', 100, 'SUPERADMIN', now(),1 from  ${appmaster}.product;

INSERT INTO ${appmaster}.product(product_id,
  product_name,
  square_off_status,
  order_mode_allowed,
  check_stocks_on_sell,
  product_multiplier,
  updated_by, 
  effective_time_stamp,
  product_order_category) Select max(product_id)+1,'CO',2, 3,'f', 100, 'SUPERADMIN', now(),2 from  ${appmaster}.product;

