-- ==========================================
-- symbol_daily_margin
-- Description: MCX Daily Margin %, Can be used for other exchanges in future
-- ==========================================

CREATE TABLE ${appmaster}.symbol_daily_margin
(
  exchange_id VARCHAR NOT NULL,
  instrument_type CHARACTER(1) NOT NULL,
  symbol CHAR VARYING NOT NULL,
  maturity_yearmon INTEGER NOT NULL,
  maturity_day INTEGER NOT NULL,
  initial_margin_percent INTEGER DEFAULT 0,
  tender_margin_percent INTEGER DEFAULT 0,
  total_margin_percent INTEGER DEFAULT 0,
  addition_long_margin_percent INTEGER DEFAULT 0,
  addition_short_margin_percent INTEGER DEFAULT 0,
  special_long_margin_percent INTEGER DEFAULT 0,
  special_short_margin_percent INTEGER DEFAULT 0,
  elm_long_margin_percent INTEGER DEFAULT 0,
  elm_short_margin_percent INTEGER DEFAULT 0,
  delivery_margin_percent INTEGER DEFAULT 0,
  is_updated BOOLEAN DEFAULT true,
  updated_by CHAR VARYING,
  effective_time_stamp timestamp DEFAULT NOW(),
  PRIMARY KEY( exchange_id, instrument_type, symbol, maturity_yearmon, maturity_day )
);

-- ==========================================
-- symbol_daily_margin_history
-- ==========================================

CREATE TABLE ${appmaster}.symbol_daily_margin_history
(
  exchange_id VARCHAR NOT NULL,
  instrument_type CHARACTER(1) NOT NULL,
  symbol CHAR VARYING NOT NULL,
  maturity_yearmon INTEGER NOT NULL,
  maturity_day INTEGER NOT NULL,
  initial_margin_percent INTEGER DEFAULT 0,
  tender_margin_percent INTEGER DEFAULT 0,
  total_margin_percent INTEGER DEFAULT 0,
  addition_long_margin_percent INTEGER DEFAULT 0,
  addition_short_margin_percent INTEGER DEFAULT 0,
  special_long_margin_percent INTEGER DEFAULT 0,
  special_short_margin_percent INTEGER DEFAULT 0,
  elm_long_margin_percent INTEGER DEFAULT 0,
  elm_short_margin_percent INTEGER DEFAULT 0,
  delivery_margin_percent INTEGER DEFAULT 0,
  is_updated BOOLEAN DEFAULT true,
  updated_by CHAR VARYING,
  effective_time_stamp timestamp DEFAULT NOW()
);

