-- =========================================
-- DOMAIN
-- Description  : Centralize Datatype
-- =========================================

-- Data type qty 
CREATE DOMAIN ${appmaster}.data_type_qty AS bigint
CHECK (VALUE > 0);

-- Data type value  
CREATE DOMAIN ${appmaster}.data_type_value AS bigint;

-- =========================================
--  Global RMS Settings 
--  Description : (RMS check Enable/Disable Globally based on combination)
-- =========================================

CREATE TABLE ${appmaster}.global_rms_settings
(
  combination_type smallint NOT NULL,
  max_outstanding_buy_qty boolean DEFAULT true, 
  max_outstanding_buy_value boolean  DEFAULT true, 
  max_outstanding_sell_qty  boolean DEFAULT true, 
  max_outstanding_sell_value  boolean DEFAULT true, 
  max_total_buy_qty boolean DEFAULT true, 
  max_total_buy_value boolean DEFAULT true, 
  max_total_sell_qty  boolean DEFAULT true, 
  max_total_sell_value  boolean DEFAULT true, 
  net_qty_range boolean DEFAULT true, 
  net_value_range boolean DEFAULT true, 
  max_turnover_limit  boolean DEFAULT true, 
  limit_price_protection  boolean DEFAULT true, 
  bad_price_protection   boolean DEFAULT true, 
  close_price_protection  boolean DEFAULT true, 
  max_mtm_value  boolean DEFAULT true, 
  discard_profit_for_mtm  boolean DEFAULT true, 
  max_margin_usage  boolean DEFAULT true, 
  max_single_order_qty  boolean DEFAULT true, 
  max_single_order_value  boolean DEFAULT true, 
  gross_quantity  boolean DEFAULT true, 
  gross_value boolean DEFAULT true, 
  square_off_status boolean DEFAULT true, 
  order_mode_allowed  boolean DEFAULT true, 
  TER boolean DEFAULT true, 
  DPR boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (combination_type),
  FOREIGN KEY (combination_type) REFERENCES refmaster.global_rms_setting_combination (combination_type)     
);


CREATE TABLE ${appmaster}.global_rms_settings_history
(
  combination_type smallint NOT NULL,
  max_outstanding_buy_qty boolean DEFAULT true,
  max_outstanding_buy_value boolean  DEFAULT true,
  max_outstanding_sell_qty  boolean DEFAULT true,
  max_outstanding_sell_value  boolean DEFAULT true,
  max_total_buy_qty boolean DEFAULT true,
  max_total_buy_value boolean DEFAULT true,
  max_total_sell_qty  boolean DEFAULT true,
  max_total_sell_value  boolean DEFAULT true,
  net_qty_range boolean DEFAULT true,
  net_value_range boolean DEFAULT true,
  max_turnover_limit  boolean DEFAULT true,
  limit_price_protection  boolean DEFAULT true,
  bad_price_protection   boolean DEFAULT true,
  close_price_protection  boolean DEFAULT true,
  max_mtm_value  boolean DEFAULT true,
  discard_profit_for_mtm  boolean DEFAULT true,
  max_margin_usage  boolean DEFAULT true,
  max_single_order_qty  boolean DEFAULT true,
  max_single_order_value  boolean DEFAULT true,
  gross_quantity  boolean DEFAULT true,
  gross_value boolean DEFAULT true,
  square_off_status boolean DEFAULT true,
  order_mode_allowed  boolean DEFAULT true,
  TER boolean DEFAULT true,
  DPR boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);




-- Genric Template Tables

-- =========================================
-- unique_template_id
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.unique_template_id
(
  template_name  char varying NOT NULL, 
  template_type smallint NOT NULL,
  user_type  smallint NOT NULL , 
  template_description  char varying,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name)

);


CREATE TABLE ${appmaster}.unique_template_id_history
(
  template_name  char varying NOT NULL,
  template_type smallint NOT NULL,
  user_type  smallint NOT NULL ,
  template_description  char varying,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- user_limits 
-- Description : Generic template user_limits
-- =========================================

CREATE TABLE ${appmaster}.user_limits
(
  template_name  char varying NOT NULL,     
  max_outstanding_buy_qty  data_type_qty,
  max_outstanding_buy_value  data_type_value,
  max_outstanding_sell_qty   data_type_qty,
  max_outstanding_sell_value   data_type_value,
  max_total_buy_qty  data_type_qty,
  max_total_buy_value  data_type_value,
  max_total_sell_qty  data_type_qty,
  max_total_sell_value   data_type_value,
  max_net_qty  data_type_qty,
  max_net_value  data_type_value,
  min_net_qty  data_type_qty,
  min_net_value  data_type_value,
  max_turnover_limit   data_type_value,
  max_mtm_value data_type_value,
  discard_profit_for_mtm  boolean,
  max_margin_usage data_type_value,
  max_single_order_qty data_type_qty,
  max_single_order_value data_type_value,
  gross_qty  data_type_qty,
  gross_value  data_type_value,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name)     

);

CREATE TABLE ${appmaster}.user_limits_history
(
  template_name  char varying NOT NULL,
  max_outstanding_buy_qty  data_type_qty,
  max_outstanding_buy_value  data_type_value,
  max_outstanding_sell_qty   data_type_qty,
  max_outstanding_sell_value   data_type_value,
  max_total_buy_qty  data_type_qty,
  max_total_buy_value  data_type_value,
  max_total_sell_qty  data_type_qty,
  max_total_sell_value   data_type_value,
  max_net_qty  data_type_qty,
  max_net_value  data_type_value,
  min_net_qty  data_type_qty,
  min_net_value  data_type_value,
  max_turnover_limit   data_type_value,
  max_mtm_value data_type_value,
  discard_profit_for_mtm  boolean,
  max_margin_usage data_type_value,
  max_single_order_qty data_type_qty,
  max_single_order_value data_type_value,
  gross_qty  data_type_qty,
  gross_value  data_type_value,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);


-- =========================================
-- User Underlying Limits
-- Description : 
-- =========================================

CREATE TABLE ${appmaster}.user_underlying_limits
(
  template_name  char varying NOT NULL,     
  exchange_id  smallint not NULL,
  underlying char varying NOT NULL NOT NULL,
  gross_qty  data_type_qty,
  gross_value  data_type_value,
  gross_value_format  boolean DEFAULT false,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name,exchange_id,underlying),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name)     

);


CREATE TABLE ${appmaster}.user_underlying_limits_history
(
  template_name  char varying NOT NULL,
  exchange_id  smallint not NULL,
  underlying char varying NOT NULL NOT NULL,
  gross_qty  data_type_qty,
  gross_value  data_type_value,
  gross_value_format  boolean DEFAULT false,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- user_security_wise_limits
-- Description : User specific Security Checks
-- =========================================

CREATE TABLE ${appmaster}.user_security_wise_limits
(
  template_name char varying NOT NULL,
  symbol_id   bigint NOT NULL,
  max_outstanding_buy_qty    data_type_qty,
  max_outstanding_buy_value    data_type_value,
  max_outstanding_sell_qty   data_type_qty,
  max_outstanding_sell_value data_type_value,  
  max_total_buy_qty  data_type_qty,
  max_total_buy_value data_type_value,
  max_total_sell_qty data_type_qty,
  max_total_sell_value data_type_value,
  max_net_qty  data_type_qty,
  max_net_value data_type_value,
  min_net_qty  data_type_qty,
  min_net_value data_type_value,
  max_turnover data_type_value,
  max_single_order_qty data_type_qty,
  max_single_order_value data_type_value,
  gross_quantity data_type_qty,
  gross_value data_type_value,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name,symbol_id),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name) 

);

CREATE TABLE ${appmaster}.user_security_wise_limits_history
(
  template_name char varying NOT NULL,
  symbol_id   bigint NOT NULL,
  max_outstanding_buy_qty    data_type_qty,
  max_outstanding_buy_value    data_type_value,
  max_outstanding_sell_qty   data_type_qty,
  max_outstanding_sell_value data_type_value,
  max_total_buy_qty  data_type_qty,
  max_total_buy_value data_type_value,
  max_total_sell_qty data_type_qty,
  max_total_sell_value data_type_value,
  max_net_qty  data_type_qty,
  max_net_value data_type_value,
  min_net_qty  data_type_qty,
  min_net_value data_type_value,
  max_turnover data_type_value,
  max_single_order_qty data_type_qty,
  max_single_order_value data_type_value,
  gross_quantity data_type_qty,
  gross_value data_type_value,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- user_symbol_basket_limits
-- Description : User specific Scrip Pack Checks
-- =========================================

CREATE TABLE ${appmaster}.user_symbol_basket_limits
(
  template_name char varying NOT NULL,
  symbol_basket_id   bigint NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name,symbol_basket_id),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name),     
  FOREIGN KEY (square_off_status) REFERENCES refmaster.square_off_status (square_off_status),     
  FOREIGN KEY (order_mode_allowed) REFERENCES refmaster.order_mode (order_mode)     

);

CREATE TABLE ${appmaster}.user_symbol_basket_limits_history
(
  template_name char varying NOT NULL,
  symbol_basket_id   bigint NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- client_template_setting
-- Description : Client template Value Feild cann in Percentage and Absolute 
-- format
-- True : Percentage
-- False : Absolute
-- =========================================

CREATE TABLE ${appmaster}.client_template_setting
(
  template_name char varying NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,  
  max_out_buy_value_format boolean DEFAULT false,
  max_out_sell_value_format boolean DEFAULT false,
  max_total_buy_value_format boolean DEFAULT false,
  max_total_sell_value_format boolean DEFAULT false,
  net_value_format  boolean DEFAULT false,
  gross_value_format  boolean DEFAULT false,
  single_order_value_format boolean DEFAULT false,
  mtm_loss_value_format boolean DEFAULT false,
  turnover_format boolean DEFAULT false,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name),     
  FOREIGN KEY (square_off_status) REFERENCES refmaster.square_off_status (square_off_status),     
  FOREIGN KEY (order_mode_allowed) REFERENCES refmaster.order_mode (order_mode)     

);

CREATE TABLE ${appmaster}.client_template_setting_history
(
  template_name char varying NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  max_out_buy_value_format boolean DEFAULT false,
  max_out_sell_value_format boolean DEFAULT false,
  max_total_buy_value_format boolean DEFAULT false,
  max_total_sell_value_format boolean DEFAULT false,
  net_value_format  boolean DEFAULT false,
  gross_value_format  boolean DEFAULT false,
  single_order_value_format boolean DEFAULT false,
  mtm_loss_value_format boolean DEFAULT false,
  turnover_format boolean DEFAULT false,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- client_symbol_template_setting
-- Description : Client symbol template Value Feild cann in Percentage and Absolute 
-- format
-- True : Percentage
-- False : Absolute
-- =========================================

CREATE TABLE ${appmaster}.client_symbol_template_setting
(
  template_name char varying NOT NULL,
  symbol_id   bigint NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,  
  limit_price_protection  smallint,
  bad_price_protection   smallint,
  close_price_protection  smallint,
  max_out_buy_value_format boolean DEFAULT false,
  max_out_sell_value_format boolean DEFAULT false,
  max_total_buy_value_format boolean DEFAULT false,
  max_total_sell_value_format boolean DEFAULT false,
  net_value_format  boolean DEFAULT false,
  gross_value_format  boolean DEFAULT false,
  single_order_value_format boolean DEFAULT false,
  mtm_loss_value_format boolean DEFAULT false,
  turnover_format boolean DEFAULT false,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name,symbol_id),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name),     
  FOREIGN KEY (square_off_status) REFERENCES refmaster.square_off_status (square_off_status),     
  FOREIGN KEY (order_mode_allowed) REFERENCES refmaster.order_mode (order_mode)     
);


CREATE TABLE ${appmaster}.client_symbol_template_setting_history
(
  template_name char varying NOT NULL,
  symbol_id   bigint NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  limit_price_protection  smallint,
  bad_price_protection   smallint,
  close_price_protection  smallint,
  max_out_buy_value_format boolean DEFAULT false,
  max_out_sell_value_format boolean DEFAULT false,
  max_total_buy_value_format boolean DEFAULT false,
  max_total_sell_value_format boolean DEFAULT false,
  net_value_format  boolean DEFAULT false,
  gross_value_format  boolean DEFAULT false,
  single_order_value_format boolean DEFAULT false,
  mtm_loss_value_format boolean DEFAULT false,
  turnover_format boolean DEFAULT false,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);


-- Global Security Wise Limit

-- =========================================
-- security_wise_limits
-- Description : Global Security Wise Limit
-- =========================================

CREATE TABLE ${appmaster}.security_wise_limits
(
  symbol_id   bigint NOT NULL,
  max_outstanding_buy_qty    data_type_qty,
  max_outstanding_buy_value    data_type_value,
  max_outstanding_sell_qty   data_type_qty,
  max_outstanding_sell_value data_type_value,  
  max_total_buy_qty  data_type_qty,
  max_total_buy_value data_type_value,
  max_total_sell_qty data_type_qty,
  max_total_sell_value data_type_value,
  max_net_qty  data_type_qty,
  max_net_value data_type_value,
  min_net_qty  data_type_qty,
  min_net_value data_type_value,
  max_turnover data_type_value,
  limit_price_protection  smallint,
  bad_price_protection   smallint,
  close_price_protection  smallint,
  max_mtm_value  data_type_value, 
  discard_profit_for_mtm  boolean, 
  max_margin_usage  data_type_value, 
  max_single_order_qty data_type_qty,
  max_single_order_value data_type_value,
  gross_quantity data_type_qty,
  gross_value data_type_value,
  square_off_status smallint,
  order_mode_allowed smallint,
  dpr_check_enabled boolean  DEFAULT true,
  ter_check_enabled boolean  DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (symbol_id),
  FOREIGN KEY (square_off_status) REFERENCES refmaster.square_off_status (square_off_status),     
  FOREIGN KEY (order_mode_allowed) REFERENCES refmaster.order_mode (order_mode)     

);

CREATE TABLE ${appmaster}.security_wise_limits_history
(
  symbol_id   bigint NOT NULL,
  max_outstanding_buy_qty    data_type_qty,
  max_outstanding_buy_value    data_type_value,
  max_outstanding_sell_qty   data_type_qty,
  max_outstanding_sell_value data_type_value,
  max_total_buy_qty  data_type_qty,
  max_total_buy_value data_type_value,
  max_total_sell_qty data_type_qty,
  max_total_sell_value data_type_value,
  max_net_qty  data_type_qty,
  max_net_value data_type_value,
  min_net_qty  data_type_qty,
  min_net_value data_type_value,
  max_turnover data_type_value,
  limit_price_protection  smallint,
  bad_price_protection   smallint,
  close_price_protection  smallint,
  max_mtm_value  data_type_value,
  discard_profit_for_mtm  boolean,
  max_margin_usage  data_type_value,
  max_single_order_qty data_type_qty,
  max_single_order_value data_type_value,
  gross_quantity data_type_qty,
  gross_value data_type_value,
  square_off_status smallint,
  order_mode_allowed smallint,
  dpr_check_enabled boolean  DEFAULT true,
  ter_check_enabled boolean  DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- Underlying Limits
-- Description : 
-- =========================================

CREATE TABLE ${appmaster}.underlying_limits
(
  exchange_id  smallint not NULL,
  underlying char varying NOT NULL NOT NULL,
  gross_qty  data_type_qty,
  gross_value  data_type_value,
  gross_value_format  boolean DEFAULT false,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (exchange_id,underlying)
);


CREATE TABLE ${appmaster}.underlying_limits_history
(
  exchange_id  smallint not NULL,
  underlying char varying NOT NULL NOT NULL,
  gross_qty  data_type_qty,
  gross_value  data_type_value,
  gross_value_format  boolean DEFAULT false,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);


-- Product/Scrip Pack Creation tables

-- =========================================
-- product
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.product
(
  product_id bigint NOT NULL,
  product_name char varying NOT NULL, 
  square_off_status smallint,
  order_mode_allowed smallint,
  is_short_selling_allowed  boolean, --Holding
  product_multiplier  smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (product_id),
  FOREIGN KEY (square_off_status) REFERENCES refmaster.square_off_status (square_off_status),     
  FOREIGN KEY (order_mode_allowed) REFERENCES refmaster.order_mode (order_mode)     

);


CREATE TABLE ${appmaster}.product_history
(
  product_id bigint NOT NULL,
  product_name char varying NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  is_short_selling_allowed  boolean, --Holding
  product_multiplier  smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- symbol_basket
-- Description :  
-- =========================================

CREATE SEQUENCE ${appmaster}.symbol_basket_number_seq
START WITH 1
INCREMENT BY 1
NO MAXVALUE
NO MINVALUE
CACHE 1;

CREATE TABLE ${appmaster}.symbol_basket
(
  symbol_basket_id bigint DEFAULT nextval('${appmaster}.symbol_basket_number_seq'::regclass) NOT NULL, 
  symbol_basket_name char varying NOT NULL, 
  square_off_status smallint,
  order_mode_allowed smallint,
  is_special boolean,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (symbol_basket_id)

);

CREATE TABLE ${appmaster}.symbol_basket_history
(
  symbol_basket_id bigint,
  symbol_basket_name char varying NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  is_special boolean,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- symbol_basket_contents
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.symbol_basket_contents
(
  symbol_basket_id bigint NOT NULL, 
  market_id char varying NOT NULL,
  instrument_type char varying,
  security_id bigint NOT NULL,
  broker char varying DEFAULT 'Default',
  scrip_name char varying, 
  special_count integer,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (symbol_basket_id,market_id,security_id),
  FOREIGN KEY (symbol_basket_id) REFERENCES symbol_basket (symbol_basket_id)     

);

CREATE TABLE ${appmaster}.symbol_basket_contents_history
(
  symbol_basket_id bigint NOT NULL,
  symbol_id bigint NOT NULL,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- symbol_basket_management_rules
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.symbol_basket_management_rules
(
  symbol_basket_id bigint NOT NULL, 
  rule_name char varying NOT NULL, 
  rule_str char varying, 
  query char varying,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (rule_name,symbol_basket_id),
  FOREIGN KEY (symbol_basket_id) REFERENCES symbol_basket (symbol_basket_id)

);

CREATE TABLE ${appmaster}.symbol_basket_management_rules_history
(
  symbol_basket_id bigint NOT NULL,
  rule_name char varying NOT NULL,
  rule_str char varying,
  query char varying,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- basket_management_exceptions
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.symbol_basket_management_exceptions
(
  symbol_basket_id bigint NOT NULL, 
  is_basket_special boolean,
  market_id char varying,
  security_id bigint,
  broker char varying DEFAULT 'Default',
  scrip_name char varying,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (symbol_basket_id,market_id,security_id),
  FOREIGN KEY (symbol_basket_id) REFERENCES symbol_basket (symbol_basket_id)

);

CREATE TABLE ${appmaster}.symbol_basket_management_exceptions_history
(
  symbol_basket_id bigint NOT NULL,
  is_basket_special boolean,
  market_id char varying,
  security_id bigint,
  broker char varying DEFAULT 'Default',
  scrip_name char varying,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);


-- =========================================
-- product_source_mapping
-- Description : Holding 
-- =========================================

CREATE TABLE ${appmaster}.product_source_mapping
(
  product_id bigint NOT NULL,
  source_id smallint NOT NULL, 
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (product_id,source_id),
  FOREIGN KEY (product_id) REFERENCES product (product_id),     
  FOREIGN KEY (source_id) REFERENCES refmaster.source (source_id)     

);

CREATE TABLE ${appmaster}.product_source_mapping_history
(
  product_id bigint NOT NULL,
  source_id smallint NOT NULL,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- product_symbol_settings
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.product_symbol_settings
(
  product_id bigint NOT NULL,
  symbol_id bigint NOT NULL, 
  square_off_status smallint,
  order_mode_allowed smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (product_id,symbol_id),
  FOREIGN KEY (product_id)  REFERENCES product (product_id),     
  FOREIGN KEY (square_off_status) REFERENCES refmaster.square_off_status (square_off_status),     
  FOREIGN KEY (order_mode_allowed) REFERENCES refmaster.order_mode (order_mode)     

);

CREATE TABLE ${appmaster}.product_symbol_settings_history
(
  product_id bigint NOT NULL,
  symbol_id bigint NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);


-- =========================================
-- product_symbol_basket_settings
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.product_symbol_basket_settings
(
  product_id bigint NOT NULL,
  symbol_basket_id bigint NOT NULL, 
  square_off_status smallint,
  order_mode_allowed smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (product_id,symbol_basket_id),
  FOREIGN KEY (product_id) REFERENCES product (product_id),     
  FOREIGN KEY (symbol_basket_id) REFERENCES symbol_basket (symbol_basket_id),     
  FOREIGN KEY (square_off_status) REFERENCES refmaster.square_off_status (square_off_status),     
  FOREIGN KEY (order_mode_allowed) REFERENCES refmaster.order_mode (order_mode)

);


CREATE TABLE ${appmaster}.product_symbol_basket_settings_history
(
  product_id bigint NOT NULL,
  symbol_basket_id bigint NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- Product Template DB Table
-- =========================================
-- user_product_settings
-- Description : User Product Template Setting 
-- =========================================
CREATE TABLE ${appmaster}.user_product_settings
(
  template_name char varying NOT NULL,
  product_id bigint NOT NULL,
  is_cash boolean, 
  is_adhoc boolean,
  is_custom_component boolean,
  is_position_in_equity_used boolean,
  is_mtm_profit boolean,
  is_mtm_loss boolean,
  is_booked_profit boolean,
  is_booked_loss boolean,
  is_option_sell_premium boolean, 
  is_cfs boolean, 
  cfs_limit smallint,
  is_var_applicable boolean,
  is_elm_applicable boolean,
  is_highest_margin_applicable boolean,
  is_span_applicable boolean,
  is_span_exposure_applicable boolean,
  is_brokerage_included boolean,
  is_topup_applicable boolean , 
  topup_margin_limit smallint , 
  is_pm_stock_applicable boolean, -- Product Multiplier
  pm_percentage_stock smallint,   -- Product Multiplier Percentage
  is_pm_future_applicable boolean,
  pm_percentage_future smallint, 
  is_pm_option_applicable boolean,
  pm_percentage_option smallint, 
  square_off_status smallint,
  order_mode_allowed smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name,product_id),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name),     
  FOREIGN KEY (product_id) REFERENCES product (product_id),     
  FOREIGN KEY (square_off_status) REFERENCES refmaster.square_off_status (square_off_status),     
  FOREIGN KEY (order_mode_allowed) REFERENCES refmaster.order_mode (order_mode)     

);

CREATE TABLE ${appmaster}.user_product_settings_history
(
  template_name char varying NOT NULL,
  product_id bigint NOT NULL,
  is_cash boolean,
  is_adhoc boolean,
  is_custom_component boolean,
  is_position_in_equity_used boolean,
  is_mtm_profit boolean,
  is_mtm_loss boolean,
  is_booked_profit boolean,
  is_booked_loss boolean,
  is_option_sell_premium boolean,
  is_cfs boolean,
  cfs_limit smallint,
  is_var_applicable boolean,
  is_elm_applicable boolean,
  is_highest_margin_applicable boolean,
  is_span_applicable boolean,
  is_span_exposure_applicable boolean,
  is_brokerage_included boolean,
  is_topup_applicable boolean , 
  topup_margin_limit smallint,
  is_pm_stock_applicable boolean, -- Product Multiplier
  pm_percentage_stock smallint,   -- Product Multiplier Percentage
  is_pm_future_applicable boolean,
  pm_percentage_future smallint,
  is_pm_option_applicable boolean,
  pm_percentage_option smallint,
  square_off_status smallint,
  order_mode_allowed smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- product_symbol_basket_setting
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.user_product_symbol_basket_settings
(
  template_name char varying NOT NULL, 
  product_id bigint NOT NULL,
  symbol_basket_id  bigint NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  symbol_basket_margin smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name,product_id,symbol_basket_id),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name),     
  FOREIGN KEY (product_id) REFERENCES product (product_id),     
  FOREIGN KEY (square_off_status) REFERENCES refmaster.square_off_status (square_off_status),     
  FOREIGN KEY (order_mode_allowed) REFERENCES refmaster.order_mode (order_mode),     
  FOREIGN KEY (symbol_basket_id) REFERENCES symbol_basket (symbol_basket_id)     

);


CREATE TABLE ${appmaster}.user_product_symbol_basket_settings_history
(
  template_name char varying NOT NULL,
  product_id bigint NOT NULL,
  symbol_basket_id  bigint NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  symbol_basket_margin smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- product_symbol_setting
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.user_product_symbol_settings
(
  template_name char varying NOT NULL, 
  product_id bigint NOT NULL,
  symbol_id  bigint NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  symbol_specific_margin smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name,product_id,symbol_id),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name),     
  FOREIGN KEY (product_id) REFERENCES product (product_id),     
  FOREIGN KEY (square_off_status) REFERENCES refmaster.square_off_status (square_off_status),     
  FOREIGN KEY (order_mode_allowed) REFERENCES refmaster.order_mode (order_mode)     

);

CREATE TABLE ${appmaster}.user_product_symbol_settings_history
(
  template_name char varying NOT NULL,
  product_id bigint NOT NULL,
  symbol_id  bigint NOT NULL,
  square_off_status smallint,
  order_mode_allowed smallint,
  symbol_specific_margin smallint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- strategy_limits
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.strategy_limits
(
  user_id char varying NOT NULL, 
  strategy_type integer NOT NULL, 
  max_strategy_allowed bigint NOT NULL, 
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (user_id,strategy_type),
  FOREIGN KEY (user_id) REFERENCES unique_id (id)    

);


CREATE TABLE ${appmaster}.strategy_limits_history
(
  user_id char varying NOT NULL,
  strategy_type integer NOT NULL,
  max_strategy_allowed bigint NOT NULL,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

-- =========================================
-- margin_summary
-- Description :  
-- =========================================

CREATE TABLE ${appmaster}.user_deposit
(
  user_id char varying NOT NULL, 
  cash bigint, 
  adhoc bigint,
  custom_component bigint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id) REFERENCES unique_id (id)    

);

CREATE TABLE ${appmaster}.user_deposit_history
(
  user_id char varying NOT NULL,
  cash bigint,
  adhoc bigint,
  custom_component bigint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

