CREATE TABLE ${appmaster}.unique_id_history
(
  id char varying NOT NULL,
  id_type smallint,
  parent_id char varying,
  unique_id_for_login bigint
);

ALTER TABLE ${appmaster}.client_history DROP CONSTRAINT client_history_id_fkey;
ALTER TABLE ${appmaster}.user_password_history DROP CONSTRAINT user_password_history_id_fkey;
ALTER TABLE ${appmaster}.notifications_history DROP CONSTRAINT notifications_history_id_fkey;
ALTER TABLE ${appmaster}.login_privileges_permissions_history DROP CONSTRAINT login_privileges_permissions_history_id_fkey;
ALTER TABLE ${appmaster}.client_exchange_settings_history DROP CONSTRAINT client_exchange_settings_history_id_fkey;
ALTER TABLE ${appmaster}.dealer_client_mapping_history DROP CONSTRAINT dealer_client_mapping_history_client_id_fkey;
ALTER TABLE ${appmaster}.dealer_client_mapping_history DROP CONSTRAINT dealer_client_mapping_history_dealer_id_fkey;
