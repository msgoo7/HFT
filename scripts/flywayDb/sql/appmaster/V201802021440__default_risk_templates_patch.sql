insert into ${appmaster}.unique_template_id(template_name, template_type, user_type, template_description,updated_by, effective_time_stamp) VALUES('Default_DGT1',0,2,'Default Dealer general template with Min Values','SUPERADMIN',now());

insert into ${appmaster}.unique_template_id(template_name, template_type, user_type, template_description,updated_by, effective_time_stamp) VALUES('Default_CGT1',0,0,'Default Client general template with Min Values','SUPERADMIN',now());

insert into ${appmaster}.unique_template_id(template_name, template_type, user_type, template_description,updated_by, effective_time_stamp) VALUES('Default_BGT1',0,3,'Default Branch general template with Min Values','SUPERADMIN',now());

insert into ${appmaster}.unique_template_id(template_name, template_type, user_type, template_description,updated_by, effective_time_stamp) VALUES('Default_DGT2',0,2,'Default Dealer general template with Max Values','SUPERADMIN',now());

insert into ${appmaster}.unique_template_id(template_name, template_type, user_type, template_description,updated_by, effective_time_stamp) VALUES('Default_CGT2',0,0,'Default Client general template with Max Values','SUPERADMIN',now());

insert into ${appmaster}.unique_template_id(template_name, template_type, user_type, template_description,updated_by, effective_time_stamp) VALUES('Default_BGT2',0,3,'Default Branch general template with Max Values','SUPERADMIN',now());

insert into ${appmaster}.unique_template_id(template_name, template_type, user_type, template_description,updated_by, effective_time_stamp) VALUES('Default_PT',1,0,'Default Product Template','SUPERADMIN',now());


insert into ${appmaster}.client_template_setting(template_name, square_off_status, order_mode_allowed, max_out_buy_value_format, max_out_sell_value_format, max_total_buy_value_format, max_total_sell_value_format, net_value_format, gross_value_format, single_order_value_format, mtm_loss_value_format, turnover_format, updated_by, effective_time_stamp) VALUES ('Default_CGT1',2,3,'f','f','f','f','f','f','f','f','f','SUPERADMIN',now());


insert into ${appmaster}.client_template_setting(template_name, square_off_status, order_mode_allowed, max_out_buy_value_format, max_out_sell_value_format, max_total_buy_value_format, max_total_sell_value_format, net_value_format, gross_value_format, single_order_value_format, mtm_loss_value_format, turnover_format, updated_by, effective_time_stamp) VALUES ('Default_CGT2',2,3,'f','f','f','f','f','f','f','f','f','SUPERADMIN',now());


insert into ${appmaster}.client_template_setting(template_name, square_off_status, order_mode_allowed, max_out_buy_value_format, max_out_sell_value_format, max_total_buy_value_format, max_total_sell_value_format, net_value_format, gross_value_format, single_order_value_format, mtm_loss_value_format, turnover_format, updated_by, effective_time_stamp) VALUES ('Default_DGT1',2,3,'f','f','f','f','f','f','f','f','f','SUPERADMIN',now());


insert into ${appmaster}.client_template_setting(template_name, square_off_status, order_mode_allowed, max_out_buy_value_format, max_out_sell_value_format, max_total_buy_value_format, max_total_sell_value_format, net_value_format, gross_value_format, single_order_value_format, mtm_loss_value_format, turnover_format, updated_by, effective_time_stamp) VALUES ('Default_DGT2',2,3,'f','f','f','f','f','f','f','f','f','SUPERADMIN',now());


insert into ${appmaster}.client_template_setting(template_name, square_off_status, order_mode_allowed, max_out_buy_value_format, max_out_sell_value_format, max_total_buy_value_format, max_total_sell_value_format, net_value_format, gross_value_format, single_order_value_format, mtm_loss_value_format, turnover_format, updated_by, effective_time_stamp) VALUES ('Default_BGT1',2,3,'f','f','f','f','f','f','f','f','f','SUPERADMIN',now());


insert into ${appmaster}.client_template_setting(template_name, square_off_status, order_mode_allowed, max_out_buy_value_format, max_out_sell_value_format, max_total_buy_value_format, max_total_sell_value_format, net_value_format, gross_value_format, single_order_value_format, mtm_loss_value_format, turnover_format, updated_by, effective_time_stamp) VALUES ('Default_BGT2',2,3,'f','f','f','f','f','f','f','f','f','SUPERADMIN',now());


insert into ${appmaster}.user_limits(template_name, max_outstanding_buy_qty, max_outstanding_buy_value, max_outstanding_sell_qty, max_outstanding_sell_value, max_total_buy_qty, max_total_buy_value, max_total_sell_qty, max_total_sell_value, max_net_qty, max_net_value, min_net_qty, min_net_value, max_turnover_limit, max_mtm_value,discard_profit_for_mtm, max_margin_usage, max_single_order_qty, max_single_order_value, gross_qty, gross_value, updated_by, effective_time_stamp) VALUES('Default_CGT1',1,100,1,100,1,100,1,100,1,100,1,100,100,100,'f',100,1,100,1,100,'SUPERADMIN', now());

insert into ${appmaster}.user_limits(template_name, max_outstanding_buy_qty, max_outstanding_buy_value, max_outstanding_sell_qty, max_outstanding_sell_value, max_total_buy_qty, max_total_buy_value, max_total_sell_qty, max_total_sell_value, max_net_qty, max_net_value, min_net_qty, min_net_value, max_turnover_limit, max_mtm_value,discard_profit_for_mtm, max_margin_usage, max_single_order_qty, max_single_order_value, gross_qty, gross_value, updated_by, effective_time_stamp) VALUES('Default_DGT1',1,100,1,100,1,100,1,100,1,100,1,100,100,100,'f',100,1,100,1,100,'SUPERADMIN', now());

insert into ${appmaster}.user_limits(template_name, max_outstanding_buy_qty, max_outstanding_buy_value, max_outstanding_sell_qty, max_outstanding_sell_value, max_total_buy_qty, max_total_buy_value, max_total_sell_qty, max_total_sell_value, max_net_qty, max_net_value, min_net_qty, min_net_value, max_turnover_limit, max_mtm_value,discard_profit_for_mtm, max_margin_usage, max_single_order_qty, max_single_order_value, gross_qty, gross_value, updated_by, effective_time_stamp) VALUES('Default_BGT1',1,100,1,100,1,100,1,100,1,100,1,100,100,100,'f',100,1,100,1,100,'SUPERADMIN', now());

insert into ${appmaster}.user_limits(template_name, max_outstanding_buy_qty, max_outstanding_buy_value, max_outstanding_sell_qty, max_outstanding_sell_value, max_total_buy_qty, max_total_buy_value, max_total_sell_qty, max_total_sell_value, max_net_qty, max_net_value, min_net_qty, min_net_value, max_turnover_limit, max_mtm_value,discard_profit_for_mtm, max_margin_usage, max_single_order_qty, max_single_order_value, gross_qty, gross_value, updated_by, effective_time_stamp) VALUES('Default_CGT2',99999999999,9999999999900,99999999999,9999999999900,99999999999,9999999999900,99999999999,9999999999900,99999999999,9999999999900,99999999999,9999999999900,9999999999900,9999999999900,'f',100,99999999999,9999999999900,99999999999,9999999999900,'SUPERADMIN', now());

insert into ${appmaster}.user_limits(template_name, max_outstanding_buy_qty, max_outstanding_buy_value, max_outstanding_sell_qty, max_outstanding_sell_value, max_total_buy_qty, max_total_buy_value, max_total_sell_qty, max_total_sell_value, max_net_qty, max_net_value, min_net_qty, min_net_value, max_turnover_limit, max_mtm_value,discard_profit_for_mtm, max_margin_usage, max_single_order_qty, max_single_order_value, gross_qty, gross_value, updated_by, effective_time_stamp) VALUES('Default_DGT2',99999999999,9999999999900,99999999999,9999999999900,99999999999,9999999999900,99999999999,9999999999900,99999999999,9999999999900,99999999999,9999999900,9999999999900,9999999999900,'f',100,99999999999,9999999999900,99999999999,9999999999900,'SUPERADMIN', now());

insert into ${appmaster}.user_limits(template_name, max_outstanding_buy_qty, max_outstanding_buy_value, max_outstanding_sell_qty, max_outstanding_sell_value, max_total_buy_qty, max_total_buy_value, max_total_sell_qty, max_total_sell_value, max_net_qty, max_net_value, min_net_qty, min_net_value, max_turnover_limit, max_mtm_value,discard_profit_for_mtm, max_margin_usage, max_single_order_qty, max_single_order_value, gross_qty, gross_value, updated_by, effective_time_stamp) VALUES('Default_BGT2',1,100,1,100,1,100,1,100,1,100,1,100,9999999999900,9999999999900,'f',100,1,100,1,100,'SUPERADMIN', now());


insert into ${appmaster}.user_product_settings(template_name, product_id, is_cash, is_adhoc, is_custom_component, is_position_in_equity_used, is_mtm_profit, is_mtm_loss, is_booked_profit, is_booked_loss, is_option_sell_premium, is_cfs, cfs_limit, is_var_applicable, is_elm_applicable, is_highest_margin_applicable, is_span_applicable, is_span_exposure_applicable, is_brokerage_included, is_topup_applicable, topup_margin_limit, is_pm_stock_applicable, pm_percentage_stock, is_pm_future_applicable, pm_percentage_future, is_pm_option_applicable, pm_percentage_option, square_off_status, order_mode_allowed, updated_by, effective_time_stamp) VALUES('Default_PT',0,'t','t','f','f','f','t','t','t','f','f',0,'f','f','f','f','f','f','f',0,'t',10000,'t',10000,'t',10000,2,3,'SUPERADMIN',now());

insert into ${appmaster}.user_product_settings(template_name, product_id, is_cash, is_adhoc, is_custom_component, is_position_in_equity_used, is_mtm_profit, is_mtm_loss, is_booked_profit, is_booked_loss, is_option_sell_premium, is_cfs, cfs_limit, is_var_applicable, is_elm_applicable, is_highest_margin_applicable, is_span_applicable, is_span_exposure_applicable, is_brokerage_included, is_topup_applicable, topup_margin_limit, is_pm_stock_applicable, pm_percentage_stock, is_pm_future_applicable, pm_percentage_future, is_pm_option_applicable, pm_percentage_option, square_off_status, order_mode_allowed, updated_by, effective_time_stamp) VALUES('Default_PT',1,'t','t','f','f','f','t','t','t','f','f',0,'f','f','f','f','f','f','f',0,'t',10000,'t',10000,'t',10000,2,3,'SUPERADMIN',now());
