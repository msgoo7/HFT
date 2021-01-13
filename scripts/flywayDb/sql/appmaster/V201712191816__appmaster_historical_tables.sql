-- ==========================================
-- Function to create language
-- Description:
-- ==========================================

CREATE OR REPLACE FUNCTION make_plpgsql()
RETURNS VOID
LANGUAGE SQL
AS $$
CREATE LANGUAGE plpgsql;
$$;

-- ==========================================
-- Query checks the existence of language
-- Description:
-- ==========================================

SELECT
CASE
WHEN EXISTS(
  SELECT 1
  FROM pg_catalog.pg_language
  WHERE lanname='plpgsql'
)
THEN NULL
ELSE make_plpgsql() 
END;


-- ==========================================
-- Receive confirmation
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.receive_confirmation;
CREATE TABLE ${appmaster}.receive_confirmation
(
  sequence_number bigint NOT NULL,
  client_order_id bigint NOT NULL,
  symbol_id bigint NOT NULL,
  order_status integer NOT NULL,
  exchange_order_id varchar NOT NULL,
  exchange_modify_time bigint NOT NULL,
  strategy_id integer NOT NULL,
  source integer NOT NULL,
  exchange varchar NOT NULL,
  symbol varchar NOT NULL,
  security_id bigint NOT NULL,
  scrip_name varchar NOT NULL,
  option_mode varchar NOT NULL,
  expiry varchar NOT NULL,
  security_type varchar NOT NULL,
  strike_price varchar NOT NULL,
  group_name varchar NOT NULL,
  dealer_id varchar NOT NULL,
  limit_price bigint NOT NULL,
  order_mode integer  NOT NULL,
  order_quantity bigint NOT NULL,
  order_price bigint NOT NULL,
  last_fill_quantity bigint NOT NULL,
  last_fill_price bigint NOT NULL,
  original_client_order_id bigint NOT NULL,
  trader_id bigint NOT NULL,
  error_code integer NOT NULL,
  order_category integer DEFAULT NULL,
  trade_id varchar NOT NULL,
  order_validity integer NOT NULL,
  confirmation_type integer NOT NULL,
  fix_client_order_id varchar,
  stop_price bigint,
  product_type integer NOT NULL,
  platform_type integer NOT NULL,
  primary_client_code varchar NOT NULL,
  exchange_client_code varchar NOT NULL,
  account_type integer NOT NULL,
  location_id bigint NOT NULL,
  updated_by varchar NOT NULL,
  eod_date timestamp NOT NULL,


  PRIMARY KEY(sequence_number,client_order_id,symbol_id,order_status)
);

-- ==========================================
-- Master confirmation Book
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.master_confirmation_book;
CREATE TABLE ${appmaster}.master_confirmation_book
(
  sequence_number bigint NOT NULL,
  client_order_id bigint NOT NULL,
  symbol_id bigint NOT NULL,
  order_status integer NOT NULL,
  exchange_order_id varchar NOT NULL,
  exchange_modify_time bigint NOT NULL,
  strategy_id integer NOT NULL,
  source integer NOT NULL,
  exchange varchar NOT NULL,
  symbol varchar NOT NULL,
  security_id bigint NOT NULL,
  scrip_name varchar NOT NULL,
  option_mode varchar NOT NULL,
  expiry varchar NOT NULL,
  security_type varchar NOT NULL,
  strike_price varchar NOT NULL,
  group_name varchar NOT NULL,
  dealer_id varchar NOT NULL,
  limit_price bigint NOT NULL,
  order_mode integer  NOT NULL,
  order_quantity bigint NOT NULL,
  order_price bigint NOT NULL,
  last_fill_quantity bigint NOT NULL,
  last_fill_price bigint NOT NULL,
  original_client_order_id bigint NOT NULL,
  trader_id bigint NOT NULL,
  error_code integer NOT NULL,
  order_category integer DEFAULT NULL,
  trade_id varchar NOT NULL,
  order_validity integer NOT NULL,
  confirmation_type integer NOT NULL,
  fix_client_order_id varchar,
  stop_price bigint,
  product_type integer NOT NULL,
  platform_type integer NOT NULL,
  primary_client_code varchar NOT NULL,
  exchange_client_code varchar NOT NULL,
  account_type integer NOT NULL,
  location_id bigint NOT NULL,
  updated_by varchar NOT NULL,
  eod_date timestamp NOT NULL,


  PRIMARY KEY(sequence_number,client_order_id,symbol_id,order_status,eod_date)
);

-- ==========================================
-- Historical Order Book
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.historical_order_book;
CREATE TABLE ${appmaster}.historical_order_book
(
  sequence_number bigint NOT NULL,
  client_order_id bigint NOT NULL,
  symbol_id bigint NOT NULL,
  order_status varchar NOT NULL,
  exchange_order_id varchar NOT NULL,
  exchange_modify_time bigint NOT NULL,
  strategy_id integer NOT NULL,
  source integer NOT NULL,
  exchange varchar NOT NULL,
  scrip_name varchar NOT NULL,
  option_mode varchar NOT NULL,
  expiry varchar NOT NULL,
  security_type varchar NOT NULL,
  strike_price varchar NOT NULL,
  group_name varchar NOT NULL,
  dealer_id varchar NOT NULL,
  limit_price bigint NOT NULL,
  order_mode varchar  NOT NULL,
  order_quantity bigint NOT NULL,
  order_price bigint NOT NULL,
  filled_quantity bigint NOT NULL,
  original_client_order_id bigint NOT NULL,
  trader_id bigint NOT NULL,
  error_code integer NOT NULL,
  order_category integer DEFAULT NULL,
  trade_id varchar NOT NULL,
  order_validity integer NOT NULL,
  confirmation_type integer NOT NULL,
  fix_client_order_id varchar,
  stop_price bigint,
  product_type integer NOT NULL,
  platform_type integer NOT NULL,
  primary_client_code varchar NOT NULL,
  exchange_client_code varchar NOT NULL,
  account_type integer NOT NULL,
  location_id bigint NOT NULL,
  updated_by varchar NOT NULL,
  eod_date timestamp NOT NULL,


  PRIMARY KEY(sequence_number,exchange_order_id,eod_date)
);


-- ==========================================
-- Historical trade Book
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.historical_trade_book;
CREATE TABLE ${appmaster}.historical_trade_book
(
  sequence_number bigint NOT NULL,
  client_order_id bigint NOT NULL,
  symbol_id bigint NOT NULL,
  order_status varchar NOT NULL,
  exchange_order_id varchar NOT NULL,
  exchange_modify_time bigint NOT NULL,
  strategy_id integer NOT NULL,
  source integer NOT NULL,
  exchange varchar NOT NULL,
  scrip_name varchar NOT NULL,
  option_mode varchar NOT NULL,
  expiry varchar NOT NULL,
  security_type varchar NOT NULL,
  strike_price varchar NOT NULL,
  group_name varchar NOT NULL,
  dealer_id varchar NOT NULL,
  limit_price bigint NOT NULL,
  order_mode varchar  NOT NULL,
  order_quantity bigint NOT NULL,
  order_price bigint NOT NULL,
  filled_quantity bigint NOT NULL,
  original_client_order_id bigint NOT NULL,
  trader_id bigint NOT NULL,
  error_code integer NOT NULL,
  order_category integer DEFAULT NULL,
  trade_id varchar NOT NULL,
  order_validity integer NOT NULL,
  confirmation_type integer NOT NULL,
  fix_client_order_id varchar,
  stop_price bigint,
  product_type integer NOT NULL,
  platform_type integer NOT NULL,
  primary_client_code varchar NOT NULL,
  exchange_client_code varchar NOT NULL,
  account_type integer NOT NULL,
  location_id bigint NOT NULL,
  updated_by varchar NOT NULL,
  eod_date timestamp NOT NULL,


  PRIMARY KEY(sequence_number,exchange_order_id,eod_date)
);


-- ==========================================
-- Function to add entries in order book 
-- and trade book
-- Description:
-- ==========================================
CREATE OR REPLACE FUNCTION order_book ()    
RETURNS trigger    
AS $add_order$
DECLARE
previous_quantity bigint default(0);
new_quantity bigint default(0);
fill_status varchar;
order_mode varchar;
isExist boolean default false;
BEGIN
  IF NEW.order_mode = '0' THEN
    order_mode = 'BUY';
  ELSEIF NEW.order_mode = '1' THEN
    order_mode = 'SELL';
  ELSE
    RETURN NEW;
  END IF;

  IF NEW.order_status = 2 THEN
    SELECT historical_order_book.filled_quantity into previous_quantity from historical_order_book  where exchange_order_id = NEW.exchange_order_id;
    IF previous_quantity IS NULL THEN
      IF NEW.last_fill_quantity = NEW.order_quantity THEN
        fill_status = 'FULLY FILLED' ;
      ELSE
        fill_status = 'PARTIALLY FILLED' ;
      END IF;
      new_quantity = NEW.last_fill_quantity;
      INSERT into historical_order_book values( NEW.sequence_number, 
        NEW.client_order_id, 
        NEW.symbol_id, 
        fill_status, 
        NEW.exchange_order_id, 
        NEW.exchange_modify_time, 
        NEW.strategy_id, 
        NEW.source, 
        NEW.exchange, 
        NEW.scrip_name, 
        NEW.option_mode, 
        NEW.expiry, 
        NEW.security_type,
        NEW.strike_price,
        NEW.group_name, 
        NEW.dealer_id, 
        NEW.limit_price, 
        order_mode, 
        NEW.order_quantity, 
        NEW.order_price, 
        NEW.last_fill_quantity, 
        NEW.original_client_order_id, 
        NEW.trader_id,
        NEW.error_code,
        NEW.order_category,
        NEW.trade_id,
        NEW.order_validity,
        NEW.confirmation_type,
        NEW.fix_client_order_id,
        NEW.stop_price,
        NEW.product_type,
        NEW.platform_type,
        NEW.primary_client_code,
        NEW.exchange_client_code,
        NEW.account_type,
        NEW.location_id,
        NEW.updated_by,
        NEW.eod_date );
    ELSEIF previous_quantity IS NOT NULL THEN
      new_quantity = NEW.last_fill_quantity + previous_quantity;
      IF new_quantity = NEW.order_quantity THEN
        fill_status = 'FULLY FILLED' ;
      ELSE
        fill_status = 'PARTIALLY FILLED' ;
      END IF;
      UPDATE historical_order_book SET client_order_id = NEW.client_order_id,
      order_status = fill_status ,
      order_price = NEW.order_price, 
      order_quantity = NEW.order_quantity, 
      filled_quantity = new_quantity where exchange_order_id = NEW.exchange_order_id;
    END IF;
      INSERT into historical_trade_book values( NEW.sequence_number, 
        NEW.client_order_id, 
        NEW.symbol_id, 
        fill_status, 
        NEW.exchange_order_id, 
        NEW.exchange_modify_time, 
        NEW.strategy_id, 
        NEW.source, 
        NEW.exchange, 
        NEW.scrip_name, 
        NEW.option_mode, 
        NEW.expiry, 
        NEW.security_type,
        NEW.strike_price,
        NEW.group_name, 
        NEW.dealer_id, 
        NEW.limit_price, 
        order_mode, 
        NEW.order_quantity, 
        NEW.order_price, 
        NEW.last_fill_quantity, 
        NEW.original_client_order_id, 
        NEW.trader_id,
        NEW.error_code,
        NEW.order_category,
        NEW.trade_id,
        NEW.order_validity,
        NEW.confirmation_type,
        NEW.fix_client_order_id,
        NEW.stop_price,
        NEW.product_type,
        NEW.platform_type,
        NEW.primary_client_code,
        NEW.exchange_client_code,
        NEW.account_type,
        NEW.location_id,
        NEW.updated_by,
        NEW.eod_date );
  ELSEIF NEW.order_status = 5 THEN
      INSERT into historical_order_book values( NEW.sequence_number, 
        NEW.client_order_id, 
        NEW.symbol_id, 
        'NEW REJECTED', 
        NEW.exchange_order_id, 
        NEW.exchange_modify_time, 
        NEW.strategy_id, 
        NEW.source, 
        NEW.exchange, 
        NEW.scrip_name, 
        NEW.option_mode, 
        NEW.expiry, 
        NEW.security_type,
        NEW.strike_price,
        NEW.group_name, 
        NEW.dealer_id, 
        NEW.limit_price, 
        order_mode, 
        NEW.order_quantity, 
        NEW.order_price, 
        NEW.last_fill_quantity, 
        NEW.original_client_order_id, 
        NEW.trader_id,
        NEW.error_code,
        NEW.order_category,
        NEW.trade_id,
        NEW.order_validity,
        NEW.confirmation_type,
        NEW.fix_client_order_id,
        NEW.stop_price,
        NEW.product_type,
        NEW.platform_type,
        NEW.primary_client_code,
        NEW.exchange_client_code,
        NEW.account_type,
        NEW.location_id,
        NEW.updated_by,
        NEW.eod_date );
  ELSEIF NEW.order_status = 3 THEN
    SELECT true FROM historical_order_book into isExist where exchange_order_id = NEW.exchange_order_id;
    IF isExist = true THEN
      UPDATE historical_order_book SET order_status = 'CANCELLED' where exchange_order_id = NEW.exchange_order_id; 
    ELSEIF isExist = false THEN
      INSERT into historical_order_book values( NEW.sequence_number, 
        NEW.client_order_id, 
        NEW.symbol_id, 
        'CANCELLED', 
        NEW.exchange_order_id, 
        NEW.exchange_modify_time, 
        NEW.strategy_id, 
        NEW.source, 
        NEW.exchange, 
        NEW.scrip_name, 
        NEW.option_mode, 
        NEW.expiry, 
        NEW.security_type,
        NEW.strike_price,
        NEW.group_name, 
        NEW.dealer_id, 
        NEW.limit_price, 
        order_mode, 
        NEW.order_quantity, 
        NEW.order_price, 
        NEW.last_fill_quantity, 
        NEW.original_client_order_id, 
        NEW.trader_id,
        NEW.error_code,
        NEW.order_category,
        NEW.trade_id,
        NEW.order_validity,
        NEW.confirmation_type,
        NEW.fix_client_order_id,
        NEW.stop_price,
        NEW.product_type,
        NEW.platform_type,
        NEW.primary_client_code,
        NEW.exchange_client_code,
        NEW.account_type,
        NEW.location_id,
        NEW.updated_by,
        NEW.eod_date );
    END IF;
  END IF; 
  RETURN NEW;
END; 
$add_order$ 

LANGUAGE 'plpgsql';

CREATE TRIGGER add_order BEFORE INSERT ON master_confirmation_book
FOR EACH ROW EXECUTE PROCEDURE order_book();

