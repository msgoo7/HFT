CREATE TABLE ${appmaster}.uhedge_settings(
  client_id                         integer  NOT NULL,
  porfolio_id                       integer  NOT NULL,
  portfolio_name                    character varying(50) NOT NULL,
  underlying_type                   smallint NOT NULL,
  underlying_symbol_name            character varying(50) DEFAULT NULL,
  exchange_id                       bigint   DEFAULT 0 ,
  hedging_symbol_id                 bigint   DEFAULT 0 ,
  underlying_hedging_symbol_id      bigint   DEFAULT 0 ,
  delta_hedge_method                smallint DEFAULT 0 ,
  user_delta_value                  bigint   DEFAULT 0 ,
  positive_delta                    bigint   DEFAULT 0 ,
  negative_delta                    bigint   DEFAULT 0 ,
  tick_count                        bigint   DEFAULT 0 ,
  market_order_percent              bigint   DEFAULT 0 ,
  market_order_counter              bigint   DEFAULT 0 ,
  modification_counter              bigint   DEFAULT 0 ,
  hedge_timer                       bigint   DEFAULT 0 ,
  interest_rate                     bigint   DEFAULT 0 ,
  dqr_percent                       bigint   DEFAULT 0 ,
  account_detail                    character varying(100) NOT NULL,
  effective_timestamp               timestamp without time zone DEFAULT now(),
  last_modification_timestamp       timestamp without time zone DEFAULT now(),
  expiration_timestamp              timestamp without time zone DEFAULT NULL,
  CONSTRAINT uhedge_pkey PRIMARY KEY ( porfolio_id, effective_timestamp )
);

CREATE TABLE ${appmaster}.uhedge_data(
  porfolio_id                       integer NOT NULL,
  symbol_id                         bigint  NOT NULL,
  buy_traded_quantity               bigint  DEFAULT 0,
  average_buy_traded_price          bigint  DEFAULT 0,
  sell_traded_quantity              bigint  DEFAULT 0,
  average_sell_traded_price         bigint  DEFAULT 0,
  is_hedge_leg                      boolean DEFAULT false,
  effective_timestamp               timestamp without time zone DEFAULT now(),
  last_modification_timestamp       timestamp without time zone DEFAULT now(),
  expiration_timestamp              timestamp without time zone DEFAULT NULL,
  CONSTRAINT uhedge_portfolio_pkey PRIMARY KEY (porfolio_id,symbol_id,last_modification_timestamp)
);