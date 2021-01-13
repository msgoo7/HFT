--
-- scrip master column security_id was changed to bigint, changing it back to integer as it was causing some problems
--

ALTER TABLE ${appmaster}.scrip_master ALTER COLUMN security_id type integer ;
