--- Unhedge Tracker Data Table ---

CREATE TABLE ${appmaster}.unhedge_tracker_data
(
  strategy_id integer NOT NULL,
  symbol_id bigint NOT NULL,
  order_qty bigint NOT NULL,
  hedge_price bigint NOT NULL,
  order_mode integer NOT NULL,
  is_bid_leg BOOLEAN DEFAULT FALSE,
  is_pending BOOLEAN DEFAULT FALSE,

  PRIMARY KEY( strategy_id, symbol_id )
);

--- StrategyId wise State and AdminTokenId ---

CREATE TABLE ${appmaster}.strategy_unhedged_status
(
  strategy_id integer NOT NULL,
  admin_token_id integer NOT NULL,
  is_terminated BOOLEAN DEFAULT FALSE,
  client_id integer NOT NULL,

  PRIMARY KEY( strategy_id )
);
