DROP TABLE ${appmaster}.alerts;
DROP TABLE ${appmaster}.alerts_history;

CREATE TABLE ${appmaster}.margin_alerts
(
  template_name char varying NOT NULL DEFAULT '',
  alloted_percentage integer NOT NULL DEFAULT 0,
  alert_type integer NOT NULL DEFAULT 0,
  trigger_type integer NOT NULL DEFAULT 0,
  is_enabled boolean NOT NULL DEFAULT false,
  actions_to_be_taken char varying NOT NULL DEFAULT '1',
  actions_to_be_reverted char varying NOT NULL DEFAULT '1',
  updated_by char varying NOT NULL DEFAULT 'SUPERADMIN',
  effective_timestamp timestamp NOT NULL DEFAULT now(),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name),
  FOREIGN KEY (alert_type) REFERENCES  ${refmaster}.alert_types(alert_type),
  PRIMARY KEY (template_name, alert_type, alloted_percentage)
);
Comment on column margin_alerts.actions_to_be_taken is 'This is comma separated string defining different types of actions such as Email and Warning popup to be taken at time of breaching alerts';
Comment on column margin_alerts.actions_to_be_reverted is 'This is comma separated string defining different types of actions such as Email and Warning popup to be taken at time of     revert of alerts';

CREATE TABLE ${appmaster}.mtm_alerts
(
  template_name char varying NOT NULL DEFAULT '',
  alloted_percentage integer NOT NULL DEFAULT 0,
  is_enabled boolean NOT NULL DEFAULT false,
  actions_to_be_taken char varying NOT NULL DEFAULT '1',
  actions_to_be_reverted char varying NOT NULL DEFAULT '1',
  updated_by char varying NOT NULL DEFAULT 'SUPERADMIN',
  effective_timestamp timestamp NOT NULL DEFAULT now(),
  FOREIGN KEY (template_name) REFERENCES unique_template_id (template_name),
  PRIMARY KEY (template_name, alloted_percentage)
);
Comment on column mtm_alerts.actions_to_be_taken is 'This is comma separated string defining different types of actions such as Email and Warning popup to be taken at time of    breaching alerts';
Comment on column mtm_alerts.actions_to_be_reverted is 'This is comma separated string defining different types of actions such as Email and Warning popup to be taken at time    of     revert of alerts';

CREATE TABLE ${appmaster}.margin_alerts_history
(
  template_name char varying NOT NULL DEFAULT '',
  alloted_percentage integer NOT NULL DEFAULT 0,
  alert_type integer NOT NULL DEFAULT 0,
  trigger_type integer NOT NULL DEFAULT 0,
  is_enabled boolean NOT NULL DEFAULT false,
  actions_to_be_taken char varying NOT NULL DEFAULT '1',
  actions_to_be_reverted char varying NOT NULL DEFAULT '1',
  updated_by char varying NOT NULL DEFAULT 'SUPERADMIN',
  effective_timestamp timestamp NOT NULL DEFAULT now()
);

CREATE TABLE ${appmaster}.mtm_alerts_history
(
  template_name char varying NOT NULL DEFAULT '',
  alloted_percentage integer NOT NULL DEFAULT 0,
  is_enabled boolean NOT NULL DEFAULT false,
  actions_to_be_taken char varying NOT NULL DEFAULT '1',
  actions_to_be_reverted char varying NOT NULL DEFAULT '1',
  updated_by char varying NOT NULL DEFAULT 'SUPERADMIN',
  effective_timestamp timestamp NOT NULL DEFAULT now()
);

