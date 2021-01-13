CREATE TABLE appmaster.multi_tick_size
(
  market_id character varying(10)  ,
  security_id integer              ,
  start_price_range double precision,
  end_price_range double precision ,
  tick_increment integer                
)
WITH (
  OIDS=FALSE
);
