CREATE TABLE ${appmaster}.order_per_second
(
  template_name char varying NOT NULL,
  exchange integer NOT NULL,
  segment integer NOT NULL,
  order_rate integer NOT NULL,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY (template_name, exchange, segment),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name)
);

CREATE TABLE ${appmaster}.order_per_second_history
(
  template_name char varying NOT NULL,
  exchange integer NOT NULL,
  segment integer NOT NULL,
  order_rate integer NOT NULL,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

