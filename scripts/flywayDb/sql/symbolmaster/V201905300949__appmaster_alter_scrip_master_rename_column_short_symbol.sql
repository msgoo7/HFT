-- =====================================
-- -- mkt_pic_bcast_flag column renamed to asset_code
-- -- asset_code size is increased
-- -- Currently used for storing symbol name of BSEFO for Span usage
-- -- As BSEFO symbol name= ACCL, AXIS  Scrip_master symbol name= ACC , AXISBANK
-- -- In future Can use this for other exchanges as well
-- =====================================

CREATE OR REPLACE FUNCTION rename_column_if_exists(ptable TEXT, pcolumn TEXT, new_column TEXT)
RETURNS VOID AS $$
DECLARE
isExist boolean DEFAULT false;
BEGIN
  SELECT true FROM information_schema.columns INTO isExist
  WHERE table_name = ptable and column_name = pcolumn;

  IF FOUND THEN
    EXECUTE FORMAT( 'ALTER TABLE %I RENAME COLUMN %I TO %I;', ptable, pcolumn, new_column);
  END IF;
END; $$
LANGUAGE plpgsql;

SELECT rename_column_if_exists('scrip_master', 'mkt_pic_bcast_flag', 'asset_code');
ALTER TABLE ${appmaster}.scrip_master ALTER COLUMN asset_code TYPE VARCHAR(10);

