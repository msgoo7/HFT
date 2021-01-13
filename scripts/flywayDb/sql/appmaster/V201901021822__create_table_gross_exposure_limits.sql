-- ==================================================
-- Gross Exposure Settings For Client and Dealer
-- ==================================================

CREATE TABLE ${appmaster}.gross_exposure_limits
(
  template_name  char varying not NULL,
  exchange_id  smallint DEFAULT 0,
  underlying char varying DEFAULT '',
  gross_qty  data_type_qty not NULL,
  gross_value  data_type_value not NULL,
  gross_value_format  boolean DEFAULT false,
  updated_by  char varying not NULL DEFAULT 'SUPERADMIN',
  effective_time_stamp  timestamp not NULL DEFAULT now(),
  grossexposuretype smallint not NULL,
  symbolId bigint DEFAULT 0,
  scripgroup smallint DEFAULT 0,
  PRIMARY KEY (template_name, exchange_id, underlying, grossexposuretype, symbolId, scripgroup),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name)

);

CREATE TABLE ${appmaster}.gross_exposure_limits_history
(
  template_name  char varying not NULL,
  exchange_id  smallint DEFAULT 0,
  underlying char varying DEFAULT '',
  gross_qty  data_type_qty not NULL,
  gross_value  data_type_value not NULL,
  gross_value_format  boolean DEFAULT false,
  updated_by  char varying not NULL DEFAULT 'SUPERADMIN',
  effective_time_stamp  timestamp not NULL DEFAULT now(),
  grossexposuretype smallint not NULL,
  symbolId bigint DEFAULT 0,
  scripgroup smallint DEFAULT 0
);

