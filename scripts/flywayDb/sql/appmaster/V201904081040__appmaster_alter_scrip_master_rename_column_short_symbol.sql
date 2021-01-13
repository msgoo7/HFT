-- =====================================
-- -- mkt_pic_bcast_flag column renamed to asset_code
-- -- asset_code size is increased
-- -- Currently used for storing symbol name of BSEFO for Span usage
-- -- As BSEFO symbol name= ACCL, AXIS  Scrip_master symbol name= ACC , AXISBANK
-- -- In future Can use this for other exchanges as well
-- =====================================

ALTER TABLE ${appmaster}.scrip_master RENAME COLUMN  mkt_pic_bcast_flag TO asset_code;
ALTER TABLE ${appmaster}.scrip_master ALTER COLUMN asset_code TYPE VARCHAR(10);
