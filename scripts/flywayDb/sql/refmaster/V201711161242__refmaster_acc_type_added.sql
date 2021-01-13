DROP TABLE ${refmaster}.exchange_participant_types_codes;

CREATE TABLE ${refmaster}.account_types
(
  account_type smallint UNIQUE,
  account_type_desc char varying UNIQUE,
  CONSTRAINT account_types_pkey PRIMARY KEY(account_type, account_type_desc)
);

INSERT INTO ${refmaster}.account_types values(0, 'Client');
INSERT INTO ${refmaster}.account_types values(1, 'PRO');
INSERT INTO ${refmaster}.account_types values(2, 'SpClient');
INSERT INTO ${refmaster}.account_types values(3, 'INST');


CREATE TABLE ${refmaster}.exchange_account_participant_types
(
  exchange char varying,
  account_type smallint,
  participant_type smallint,
  CONSTRAINT exchange_account_participant_types_pkey PRIMARY KEY(exchange, account_type, participant_type)
);
comment on table ${refmaster}.exchange_account_participant_types is 'it keeps participant types allowed in different exchanges';

INSERT INTO ${refmaster}.exchange_account_participant_types values('BSECM', 0, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSECM', 1, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSECM', 2, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSECM', 3, 0);

INSERT INTO ${refmaster}.exchange_account_participant_types values('BSECDS', 0, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSECDS', 2, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSECDS', 2, 1);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSECDS', 3, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSECDS', 3, 1);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSECDS', 3, 2);

INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEFO', 0, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEFO', 1, 0); 
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEFO', 2, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEFO', 2, 1);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEFO', 3, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEFO', 3, 1);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEFO', 3, 2);

INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEINX', 0, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEINX', 1, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEINX', 2, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('BSEINX', 3, 0);

INSERT INTO ${refmaster}.exchange_account_participant_types values('NSECM', 0, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSECM', 0, 1);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSECM', 0, 2);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSECM', 1, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSECM', 1, 1);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSECM', 1, 2);

INSERT INTO ${refmaster}.exchange_account_participant_types values('NSECDS', 0, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSECDS', 0, 1);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSECDS', 1, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSECDS', 1, 1);

INSERT INTO ${refmaster}.exchange_account_participant_types values('NSEFO', 0, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSEFO', 0, 1);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSEFO', 1, 0);
INSERT INTO ${refmaster}.exchange_account_participant_types values('NSEFO', 1, 1);

