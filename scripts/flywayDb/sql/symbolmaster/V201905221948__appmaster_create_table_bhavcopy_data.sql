-- Table for storing NSECM bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_nsecm_data(
symbol character varying(50),
series character varying(3),
entry_time date not null default CURRENT_DATE,
isin character varying(30),
open bigint,
high bigint,
low bigint,
close bigint,
last_trade_price bigint,
previous_close bigint,
traded_volume bigint,
traded_value numeric,
total_trades bigint,
primary key( symbol, entry_time, isin )
);

-- Table for storing NSEFO bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_nsefo_data(
symbol character varying(50),
instrument_name character varying(6),
expiry integer,
option_type character varying(2),
strike_price numeric,
entry_time date not null default CURRENT_DATE,
open bigint,
high bigint,
low bigint,
close bigint,
settlement_price bigint,
traded_volume bigint,
traded_value numeric,
open_interest bigint,
change_in_open_interest bigint,
primary key( symbol, expiry, strike_price, option_type, entry_time )
);

-- Table for storing NSECD bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_nsecd_data(
symbol character varying(50),
instrument_name character varying(6),
expiry integer,
option_type character varying(2),
strike_price numeric,
entry_time date not null default CURRENT_DATE,
previous_settlement_price bigint,
open bigint,
high bigint,
low bigint,
close bigint,
settlement_price bigint,
net_change numeric,
traded_volume bigint,
traded_value numeric,
total_trades bigint,
open_interest bigint,
premium_value numeric,
underlying_st character varying,
primary key( symbol, expiry, strike_price, option_type, entry_time )
);

-- Table for storing BSECM bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_bsecm_data(
security_id integer,
symbol character varying(50),
series character varying(3),
security_type character varying(2),
entry_time date not null default CURRENT_DATE,
open bigint,
high bigint,
low bigint,
close bigint,
last_trade_price bigint,
previous_close bigint,
traded_volume bigint,
total_trades bigint,
net_turnover numeric,
corporate_actions_indicator character varying,
primary key( security_id, symbol, entry_time )
);

-- Table for storing MCX bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_mcx_data(
symbol character varying(50),
instrument_name character varying(6),
expiry integer,
option_type character varying(2),
strike_price numeric,
entry_time date not null default CURRENT_DATE,
open bigint,
high bigint,
low bigint,
close bigint,
previous_close bigint,
traded_volume bigint,
traded_value numeric,
trade_volume_in_000s character varying(25),
open_interest bigint,
primary key( symbol, expiry, strike_price, option_type, entry_time )
);
