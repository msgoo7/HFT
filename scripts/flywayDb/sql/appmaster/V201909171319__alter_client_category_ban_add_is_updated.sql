-- ADD is_updated column in client_category_ban and client_category_ban_history table
ALTER TABLE ${appmaster}.client_category_ban ADD COLUMN is_updated boolean default false ;
ALTER TABLE ${appmaster}.client_category_ban_history ADD COLUMN is_updated boolean default false ;
