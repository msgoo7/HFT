CREATE TABLE ${appmaster}.single_order
(
  exchange_id integer NOT NULL,
  segment_type smallint NOT NULL,
  master_client_order_id bigint NOT NULL,
  sequence_number BIGSERIAL NOT NULL,
  client_order_id bigint NOT NULL,
  original_client_order_id bigint,
  symbol_id bigint NOT NULL,
  client_id bigint,
  order_quantity bigint NOT NULL,
  disclosed_quantity bigint DEFAULT 0,
  filled_quantity bigint,
  old_quantity bigint,
  order_price bigint NOT NULL,
  market_price_protection bigint,
  stop_price bigint,
  exchange_entry_time bigint NOT NULL,
  exchange_modify_time bigint,
  transaction_type smallint,
  order_mode integer NOT NULL,
  order_validity smallint NOT NULL,
  gtd_date bigint,
  product_type integer NOT NULL,
  order_type smallint NOT NULL,
  settlement_period smallint,
  order_status integer NOT NULL,
  exchange_order_id varchar,
  primary_client_code varchar NOT NULL,
  trader_id bigint,
  location_id bigint,
  account_type smallint,
  order_category smallint DEFAULT 0,
  strategy_type smallint,
  self_trade_cancel_flag smallint,
  load_balancing_id bigint,
  fix_client_order_id varchar,
  platform_type smallint NOT NULL,
  price1 bigint,
  price2 bigint,
  is_trigger_order smallint,
  is_trade_capture_report smallint,
  child_strategy_id bigint,
  parent_strategy_id bigint,
  algo_id bigint,
  market_session smallint,
  generated_order_id varchar,
  exchange_client_code varchar,
  participant_code varchar,
  pan varchar,
  strategy_id bigint DEFAULT 0,
  confirmation_type integer,
  is_placed BOOLEAN DEFAULT FALSE,
  effective_timestamp timestamp without time zone DEFAULT now(),

  PRIMARY KEY( client_order_id )
);

-- Adding Generating order id's in historical tables --
ALTER TABLE ${appmaster}.receive_confirmation 
  ADD COLUMN generated_order_id varchar;

ALTER TABLE ${appmaster}.master_confirmation_book
  ADD COLUMN generated_order_id varchar;

ALTER TABLE ${appmaster}.historical_order_book
  ADD COLUMN generated_order_id varchar;

ALTER TABLE ${appmaster}.historical_trade_book
  ADD COLUMN generated_order_id varchar;
