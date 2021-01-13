-- Table login_history

CREATE TABLE ${appmaster}.login_history (
  user_id character varying NOT NULL,
  access_type integer NOT NULL,
  device character varying(50) NOT NULL,
  location character varying(100) NOT NULL,
  access_time timestamptz default now(),
  duration  character varying(40) NOT NULL,
  ip_address  character varying(20) NOT NULL,
  loggedin boolean DEFAULT false
);
