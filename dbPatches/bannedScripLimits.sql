-- Table: BannedScripLimits

DROP TABLE BannedScripLimits;

CREATE TABLE BannedScripLimits
(
  DealerId integer ,
  SymbolId bigint NOT NULL,
  ClientCode varchar(100),
  OpenQty bigint,
  RequestType smallint,
  CONSTRAINT p_key_BannedScripLimits PRIMARY KEY (DealerId, SymbolId, ClientCode)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE BannedScripLimits OWNER TO utrade;

