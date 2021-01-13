-- ================================================================================
-- Insert Queries for eod_entity: Product Conversion
-- ===============================================================================

INSERT INTO ${refmaster}.eod_entity(entity) values ('Product_conversion') ;
INSERT INTO ${refmaster}.eod_action(entity,clean,clean_and_archive) values ('Product_conversion',0,1) ;
