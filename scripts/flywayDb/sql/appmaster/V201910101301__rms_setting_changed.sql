DROP TABLE ${appmaster}.global_rms_settings;

CREATE TABLE ${appmaster}.global_rms_settings
(
  combination_type smallint NOT NULL,
  max_buy_sell_open_outstanding_check boolean DEFAULT true, 
  max_buy_sell_total_net boolean DEFAULT true, 
  max_turnover_limit boolean DEFAULT true, 
  max_mtm_value boolean DEFAULT true, 
  limit_close_price_protection  boolean DEFAULT true, 
  bad_price_protection  boolean DEFAULT true, 
  max_margin_usage boolean DEFAULT true, 
  max_single_order_qty_value boolean DEFAULT true, 
  gross_quantity_value boolean DEFAULT true, 
  square_off_status boolean DEFAULT true, 
  order_mode_allowed  boolean DEFAULT true, 
  TER boolean DEFAULT true, 
  DPR boolean DEFAULT true,
  orders_per_second boolean DEFAULT true, 
  mapping_checks boolean DEFAULT true,
  client_category_ban boolean DEFAULT true,
  iv_check boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (combination_type),
  FOREIGN KEY (combination_type) REFERENCES refmaster.global_rms_setting_combination (combination_type)
);
