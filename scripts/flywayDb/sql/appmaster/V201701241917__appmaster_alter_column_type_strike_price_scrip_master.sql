--
-- scrip master column strike price was numeric ( 10, 2 ) which is changed to decimal no limit in precision
--
ALTER TABLE scrip_master ALTER COLUMN strike_price TYPE DECIMAL ;
