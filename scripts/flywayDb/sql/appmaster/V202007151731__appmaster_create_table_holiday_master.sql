-- Table for Holiday Handling --

CREATE TABLE ${appmaster}.holiday_master(
  exchange_id VARCHAR NOT NULL,
  hol_date DATE NOT NULL,
  day INTEGER,
  description VARCHAR(151),
  updated_by VARCHAR,
  effective_timestamp timestamp without time zone DEFAULT now()
);

