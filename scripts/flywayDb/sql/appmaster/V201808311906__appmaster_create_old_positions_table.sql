--This table is used for storing the standing positions at the end of the day which will be restored
--on next trading session
CREATE TABLE ${appmaster}.old_positions 
(
  dealer int NOT NULL,
  symbol_id bigint NOT NULL,
  client char varying NOT NULL,
  exchange smallint NOT NULL,
  segment smallint NOT NULL,
  net_qty bigint NOT NULL,
  net_value bigint NOT NULL,
  CONSTRAINT p_key_old_positions PRIMARY KEY ( dealer , symbol_id , client , exchange , segment )
);

CREATE TABLE ${appmaster}.old_positions_history
(
  dealer int NOT NULL,
  symbol_id bigint NOT NULL,
  client char varying NOT NULL,
  exchange smallint NOT NULL,
  segment smallint NOT NULL,
  net_qty bigint NOT NULL,
  net_value bigint NOT NULL,
  effective_time_stamp  timestamp NOT NULL
);
