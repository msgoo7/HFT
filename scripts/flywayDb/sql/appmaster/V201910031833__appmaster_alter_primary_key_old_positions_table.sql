ALTER TABLE old_positions DROP CONSTRAINT p_key_old_positions;
ALTER TABLE old_positions ADD CONSTRAINT p_key_old_positions PRIMARY KEY (dealer, symbol_id, client, exchange, segment, product_id);
