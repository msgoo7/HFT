-- Drop Old AMO Time Settings Table -- 

DROP TABLE ${appmaster}.amo_order_time_settings;

-- Create New AMO Time Settings Tables --

CREATE TABLE ${appmaster}.amo_allowed_settings(
  exchange_id INTEGER NOT NULL,
  exchange_segment INTEGER NOT NULL,
  is_enable BOOLEAN NOT NULL,
  updated_by VARCHAR,
  effective_timestamp timestamp without time zone DEFAULT now(),
  PRIMARY KEY( exchange_id, exchange_segment )
);

-- Allowing AMO in Some Exchanges --
INSERT INTO ${appmaster}.amo_allowed_settings( 
  exchange_id, exchange_segment, is_enable, updated_by )
  VALUES ( 1, 0, true, 'SUPERADMIN' ),
         ( 2, 1, true, 'SUPERADMIN' ),
         ( 3, 0, true, 'SUPERADMIN' ),
         ( 4, 1, true, 'SUPERADMIN' ),
         ( 5, 0, true, 'SUPERADMIN' ),
         ( 5, 1, true, 'SUPERADMIN' ),
         ( 6, 1, true, 'SUPERADMIN' ),
         ( 7, 1, true, 'SUPERADMIN' ),
         ( 11, 1, true, 'SUPERADMIN' );

CREATE TABLE ${appmaster}.amo_time_slots_settings(
  exchange_id INTEGER NOT NULL,
  exchange_segment INTEGER NOT NULL,
  start_time INTEGER NOT NULL,
  end_time INTEGER NOT NULL,
  effective_timestamp timestamp without time zone DEFAULT now(),
  FOREIGN KEY ( exchange_id, exchange_segment ) REFERENCES 
  ${appmaster}.amo_allowed_settings( exchange_id, exchange_segment )
  ON DELETE CASCADE
);

-- Setting Time Slot from 6 PM to 7 PM --
-- For MCX 11:30 PM to 11:59:59 PM --
INSERT INTO ${appmaster}.amo_time_slots_settings( 
  exchange_id, exchange_segment, start_time, end_time )
  VALUES ( 1, 0, 64800, 68400 ),
         ( 2, 1, 64800, 68400 ),
         ( 3, 0, 64800, 68400 ),
         ( 4, 1, 64800, 68400 ),
         ( 5, 0, 64800, 68400 ),
         ( 5, 1, 64800, 68400 ),
         ( 6, 1, 64800, 68400 ),
         ( 7, 1, 64800, 68400 ),
         ( 11, 1, 84600, 86399 );

CREATE TABLE ${appmaster}.amo_push_time_settings(
  exchange_id INTEGER NOT NULL,
  exchange_segment INTEGER NOT NULL,
  push_time INTEGER NOT NULL,
  effective_timestamp timestamp without time zone DEFAULT now(),
  FOREIGN KEY ( exchange_id, exchange_segment ) REFERENCES 
  ${appmaster}.amo_allowed_settings( exchange_id, exchange_segment )
  ON DELETE CASCADE
);

-- Setting Push Time to Market Open Time --
INSERT INTO ${appmaster}.amo_push_time_settings( 
  exchange_id, exchange_segment, push_time )
  VALUES ( 1, 0, 33300 ),
         ( 2, 1, 33300 ),
         ( 3, 0, 33300 ),
         ( 4, 1, 33300 ),
         ( 5, 0, 33300 ),
         ( 5, 1, 33300 ),
         ( 6, 1, 32400 ),
         ( 7, 1, 32400 ),
         ( 11, 1, 32400 );
