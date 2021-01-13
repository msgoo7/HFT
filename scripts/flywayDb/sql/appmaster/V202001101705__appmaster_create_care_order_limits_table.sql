
-- ==================================================
-- -- Care Order Settings For Client 
-- -- ==================================================

CREATE TABLE ${appmaster}.care_order_limits
(
  template_name  char varying not NULL,
  exchange integer not NULL,
  securitytype integer not NULL,
  careordertype integer not NULL,
  max_ord_qty  data_type_qty not NULL,
  max_ord_value  data_type_value not NULL,
  limit_price_per  data_type_value not NULL,
  market_orders_allowed  boolean DEFAULT false,
  updated_by  char varying not NULL DEFAULT 'SUPERADMIN',
  effective_time_stamp  timestamp not NULL DEFAULT now(),
  PRIMARY KEY (template_name, exchange, securitytype, careordertype),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name)
);

CREATE TABLE ${appmaster}.care_order_limits_history
(
  template_name  char varying not NULL,
  exchange  integer not NULL,
  securitytype integer not NULL,
  careordertype integer not NULL,
  max_ord_qty  data_type_qty not NULL,
  max_ord_value  data_type_value not NULL,
  limit_price_per  data_type_value not NULL,
  market_orders_allowed  boolean DEFAULT false,
  updated_by  char varying not NULL DEFAULT 'SUPERADMIN',
  effective_time_stamp  timestamp not NULL DEFAULT now()
);

