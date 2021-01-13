 ALTER TABLE ${appmaster}.uhedge_settings ALTER COLUMN account_detail DROP NOT NULL;
 ALTER TABLE ${appmaster}.uhedge_settings ALTER COLUMN account_detail SET  DEFAULT NULL; 
