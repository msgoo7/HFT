--Table made by taking reference from unique_id table. 
CREATE TABLE ${appmaster}.entity_check_counter
(
  entity_type smallint NOT NULL,--Dealer,Client etc.
  entity_id integer NOT NULL,
  rms_entity smallint NOT NULL,
  rms_check_type smallint NOT NULL,
  counter integer NOT NULL,
  CONSTRAINT entity_check_counter_pKey PRIMARY KEY(entity_id,rms_entity,rms_check_type)
)
