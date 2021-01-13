CREATE TABLE ${appmaster}.auto_sq_off
(
  exchange_id integer NOT NULL DEFAULT 0,
  segment_id integer NOT NULL DEFAULT 0,
  product bigint NOT NULL DEFAULT 0,
  pre_sq_off_time integer NOT NULL DEFAULT 0,
  auto_sq_off_time integer NOT NULL DEFAULT 0,
  auto_sq_off_state integer NOT NULL DEFAULT 0,
  updated_by char varying NOT NULL DEFAULT 'SUPERADMIN',
  effective_timestamp timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY (exchange_id, segment_id, product)
);

CREATE TABLE ${appmaster}.auto_sq_off_history
(
  exchange_id integer NOT NULL DEFAULT 0,
  segment_id integer NOT NULL DEFAULT 0,
  product bigint NOT NULL DEFAULT 0,
  pre_sq_off_time integer NOT NULL DEFAULT 0,
  auto_sq_off_time integer NOT NULL DEFAULT 0,
  auto_sq_off_state integer NOT NULL DEFAULT 0,
  updated_by char varying NOT NULL DEFAULT 'SUPERADMIN',
  effective_timestamp timestamp NOT NULL DEFAULT now()
);

ALTER TABLE ${appmaster}.client ADD COLUMN auto_sq_off_excluded boolean ;
ALTER TABLE ${appmaster}.client_history ADD COLUMN auto_sq_off_excluded boolean ;

CREATE TABLE ${appmaster}.alerts 
(
  template_name char varying NOT NULL DEFAULT '',
  alert_type integer NOT NULL DEFAULT 0,
  alloted_percentage integer NOT NULL DEFAULT 0,
  action_required integer NOT NULL DEFAULT 0,
  trigger_type integer NOT NULL DEFAULT 0,
  warning_type integer NOT NULL DEFAULT 0,
  updated_by char varying NOT NULL DEFAULT 'SUPERADMIN',
  effective_timestamp timestamp NOT NULL DEFAULT now(),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name)
);

CREATE TABLE ${appmaster}.alerts_history
(
  template_name char varying NOT NULL DEFAULT '',
  alert_type integer NOT NULL DEFAULT 0,
  alloted_percentage integer NOT NULL DEFAULT 0,
  action_required integer NOT NULL DEFAULT 0,
  trigger_type integer NOT NULL DEFAULT 0,
  warning_type integer NOT NULL DEFAULT 0,
  updated_by char varying NOT NULL DEFAULT 'SUPERADMIN',
  effective_timestamp timestamp NOT NULL DEFAULT now()
);

