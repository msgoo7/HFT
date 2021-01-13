-- Table: SecurityWise_Limit

DROP TABLE SecurityWise_Limit;

CREATE TABLE SecurityWise_Limit
(
  requesttype smallint,
  symbolid bigint NOT NULL,
  TotalBuyQty bigint NOT NULL,
  TotalSellQty bigint NOT NULL,
  TotalBuyValue bigint NOT NULL,
  TotalSellValue bigint NOT NULL,
  CONSTRAINT p_key_SecurityWise_Limit PRIMARY KEY (symbolid, TotalBuyQty, TotalSellQty, TotalBuyValue, TotalSellValue)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE SecurityWise_Limit OWNER TO utrade;

