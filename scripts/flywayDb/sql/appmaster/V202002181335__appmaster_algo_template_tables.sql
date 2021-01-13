CREATE TABLE ${appmaster}.algo_templates 
(
  id bigint PRIMARY KEY ,
  algo_unique_key varchar NOT NULL ,
  algo_type varchar NOT NULL ,
  template_name varchar NOT NULL ,
  created_by varchar ,
  effective_time_stamp timestamp without time zone DEFAULT now()
);

CREATE TABLE ${appmaster}.algo_template_details
(
  template_id bigint NOT NULL ,
  param_name varchar NOT NULL ,
  normal_value varchar NOT NULL ,
  aggressive_value varchar ,
  passive_value varchar ,
  updated_by varchar ,
  effective_time_stamp timestamp without time zone DEFAULT now(),
  FOREIGN KEY (template_id) REFERENCES algo_templates(id) 
);

CREATE TABLE ${appmaster}.algo_template_mappings
(
  template_id bigint NOT NULL,
  dealer_id varchar NOT NULL ,
  updated_by varchar ,
  effective_time_stamp timestamp without time zone DEFAULT now(),
  FOREIGN KEY (template_id) REFERENCES algo_templates(id)
);

CREATE TABLE ${appmaster}.algo_templates_history
(
  id bigint NOT NULL ,
  algo_unique_key varchar NOT NULL ,
  algo_type varchar NOT NULL ,
  template_name varchar NOT NULL ,
  created_by varchar ,
  effective_time_stamp timestamp without time zone DEFAULT now()
);

CREATE TABLE ${appmaster}.algo_template_details_history
(
  template_id bigint NOT NULL ,
  param_name varchar NOT NULL ,
  normal_value varchar NOT NULL ,
  aggressive_value varchar  ,
  passive_value varchar ,
  updated_by varchar ,
  effective_time_stamp timestamp without time zone DEFAULT now()
);

CREATE TABLE ${appmaster}.algo_template_mappings_history
(
  template_id bigint NOT NULL ,
  dealer_id varchar NOT NULL ,
  updated_by varchar ,
  effective_time_stamp timestamp without time zone DEFAULT now()
);
