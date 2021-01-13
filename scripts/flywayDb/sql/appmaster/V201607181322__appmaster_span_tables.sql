-- DROP TABLE appmaster.exposure_margins;

CREATE TABLE appmaster.exposure_margins
(
  market_id character varying(10) NOT NULL,
  symbol character varying(30) NOT NULL,
  mkt_lot integer,
  maturity_date timestamp without time zone,
  close_price double precision,
  short_option_charge double precision,
  span_margin_percentage double precision,
  span_margin_per_lot double precision,
  exposure_margin_percentage double precision,
  exposure_margin_per_lot double precision,
  total_margin_percentage double precision,
  total_margin_per_lot double precision,
  net_future_value double precision
)
WITH (
  OIDS=FALSE
);
ALTER TABLE appmaster.exposure_margins
  OWNER TO mutrade;

-- Table: appmaster.span_margins

-- DROP TABLE appmaster.span_margins;

CREATE TABLE appmaster.span_margins
(
  symbol character varying(30) NOT NULL,
  market_id character varying(10) NOT NULL,
  mkt_lot integer,
  maturity_date timestamp without time zone,
  price numeric(24,6),
  sell_span_margin numeric(24,6),
  buy_span_margin numeric(24,6),
  short_option_charge double precision,
  span_exposure_per_lot numeric(24,6),
  span_exposure_percentage double precision,
  security_id integer,
  option_type character(1),
  strike_price numeric(24,6),
  sell_margin_percentage numeric(10,2),
  buy_margin_percentage numeric(10,2)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE appmaster.span_margins
  OWNER TO mutrade;


-- Table: appmaster.span_initial_margins

-- DROP TABLE appmaster.span_initial_margins;

CREATE TABLE appmaster.span_initial_margins
(
  market_id character varying(10) NOT NULL,
  symbol character varying(20) NOT NULL,
  maturity_yearmon integer NOT NULL,
  price integer,
  ra1 double precision,
  ra2 double precision,
  ra3 double precision,
  ra4 double precision,
  ra5 double precision,
  ra6 double precision,
  ra7 double precision,
  ra8 double precision,
  ra9 double precision,
  ra10 double precision,
  ra11 double precision,
  ra12 double precision,
  ra13 double precision,
  ra14 double precision,
  ra15 double precision,
  ra16 double precision,
  buy_initial_margin double precision,
  sell_initial_margin double precision,
  delta double precision,
  volatility double precision,
  value_factor double precision,
  price_scan double precision,
  volume_scan double precision,
  CONSTRAINT span_initial_margins_pkey PRIMARY KEY (market_id, symbol, maturity_yearmon)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE appmaster.span_initial_margins
  OWNER TO mutrade;


-- Table: appmaster.span_margin_calculation_details

-- DROP TABLE appmaster.span_margin_calculation_details;

CREATE TABLE appmaster.span_margin_calculation_details
(
  market_id character varying(10),
  symbol character varying(20),
  maturity_yearmon integer,
  maturity_day integer,
  security_id integer,
  risk_array_1 double precision,
  risk_array_2 double precision,
  risk_array_3 double precision,
  risk_array_4 double precision,
  risk_array_5 double precision,
  risk_array_6 double precision,
  risk_array_7 double precision,
  risk_array_8 double precision,
  risk_array_9 double precision,
  risk_array_10 double precision,
  risk_array_11 double precision,
  risk_array_12 double precision,
  risk_array_13 double precision,
  risk_array_14 double precision,
  risk_array_15 double precision,
  risk_array_16 double precision,
  deltas double precision,
  strike_price numeric(10,2),
  option_type character(1),
  security_type character varying,
  price numeric(24,6)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE appmaster.span_margin_calculation_details
  OWNER TO mutrade;
-- Table: appmaster.spread

-- DROP TABLE appmaster.spread;

CREATE TABLE appmaster.spread
(
  market_id character varying(10) NOT NULL,
  contract character varying NOT NULL,
  first_month character varying NOT NULL,
  second_month character varying NOT NULL,
  spread double precision,
  security_type character varying,
  CONSTRAINT spread_pkey PRIMARY KEY (market_id, contract, first_month, second_month)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE appmaster.spread
  OWNER TO mutrade;
COMMENT ON TABLE appmaster.spread
  IS 'Maintains spread data for contracts';

-- Table: appmaster.span_margins_temp

-- DROP TABLE appmaster.span_margins_temp;

CREATE TABLE appmaster.span_margins_temp
(
  symbol character varying(30) NOT NULL,
  short_option_charge double precision
)
WITH (
  OIDS=FALSE
);
ALTER TABLE appmaster.span_margins_temp
  OWNER TO mutrade;
