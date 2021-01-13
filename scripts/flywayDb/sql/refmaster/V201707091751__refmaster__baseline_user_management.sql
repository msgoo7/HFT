CREATE SCHEMA ${refmaster};

CREATE TABLE ${refmaster}.client_types
(
  client_type smallint NOT NULL UNIQUE,
  client_type_desc character varying NOT NULL UNIQUE,
  CONSTRAINT client_types_pkey PRIMARY KEY (client_type, client_type_desc)
);
comment on table ${refmaster}.client_types is 'this table is to keep string-number mapping of client types such as OWN, HUF, INDIVIDUAL, PROPRIETOR etc';


INSERT INTO ${refmaster}.client_types values(1, 'Individual/Proprietorship Firms');
INSERT INTO ${refmaster}.client_types values(2, 'Partnership Firm');
INSERT INTO ${refmaster}.client_types values(3, 'HUF');
INSERT INTO ${refmaster}.client_types values(4, 'OWN');
INSERT INTO ${refmaster}.client_types values(5, 'INSTITUTIONAL');
INSERT INTO ${refmaster}.client_types values(6, 'NRI');
INSERT INTO ${refmaster}.client_types values(7, 'FII');
INSERT INTO ${refmaster}.client_types values(8, 'Trust/Society');

CREATE TABLE ${refmaster}.user_identification_types
(
  identification_type smallint UNIQUE,
  identification_type_desc char varying UNIQUE,
  CONSTRAINT user_identification_types_pkey PRIMARY KEY(identification_type, identification_type_desc)
);
comment on table ${refmaster}.user_identification_types is 'string-number mapping of identification-types such as Driving license/pancard/aadhar card';

INSERT INTO ${refmaster}.user_identification_types values(1, 'Driving License');
INSERT INTO ${refmaster}.user_identification_types values(2, 'Pan Card');
INSERT INTO ${refmaster}.user_identification_types values(3,'Aadhar Card');

CREATE TABLE ${refmaster}.password_policy
(
  effective_date date NOT NULL,
  min_length integer,
  max_length integer,
  contains_special_char boolean,
  contains_mixed_case boolean,
  contains_digit boolean,
  days_to_expire integer,
  last_n_different integer,
  expiration_date date,
  allow_concurrent_login character(1),
  otp_retries_allowed integer DEFAULT 5,
  otp_validation_time_frame integer NOT NULL DEFAULT 1,
  max_password_retries_allowed integer NOT NULL DEFAULT 3,
  CONSTRAINT password_policy_pkey PRIMARY KEY (effective_date),
  CONSTRAINT max_password_retries_positive_check CHECK (max_password_retries_allowed > 0)
);
comment on column ${refmaster}.password_policy.min_length is 'minimum length of password';
comment on column ${refmaster}.password_policy.max_length is 'maximum length of password';
comment on column ${refmaster}.password_policy.contains_special_char is 'a validation that password should contain special characters or not';
comment on column ${refmaster}.password_policy.contains_mixed_case is 'a validation that password sshould contains atleast 1 small aalphabet and 1 capital alphabet';
comment on column ${refmaster}.password_policy.contains_digit is 'password should be mixture of digits and alphabets';
comment on column ${refmaster}.password_policy.days_to_expire is 'after how many days password will expire';
comment on column ${refmaster}.password_policy.last_n_different is 'password should not be same as its last n passwords';
comment on column ${refmaster}.password_policy.allow_concurrent_login is 'concurrent login is allowed or not for particular login id';
comment on column ${refmaster}.password_policy.max_password_retries_allowed is 'how many times a user can try his/her wrong password before his account gets locked';

INSERT INTO ${refmaster}.password_policy values(now(), 8, 12,'f','f','t',14,8,NULL,'N',5,1,3);


CREATE TABLE ${refmaster}.id_types
(
  id_type smallint UNIQUE,
  id_type_desc char varying UNIQUE,
  CONSTRAINT id_types_pkey PRIMARY KEY(id_type, id_type_desc)
);
comment on table ${refmaster}.id_types is 'it tells the types of users our system support and their corresponding enums. % types of usersf';

INSERT INTO ${refmaster}.id_types values(0, 'CLIENT');
INSERT INTO ${refmaster}.id_types values(1, 'ADMIN');
INSERT INTO ${refmaster}.id_types values(2, 'DEALER');
INSERT INTO ${refmaster}.id_types values(3, 'BRANCH');
INSERT INTO ${refmaster}.id_types values(4, 'GROUP');

CREATE TABLE ${refmaster}.platform_types
(
  platform_type smallint UNIQUE,
  platform_type_desc char varying UNIQUE,
  CONSTRAINT platform_types_pkey PRIMARY KEY(platform_type, platform_type_desc)
);
comment on table ${refmaster}.platform_types is 'It keeps string-number mapping of platform types such as web/desktop/mobile';

INSERT INTO ${refmaster}.platform_types values(1, 'DESKTOP');
INSERT INTO ${refmaster}.platform_types values(2, 'WEB');
INSERT INTO ${refmaster}.platform_types values(3,'MOBILE');


CREATE TABLE ${refmaster}.user_account_status
(
  user_account_status smallint UNIQUE,
  user_account_status_desc char varying UNIQUE,
  CONSTRAINT user_account_status_pkey PRIMARY KEY(user_account_status, user_account_status_desc)
);
comment on table ${refmaster}.user_account_status is 'it keeps string-number mapping of user account status such as active/inactive etc';

INSERT INTO ${refmaster}.user_account_status values(0, 'Active');
INSERT INTO ${refmaster}.user_account_status values(1, 'Inactive');
INSERT INTO ${refmaster}.user_account_status values(2, 'Suspended');
INSERT INTO ${refmaster}.user_account_status values(3, 'Deleted');

CREATE TABLE ${refmaster}.participant_types
(
  participant_type smallint UNIQUE,
  participant_type_desc char varying UNIQUE,
  CONSTRAINT participant_types_pkey PRIMARY KEY(participant_type, participant_type_desc)
);
comment on table ${refmaster}.participant_types is 'it keeps string-number mapping of participant types such as member code/cp code/inst';

INSERT INTO ${refmaster}.participant_types values(0, 'Member Code');
INSERT INTO ${refmaster}.participant_types values(1, 'CP Code');
INSERT INTO ${refmaster}.participant_types values(2, 'INST');

CREATE TABLE ${refmaster}.exchange_participant_types_codes
(
  exchange char varying,
  participant_type smallint,
  CONSTRAINT exchange_participant_types_codes_pkey PRIMARY KEY(exchange, participant_type)
);
comment on table ${refmaster}.exchange_participant_types_codes is 'it keeps participant types allowed in different exchanges';

INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSECM', 2);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSECM', 0);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSECDS', 1);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSECDS', 2);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSECDS', 0);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSEFO', 1);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSEFO', 2);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSEFO', 0);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSEINX', 0);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSEINX', 1);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('BSEINX', 2);

INSERT INTO ${refmaster}.exchange_participant_types_codes values('NSECM', 2);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('NSECM', 0);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('NSECDS', 1);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('NSECDS', 2);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('NSECDS', 0);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('NSEFO', 1);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('NSEFO', 2);
INSERT INTO ${refmaster}.exchange_participant_types_codes values('NSEFO', 0);

CREATE TABLE ${refmaster}.exchange_segment_settings
(
  exchange char varying, 
  is_ctcl_applicable boolean,
  vendor_code char varying,
  max_location_id_length smallint,
  ctcl_for_web_exe bigint,
  ctcl_for_mobile bigint,
  CONSTRAINT  exchange_segment_settings_pkey PRIMARY KEY (exchange)
);
comment on table ${refmaster}.exchange_segment_settings is 'This table stores settings for different exchanges such as ctcl applicability for exchange as ctcl is generally applicable only for Indian exchanges and CTCL =  location id + Vendor code and Ctcl for web and mobile platforms are fixed for every exchange. They are saved here directly.';
comment on column ${refmaster}.exchange_segment_settings.vendor_code is 'Vendor_code consists of last three digits of CTCL Id as they are fixed according to exchange segment wise ';
comment on column ${refmaster}.exchange_segment_settings.max_location_id_length is 'location id length varies exchange to exchange';


INSERT INTO ${refmaster}.exchange_segment_settings VALUES('BSECM', 't', '021', 13, 1111111111111021, 3333333333333021);
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('BSEFO', 't', '021', 13, 1111111111111021, 3333333333333021);
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('NSECM', 't', '100', 12, 111111111111100, 333333333333100);
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('NSEFO', 't', '100', 12, 111111111111100, 333333333333100);
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('NSECDS', 't', '100', 12, 1111111111111021, 3333333333333021);
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('BSECDS', 't', '021', 13, 111111111111100, 333333333333100);
INSERT INTO ${refmaster}.exchange_segment_settings VALUES('BSEINX', 't', '006', 13, 0, 0);

