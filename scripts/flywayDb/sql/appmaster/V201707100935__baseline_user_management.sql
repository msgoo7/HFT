-- UNIQUE ID

CREATE TABLE ${appmaster}.unique_id
(
  id char varying NOT NULL,
  id_type smallint,
  parent_id char varying,
  unique_id_for_login SERIAL,
  CONSTRAINT unique_id_pkey PRIMARY KEY(id)
);
comment on column unique_id.id is 'The user ID';
comment on column unique_id.id_type is 'Terminal/Admin/Client/Branch';
comment on column unique_id.parent_id is 'parent branch of id';
comment on column unique_id.unique_id_for_login is 'integer id for login';

--CLIENT

CREATE TABLE ${appmaster}.client
(
  id char varying references unique_id(id) NOT NULL PRIMARY KEY,
  first_name char varying NOT NULL,
  last_name char varying,
  address char varying,
  city char varying,
  state char varying,
  country char varying,
  pin char varying,
  country_code char varying,
  phone char varying NOT NULL,
  alt_country_code char varying,
  alt_phone char varying,
  id_type smallint ,
  id_number char varying,
  email char varying NOT NULL,
  gender char varying(11),
  date_of_birth date,
  account_status smallint NOT NULL references refmaster.user_account_status(user_account_status),
  account_validity date NOT NULL,
  client_type smallint NOT NULL,
  updated_by char varying,
  profile char varying,
  general_risk_template char varying,
  product_risk_template char varying,
  effective_timestamp timestamp NOT NULL 
);
comment on column client.account_status is 'ENABLED/INACTIVE/SUSPENDED';
comment on column client.account_validity is 'date till client account is valid';
comment on column client.client_type is 'OWN/NRI/INSTITUTIONAL etc';
comment on column client.effective_timestamp is 'time when client is created';
comment on table client is 'It stores client entities.Similar History table(client_history) is also created to maintain audit data.If any changes are made here, please change that table also.';


CREATE TABLE ${appmaster}.client_history
(
  id char varying references unique_id(id) NOT NULL ,
  first_name char varying NOT NULL,
  last_name char varying,
  address char varying,
  city char varying,
  state char varying,
  country char varying,
  pin char varying,
  country_code char varying,
  phone char varying NOT NULL,
  alt_country_code char varying,
  alt_phone char varying,
  id_type smallint,
  id_number char varying,
  email char varying NOT NULL,
  gender char varying(11),
  date_of_birth date,
  account_status smallint NOT NULL,
  account_validity date NOT NULL,
  client_type smallint NOT NULL,
  updated_by char varying,
  profile char varying,
  general_risk_template char varying,
  product_risk_template char varying,
  effective_timestamp timestamp NOT NULL 
);
comment on column client_history.account_status is 'ENABLED/INACTIVE/SUSPENDED';
comment on column client_history.account_validity is 'date till client account is valid';
comment on column client_history.client_type is 'OWN/NRI/INSTITUTIONAL etc';
comment on column client_history.effective_timestamp is 'time when client is modified/deleted';
comment on table client_history is 'This table is created to maintain history of clients table. Any changes made here should also be changed in client table';

--Admin

CREATE TABLE ${appmaster}.admin
(
  id char varying references unique_id(id) NOT NULL PRIMARY KEY,
  first_name char varying NOT NULL,
  last_name char varying,
  address char varying,
  city char varying,
  state char varying,
  country char varying,
  pin char varying,
  country_code char varying,
  phone char varying,
  alt_country_code char varying,
  alt_phone char varying,
  id_type smallint,
  id_number char varying,
  email char varying,
  gender char varying(11),
  date_of_birth date,
  account_status smallint NOT NULL references refmaster.user_account_status(user_account_status),
  account_validity date,
  updated_by char varying,
  profile char varying,
  general_risk_template char varying,
  product_risk_template char varying,
  effective_timestamp timestamp NOT NULL 
);
comment on column admin.account_status is 'ENABLED/INACTIVE';
comment on column admin.effective_timestamp is 'time when admin is created';
comment on table admin is 'It stores admin entities.Similar History table(admin_history) is also created to maintain audit data.If any changes are made here, please change that table also.';


CREATE TABLE ${appmaster}.admin_history
(
  id char varying references unique_id(id) NOT NULL ,
  first_name char varying NOT NULL,
  last_name char varying,
  address char varying,
  city char varying,
  state char varying,
  country char varying,
  pin char varying,
  country_code char varying,
  phone char varying,
  alt_country_code char varying,
  alt_phone char varying,
  id_type smallint,
  id_number char varying,
  email char varying,
  gender char varying(11),
  date_of_birth date,
  account_status smallint NOT NULL,
  account_validity date,
  updated_by char varying,
  profile char varying,
  general_risk_template char varying,
  product_risk_template char varying,
  effective_timestamp timestamp NOT NULL 
);
comment on column admin_history.account_status is 'ENABLED/INACTIVE/SUSPENDED';
comment on column admin_history.effective_timestamp is 'time when admin is modified/deleted';
comment on table admin_history is 'This table is created to maintain history of admins table. Any changes made here should also be changed in admin table';

--DEALER

CREATE TABLE ${appmaster}.dealer
(
  id char varying references unique_id(id) NOT NULL PRIMARY KEY,
  first_name char varying NOT NULL,
  last_name char varying,
  address char varying,
  city char varying,
  state char varying,
  country char varying,
  pin char varying,
  country_code char varying,
  phone char varying,
  alt_country_code char varying,
  alt_phone char varying,
  id_type smallint ,
  id_number char varying,
  email char varying,
  gender char varying(11),
  date_of_birth date,
  account_status smallint NOT NULL references refmaster.user_account_status(user_account_status),
  account_validity date NOT NULL,
  is_dma_enabled boolean,
  updated_by char varying,
  profile char varying,
  general_risk_template char varying,
  product_risk_template char varying,
  effective_timestamp timestamp NOT NULL 
);
comment on column dealer.account_status is 'ENABLED/INACTIVE';
comment on column dealer.account_validity is 'date till dealer account is valid';
comment on column dealer.effective_timestamp is 'time when dealer is modified/deleted';
comment on table dealer is 'This table is created to store dealer entities. Similar dealer history table is also created to maintain its history. Any changes made here should also be changed in that table also';



CREATE TABLE ${appmaster}.dealer_history
(
  id char varying references unique_id(id) NOT NULL ,
  first_name char varying NOT NULL,
  last_name char varying,
  address char varying,
  city char varying,
  state char varying,
  country char varying,
  pin char varying,
  country_code char varying,
  phone char varying,
  alt_country_code char varying,
  alt_phone char varying,
  id_type smallint,
  id_number char varying,
  email char varying,
  gender char varying(11),
  date_of_birth date,
  account_status smallint NOT NULL,
  account_validity date NOT NULL,
  is_dma_enabled boolean,
  updated_by char varying,
  profile char varying,
  general_risk_template char varying,
  product_risk_template char varying,
  effective_timestamp timestamp NOT NULL 
);
comment on column dealer_history.account_status is 'ENABLED/INACTIVE';
comment on column dealer_history.account_validity is 'date till dealer account is valid';
comment on column dealer_history.effective_timestamp is 'time when dealer is modified/deleted';
comment on table dealer_history is 'This table is created to maintain the history of dealer table. If Any changes made here, should also be changed in dealer table also';

--BRANCH

CREATE TABLE ${appmaster}.branch
(
  id char varying references unique_id(id) NOT NULL, 
  name char varying NOT NULL,
  address char varying,
  city char varying,
  state char varying,
  country char varying,
  pin char varying,
  country_code char varying,
  phone char varying,
  alt_country_code char varying,
  alt_phone char varying,
  email char varying,
  profile char varying,
  general_risk_template char varying,
  product_risk_template char varying,
  updated_by char varying,
  effective_timestamp timestamp NOT NULL 
);
comment on column branch.effective_timestamp is 'time when branch is created';
comment on table branch is 'This table is created to store branch entities. Similar branch history table is also created to maintain its history. Any changes made here should also be changed in that table also';



CREATE TABLE ${appmaster}.branch_history
(
  id char varying references unique_id(id) NOT NULL ,
  name char varying NOT NULL,
  address char varying,
  city char varying,
  state char varying,
  country char varying,
  pin char varying,
  country_code char varying,
  phone char varying,
  alt_country_code char varying,
  alt_phone char varying,
  email char varying,
  profile char varying,
  general_risk_template char varying,
  product_risk_template char varying,
  updated_by char varying,
  effective_timestamp timestamp NOT NULL 
);

comment on column branch_history.effective_timestamp is 'time when branch is modified/deleted';
comment on table branch_history is 'This table is created to maintain the history of branch table. If Any changes made here, should also be changed in branch table also';

--GROUP

CREATE TABLE ${appmaster}.groups
(
  id char varying references unique_id(id) NOT NULL PRIMARY KEY,
  name char varying NOT NULL,
  country_code char varying,
  phone char varying,
  alt_country_code char varying,
  alt_phone char varying,
  email char varying,
  profile char varying,
  general_risk_template char varying,
  product_risk_template char varying,
  updated_by char varying,
  effective_timestamp timestamp NOT NULL 
);
comment on table groups is 'This table is created to store groups entities. Similar groups history table is also created to maintain its history. Any changes made here should also be changed in that table also';



CREATE TABLE ${appmaster}.groups_history
(
  id char varying references unique_id(id) NOT NULL ,
  name char varying NOT NULL,
  country_code char varying,
  phone char varying,
  alt_country_code char varying,
  alt_phone char varying,
  email char varying,
  profile char varying,
  general_risk_template char varying,
  product_risk_template char varying,
  updated_by char varying,
  effective_timestamp timestamp NOT NULL 
);

comment on column groups_history.effective_timestamp is 'time when groups is modified/deleted';
comment on table groups_history is 'This table is created to maintain the history of groups table. If Any changes made here, should also be changed in groups table also';

--USER PASSWORD

CREATE TABLE ${appmaster}.user_password
(
  id char varying references unique_id(id) PRIMARY KEY,
  password char varying NOT NULL,
  salt char varying NOT NULL,
  password_changed_on_platform smallint,
  user_password_state char varying(1),
  passwords_already_attempted smallint,
  updated_by char varying,
  effective_timestamp timestamp
);
comment on column user_password.password is 'encrypted password in hex format';
comment on column user_password.salt is 'salt using which password will be generated';
comment on column user_password.password_changed_on_platform is 'platform(web/desktop) on which password is changed';
comment on column user_password.passwords_already_attempted is 'No of wrong passwords user has already attempted';


CREATE TABLE ${appmaster}.user_password_history
(
  id char varying references unique_id(id) ,
  password char varying NOT NULL,
  salt char varying NOT NULL,
  password_changed_on_platform char varying(1),
  user_password_state char varying(1),
  passwords_already_attempted smallint,
  updated_by char varying,
  effective_timestamp timestamp
);
comment on column user_password_history.password is 'encrypted password in hex format';
comment on column user_password_history.salt is 'salt using which password will be generated';
comment on column user_password_history.password_changed_on_platform is 'platform(web/desktop) on which password is changed';
comment on column user_password_history.passwords_already_attempted is 'No of wrong passwords user has already attempted';

--LOGIN PRIVILEGES AND PERMISSIONS

CREATE TABLE ${appmaster}.login_privileges_permissions
(
  id char varying references unique_id(id) PRIMARY KEY,
  is_desktop_platform_allowed boolean,
  dekstop_permissions char varying,
  is_web_platform_allowed boolean,
  web_permissions char varying,
  is_mobile_platform_allowed boolean,
  updated_by char varying,
  effective_timestamp timestamp
);
comment on table login_privileges_permissions is 'This table tells the platforms allowed to particular users and permissions corresponding to allowed platforms';

CREATE TABLE ${appmaster}.login_privileges_permissions_history
(
  id char varying references unique_id(id),
  is_desktop_platform_allowed boolean,
  dekstop_permissions char varying,
  is_web_platform_allowed boolean,
  web_permissions char varying,
  is_mobile_platoform_allowed boolean,
  updated_by char varying,
  effective_timestamp timestamp
);
comment on table login_privileges_permissions_history is 'This table maintains the history table for login_privileges_permissions';

--CLIENT EXCHANGE SETTINGS

CREATE TABLE ${appmaster}.client_exchange_settings
(
  id char varying references unique_id(id),
  exchange smallint NOT NULL,
  segment smallint NOT NULL,
  participant_type smallint,
  participant_code char varying,
  is_ucc_inherited boolean,
  ucc char varying,
  ucc_inherited_from char varying,
  account_type smallint,
  updated_by char varying,
  effective_timestamp timestamp,
  CONSTRAINT "client_exchange_settings_pkey" PRIMARY KEY(id, exchange, segment)
);
comment on column client_exchange_settings.participant_code is 'if participant_code is null, it is MEMBER Code by default else it is CP Code';
comment on column client_exchange_settings.is_ucc_inherited is 'UCC for this id, echange, segment is inherited from some other Client or not';
comment on column client_exchange_settings.ucc is 'Unique Client Code for particular id,exchange,segment that will be sent to exchange on placing order';
comment on column client_exchange_settings.ucc_inherited_from is 'Ucc it has inherited is of which particular client';
comment on table client_exchange_settings is 'It stores the exchange mapping and ucc corresponding to a particular client.';


CREATE TABLE ${appmaster}.client_exchange_settings_history
(
  id char varying references unique_id(id),
  exchange smallint NOT NULL,
  segment smallint NOT NULL,
  participant_type smallint,
  participant_code char varying,
  is_ucc_inherited boolean,
  ucc char varying,
  ucc_inherited_from char varying,
  account_type smallint,
  updated_by char varying,
  effective_timestamp timestamp
);
comment on column client_exchange_settings_history.participant_code is 'if participant_code is null, it is MEMBER Code by default else it is CP Code';
comment on column client_exchange_settings_history.is_ucc_inherited is 'UCC for this id, echange, segment is inherited from some other Client or not';
comment on column client_exchange_settings_history.ucc is 'Unique Client Code for particular id,exchange,segment that will be sent to exchange on placing order';
comment on column client_exchange_settings_history.ucc_inherited_from is 'Ucc it has inherited is of which particular client';
comment on table client_exchange_settings_history is 'It maintains the history for client exchange mapping and its ucc';

--DEALER EXCHANGE SETTINGS

CREATE TABLE ${appmaster}.dealer_admin_exchange_settings
(
  id char varying references unique_id(id),
  exchange smallint NOT NULL,
  segment smallint ,
  location_id bigint ,
  code char varying ,
  trader_id bigint,
  expiry_date date ,
  updated_by char varying,
  effective_timestamp timestamp,
  CONSTRAINT "dealer_admin_exchange_settings_pkey" PRIMARY KEY(id, exchange, segment)
);
comment on column dealer_admin_exchange_settings.location_id is 'Location id = CTCL Id + vendor code';
comment on column dealer_admin_exchange_settings.trader_id is 'id to connect with exchange';
comment on table dealer_admin_exchange_settings is 'It stores the exchange mapping corresponding to a particular dealer_admin.';


CREATE TABLE ${appmaster}.dealer_admin_exchange_settings_history
(
  id char varying references unique_id(id),
  exchange smallint NOT NULL,
  segment smallint ,
  location_id bigint ,
  code char varying,
  trader_id bigint,
  expiry_date date,
  updated_by char varying,
  effective_timestamp timestamp
);
comment on table dealer_admin_exchange_settings_history is 'It maintains the history for dealer_admin exchange mapping';

--DESKTOP AND WEB PERMISSIONS -- need to be reformed when permissions widget will be implemented

CREATE TABLE ${appmaster}.desktop_permissions
(
  permission_name char varying  NOT NULL,
  widget_name char varying NOT NULL,
  is_widget_edit_allowed boolean,
  updated_by char varying,
  effective_timestamp timestamp
);

CREATE TABLE ${appmaster}.desktop_permissions_history
(
  permission_name char varying  NOT NULL,
  widget_name char varying NOT NULL,
  is_widget_edit_allowed boolean,
  updated_by char varying,
  effective_timestamp timestamp
);

CREATE TABLE ${appmaster}.web_permissions
(
  permission_name char varying  NOT NULL,
  widget_name char varying NOT NULL,
  is_widget_edit_allowed boolean,
  updated_by char varying,
  effective_timestamp timestamp
);

CREATE TABLE ${appmaster}.web_permissions_history
(
  permission_name char varying  NOT NULL,
  widget_name char varying NOT NULL,
  is_widget_edit_allowed boolean,
  updated_by char varying,
  effective_timestamp timestamp
);

--NOTIFICATIONS

CREATE TABLE ${appmaster}.notifications 
(
  id char varying references unique_id(id) PRIMARY KEY,
  is_email_allowed boolean,
  is_sms_allowed boolean,
  updated_by char varying,
  effective_timestamp timestamp
);
comment on table notifications is 'This table stores that information sent to user about trading or any account changes should be sent through email or sms or both';

CREATE TABLE ${appmaster}.notifications_history
(
  id char varying references unique_id(id) ,
  is_email_allowed boolean,
  is_sms_allowed boolean,
  updated_by char varying,
  effective_timestamp timestamp
);

ALTER TABLE ${appmaster}.dealer_client_mappings ALTER dealer_id type char varying;
ALTER TABLE ${appmaster}.dealer_client_mappings ALTER client_id type char varying;
CREATE TABLE ${appmaster}.dealer_client_mapping_history
(
  dealer_id char varying references unique_id(id),
  client_id char varying references unique_id(id),
  effective_timestamp timestamp
);
comment on table dealer_client_mapping_history is 'This table stores the history of dealer client mapping.';

CREATE TABLE ${appmaster}.group_client_mapping
(
  group_id char varying references unique_id(id),
  client_id char varying references unique_id(id),
  effective_timestamp timestamp
);
comment on table group_client_mapping is 'This table stores the mapping of groups and clients';

CREATE TABLE ${appmaster}.group_client_mapping_history
(
  group_id char varying references unique_id(id),
  client_id char varying references unique_id(id),
  effective_timestamp timestamp
);
comment on table group_client_mapping is 'This table stores the history of mapping of groups and clients';

