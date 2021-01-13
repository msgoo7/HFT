---------------Removing old tables.---------------------

DROP TABLE ${appmaster}.uhedge_data;
DROP TABLE ${appmaster}.uhedge_settings;

---------------Introduce new tables.--------------------

--Table containing a uhege portfolio info.
CREATE TABLE ${appmaster}.uhedge_portfolios
(
  porfolio_id         integer                     NOT NULL,
  client_id           integer                     NOT NULL,
  portfolio_name      char varying                NOT NULL,
  effective_timestamp timestamp without time zone DEFAULT now(),
  CONSTRAINT p_key_uhedge_portfolios PRIMARY KEY ( porfolio_id )
);

--Table containing a single strategy portfolio info.
--No primary key is being taken here , code has to take care of it.
CREATE TABLE ${appmaster}.uhedge_strategy_portfolios
(
  porfolio_id                  integer                     NOT NULL  ,
  exchange_id                  bigint                      DEFAULT 0 ,
  expiry                       char varying                NOT NULL  ,
  hedging_symbol_id            bigint                      DEFAULT 0 ,
  underlying_hedging_symbol_id bigint                      DEFAULT 0 ,
  positive_delta               bigint                      DEFAULT 0 ,
  negative_delta               bigint                      DEFAULT 0 ,
  underlying                   smallint                    DEFAULT 0 ,
  delta_hedge_method           smallint                    DEFAULT 0 ,
  user_delta_value             bigint                      DEFAULT 0 ,
  hedge_timer                  bigint                      DEFAULT 0 ,
  modification_counter         bigint                      DEFAULT 0 ,
  market_order_counter         bigint                      DEFAULT 0 ,
  market_order_percent         bigint                      DEFAULT 0 ,
  tick_count                   bigint                      DEFAULT 0 ,
  interest_rate                bigint                      DEFAULT 0 ,
  dqr_percent                  bigint                      DEFAULT 0 ,
  account_detail               character varying(100)      NOT NULL  ,
  effective_timestamp          timestamp without time zone DEFAULT now(),
  last_modification_timestamp  timestamp without time zone DEFAULT now(),
  CONSTRAINT uhedge_strategy_portfolios_pkey PRIMARY KEY (porfolio_id,expiry,hedging_symbol_id,account_detail)
);

--Table containing position data.
CREATE TABLE ${appmaster}.uhedge_position_data
(
  porfolio_id                  integer                     NOT NULL,
  symbol_id                    bigint                      NOT NULL,
  client_code                  char varying                NOT NULL,
  expiry                       char varying                NOT NULL,
  buy_traded_quantity          bigint                      DEFAULT 0,
  average_buy_traded_price     bigint                      DEFAULT 0,
  sell_traded_quantity         bigint                      DEFAULT 0,
  average_sell_traded_price    bigint                      DEFAULT 0,
  is_hedge_leg                 boolean                     DEFAULT false,
  effective_timestamp          timestamp without time zone DEFAULT now(),
  last_modification_timestamp  timestamp without time zone DEFAULT now(),
  CONSTRAINT p_key_uhedge_position_data PRIMARY KEY (porfolio_id,symbol_id,client_code,is_hedge_leg,expiry)
);
