-- This file contains a repetitive function which is alread present in historical table 
-- file. But in case it is needed to update the function, one can update here and 
-- increase the file version.

-- ==========================================
-- Function to add entries in order book 
-- and trade book.
-- Description:
-- ==========================================
----
--
--
--
--Make new
--
--
--
CREATE OR REPLACE FUNCTION order_book ()    
RETURNS trigger    
AS $add_order$
DECLARE
previous_quantity bigint default(0);
new_quantity bigint default(0);
fill_status varchar;
order_mode varchar;
isExist boolean default false;
dealerIdStr varchar default('0');
BEGIN
  IF NEW.order_mode = '0' THEN
    order_mode = 'BUY';
  ELSEIF NEW.order_mode = '1' THEN
    order_mode = 'SELL';
  ELSE
    RETURN NEW;
  END IF;

  IF NEW.dealer_id != '0' THEN
    SELECT appmaster.unique_id.id into dealerIdStr from appmaster.unique_id  where unique_id_for_login = CAST(NEW.dealer_id as INT);
  END IF;

  IF NEW.order_status = 2 THEN
    SELECT historical_order_book.filled_quantity into previous_quantity from historical_order_book  where exchange_order_id = NEW.exchange_order_id;
    IF previous_quantity IS NULL THEN
      IF NEW.last_fill_quantity = NEW.order_quantity THEN
        fill_status = 'FILLED' ;
      ELSE
        fill_status = 'PARTIAL FILLED' ;
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
        dealerIdStr, 
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
        fill_status = 'FILLED' ;
      ELSE
        fill_status = 'PARTIAL FILLED' ;
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
      dealerIdStr, 
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
      dealerIdStr, 
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
      UPDATE historical_order_book SET order_status = 'CANCELED' where exchange_order_id = NEW.exchange_order_id; 
    ELSE
      INSERT into historical_order_book values( NEW.sequence_number, 
        NEW.client_order_id, 
        NEW.symbol_id, 
        'CANCELED', 
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
        dealerIdStr, 
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
  ELSEIF NEW.order_status = 12 THEN
    SELECT true FROM historical_order_book into isExist where exchange_order_id = NEW.exchange_order_id;
    IF isExist = true THEN
      UPDATE historical_order_book SET order_status = 'CANCELED' where exchange_order_id = NEW.exchange_order_id;
    ELSE
      INSERT into historical_order_book values( NEW.sequence_number,
        NEW.client_order_id,
        NEW.symbol_id,
        'CANCELED',
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
        dealerIdStr,
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

