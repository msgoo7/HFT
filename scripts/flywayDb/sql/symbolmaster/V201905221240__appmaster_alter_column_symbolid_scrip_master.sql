TRUNCATE table ${appmaster}.scrip_master CASCADE; 
ALTER table ${appmaster}.scrip_master ALTER COLUMN  symbol_id TYPE bigint;

CREATE OR REPLACE FUNCTION add_unique_if_not_exist( ptable TEXT, pcolumn TEXT ) 
RETURNS VOID AS $$
DECLARE
isExists boolean DEFAULT false;
BEGIN
  SELECT true FROM information_schema.table_constraints tc INTO isExists
  INNER JOIN information_schema.constraint_column_usage AS ccu ON ccu.table_catalog = tc.table_catalog 
  AND ccu.constraint_name = tc.constraint_name AND ccu.table_name = ptable 
  AND ccu.column_name = pcolumn AND tc.constraint_type = 'UNIQUE';

  IF NOT FOUND THEN
    EXECUTE FORMAT('ALTER TABLE ${appmaster}.%I ADD UNIQUE ( %I );', ptable, pcolumn);
  END IF;
END; $$
LANGUAGE plpgsql;

SELECT add_unique_if_not_exist('scrip_master', 'symbol_id');
