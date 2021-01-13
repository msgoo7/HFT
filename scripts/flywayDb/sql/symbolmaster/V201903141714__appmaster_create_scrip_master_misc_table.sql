CREATE TABLE IF NOT EXISTS ${appmaster}.scrip_master_misc
(
  market_id character varying(10) NOT NULL,
  security_id integer NOT NULL,
  trading_currency character varying(10),
  tft_status character varying(10),
  max_order_size bigint,
  max_order_value bigint,
  face_value bigint,
  issued_capital bigint,
  free_float_capital bigint,
  price_quote_factor integer,
  price_quote_unit character varying(10)
)
