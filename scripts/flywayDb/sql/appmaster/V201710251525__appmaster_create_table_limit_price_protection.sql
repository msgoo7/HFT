-- Table: LimitPriceProtection
--
-- DROP TABLE LimitPriceProtection;

CREATE TABLE LimitPriceProtection
(
  exchangeid smallint NOT NULL,
  segmentid smallint NOT NULL,
  requesttype smallint,
  limitprice integer,
  fromrange bigint NOT NULL,
  torange bigint,
  oldFromRange bigint,
  CONSTRAINT p_key_LimitPriceProtection PRIMARY KEY (exchangeid, segmentid, fromrange)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE LimitPriceProtection
OWNER TO mutrade;
