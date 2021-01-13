--
-- Deleting the existing entry from the table.
--

DELETE FROM ${appmaster}.asm_gsm_ban;

--
-- Inserting the default values as false in the table for all columns.
--

INSERT INTO ${appmaster}.asm_gsm_ban VALUES( false, false, false, false, false, false, false,
                                             false, false, false, false, false, false, false );
