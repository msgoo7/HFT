-- ================================================================================
-- EOD entities to be cleaned
-- ===============================================================================

CREATE TABLE ${refmaster}.eod_entity
(
  sequence SERIAL,
  entity varchar NOT NULL,
  CONSTRAINT eod_entity_pkey PRIMARY KEY(entity)
);

-- ================================================================================
-- BOD entities to be cleaned
-- ===============================================================================

CREATE TABLE ${refmaster}.bod_entity
(
  sequence SERIAL,
  entity varchar NOT NULL,
  CONSTRAINT bod_entity_pkey PRIMARY KEY(entity)
);

-- ================================================================================
-- EOD Clean or archive table
-- ===============================================================================

CREATE TABLE ${refmaster}.eod_action
(
  entity varchar REFERENCES ${refmaster}.eod_entity(entity),
  clean integer,
  clean_and_archive integer,
  CONSTRAINT eod_action_pkey PRIMARY KEY(entity)
);

-- ================================================================================
-- BOD Clean or archive table
-- ===============================================================================

CREATE TABLE ${refmaster}.bod_action
(
  entity varchar REFERENCES ${refmaster}.bod_entity(entity),
  clean integer,
  clean_and_archive integer,
  CONSTRAINT bod_action_pkey PRIMARY KEY(entity)
);

-- ================================================================================
-- Insert Queries for eod_entity
-- ===============================================================================

INSERT INTO ${refmaster}.eod_entity(entity) values ('Transaction_History') ;
INSERT INTO ${refmaster}.eod_entity(entity) values ('Holding') ;
INSERT INTO ${refmaster}.eod_entity(entity) values ('Cash') ;
INSERT INTO ${refmaster}.eod_entity(entity) values ('Quote') ;
INSERT INTO ${refmaster}.eod_entity(entity) values ('Open_Interest') ;
INSERT INTO ${refmaster}.eod_action(entity,clean,clean_and_archive) values ('Transaction_History',1,0),('Holding',0,1),('Cash',0,1),('Quote',1,0),('Open_Interest',1,0) ;
