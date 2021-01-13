
CREATE TABLE IF NOT EXISTS scrip_master (
    market_id character varying(10) NOT NULL,
    security_id integer NOT NULL,
    symbol character varying(50),
    instrument_type character(1),
    scrip_name character varying(100),
    group_name character varying(20),
    maturity_yearmon integer,
    maturity_day integer,
    option_type character varying,
    option_attribute character(1),
    symbol_type character(1),
    strike_price numeric,
    no_delivery character(1),
    market_lot integer,
    tick_size integer,
    suspended character(1),
    avm_flag character(1),
    avm_buy_margin integer,
    avm_sell_margin integer,
    span_margin numeric(3,2),
    exposure_margin numeric(3,2),
    settlement_type character(1),
    isin character varying(30),
    haircut integer DEFAULT 20,
    bcast_flag integer,
    mkt_pic_bcast_flag character varying(3),
    product_code character varying(10),
    underlying_id integer,
    is_auction_eligible integer,
    hi_52_wk integer,
    lo_52_wk integer,
    low_price_range integer,
    high_price_range integer,
    freeze_percent bigint,
    close_price integer,
    scrip_precision integer,
    contract_type character(1),
    security_id1 integer,
    security_id2 integer,
    maturity_yearmon2 integer,
    maturity_day2 integer,
    series_identity character varying,
    trade_value integer,
    symbol_id integer,
    trade_unit character varying,
    instrument_group integer,
    instrument_modifier integer,
    underlying_market_code integer,
    trading_session_id character varying(30),
    apply_lot integer,
    spread_maturity_yearmon integer,
    spread_maturity_day integer,
    base_currency character varying(10),
    price_unit character varying(10),
    quantity_unit character varying(10),
    delivery_unit character varying(10),
    partition_id integer DEFAULT 0,
    CONSTRAINT scrip_master_pkey PRIMARY KEY (market_id, security_id)
)
WITH (
    OIDS=FALSE
  );

-- Index: scrip_master_idx1

CREATE INDEX IF NOT EXISTS scrip_master_idx1
ON scrip_master
USING btree
(instrument_type, symbol, group_name, maturity_yearmon, maturity_day, option_type, strike_price);

-- Index: scrip_master_idx2

CREATE INDEX IF NOT EXISTS scrip_master_idx2
ON scrip_master
USING btree
(isin);


CREATE TABLE IF NOT EXISTS broker_details (
    broker character varying(6) NOT NULL,
    market_id character varying(10) NOT NULL,
    security_id integer NOT NULL,
    broker_symbol character varying(50),
    broker_security_id character varying(15),
    exchange_security_id character varying(15),
    broker_scrip_precision integer DEFAULT 0,
    CONSTRAINT broker_details_pkey PRIMARY KEY (broker, market_id, security_id)
)
WITH (
    OIDS=FALSE
  );



CREATE OR REPLACE FUNCTION make_plpgsql()
RETURNS VOID
LANGUAGE SQL
AS $$
CREATE LANGUAGE plpgsql;
$$;

-- ==========================================
-- -- -- Query checks the existence of language
-- -- -- Description:
-- -- -- ==========================================

SELECT CASE
WHEN EXISTS(
  SELECT 1
  FROM pg_catalog.pg_language
  WHERE lanname='plpgsql'
)
THEN NULL
ELSE make_plpgsql()
END;


CREATE OR REPLACE FUNCTION Delete_From_Broker_Details ()
RETURNS trigger
AS $Delete_From_Broker$
BEGIN
    DELETE from broker_details
      where market_id   = OLD.market_id
        AND   security_id = OLD.security_id;
          RETURN OLD;
END;
$Delete_From_Broker$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS Delete_From_Broker ON scrip_master;

CREATE TRIGGER Delete_From_Broker BEFORE DELETE ON scrip_master
FOR EACH ROW EXECUTE PROCEDURE Delete_From_Broker_Details();
