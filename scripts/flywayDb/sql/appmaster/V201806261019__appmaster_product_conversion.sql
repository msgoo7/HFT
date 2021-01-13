CREATE TABLE ${appmaster}.product_conversion
(
  sequence integer NOT NULL,
  initiator_id integer NOT NULL DEFAULT 0,
  client varchar NOT NULL,
  source_product bigint NOT NULL DEFAULT 0,
  target_product bigint NOT NULL DEFAULT 0,
  symbol_id bigint NOT NULL,
  quantity bigint NOT NULL,
  value bigint NOT NULL,
  position_mode integer NOT NULL,
  status integer NOT NULL,
  rejection_text varchar,
  updated_by char varying NOT NULL DEFAULT 'SUPERADMIN',
  effective_timestamp timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY (sequence, client, source_product, target_product, symbol_id)
);

CREATE TABLE ${appmaster}.product_conversion_history
(
  sequence integer NOT NULL,
  initiator_id integer NOT NULL DEFAULT 0,
  client varchar NOT NULL,
  source_product bigint NOT NULL DEFAULT 0,
  target_product bigint NOT NULL DEFAULT 0,
  symbol_id bigint NOT NULL,
  quantity bigint NOT NULL,
  value bigint NOT NULL,
  position_mode integer NOT NULL,
  status integer NOT NULL,
  rejection_text varchar,
  updated_by char varying NOT NULL DEFAULT 'SUPERADMIN',
  effective_timestamp timestamp NOT NULL DEFAULT now()
);


