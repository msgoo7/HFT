-- new column added for indices for storing close price

alter table ${appmaster}.indices
add column close_price int default 0;
