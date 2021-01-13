INSERT INTO ${appmaster}.unique_template_id SELECT 'PRO',template_type,user_type,template_description,updated_by,now() FROM ${appmaster}.unique_template_id WHERE template_name='Default_CGT1';

INSERT INTO ${appmaster}.unique_template_id SELECT 'ROOTBRANCH',template_type,user_type,template_description,updated_by,now() FROM ${appmaster}.unique_template_id WHERE template_name='Default_BGT1';

INSERT INTO ${appmaster}.client_template_setting SELECT 'PRO',square_off_status,order_mode_allowed, max_out_buy_value_format, max_out_sell_value_format, max_total_buy_value_format, max_total_sell_value_format, net_value_format, gross_value_format, single_order_value_format, mtm_loss_value_format, turnover_format, updated_by ,now() FROM ${appmaster}.client_template_setting WHERE template_name='Default_CGT1';

INSERT INTO ${appmaster}.client_template_setting SELECT 'ROOTBRANCH',square_off_status,order_mode_allowed, max_out_buy_value_format, max_out_sell_value_format, max_total_buy_value_format, max_total_sell_value_format, net_value_format, gross_value_format, single_order_value_format, mtm_loss_value_format, turnover_format, updated_by ,now() FROM ${appmaster}.client_template_setting WHERE template_name='Default_BGT1';

INSERT INTO ${appmaster}.user_limits SELECT 'PRO', max_outstanding_buy_qty , max_outstanding_buy_value, max_outstanding_sell_qty, max_outstanding_sell_value, max_total_buy_qty , max_total_buy_value, max_total_sell_qty , max_total_sell_value, max_net_qty , max_net_value, min_net_qty , min_net_value, max_turnover_limit, max_mtm_value, discard_profit_for_mtm, max_margin_usage, max_single_order_qty , max_single_order_value, gross_qty , gross_value, updated_by,now() FROM ${appmaster}.user_limits WHERE template_name='Default_CGT1';

INSERT INTO ${appmaster}.user_limits SELECT 'ROOTBRANCH', max_outstanding_buy_qty , max_outstanding_buy_value, max_outstanding_sell_qty, max_outstanding_sell_value, max_total_buy_qty , max_total_buy_value, max_total_sell_qty , max_total_sell_value, max_net_qty , max_net_value, min_net_qty , min_net_value, max_turnover_limit, max_mtm_value, discard_profit_for_mtm, max_margin_usage, max_single_order_qty , max_single_order_value, gross_qty , gross_value, updated_by,now() FROM ${appmaster}.user_limits WHERE template_name='Default_BGT1';

