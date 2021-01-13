CREATE TABLE ${appmaster}.exchange_timings 
(
  market_id character varying(10) NOT NULL,
  start_time time without time zone NOT NULL,
  end_time time without time zone NOT NULL,
  PRIMARY KEY (market_id)
);

INSERT INTO ${appmaster}.exchange_timings VALUES 
( 'NSECM','09:15:00', '15:30:00' ),
( 'NSEFO','09:15:00', '15:30:00' ),
( 'NSECDS','09:00:00', '17:00:00' ),
( 'BSECM','09:15:00', '15:30:00' ),
( 'BSEFO','09:15:00', '15:30:00' ),
( 'BSECDS','09:00:00', '17:00:00' ),
( 'MCX','09:00:00', '23:30:00' ),
( 'NCDEX', '09:00:00', '21:00:00' ),
( 'MSECM', '09:15:00', '15:30:00' ),
( 'MSEFO', '09:15:00', '15:30:00' ),
( 'MSECD', '09:00:00', '17:00:00' ),
( 'ESMNSE', '00:00:00', '23:59:59' );
