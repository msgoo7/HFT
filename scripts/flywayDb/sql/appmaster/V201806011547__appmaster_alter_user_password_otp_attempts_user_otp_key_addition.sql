ALTER TABLE appmaster.user_password ADD COLUMN otp_attempts SMALLINT DEFAULT 0;
ALTER TABLE appmaster.user_password ADD COLUMN user_otp_key VARCHAR(20) DEFAULT 'C32XYFB5ZZLD5MQT';
