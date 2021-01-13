alter table appmaster.dealer ADD is_sales_trader boolean default false;
alter table appmaster.dealer_history ADD is_sales_trader boolean default false;

alter table appmaster.client ADD COLUMN sender_comp_id char varying default '';
alter table appmaster.client ADD COLUMN primary_st char varying default '';
alter table appmaster.client ADD COLUMN secondary_st char varying default '';

alter table appmaster.client_history ADD COLUMN sender_comp_id char varying default '';
alter table appmaster.client_history ADD COLUMN primary_st char varying default '';
alter table appmaster.client_history ADD COLUMN secondary_st char varying default '';
