-- Table for storing All exchanges bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_data(
security_id integer,
market_id character varying(10),
scrip_name character varying,
symbol character varying(50),
series character varying(3),
instrument_name character varying(6),
expiry integer,
option_type character varying(2),
strike_price bigint,
entry_time date not null default CURRENT_DATE,
isin character varying(30),
open bigint,
high bigint,
low bigint,
close bigint,
last_trade_price bigint,
previous_close bigint,
previous_settlement_price bigint,
settlement_price bigint,
traded_volume bigint,
traded_value bigint,
total_trades bigint,
open_interest bigint,
change_in_open_interest bigint,
net_change bigint,
net_turnover bigint,
premium_value bigint,
trade_volume_in_000s character varying(25),
underlying_st character varying,
corporate_actions_indicator character varying
);

--Drop All Bhavcopy Tables Exchange-Segment Wise
DROP TABLE ${appmaster}.bhavcopy_nsecm_data;
DROP TABLE ${appmaster}.bhavcopy_nsefo_data;
DROP TABLE ${appmaster}.bhavcopy_nsecd_data;
DROP TABLE ${appmaster}.bhavcopy_bsecm_data;
DROP TABLE ${appmaster}.bhavcopy_mcx_data;

-- Table for storing NSECM bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_nsecm_data(
security_id integer,
scrip_name character varying,
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
traded_value bigint,
total_trades bigint
);

-- Table for storing NSEFO bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_nsefo_data(
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
settlement_price bigint,
traded_volume bigint,
traded_value bigint,
open_interest bigint,
change_in_open_interest bigint
);

-- Table for storing NSECD bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_nsecds_data(
security_id integer,
scrip_name character varying,
symbol character varying(50),
instrument_name character varying(6),
expiry integer,
option_type character varying(2),
strike_price bigint,
entry_time date not null default CURRENT_DATE,
previous_settlement_price bigint,
open bigint,
high bigint,
low bigint,
close bigint,
settlement_price bigint,
net_change numeric,
traded_volume bigint,
traded_value bigint,
total_trades bigint,
open_interest bigint,
premium_value bigint,
underlying_st character varying
);

-- Table for storing BSECM bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_bsecm_data(
security_id integer,
scrip_name character varying,
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
net_turnover bigint,
corporate_actions_indicator character varying
);

-- Table for storing MCX bhavcopy data
CREATE TABLE ${appmaster}.bhavcopy_mcx_data(
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
previous_close bigint,
traded_volume bigint,
traded_value bigint,
trade_volume_in_000s character varying(25),
open_interest bigint
);
