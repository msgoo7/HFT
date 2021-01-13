-- Table: clientcode_grossexposurescripgrouplimit

CREATE TABLE ${appmaster}.clientcode_grossexposurescripgrouplimit
(
  requesttype smallint NOT NULL,
  exchangeid smallint NOT NULL,
  segmenttype smallint NOT NULL,
  clienttype smallint NOT NULL,
  primaryclientcode text NOT NULL,
  dealerid integer NOT NULL,
  grosslots bigint NOT NULL,
  grossvalue bigint NOT NULL,
  scripgrouptype smallint NOT NULL,
  CONSTRAINT p_key_clientcode_grossexposurescripgrouplimit PRIMARY KEY (primaryclientcode, exchangeid, segmenttype, scripgrouptype),
  CONSTRAINT f_key_clientcode_grossexposurescripgrouplimit FOREIGN KEY (primaryclientcode, exchangeid, segmenttype)
  REFERENCES ${appmaster}.childparentcodemapping (primaryclientcode, exchangeid, segmenttype) MATCH SIMPLE
  ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ${appmaster}.clientcode_grossexposurescripgrouplimit
OWNER TO mutrade;

-- Table: dealerid_grossexposurelimit

CREATE TABLE ${appmaster}.dealerid_grossexposurescripgrouplimit
(
  requesttype smallint NOT NULL,
  exchangeid smallint NOT NULL,
  segmenttype smallint NOT NULL,
  clienttype smallint NOT NULL,
  primaryclientcode text NOT NULL,
  dealerid integer NOT NULL,
  grosslots bigint NOT NULL,
  grossvalue bigint NOT NULL,
  scripgrouptype smallint NOT NULL,
  CONSTRAINT p_key_dealerid_grossexposurescripgrouplimit PRIMARY KEY (dealerid, exchangeid, scripgrouptype)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ${appmaster}.dealerid_grossexposurescripgrouplimit
OWNER TO mutrade;
