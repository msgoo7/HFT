CREATE TABLE ${refmaster}.actions
(
  action integer ,
  action_desc char varying,
  PRIMARY KEY (action)
);

INSERT INTO ${refmaster}.actions values( 0, 'INVALID' );
INSERT INTO ${refmaster}.actions values( 1, 'WARNING POPUP' );
INSERT INTO ${refmaster}.actions values( 2, 'WARNING' );
INSERT INTO ${refmaster}.actions values( 3, 'CANCEL' );
INSERT INTO ${refmaster}.actions values( 4, 'SQUARE OFF' );
INSERT INTO ${refmaster}.actions values( 5, 'EMAIL' );
INSERT INTO ${refmaster}.actions values( 6, 'SMS' );

CREATE TABLE ${refmaster}.alert_types
(
  alert_type integer,
  alert_type_desc char varying,
  PRIMARY KEY( alert_type)
);

INSERT INTO ${refmaster}.alert_types values(0 , 'INVALID');
INSERT INTO ${refmaster}.alert_types values(1 , 'MARGIN APPLICATION');
INSERT INTO ${refmaster}.alert_types values(2 , 'MARGIN EMAIL');
INSERT INTO ${refmaster}.alert_types values(3 , 'MARGIN SMS');
INSERT INTO ${refmaster}.alert_types values(4 , 'MTM');

