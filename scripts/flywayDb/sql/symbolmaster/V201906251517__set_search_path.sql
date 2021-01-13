
-- =======================================
-- Function to set default search_path 
-- to appmaster and refmaster in postgres
-- =======================================

CREATE OR REPLACE FUNCTION set_search_path()
RETURNS void AS $$
  DECLARE
    db_name TEXT;
  BEGIN
    select current_database() into db_name;
    execute 'alter role ' || current_user 
      || ' in database ' || db_name 
      || ' set search_path to appmaster, refmaster ';
  END; $$
LANGUAGE plpgsql;

-- =================================
-- Execute set_search_path function
-- =================================
SELECT set_search_path();
