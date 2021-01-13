CREATE TABLE ${appmaster}.holdings
(
  id char varying NOT NULL,
  isin char varying NOT NULL,
  holding_type integer NOT NULL,
  total_quantity bigint NOT NULL,
  pending_quantity bigint NOT NULL,
  sold_quantity bigint NOT NULL,
  collateral_quantity bigint NOT NULL,
  haircut smallint NOT NULL,
  updated_by char varying ,
  effective_time_stamp timestamp NOT NULL,
  updated char varying DEFAULT false,

  PRIMARY KEY (id,isin,holding_type)
);

CREATE TABLE ${appmaster}.holdings_history
(
  id char varying NOT NULL,
  isin char varying NOT NULL,
  holding_type integer NOT NULL,
  total_quantity bigint NOT NULL,
  pending_quantity bigint NOT NULL,
  sold_quantity bigint NOT NULL,
  collateral_quantity bigint NOT NULL,
  haircut smallint NOT NULL,
  updated_by char varying ,
  effective_time_stamp timestamp NOT NULL,
  updated char varying DEFAULT false
);
