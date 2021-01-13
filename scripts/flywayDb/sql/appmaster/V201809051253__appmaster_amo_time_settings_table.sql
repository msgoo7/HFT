create table ${appmaster}.amo_order_time_settings (
  exchange_segment_key int NOT NULL UNIQUE,
  start_time timestamp without time zone NOT NULL,
  end_time timestamp without time zone NOT NULL,
  order_push_time timestamp without time zone NOT NULL,
  PRIMARY KEY (exchange_segment_key)
);

