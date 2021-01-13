-- =========================================
-- -- User ScripGroup Limits
-- -- Description :
-- -- =========================================

CREATE TABLE ${appmaster}.user_scripgroup_limits
(
  template_name  char varying NOT NULL,
  exchange_id  smallint not NULL,
  scripgroup smallint NOT NULL,
  gross_qty  data_type_qty,
  gross_value  data_type_value,
  gross_value_format  boolean DEFAULT false,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name,exchange_id,scripgroup),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name)

);


CREATE TABLE ${appmaster}.user_scripgroup_limits_history
(
  template_name  char varying NOT NULL,
  exchange_id  smallint not NULL,
  scripgroup smallint NOT NULL,
  gross_qty  data_type_qty,
  gross_value  data_type_value,
  gross_value_format  boolean DEFAULT false,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);
