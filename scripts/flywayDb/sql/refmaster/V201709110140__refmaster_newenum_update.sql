-- =========================================
-- Enum square_off_status
-- Description :  
-- =========================================

CREATE TABLE ${refmaster}.square_off_status
(
  square_off_status smallint UNIQUE,
  square_off_status_desc char varying UNIQUE,
  CONSTRAINT square_off_status_pkey PRIMARY KEY(square_off_status,square_off_status_desc)
);

INSERT INTO ${refmaster}.square_off_status  values(0, 'Only Square off allowed');
INSERT INTO ${refmaster}.square_off_status  values(1, 'Sqaue off not allowed');
INSERT INTO ${refmaster}.square_off_status  values(2, 'None');
INSERT INTO ${refmaster}.square_off_status  values(3, 'Max');

-- =========================================
-- Enum order_mode
-- Description : For RMS check Order Mode Allowed / Not Allowed
-- =========================================

CREATE TABLE ${refmaster}.order_mode
(
  order_mode smallint UNIQUE,
  order_mode_desc char varying UNIQUE,
  CONSTRAINT order_mode_pkey PRIMARY KEY(order_mode,order_mode_desc)
);

INSERT INTO ${refmaster}.order_mode  values(0, 'BUY');
INSERT INTO ${refmaster}.order_mode  values(1, 'SELL');
INSERT INTO ${refmaster}.order_mode  values(2, 'BOTH');
INSERT INTO ${refmaster}.order_mode  values(3, 'NONE');
INSERT INTO ${refmaster}.order_mode  values(4, 'MAX');

-- =========================================
-- Enum global_rms_setting_combination
-- Description : RMS checks Level 
-- =========================================

CREATE TABLE ${refmaster}.global_rms_setting_combination
(
  combination_type smallint UNIQUE,
  combination_type_desc char varying UNIQUE,
  CONSTRAINT global_rms_setting_combination_pkey PRIMARY KEY(combination_type,combination_type_desc)
);

INSERT INTO ${refmaster}.global_rms_setting_combination  values(0, 'Client Code');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(1, 'Client Code + Symbol');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(2, 'Client Code + Underlying');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(3, 'Client Code + Product');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(4, 'Client Code + Symbol Basket');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(5, 'Client Code + Product + Symbol');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(6, 'Client Code + Product + Symbol Basket');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(7, 'Dealer');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(8, 'Dealer + Symbol');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(9, 'Dealer + Underlying');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(10, 'Group + Symbol');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(11, 'Branch');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(12, 'Brance + Symbol');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(13, 'Branch + Underlying');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(14, 'Product');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(15, 'Product + Symbol');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(16, 'Product + Underlying');
INSERT INTO ${refmaster}.global_rms_setting_combination  values(17, 'Symbol Basket');

-- =========================================
-- Enum source
-- Description :  
-- =========================================

CREATE TABLE ${refmaster}.source
(
  source_id smallint UNIQUE,
  source_id_desc char varying UNIQUE,
  CONSTRAINT source_pkey PRIMARY KEY(source_id,source_id_desc)
);

INSERT INTO ${refmaster}.source  values(0, 'Settled');
INSERT INTO ${refmaster}.source  values(1, 'UnSettled');

