-- Table  strategy_limits
--

DROP TABLE ${appmaster}.strategy_limits ;
DROP TABLE ${appmaster}.strategy_limits_history ;

CREATE TABLE ${appmaster}.strategy_limits 
( dealer_id integer NOT NULL,
  strategy_name character varying NOT NULL , 
  allowed_count integer ,
  updated_by character varying NOT NULL ,
  CONSTRAINT pk_strategy_limits PRIMARY KEY (dealer_id , strategy_name)
);

CREATE TABLE ${appmaster}.strategy_limits_history
( dealer_id integer NOT NULL,
  strategy_name character varying NOT NULL,
  allowed_count integer ,
  updated_by character varying NOT NULL ,
  effective_timestamp timestamp without time zone DEFAULT now()
);
