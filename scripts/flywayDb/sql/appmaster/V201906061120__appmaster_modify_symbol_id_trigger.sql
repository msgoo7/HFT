-- Dropping Previous Trigger
DROP TRIGGER symbolid_creation_trigger ON appmaster.scrip_master;

-- Creating New Trigger
CREATE OR REPLACE FUNCTION appmaster.createSymbolId()
RETURNS TRIGGER AS
$scrip_master$
DECLARE
  symbolId CHARACTER VARYING(15) DEFAULT '';
  symbolId_bigint BIGINT DEFAULT 0;
BEGIN
  symbolId = CONCAT( appmaster.getSourceId('DEFAULT') ,
                     LPAD( appmaster.getExchangeId(NEW.market_id)::text , 3, '0' ) ,
                     appmaster.getContractType(NEW.contract_type) ,
                     LPAD( NEW.security_id::text  , 10, '0' ) );
  symbolId_bigint = CAST(symbolId AS BIGINT);
  NEW.symbol_id = symbolId_bigint;
  RETURN NEW;
END;
$scrip_master$
LANGUAGE plpgsql;

CREATE TRIGGER symbolId_Creation_Trigger
    BEFORE INSERT ON appmaster.scrip_master
    FOR EACH ROW
    EXECUTE PROCEDURE appmaster.createSymbolId();
