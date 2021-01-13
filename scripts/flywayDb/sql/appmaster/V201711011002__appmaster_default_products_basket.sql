-- =========================================
-- Product Name: DELIVERY
-- Product Id : 1
-- =========================================
INSERT INTO ${appmaster}.product(product_id,
  product_name,
  square_off_status,
  order_mode_allowed,
  is_short_selling_allowed,
  product_multiplier,
  updated_by, 
  effective_time_stamp) 
VALUES(0,'DELIVERY',2, 3,'t', 100, 'SUPERADMIN', now());


-- =========================================
-- Product Name: INTRADAY
-- Product Id : 0  
-- =========================================
INSERT INTO ${appmaster}.product(product_id,
  product_name,
  square_off_status,
  order_mode_allowed,
  is_short_selling_allowed,
  product_multiplier,
  updated_by, 
  effective_time_stamp) 
VALUES(1,'INTRADAY',2, 3,'f', 100, 'SUPERADMIN', now());

-- =========================================
-- Product Name: DELIVERY
-- Product Id : 1
-- Source Mapped : Settled
-- =========================================
INSERT INTO ${appmaster}.product_source_mapping(product_id,
  source_id,
  updated_by, 
  effective_time_stamp) 
VALUES(0,0,'SUPERADMIN', now());

-- =========================================
-- Product Name: DELIVERY
-- Product Id : 1
-- Source Mapped : UnSettled
-- =========================================
INSERT INTO ${appmaster}.product_source_mapping(product_id,
  source_id,
  updated_by, 
  effective_time_stamp) 
VALUES(0,1,'SUPERADMIN', now());

-- =========================================
-- Basket Name: DEFAULT
-- Product Id : 1
-- =========================================
INSERT INTO ${appmaster}.symbol_basket(
  symbol_basket_name,
  square_off_status,
  order_mode_allowed,
  is_special,
  updated_by,
  effective_time_stamp)
VALUES('Default', 2, 3,'f', 'SUPERADMIN', now());

