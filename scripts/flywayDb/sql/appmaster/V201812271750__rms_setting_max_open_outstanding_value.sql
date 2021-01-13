ALTER TABLE ${appmaster}.global_rms_settings ADD COLUMN max_outstanding_open_value boolean  DEFAULT true;
ALTER TABLE ${appmaster}.global_rms_settings_history ADD COLUMN max_outstanding_open_value boolean  DEFAULT true;
ALTER TABLE ${appmaster}.user_limits ADD COLUMN max_outstanding_open_value data_type_value DEFAULT 0;
ALTER TABLE ${appmaster}.user_limits_history ADD COLUMN max_outstanding_open_value data_type_value DEFAULT 0;
ALTER TABLE ${appmaster}.user_security_wise_limits ADD COLUMN max_outstanding_open_value data_type_value DEFAULT 0;
ALTER TABLE ${appmaster}.user_security_wise_limits_history ADD COLUMN max_outstanding_open_value data_type_value DEFAULT 0;
ALTER TABLE ${appmaster}.client_template_setting ADD COLUMN max_out_open_value_format boolean  DEFAULT false;
ALTER TABLE ${appmaster}.client_template_setting_history ADD COLUMN max_out_open_value_format boolean  DEFAULT false;
ALTER TABLE ${appmaster}.client_symbol_template_setting ADD COLUMN max_out_open_value_format boolean  DEFAULT false; 
ALTER TABLE ${appmaster}.client_symbol_template_setting_history ADD COLUMN max_out_open_value_format boolean  DEFAULT false;
ALTER TABLE ${appmaster}.security_wise_limits ADD COLUMN max_outstanding_open_value data_type_value DEFAULT 0;         
ALTER TABLE ${appmaster}.security_wise_limits_history ADD COLUMN max_outstanding_open_value data_type_value DEFAULT 0;
