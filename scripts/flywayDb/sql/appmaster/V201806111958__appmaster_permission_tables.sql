CREATE TABLE ${appmaster}.permission_templates(
  id bigint  PRIMARY KEY,
  name varchar(50) NOT NULL,
  description varchar,
  branch varchar NOT NULL,
  creater_branch varchar NOT NULL,
  permission_type smallint NOT NULL,
  user_type smallint NOT NULL,
  updated_by varchar,
  effective_time_stamp timestamp without time zone
);

CREATE TABLE ${appmaster}.permission_templates_history(
  id bigint NOT NULL,
  name varchar(50) NOT NULL,
  description varchar,
  branch varchar NOT NULL,
  creater_branch varchar NOT NULL,
  permission_type smallint NOT NULL,
  user_type smallint NOT NULL,
  updated_by varchar,
  effective_time_stamp timestamp without time zone
);


CREATE TABLE ${appmaster}.permission_template_details(
  template_id bigint NOT NULL,
  action_id smallint NOT NULL,
  access_mode smallint NOT NULL,
  updated_by varchar,
  effective_time_stamp timestamp without time zone,
  FOREIGN KEY (template_id) REFERENCES permission_templates(id)
);

CREATE TABLE ${appmaster}.permission_template_details_history(
  template_id bigint NOT NULL,
  action_id smallint NOT NULL,
  access_mode smallint NOT NULL,
  updated_by varchar,
  effective_time_stamp timestamp without time zone
);

