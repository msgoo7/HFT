-- Alter Table login_history

ALTER TABLE ${appmaster}.login_history ADD COLUMN token character varying DEFAULT 'NA', ADD CONSTRAINT primary_key PRIMARY KEY ( user_id, access_time );
