DROP MATERIALIZED VIEW IF EXISTS ${appmaster}.ohlc_1_min_last_candles;

CREATE MATERIALIZED VIEW ${appmaster}.ohlc_1_min_last_candles AS
SELECT ohlc.* FROM ohlc_1_min ohlc INNER JOIN symbols 
ON ohlc.unique_id_for_symbol = symbols.unique_id_for_symbol 
AND ohlc.full_candle = 'f';

CREATE INDEX idx_ohlc_1_min_last_candles ON ohlc_1_min_last_candles(unique_id_for_symbol);

DROP MATERIALIZED VIEW IF EXISTS ${appmaster}.ohlc_5_min_last_candles;

CREATE MATERIALIZED VIEW ${appmaster}.ohlc_5_min_last_candles AS
SELECT ohlc.* FROM ohlc_5_min ohlc INNER JOIN symbols 
ON ohlc.unique_id_for_symbol = symbols.unique_id_for_symbol 
AND ohlc.full_candle = 'f';

CREATE INDEX idx_ohlc_5_min_last_candles ON ohlc_5_min_last_candles(unique_id_for_symbol);

DROP MATERIALIZED VIEW IF EXISTS ${appmaster}.ohlc_10_min_last_candles;

CREATE MATERIALIZED VIEW ${appmaster}.ohlc_10_min_last_candles AS
SELECT ohlc.* FROM ohlc_10_min ohlc INNER JOIN symbols 
ON ohlc.unique_id_for_symbol = symbols.unique_id_for_symbol 
AND ohlc.full_candle = 'f';

CREATE INDEX idx_ohlc_10_min_last_candles ON ohlc_10_min_last_candles(unique_id_for_symbol);

DROP MATERIALIZED VIEW IF EXISTS ${appmaster}.ohlc_15_min_last_candles;

CREATE MATERIALIZED VIEW ${appmaster}.ohlc_15_min_last_candles AS
SELECT ohlc.* FROM ohlc_15_min ohlc INNER JOIN symbols 
ON ohlc.unique_id_for_symbol = symbols.unique_id_for_symbol 
AND ohlc.full_candle = 'f';

CREATE INDEX idx_ohlc_15_min_last_candles ON ohlc_15_min_last_candles(unique_id_for_symbol);

DROP MATERIALIZED VIEW IF EXISTS ${appmaster}.ohlc_30_min_last_candles;

CREATE MATERIALIZED VIEW ${appmaster}.ohlc_30_min_last_candles AS
SELECT ohlc.* FROM ohlc_30_min ohlc INNER JOIN symbols 
ON ohlc.unique_id_for_symbol = symbols.unique_id_for_symbol 
AND ohlc.full_candle = 'f';

CREATE INDEX idx_ohlc_30_min_last_candles ON ohlc_30_min_last_candles(unique_id_for_symbol);

DROP MATERIALIZED VIEW IF EXISTS ${appmaster}.ohlc_1_hour_last_candles;

CREATE MATERIALIZED VIEW ${appmaster}.ohlc_1_hour_last_candles AS
SELECT ohlc.* FROM ohlc_1_hour ohlc INNER JOIN symbols 
ON ohlc.unique_id_for_symbol = symbols.unique_id_for_symbol 
AND ohlc.full_candle = 'f';

CREATE INDEX idx_ohlc_1_hour_last_candles ON ohlc_1_hour_last_candles(unique_id_for_symbol);

DROP MATERIALIZED VIEW IF EXISTS ${appmaster}.ohlc_1_day_last_candles;

CREATE MATERIALIZED VIEW ${appmaster}.ohlc_1_day_last_candles AS
SELECT ohlc.* FROM ohlc_1_day ohlc INNER JOIN symbols 
ON ohlc.unique_id_for_symbol = symbols.unique_id_for_symbol 
AND ohlc.full_candle = 'f';

CREATE INDEX idx_ohlc_1_day_last_candles ON ohlc_1_day_last_candles(unique_id_for_symbol);
