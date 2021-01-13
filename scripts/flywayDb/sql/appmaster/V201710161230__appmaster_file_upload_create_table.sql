-- ==========================================
-- Position Upload RMS
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.client_position_info;
CREATE TABLE ${appmaster}.client_position_info
(
  exchange_id varchar NOT NULL,
  product_id varchar NOT NULL,
  instrument_type varchar NOT NULL,
  symbol varchar NOT NULL,
  expiry varchar NOT NULL,
  option_type varchar  ,
  strike_price varchar ,
  account varchar NOT NULL,
  account_type varchar NOT NULL,
  member_type varchar NOT NULL,
  long_quantity varchar ,
  short_quantity varchar ,
  long_brought_fwd_quantity varchar ,
  short_brought_fwd_quantity varchar ,
  settlement_price varchar ,
  net_premium varchar , 
  is_updated boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY(exchange_id,product_id,member_type,account_type,instrument_type,symbol,expiry,strike_price,option_type,account)
);


-- ==========================================
-- symbol_var
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.symbol_var;
CREATE TABLE ${appmaster}.symbol_var
(
  exchange_id varchar NOT NULL, 
  symbol varchar NOT NULL, 
  group_name varchar NOT NULL, 
  var_percent varchar, 
  is_updated boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL,

  PRIMARY KEY(exchange_id,symbol,group_name)
);

-- ==========================================
-- symbol_elm
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.symbol_elm;
CREATE TABLE ${appmaster}.symbol_elm
(
  exchange_id varchar NOT NULL, 
  symbol varchar NOT NULL, 
  group_name varchar NOT NULL, 
  elm_percent varchar, 
  is_updated boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL, 
  
  PRIMARY KEY(exchange_id,symbol,group_name)
);

-- ==========================================
-- Position Upload History RMS
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.client_position_info_history;
CREATE TABLE ${appmaster}.client_position_info_history
(
  exchange_id varchar NOT NULL,
  product_id varchar NOT NULL,
  instrument_type varchar NOT NULL,
  symbol varchar NOT NULL,
  expiry varchar NOT NULL,
  option_type varchar  ,
  strike_price varchar ,
  account varchar NOT NULL,
  account_type varchar NOT NULL,
  member_type varchar NOT NULL,
  long_quantity varchar ,
  short_quantity varchar ,
  long_brought_fwd_quantity varchar ,
  short_brought_fwd_quantity varchar ,
  settlement_price varchar ,
  net_premium varchar , 
  is_updated boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL

);


-- ==========================================
-- symbol_var_history
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.symbol_var_history;
CREATE TABLE ${appmaster}.symbol_var_history
(
  exchange_id varchar NOT NULL, 
  symbol varchar NOT NULL, 
  group_name varchar NOT NULL, 
  var_percent varchar, 
  is_updated boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL

);

-- ==========================================
-- symbol_elm_history
-- Description:
-- ==========================================

--DROP TABLE ${appmaster}.symbol_elm_history;
CREATE TABLE ${appmaster}.symbol_elm_history
(
  exchange_id varchar NOT NULL, 
  symbol varchar NOT NULL, 
  group_name varchar NOT NULL, 
  elm_percent varchar, 
  is_updated boolean DEFAULT true,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL 
  
);
