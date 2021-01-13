ALTER TABLE ${appmaster}.client ADD COLUMN family_id character varying DEFAULT 'NONE' ;
ALTER TABLE ${appmaster}.client_history ADD COLUMN family_id character varying DEFAULT 'NONE' ;
