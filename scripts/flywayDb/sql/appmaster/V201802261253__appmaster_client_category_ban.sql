-- =========================================
--   Global Client Categoy Ban
--   Some particular Client Categories orders will be banned 
--   from doing trading for some specfic symbols
--  =========================================

CREATE TABLE ${appmaster}.client_category_ban
(
  client_type smallint not null references refmaster.client_types(client_type),
  square_off_status smallint not null references refmaster.square_off_status(square_off_status),
  order_mode_allowed  smallint not null references refmaster.order_mode(order_mode),
  source char varying NOT NULL,
  market_id char varying NOT NULL, 
  instrument char varying NOT NULL,
  symbol char varying NOT NULL,
  group_name char varying,
  maturity_yearmon integer,
  maturity_day integer,
  option_type char varying,
  strike_price bigint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);

CREATE TABLE ${appmaster}.client_category_ban_history
(
  client_type smallint not null references refmaster.client_types(client_type),
  square_off_status smallint not null references refmaster.square_off_status(square_off_status),
  order_mode_allowed  smallint not null references refmaster.order_mode(order_mode),
  source char varying NOT NULL,
  market_id char varying NOT NULL,
  instrument char varying NOT NULL,
  symbol char varying NOT NULL,
  group_name char varying,
  maturity_yearmon integer,
  maturity_day integer,
  option_type char varying,
  strike_price bigint,
  updated_by  char varying,
  effective_time_stamp  timestamp NOT NULL
);
