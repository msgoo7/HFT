UPDATE ${appmaster}.login_privileges_permissions  
SET dekstop_permissions = 'ALL' 
WHERE id IN (SELECT id FROM ${appmaster}.unique_id WHERE id_type = 1);
