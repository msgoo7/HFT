-- ADD prodcut_id column in client_category_ban and client_category_ban_history table
ALTER TABLE ${appmaster}.client_category_ban ADD COLUMN product_id smallint default -1 ;
ALTER TABLE ${appmaster}.client_category_ban_history ADD COLUMN product_id smallint default -1 ;

-- ADD row in client_types table for addressing All client types
INSERT INTO ${refmaster}.client_types VALUES( 5, 'ALL' );
