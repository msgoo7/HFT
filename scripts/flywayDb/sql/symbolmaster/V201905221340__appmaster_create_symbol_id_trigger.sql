CREATE OR REPLACE FUNCTION appmaster.getSourceId(
  IN source CHARACTER VARYING(10))
RETURNS BIGINT AS
$$
DECLARE
  newSource BIGINT DEFAULT 0;
BEGIN
  CASE source
        WHEN 'DEFAULT' THEN newSource = 1;
        WHEN 'MAREX'   THEN newSource = 2;
        WHEN 'TT'      THEN newSource = 3;
        WHEN 'CTP'     THEN newSource = 4;
        WHEN 'IB'      THEN newSource = 5;
        WHEN 'OT'      THEN newSource = 6;
        ELSE newSource = 7;
  END CASE;
  RETURN newSource;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION appmaster.getExchangeId(
  IN marketId CHARACTER VARYING(10))
RETURNS BIGINT AS
$$
DECLARE
  exchangeId BIGINT DEFAULT 0;
BEGIN 
  CASE marketId
        WHEN 'BSECM'     THEN exchangeId = 1;
        WHEN 'BSEFO'     THEN exchangeId = 2;
        WHEN 'NSECM'     THEN exchangeId = 3;
        WHEN 'NSEFO'     THEN exchangeId = 4;
        WHEN 'ESM'       THEN exchangeId = 5;
        WHEN 'ESMNSE'    THEN exchangeId = 5;
        WHEN 'NSECDS'    THEN exchangeId = 6;
        WHEN 'BSECDS'    THEN exchangeId = 7;
        WHEN 'SGX'       THEN exchangeId = 8;
        WHEN 'CFH'       THEN exchangeId = 9;
        WHEN 'MAREX'     THEN exchangeId = 10;
        WHEN 'MCX'       THEN exchangeId = 11;
        WHEN 'DGCX'      THEN exchangeId = 12;
        WHEN 'DGCXCD'    THEN exchangeId = 13;
        WHEN 'LME'       THEN exchangeId = 14;
        WHEN 'CME'       THEN exchangeId = 15;
        WHEN 'CFFEX'     THEN exchangeId = 16;
        WHEN 'CZCE'      THEN exchangeId = 17;
        WHEN 'DCE'       THEN exchangeId = 18;
        WHEN 'SHFE'      THEN exchangeId = 19;
        WHEN 'SGXCUR'    THEN exchangeId = 20;
        WHEN 'SMART'     THEN exchangeId = 21;
        WHEN 'ALPHA'     THEN exchangeId = 22;
        WHEN 'AMEX'      THEN exchangeId = 23;
        WHEN 'ARCA'      THEN exchangeId = 24;
        WHEN 'ASX'       THEN exchangeId = 25;
        WHEN 'BATS'      THEN exchangeId = 26;
        WHEN 'BEX'       THEN exchangeId = 27;
        WHEN 'BTRADE'    THEN exchangeId = 28;
        WHEN 'BYX'       THEN exchangeId = 29;
        WHEN 'CHX'       THEN exchangeId = 30;
        WHEN 'DRCTEDGE'  THEN exchangeId = 31;
        WHEN 'EBS'       THEN exchangeId = 32;
        WHEN 'EDGEA'     THEN exchangeId = 33;
        WHEN 'FWB'       THEN exchangeId = 34;
        WHEN 'FWB2'      THEN exchangeId = 35;
        WHEN 'IEX'       THEN exchangeId = 36;
        WHEN 'INET'      THEN exchangeId = 37;
        WHEN 'ISLAND'    THEN exchangeId = 38;
        WHEN 'LAVA'      THEN exchangeId = 39;
        WHEN 'LSE'       THEN exchangeId = 40;
        WHEN 'MEXI'      THEN exchangeId = 41;
        WHEN 'NASDAQ'    THEN exchangeId = 42;
        WHEN 'NYSE'      THEN exchangeId = 43;
        WHEN 'NYMEX'     THEN exchangeId = 44;
        WHEN 'OMEGA'     THEN exchangeId = 45;
        WHEN 'PINK'      THEN exchangeId = 46;
        WHEN 'PSX'       THEN exchangeId = 47;
        WHEN 'PURE'      THEN exchangeId = 48;
        WHEN 'SBF'       THEN exchangeId = 49;
        WHEN 'SEHK'      THEN exchangeId = 50;
        WHEN 'SELECT'    THEN exchangeId = 51;
        WHEN 'SWB'       THEN exchangeId = 52;
        WHEN 'SWB2'      THEN exchangeId = 53;
        WHEN 'TSE'       THEN exchangeId = 54;
        WHEN 'VWAP'      THEN exchangeId = 55;
        WHEN 'ONE'       THEN exchangeId = 56;
        WHEN 'ECBOT'     THEN exchangeId = 57;
        WHEN 'IDEALPRO'  THEN exchangeId = 58;
        WHEN 'NASDAQOM'  THEN exchangeId = 59;
        WHEN 'GLOBEX'    THEN exchangeId = 60;
        WHEN 'ISE'       THEN exchangeId = 61;
        WHEN 'EXOTIC'    THEN exchangeId = 62;
        WHEN 'MSECM'     THEN exchangeId = 63;
        WHEN 'MOEXFO'    THEN exchangeId = 64;
        WHEN 'MOEX'      THEN exchangeId = 65;
        WHEN 'IFLL'      THEN exchangeId = 66;
        WHEN 'CBT'       THEN exchangeId = 67;
        WHEN 'FXALL'     THEN exchangeId = 68;
        WHEN 'PLUS'      THEN exchangeId = 69;
        WHEN 'NCDEX'     THEN exchangeId = 70;
        WHEN 'COMEX'     THEN exchangeId = 71;
        WHEN 'BSEINX'    THEN exchangeId = 72;
        WHEN 'MSEFO'     THEN exchangeId = 73;
        WHEN 'MSECD'     THEN exchangeId = 74;
        WHEN 'BIST'      THEN exchangeId = 75;
        WHEN 'PXM'       THEN exchangeId = 76;
        WHEN 'NYBOT'     THEN exchangeId = 77;
        WHEN 'NYSELIFFE' THEN exchangeId = 78;
        WHEN 'NSEIFSC'   THEN exchangeId = 79;
        WHEN 'NSECOM'    THEN exchangeId = 80;
        WHEN 'BSECOM'    THEN exchangeId = 81;
        ELSE exchangeId = 82;
  END CASE;
  RETURN exchangeId;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION appmaster.getContractType(
  IN contactType CHARACTER(1))
RETURNS BIGINT AS
$$
DECLARE
  newContractType BIGINT DEFAULT 0;
BEGIN
  CASE contactType
        WHEN 'S' THEN newContractType = 1;
        WHEN 'P' THEN newContractType = 2;
        WHEN 'R' THEN newContractType = 3;
        ELSE newContractType = 0;
  END CASE;
  RETURN newContractType;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION appmaster.createSymbolId()
RETURNS TRIGGER AS
$scrip_master$
DECLARE
  symbolId CHARACTER VARYING(50) DEFAULT '';
  symbolId_bigint BIGINT DEFAULT 0;
BEGIN
  CASE appmaster.getContractType(NEW.contract_type)
        WHEN 0 THEN 
                symbolId = CONCAT(CAST(appmaster.getSourceId('DEFAULT') AS CHARACTER VARYING(20)) ,
                                  CAST(appmaster.getExchangeId(NEW.market_id) AS CHARACTER VARYING(20)) ,
                                  CAST(appmaster.getContractType(NEW.contract_type) AS CHARACTER VARYING(20)) ,
                                  CAST(NEW.security_id  AS CHARACTER VARYING(20)));

        ELSE    symbolId = CONCAT(CAST(appmaster.getSourceId('DEFAULT') AS CHARACTER VARYING(20)) ,
                                  CAST(appmaster.getExchangeId(NEW.market_id) AS CHARACTER VARYING(20)) ,
                                  CAST(appmaster.getContractType(NEW.contract_type) AS CHARACTER VARYING(20)) ,
                                  CAST(NEW.underlying_id  AS CHARACTER VARYING(20)) ,
                                  CAST((NEW.maturity_yearmon/100)%10  AS CHARACTER VARYING(20)) ,
                                  CAST((NEW.maturity_yearmon)%100  AS CHARACTER VARYING(20)) ,
                                  CAST((NEW.maturity_yearmon2/100)%10  AS CHARACTER VARYING(20)) ,
                                  CAST((NEW.maturity_yearmon2)%100  AS CHARACTER VARYING(20)));
  END CASE;
  symbolId_bigint = CAST(symbolId AS BIGINT);
  NEW.symbol_id = symbolId_bigint;
  RETURN NEW;
END;
$scrip_master$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS symbolId_Creation_Trigger on appmaster.scrip_master;

CREATE TRIGGER symbolId_Creation_Trigger
    BEFORE INSERT ON appmaster.scrip_master
    FOR EACH ROW
    EXECUTE PROCEDURE appmaster.createSymbolId();
