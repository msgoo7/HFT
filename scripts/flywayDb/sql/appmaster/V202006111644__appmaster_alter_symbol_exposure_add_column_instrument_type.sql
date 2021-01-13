-- instrument_type is used in case of NSEFO only for now.
-- Values can be OTH(0) , Deep OTM(1) , MAX(2).
ALTER TABLE ${appmaster}.symbol_exposure ADD COLUMN instrument_type smallint default 0;

-- Drop old contraint.
alter table ${appmaster}.symbol_exposure drop CONSTRAINT "symbol_exposure_pkey";

-- Add intrument_type in the new one.
alter table ${appmaster}.symbol_exposure add CONSTRAINT "symbol_exposure_pkey" 
PRIMARY KEY(exchange_id,symbol,affected_instrument,instrument_type);
