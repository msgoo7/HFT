CREATE TABLE ${appmaster}.symbol_exposure_otm
(
  exchange_id varchar NOT NULL,
  symbol_id bigint NOT NULL,
  exposure_percent varchar NOT NULL,
  is_updated boolean DEFAULT true,
  updated_by char varying,
  effective_time_stamp timestamp NOT NULL,
  PRIMARY KEY(symbol_id)
);

