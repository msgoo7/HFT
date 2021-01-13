-- Table for storing BSEFO bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_bsefo_data(
  security_id integer,
  scrip_name character varying,
  symbol character varying(50),
  instrument_name character varying(6),
  expiry integer,
  option_type character varying(2),
  strike_price bigint,
  entry_time date not null default CURRENT_DATE,
  previous_close bigint, 
  open bigint,
  high bigint,
  low bigint,
  close bigint,
  traded_volume bigint,
  traded_value bigint, 
  total_trades bigint,
  open_interest bigint );

-- Table for storing BSECDS bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_bsecds_data( 
  security_id integer,
  scrip_name character varying,
  symbol character varying(50),
  instrument_name character varying(6),
  expiry integer, 
  option_type character varying(2),
  strike_price bigint, 
  entry_time date not null default CURRENT_DATE,
  open bigint,
  high bigint,
  low bigint,
  close bigint, 
  traded_volume bigint, 
  traded_value bigint,
  open_interest bigint,
  change_in_open_interest bigint );
