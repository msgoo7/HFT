ALTER TABLE scrip_master RENAME COLUMN underlying_market_code TO maturity_yearmon20 ; 
ALTER TABLE scrip_master RENAME COLUMN maturity_yearmon2 TO underlying_market_code ;
ALTER TABLE scrip_master RENAME COLUMN maturity_yearmon20 TO maturity_yearmon2;
ALTER TABLE scrip_master RENAME COLUMN instrument_modifier TO maturity_day20;
ALTER TABLE scrip_master RENAME COLUMN maturity_day2 TO instrument_modifier ;
ALTER TABLE scrip_master RENAME COLUMN maturity_day20 TO maturity_day2;
