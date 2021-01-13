-- Table: ib_parameters

-- DROP TABLE ib_parameters;
CREATE TABLE ib_parameters
(
  client_id integer NOT NULL,
  sub_account character varying(100),
  sub_sender_id character varying(100),
  CONSTRAINT ib_parameters_pkey PRIMARY KEY (client_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ib_parameters
OWNER TO mutrade;
GRANT ALL ON TABLE ib_parameters TO mutrade;

-- Table: bannedscrip

-- DROP TABLE bannedscrip;

CREATE TABLE bannedscrip
(
  dealerid integer,
  symbolid bigint,
  requesttype smallint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bannedscrip
OWNER TO mutrade;

-- Table: banned_expiry
--
-- DROP TABLE banned_expiry;

CREATE TABLE banned_expiry
(
  dealerid integer NOT NULL,
  requesttype smallint,
  sourceid smallint NOT NULL,
  exchangeid smallint NOT NULL,
  symbol character varying(100) NOT NULL,
  expiryday integer NOT NULL,
  expiryyearmon integer NOT NULL,
  CONSTRAINT p_key_banned_expiry PRIMARY KEY (dealerid, sourceid, exchangeid, symbol, expiryday, expiryyearmon)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE banned_expiry
OWNER TO mutrade;

-- Table: bannedscriplimits

-- DROP TABLE bannedscriplimits;

CREATE TABLE bannedscriplimits
(
  dealerid integer NOT NULL,
  symbolid bigint NOT NULL,
  clientcode character varying(100) NOT NULL,
  openqty bigint,
  requesttype smallint,
  CONSTRAINT p_key_bannedscriplimits PRIMARY KEY (dealerid, symbolid, clientcode)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bannedscriplimits
OWNER TO mutrade;

-- Table: clientcodedetail

-- DROP TABLE clientcodedetail;

CREATE TABLE clientcodedetail
(
  exchangeid smallint NOT NULL,
  segmenttype smallint NOT NULL,
  requesttype smallint,
  exchangeclientcode text NOT NULL,
  participantcode text,
  accounttype smallint,
  name text NOT NULL DEFAULT 'Default Name'::text,
  rejectreason text DEFAULT ''::text,
  CONSTRAINT p_key_clientcodedetail PRIMARY KEY (exchangeclientcode, exchangeid, segmenttype)
)
WITH (
  OIDS=FALSE
);
-- Table: broker_details
-- DROP TABLE broker_details;
CREATE TABLE broker_details
(
  broker character varying(6) NOT NULL,
  market_id character varying(10) NOT NULL,
  security_id integer NOT NULL,
  broker_symbol character varying(50),
  broker_security_id character varying(15),
  exchange_security_id character varying(15),
  CONSTRAINT broker_details_pkey PRIMARY KEY (broker, market_id, security_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE broker_details
OWNER TO mutrade;
GRANT ALL ON TABLE broker_details TO mutrade;

ALTER TABLE clientcodedetail
OWNER TO mutrade;

-- Table: childparentcodemapping

-- DROP TABLE childparentcodemapping;

CREATE TABLE childparentcodemapping
(
  exchangeid smallint NOT NULL,
  segmenttype smallint NOT NULL,
  requesttype smallint,
  primaryclientcode text NOT NULL,
  exchangeclientcode text,
  name text,
  parttype smallint,
  rejectreason text DEFAULT ''::text,
  CONSTRAINT p_key_childparentcodemapping PRIMARY KEY (primaryclientcode, exchangeid, segmenttype),
  CONSTRAINT f_key_childparentcodemapping FOREIGN KEY (exchangeclientcode, exchangeid, segmenttype)
  REFERENCES clientcodedetail (exchangeclientcode, exchangeid, segmenttype) MATCH SIMPLE
  ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE childparentcodemapping
OWNER TO mutrade;

-- Table: clientcode_grossexposurelimit

-- DROP TABLE clientcode_grossexposurelimit;

CREATE TABLE clientcode_grossexposurelimit
(
  requesttype smallint,
  exchangeid smallint NOT NULL,
  segmenttype smallint NOT NULL,
  clienttype smallint,
  primaryclientcode text NOT NULL,
  dealerid integer,
  grosslots bigint,
  grossvalue bigint,
  symbol text NOT NULL,
  CONSTRAINT p_key_clietcode_grossexposurelimit PRIMARY KEY (primaryclientcode, exchangeid, segmenttype, symbol),
  CONSTRAINT f_key_clietcode_grossexposurelimit FOREIGN KEY (primaryclientcode, exchangeid, segmenttype)
  REFERENCES childparentcodemapping (primaryclientcode, exchangeid, segmenttype) MATCH SIMPLE
  ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE clientcode_grossexposurelimit
OWNER TO mutrade;
-- Table: clientcode_grossexposuresecuritywiselimit

-- DROP TABLE clientcode_grossexposuresecuritywiselimit;

CREATE TABLE clientcode_grossexposuresecuritywiselimit
(
  requesttype smallint,
  exchangeid smallint NOT NULL,
  segmenttype smallint NOT NULL,
  clienttype smallint,
  primaryclientcode text NOT NULL,
  dealerid integer,
  grosslots bigint,
  grossvalue bigint,
  symbolid bigint NOT NULL,
  CONSTRAINT p_key_clietcode_grossexposurelimitsecuritywiselimit PRIMARY KEY (primaryclientcode, exchangeid, segmenttype, symbolid),
  CONSTRAINT f_key_clietcode_grossexposuresecuritywiselimit FOREIGN KEY (primaryclientcode, exchangeid, segmenttype)
  REFERENCES childparentcodemapping (primaryclientcode, exchangeid, segmenttype) MATCH SIMPLE
  ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE clientcode_grossexposuresecuritywiselimit
OWNER TO mutrade;
-- Table: clientcode_orderlimits

-- DROP TABLE clientcode_orderlimits;

CREATE TABLE clientcode_orderlimits
(
  clientid integer,
  maximumsingleorderquantity bigint,
  maximumsingleordervalue bigint,
  maximumtotalbuyquantity bigint,
  maximumtotalbuyvalue bigint,
  maximumtotalsellquantity bigint,
  maximumtotalsellvalue bigint,
  maximumnetquantity bigint,
  maximumnetvalue bigint,
  maximumm2mloss bigint,
  maximumoutstandingtotalbuyquantity bigint,
  maximumoutstandingtotalbuyvalue bigint,
  maximumoutstandingtotalsellquantity bigint,
  maximumoutstandingtotalsellvalue bigint,
  deposit bigint,
  type smallint,
  exchangeid smallint NOT NULL,
  segmenttype smallint NOT NULL,
  primaryclientcode text NOT NULL,
  CONSTRAINT p_key_clientcode_orderlimits PRIMARY KEY (primaryclientcode, exchangeid, segmenttype),
  CONSTRAINT f_key_clientcode_orderlimits FOREIGN KEY (primaryclientcode, exchangeid, segmenttype)
  REFERENCES childparentcodemapping (primaryclientcode, exchangeid, segmenttype) MATCH SIMPLE
  ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE clientcode_orderlimits
OWNER TO mutrade;
-- Table: dealer_client_mappings

-- DROP TABLE dealer_client_mappings;

CREATE TABLE dealer_client_mappings
(
  dealer_id character varying(20) NOT NULL,
  client_id character varying(20) NOT NULL,
  effective_date timestamp without time zone,
  expiration_date timestamp without time zone
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dealer_client_mappings
OWNER TO mutrade;
GRANT ALL ON TABLE dealer_client_mappings TO mutrade;

-- Table: dealerid_grossexposurelimit

-- DROP TABLE dealerid_grossexposurelimit;

CREATE TABLE dealerid_grossexposurelimit
(
  requesttype smallint,
  exchangeid smallint NOT NULL,
  segmenttype smallint,
  clienttype smallint,
  primaryclientcode text,
  dealerid integer NOT NULL,
  grosslots bigint,
  grossvalue bigint,
  symbol text NOT NULL,
  CONSTRAINT p_key_dealerid_grossexposurelimit PRIMARY KEY (dealerid, exchangeid, symbol)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dealerid_grossexposurelimit
OWNER TO mutrade;
-- Table: dealerid_grossexposuresecuritywiselimit

-- DROP TABLE dealerid_grossexposuresecuritywiselimit;

CREATE TABLE dealerid_grossexposuresecuritywiselimit
(
  requesttype smallint,
  exchangeid smallint,
  segmenttype smallint,
  clienttype smallint,
  primaryclientcode text,
  dealerid integer NOT NULL,
  grosslots bigint,
  grossvalue bigint,
  symbolid bigint NOT NULL,
  CONSTRAINT p_key_dealerid_grossexposuresecuritywiselimit PRIMARY KEY (dealerid, symbolid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dealerid_grossexposuresecuritywiselimit
OWNER TO mutrade;
-- Table: loginidclientcodemapping

-- DROP TABLE loginidclientcodemapping;

CREATE TABLE loginidclientcodemapping
(
  loginid integer NOT NULL,
  exchangeid smallint NOT NULL,
  segmenttype smallint NOT NULL,
  requesttype smallint,
  primaryclientcode text NOT NULL,
  rejectreason text DEFAULT ''::text,
  CONSTRAINT p_key_loginidclientcodemapping PRIMARY KEY (loginid, primaryclientcode, exchangeid, segmenttype),
  CONSTRAINT f_key_loginidclientcodemapping FOREIGN KEY (primaryclientcode, exchangeid, segmenttype)
  REFERENCES childparentcodemapping (primaryclientcode, exchangeid, segmenttype) MATCH SIMPLE
  ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE loginidclientcodemapping
OWNER TO mutrade;

-- Table: priceprotectionchecks
--
-- DROP TABLE priceprotectionchecks;

CREATE TABLE priceprotectionchecks
(
  exchangeid smallint NOT NULL,
  segmentid smallint NOT NULL,
  requesttype smallint,
  limitprice integer,
  badprice integer,
  closeprice integer,
  CONSTRAINT p_key_priceprotectionchecks PRIMARY KEY (exchangeid, segmentid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE priceprotectionchecks
OWNER TO mutrade;

-- Table: scrip_master
--
-- DROP TABLE scrip_master;
--
CREATE TABLE scrip_master
(
  market_id character varying(10) NOT NULL,
  security_id integer NOT NULL,
  symbol character varying(50),
  instrument_type character(1),
  scrip_name character varying(100),
  group_name character varying(20),
  maturity_yearmon integer,
  maturity_day integer,
  option_type character(1),
  option_attribute character(1),
  symbol_type character(1),
  strike_price numeric(10,2),
  no_delivery character(1),
  market_lot integer,
  tick_size integer,
  suspended character(1),
  avm_flag character(1),
  avm_buy_margin integer,
  avm_sell_margin integer,
  span_margin numeric(3,2),
  exposure_margin numeric(3,2),
  settlement_type character(1),
  isin character varying(30),
  haircut integer DEFAULT 20,
  bcast_flag integer,
  mkt_pic_bcast_flag character varying(3),
  product_code character varying(10),
  underlying_id integer,
  is_auction_eligible integer,
  hi_52_wk integer,
  lo_52_wk integer,
  low_price_range integer,
  high_price_range integer,
  freeze_percent integer,
  close_price integer,
  scrip_precision integer,
  contract_type character(1),
  security_id1 integer,
  security_id2 integer,
  underlying_market_code integer,
  instrument_modifier integer,
  series_identity character varying,
  trade_value integer,
  symbol_id integer,
  trade_unit character varying,
  instrument_group integer,
  maturity_day2 integer,
  maturity_yearmon2 integer,
  trading_session_id character varying(30),
  apply_lot integer,
  CONSTRAINT scrip_master_pkey PRIMARY KEY (market_id, security_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE scrip_master
OWNER TO mutrade;
GRANT ALL ON TABLE scrip_master TO mutrade;

-- Index: scrip_master_idx1
-- DROP INDEX scrip_master_idx1;

CREATE INDEX scrip_master_idx1
ON scrip_master
USING btree
(instrument_type, symbol, group_name, maturity_yearmon, maturity_day, option_type, strike_price);

-- Index: scrip_master_idx2

-- DROP INDEX scrip_master_idx2;

CREATE INDEX scrip_master_idx2
ON scrip_master
USING btree
(isin);

-- Table: rmsorderthrotle
--
-- DROP TABLE rmsorderthrotle;

CREATE TABLE rmsorderthrotle
(
  dealerid integer NOT NULL,
  exchangeid smallint NOT NULL,
  segmentid smallint NOT NULL,
  requesttype smallint,
  orderrate integer,
  CONSTRAINT p_key_rmsorderthrotle PRIMARY KEY (dealerid, exchangeid, segmentid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE rmsorderthrotle
OWNER TO mutrade;
-- Table: securitywise_limit
--
-- DROP TABLE securitywise_limit;

CREATE TABLE securitywise_limit
(
  requesttype smallint,
  symbolid bigint NOT NULL,
  totalbuyqty bigint NOT NULL,
  totalsellqty bigint NOT NULL,
  totalbuyvalue bigint NOT NULL,
  totalsellvalue bigint NOT NULL,
  CONSTRAINT p_key_securitywise_limit PRIMARY KEY (symbolid, totalbuyqty, totalsellqty, totalbuyvalue, totalsellvalue)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE securitywise_limit
OWNER TO mutrade;

