alter table ${appmaster}.symbol_exposure ADD COLUMN affected_instrument varchar NOT NULL DEFAULT('UL');
alter table ${appmaster}.symbol_exposure drop CONSTRAINT "symbol_exposure_pkey";

alter table ${appmaster}.symbol_exposure add CONSTRAINT "symbol_exposure_pkey" PRIMARY KEY(exchange_id,symbol,affected_instrument);
