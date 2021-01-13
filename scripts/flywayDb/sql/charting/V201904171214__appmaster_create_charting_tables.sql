CREATE TABLE ${appmaster}.symbols (
  unique_id_for_symbol bigserial NOT NULL,
  symbol_id bigint NOT NULL,
  exchange character varying,
  instrument_name character varying,
  CONSTRAINT symbols_pkey PRIMARY KEY(unique_id_for_symbol),
  CONSTRAINT symbols_unique_key UNIQUE(instrument_name)
);

CREATE TABLE ${appmaster}.ohlc_1_min
(
  unique_id_for_symbol bigint NOT NULL,
  timestamp bigint NOT NULL,
  open bigint NOT NULL,
  high bigint NOT NULL,
  low bigint NOT NULL,
  close bigint NOT NULL,
  volume bigint NOT NULL,
  full_candle boolean NOT NULL,
  CONSTRAINT ohlc_1_min_pkey PRIMARY KEY(unique_id_for_symbol, timestamp),
  CONSTRAINT ohlc_1_min_fkey FOREIGN KEY (unique_id_for_symbol)
  REFERENCES appmaster.symbols (unique_id_for_symbol)
) PARTITION BY RANGE (timestamp);
CREATE TABLE ${appmaster}.ohlc_1_min_default PARTITION OF ${appmaster}.ohlc_1_min DEFAULT;

CREATE TABLE ${appmaster}.ohlc_3_min
(
  unique_id_for_symbol bigint NOT NULL,
  timestamp bigint NOT NULL,
  open bigint NOT NULL,
  high bigint NOT NULL,
  low bigint NOT NULL,
  close bigint NOT NULL,
  volume bigint NOT NULL,
  full_candle boolean NOT NULL,
  CONSTRAINT ohlc_3_min_pkey PRIMARY KEY(unique_id_for_symbol, timestamp),
  CONSTRAINT ohlc_3_min_fkey FOREIGN KEY (unique_id_for_symbol)
  REFERENCES appmaster.symbols (unique_id_for_symbol)
) PARTITION BY RANGE (timestamp);
CREATE TABLE ${appmaster}.ohlc_3_min_default PARTITION OF ${appmaster}.ohlc_3_min DEFAULT;

CREATE TABLE ${appmaster}.ohlc_5_min
(
  unique_id_for_symbol bigint NOT NULL,
  timestamp bigint NOT NULL,
  open bigint NOT NULL,
  high bigint NOT NULL,
  low bigint NOT NULL,
  close bigint NOT NULL,
  volume bigint NOT NULL,
  full_candle boolean NOT NULL,
  CONSTRAINT ohlc_5_min_pkey PRIMARY KEY(unique_id_for_symbol, timestamp),
  CONSTRAINT ohlc_5_min_fkey FOREIGN KEY (unique_id_for_symbol)
  REFERENCES appmaster.symbols (unique_id_for_symbol)
) PARTITION BY RANGE (timestamp);
CREATE TABLE ${appmaster}.ohlc_5_min_default PARTITION OF ${appmaster}.ohlc_5_min DEFAULT;

CREATE TABLE ${appmaster}.ohlc_10_min
(
  unique_id_for_symbol bigint NOT NULL,
  timestamp bigint NOT NULL,
  open bigint NOT NULL,
  high bigint NOT NULL,
  low bigint NOT NULL,
  close bigint NOT NULL,
  volume bigint NOT NULL,
  full_candle boolean NOT NULL,
  CONSTRAINT ohlc_10_min_pkey PRIMARY KEY(unique_id_for_symbol, timestamp),
  CONSTRAINT ohlc_10_min_fkey FOREIGN KEY (unique_id_for_symbol)
  REFERENCES appmaster.symbols (unique_id_for_symbol)
) PARTITION BY RANGE (timestamp);
CREATE TABLE ${appmaster}.ohlc_10_min_default PARTITION OF ${appmaster}.ohlc_10_min DEFAULT;

CREATE TABLE ${appmaster}.ohlc_15_min
(
  unique_id_for_symbol bigint NOT NULL,
  timestamp bigint NOT NULL,
  open bigint NOT NULL,
  high bigint NOT NULL,
  low bigint NOT NULL,
  close bigint NOT NULL,
  volume bigint NOT NULL,
  full_candle boolean NOT NULL,
  CONSTRAINT ohlc_15_min_pkey PRIMARY KEY(unique_id_for_symbol, timestamp),
  CONSTRAINT ohlc_15_min_fkey FOREIGN KEY (unique_id_for_symbol)
  REFERENCES appmaster.symbols (unique_id_for_symbol)
) PARTITION BY RANGE (timestamp);
CREATE TABLE ${appmaster}.ohlc_15_min_default PARTITION OF ${appmaster}.ohlc_15_min DEFAULT;

CREATE TABLE ${appmaster}.ohlc_30_min
(
  unique_id_for_symbol bigint NOT NULL,
  timestamp bigint NOT NULL,
  open bigint NOT NULL,
  high bigint NOT NULL,
  low bigint NOT NULL,
  close bigint NOT NULL,
  volume bigint NOT NULL,
  full_candle boolean NOT NULL,
  CONSTRAINT ohlc_30_min_pkey PRIMARY KEY(unique_id_for_symbol, timestamp),
  CONSTRAINT ohlc_30_min_fkey FOREIGN KEY (unique_id_for_symbol)
  REFERENCES appmaster.symbols (unique_id_for_symbol)
) PARTITION BY RANGE (timestamp);
CREATE TABLE ${appmaster}.ohlc_30_min_default PARTITION OF ${appmaster}.ohlc_30_min DEFAULT;

CREATE TABLE ${appmaster}.ohlc_1_hour
(
  unique_id_for_symbol bigint NOT NULL,
  timestamp bigint NOT NULL,
  open bigint NOT NULL,
  high bigint NOT NULL,
  low bigint NOT NULL,
  close bigint NOT NULL,
  volume bigint NOT NULL,
  full_candle boolean NOT NULL,
  CONSTRAINT ohlc_1_hour_pkey PRIMARY KEY(unique_id_for_symbol, timestamp),
  CONSTRAINT ohlc_1_hour_fkey FOREIGN KEY (unique_id_for_symbol)
  REFERENCES appmaster.symbols (unique_id_for_symbol)
) PARTITION BY RANGE (timestamp);
CREATE TABLE ${appmaster}.ohlc_1_hour_default PARTITION OF ${appmaster}.ohlc_1_hour DEFAULT;


CREATE TABLE ${appmaster}.ohlc_4_hour
(
  unique_id_for_symbol bigint NOT NULL,
  timestamp bigint NOT NULL,
  open bigint NOT NULL,
  high bigint NOT NULL,
  low bigint NOT NULL,
  close bigint NOT NULL,
  volume bigint NOT NULL,
  full_candle boolean NOT NULL,
  CONSTRAINT ohlc_4_hour_pkey PRIMARY KEY(unique_id_for_symbol, timestamp),
  CONSTRAINT ohlc_4_hour_fkey FOREIGN KEY (unique_id_for_symbol)
  REFERENCES appmaster.symbols (unique_id_for_symbol)
) PARTITION BY RANGE (timestamp);
CREATE TABLE ${appmaster}.ohlc_4_hour_default PARTITION OF ${appmaster}.ohlc_4_hour DEFAULT;


CREATE TABLE ${appmaster}.ohlc_1_day
(
  unique_id_for_symbol bigint NOT NULL,
  timestamp bigint NOT NULL,
  open bigint NOT NULL,
  high bigint NOT NULL,
  low bigint NOT NULL,
  close bigint NOT NULL,
  volume bigint NOT NULL,
  full_candle boolean NOT NULL,
  CONSTRAINT ohlc_1_day_pkey PRIMARY KEY(unique_id_for_symbol, timestamp),
  CONSTRAINT ohlc_1_day_fkey FOREIGN KEY (unique_id_for_symbol)
  REFERENCES appmaster.symbols (unique_id_for_symbol)
) PARTITION BY RANGE (timestamp);
CREATE TABLE ${appmaster}.ohlc_1_day_default PARTITION OF ${appmaster}.ohlc_1_day DEFAULT;

CREATE TABLE ${appmaster}.snapshot
(
  unique_id_for_symbol bigint NOT NULL,
  timestamp bigint NOT NULL,
  top_bid bigint NOT NULL,
  top_ask bigint NOT NULL,
  CONSTRAINT snapshot_p_key PRIMARY KEY(unique_id_for_symbol, timestamp),
  CONSTRAINT snapshot_fkey FOREIGN KEY (unique_id_for_symbol)
  REFERENCES appmaster.symbols (unique_id_for_symbol)
) PARTITION BY RANGE (timestamp);
CREATE TABLE ${appmaster}.snapshot_default PARTITION OF ${appmaster}.snapshot DEFAULT;

CREATE TABLE ${appmaster}.quote_index_processed
(
  quote_key character varying PRIMARY KEY,
  index_processed bigint NOT NULL
);

CREATE TABLE  ${appmaster}.snapshot_index_processed
(
  snapshot_key character varying PRIMARY KEY,
  index_processed bigint NOT NULL
);
