-- ================================================================================
-- Remove Previous Client Types and add
-- new cient types in sync with front end db
-- ===============================================================================

DELETE from ${refmaster}.client_types;
INSERT INTO ${refmaster}.client_types values(1, 'CLIENT');
INSERT INTO ${refmaster}.client_types values(2, 'OWN');
INSERT INTO ${refmaster}.client_types values(3, 'FII');
INSERT INTO ${refmaster}.client_types values(4, 'DII');
