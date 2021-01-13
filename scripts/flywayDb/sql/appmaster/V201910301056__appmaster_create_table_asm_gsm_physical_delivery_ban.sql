--
-- Create  Table asm_gsm_ban and physical_delivery_ban
--

CREATE TABLE asm_gsm_ban (
  asm_stage_0 boolean,
  asm_short_stage_1 boolean,
  asm_short_stage_2 boolean,
  asm_long_stage_1 boolean,
  asm_long_stage_2 boolean,
  asm_long_stage_3 boolean,
  asm_long_stage_4 boolean,
  gsm_stage_0 boolean,
  gsm_stage_1 boolean,
  gsm_stage_2 boolean,
  gsm_stage_3 boolean,
  gsm_stage_4 boolean,
  gsm_stage_5 boolean,
  gsm_stage_6 boolean
);

CREATE TABLE physical_delivery_ban (
  fo_days SMALLINT,
  commodity_days SMALLINT
);

--
-- Insertings true in all stages to enable them by default
--

INSERT INTO ${appmaster}.asm_gsm_ban VALUES( true, true, true, true, true, true, true,
                                             true, true, true, true, true, true, true );

--
-- Inserting 0 for both to disable the ban by default
--

INSERT INTO ${appmaster}.physical_delivery_ban VALUES( 0, 0);
