update ${appmaster}.user_limits SET max_outstanding_open_value=100 WHERE template_name='Default_CGT1';
update ${appmaster}.user_limits SET max_outstanding_open_value=100 WHERE template_name='Default_DGT1';
update ${appmaster}.user_limits SET max_outstanding_open_value=100 WHERE template_name='Default_BGT1';
update ${appmaster}.user_limits SET max_outstanding_open_value=9999999999900 WHERE template_name='Default_CGT2';
update ${appmaster}.user_limits SET max_outstanding_open_value=9999999999900 WHERE template_name='Default_DGT2';
update ${appmaster}.user_limits SET max_outstanding_open_value=100 WHERE template_name='Default_BGT2';
