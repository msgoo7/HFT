CREATE TABLE ${appmaster}.confirmation_sequence_number
(
  last_seq_no bigint NOT NULL
);

INSERT INTO ${appmaster}.confirmation_sequence_number(last_seq_no) VALUES(0);
