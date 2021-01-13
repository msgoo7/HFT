TRUNCATE table ${appmaster}.scrip_master;
ALTER table ${appmaster}.scrip_master ADD UNIQUE ( symbol_id );
