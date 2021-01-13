-- After Market Order Exchange Wise EOD Time --
CREATE TABLE ${appmaster}.amo_eod_time(
    exchange_id INTEGER NOT NULL,
    eod_time BIGINT NOT NULL
);
