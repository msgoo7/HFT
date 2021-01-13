
-- Table: stcompid_subids_client_mappings

CREATE TABLE  ${appmaster}.stcompid_subids_client_mappings
(
  client_id character varying(30) NOT NULL,
  comp_id character varying(20) NOT NULL,
  target_id character varying(20) NOT NULL,
  effective_time_stamp  timestamp not NULL DEFAULT now(),
  PRIMARY KEY (client_id, comp_id, target_id)
);

CREATE TABLE  ${appmaster}.stcompid_subids_client_mapping_history
(
  client_id character varying(30) NOT NULL,
  comp_id character varying(20) NOT NULL,
  target_id character varying(20) NOT NULL,
  effective_time_stamp  timestamp not NULL DEFAULT now()
);

