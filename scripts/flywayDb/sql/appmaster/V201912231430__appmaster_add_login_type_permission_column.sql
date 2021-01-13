-- Add login_type column in login_privileges_permissions and login_privileges_permissions_history table
-- Value of login_type may be Offline(0) or Online(1)

ALTER TABLE ${appmaster}.login_privileges_permissions ADD COLUMN login_type smallint DEFAULT 1 ;
ALTER TABLE ${appmaster}.login_privileges_permissions_history ADD COLUMN login_type smallint DEFAULT 1 ;
