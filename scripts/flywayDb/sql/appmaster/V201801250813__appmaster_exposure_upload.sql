-- ==========================================
-- symbol_exposure
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.symbol_exposure;
CREATE TABLE ${appmaster}.symbol_exposure
(
  exchange_id varchar NOT NULL,
  symbol varchar NOT NULL,
  exposure_percent varchar NOT NULL,
  is_updated boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,
  PRIMARY KEY(exchange_id,symbol)
);

-- ==========================================
-- symbol_exposure_history
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.symbol_exposure_history;
CREATE TABLE ${appmaster}.symbol_exposure_history
(
  exchange_id varchar NOT NULL,
  symbol varchar NOT NULL,
  exposure_percent varchar NOT NULL,
  is_updated boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

