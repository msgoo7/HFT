--Table for storing position data on temporary basis.
CREATE TABLE ${appmaster}.uhedge_position_data_backup
(
  porfolio_id                  integer                     NOT NULL,
  symbol_id                    bigint                      NOT NULL,
  client_code                  char varying                NOT NULL,
  expiry                       char varying                NOT NULL,
  buy_traded_quantity          bigint                      DEFAULT 0,
  buy_traded_amount            bigint                      DEFAULT 0,
  sell_traded_quantity         bigint                      DEFAULT 0,
  sell_traded_amount           bigint                      DEFAULT 0,
  is_hedge_leg                 boolean                     DEFAULT false,
  effective_timestamp          timestamp without time zone DEFAULT now(),
  last_modification_timestamp  timestamp without time zone DEFAULT now(),
  CONSTRAINT p_key_uhedge_position_data_backup PRIMARY KEY (porfolio_id,symbol_id,client_code,is_hedge_leg,expiry)
);

