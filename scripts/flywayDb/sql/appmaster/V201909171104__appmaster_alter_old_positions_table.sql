ALTER TABLE ${appmaster}.old_positions ADD COLUMN product_id integer DEFAULT 1;
ALTER TABLE ${appmaster}.old_positions_history ADD COLUMN product_id integer DEFAULT 1;
