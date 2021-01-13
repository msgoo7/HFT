INSERT INTO ${appmaster}.unique_id (id, id_type, parent_id) VALUES ('root', NULL, NULL);
INSERT INTO ${appmaster}.unique_id (id, id_type, parent_id) VALUES ('ROOTBRANCH', 3, 'root');
INSERT INTO ${appmaster}.unique_id (id, id_type, parent_id) VALUES ('SUPERADMIN', 1, 'ROOTBRANCH');

INSERT INTO ${appmaster}.unique_id (id, id_type, parent_id) VALUES ('DMS', 1,'ROOTBRANCH'); 

INSERT INTO ${appmaster}.admin(id, first_name, country_code, phone, email, account_status, account_validity, effective_timestamp) VALUES('DMS', 'DMSADMIN', '+91', '987654321',  'dmsadmin@gmail.com', 0, CURRENT_DATE + INTERVAL '5 year', now());

INSERT INTO ${appmaster}.admin(id, first_name, country_code, phone, email, account_status, account_validity,effective_timestamp) VALUES('SUPERADMIN', 'SUPERADMIN', '+91', '987654321', 'superadmin@gmail.com', 0, CURRENT_DATE + INTERVAL '5 year', now());

INSERT INTO ${appmaster}.user_password(id, password, salt, user_password_state,
passwords_already_attempted) VALUES('SUPERADMIN', '3c3fe4d35f5671041a674776a1d9e242b1b7f28c', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'N', 0);

INSERT INTO ${appmaster}.user_password(id, password, salt, user_password_state, passwords_already_attempted) VALUES('DMS', '3c3fe4d35f5671041a674776a1d9e242b1b7f28c',
'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'N', 0);

INSERT INTO ${appmaster}.branch(id, name, country_code, phone, email, effective_timestamp) VALUES('ROOTBRANCH', 'ROOTBRANCH', '+91', '3977654321', 'rootbranch@gmail.com', now());

INSERT INTO ${appmaster}.unique_id (id, id_type, parent_id) VALUES('PRO', 0,
'ROOTBRANCH');

INSERT INTO ${appmaster}.client(id, first_name, country_code, phone, email, account_status, account_validity, client_type, effective_timestamp) VALUES('PRO', 'PRO', '+91', '987654321', 'abc@gmail.com', 0, '01-01-2099', 4, now());

INSERT INTO ${appmaster}.login_privileges_permissions(id, is_desktop_platform_allowed, effective_timestamp) values('SUPERADMIN', 't', now());
INSERT INTO ${appmaster}.login_privileges_permissions(id, is_desktop_platform_allowed, effective_timestamp) values('DMS', 't', now());
INSERT INTO ${appmaster}.login_privileges_permissions(id, is_desktop_platform_allowed, effective_timestamp) values('PRO', 't', now());
