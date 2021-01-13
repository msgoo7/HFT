-- Table: BannedScripLimits

DROP TABLE banned_expiry;

CREATE TABLE banned_expiry
(
  DealerId integer ,
  RequestType smallint,
  SourceId smallint,
  ExchangeId smallint,
  Symbol varchar(100),
  ExpiryDay integer ,
  ExpiryYearMon integer ,
  CONSTRAINT p_key_banned_expiry PRIMARY KEY (DealerId, SourceId, ExchangeId, Symbol, ExpiryDay, ExpiryYearMon)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE banned_expiry OWNER TO utrade;

