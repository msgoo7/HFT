-- Assigning default basket to Default Product Template if not already assgined

insert into ${appmaster}.user_product_symbol_basket_settings (template_name, product_id, symbol_basket_id, square_off_status, order_mode_allowed, symbol_basket_margin, updated_by, effective_time_stamp) select 'Default_PT',0,1,2,3,10000,'SUPERADMIN',now() where not exists ( select * from ${appmaster}.user_product_symbol_basket_settings where template_name = 'Default_PT' and product_id = 0 );

insert into ${appmaster}.user_product_symbol_basket_settings (template_name, product_id, symbol_basket_id, square_off_status, order_mode_allowed, symbol_basket_margin, updated_by, effective_time_stamp) select 'Default_PT',1,1,2,3,10000,'SUPERADMIN',now() where not exists ( select * from ${appmaster}.user_product_symbol_basket_settings where template_name = 'Default_PT' and product_id = 1 );
