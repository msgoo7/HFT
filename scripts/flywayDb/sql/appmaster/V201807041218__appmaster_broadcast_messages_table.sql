create table ${appmaster}.broadcast_messages(
  sequence SERIAL,
  sender varchar(25) NOT NULL,
  receiver varchar(25) NOT NULL,
  message text,
  effective_time_stamp timestamp not NULL default now(),
  PRIMARY KEY(sequence));
