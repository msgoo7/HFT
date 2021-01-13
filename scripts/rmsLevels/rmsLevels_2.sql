--  VALI  : VALID
--  INVAL : INVALID

\set CLIENT 0
\set CLIENT_S 1
\set CLIENT_U 2
\set CLIENT_P 3
\set CLIENT_P_S 4
\set CLIENT_P_SP 5
\set CLIENT_SP 6
\set DEALER 7
\set DEALER_S 8
\set DEALER_U 9
\set GROUP 10
\set GROUP_S 11
\set GROUP_U 12
\set BRANCH 13
\set BRANCH_S 14
\set PRODUCT 15
\set PRODUCT_S 16
\set PRODUCT_SP 17
\set SCRIP_PACK 18
\set SYMBOL 19
\set UNDERLYING 20
\set INFRA 21
\set CLIENT_SG 22
\set DEALER_SG 23
\set TRUE true
\set FALS false

DELETE from global_rms_settings;

INSERT INTO global_rms_settings (combination_type,  updated_by, effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:CLIENT,            'NAME',    current_timestamp,:TRUE,            :TRUE,             :FALS,                  :TRUE,:FALS,                  :FALS,:FALS,            :TRUE,:FALS,            :TRUE,            :TRUE,              :FALS,  :FALS,  :FALS,              :FALS ,:TRUE, :FALS),
--                              (:CLIENT,            'NAME',    current_timestamp,    VALID,                      VALID,            VALID,                  VALID,              INVAL,                  INVAL,          VALID,            VALID,                  VALID,        VALID,              VALID,              INVAL,  INVAL,  INVAL,              INVAL , VALID, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:CLIENT_S,          'NAME',    current_timestamp,            :TRUE,            :TRUE,             :FALS,                  :FALS,            :TRUE,                  :FALS,    :FALS,            :TRUE,          :FALS,            :TRUE,            :TRUE,    :FALS,    :FALS,    :FALS,    :FALS,    :FALS,    :FALS),
--                              (:CLIENT_S,          'NAME',    current_timestamp,    VALID,                      VALID,            VALID,                  VALID,              VALID,                  VALID,          VALID,            VALID,                  VALID,        VALID,              VALID,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:CLIENT_U,          'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,        :FALS,              :FALS,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:CLIENT_U,          'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  VALID,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:CLIENT_P,          'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,            :TRUE,            :TRUE,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:CLIENT_P,          'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  INVAL,        VALID,              VALID,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:CLIENT_P_S,        'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,            :TRUE,            :TRUE,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:CLIENT_P_S,        'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  INVAL,        VALID,              VALID,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:CLIENT_P_SP,       'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,            :TRUE,            :TRUE,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:CLIENT_P_SP,       'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  INVAL,        VALID,              VALID,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:CLIENT_SP,         'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,            :TRUE,            :TRUE,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:CLIENT_SP,         'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  INVAL,        VALID,              VALID,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:DEALER,            'NAME',    current_timestamp,            :TRUE,            :TRUE,             :FALS,                  :TRUE,    :FALS,                  :FALS,    :FALS,            :TRUE,:FALS,    :FALS,    :FALS,    :FALS,    :FALS,    :FALS,    :FALS,    :FALS,    :FALS),
--                              (:DEALER,            'NAME',    current_timestamp,    VALID,                      VALID,            VALID,                  VALID,              INVAL,                  INVAL,          INVAL,            VALID,                  VALID,        INVAL,              INVAL,              INVAL,  INVAL,  VALID,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:DEALER_S,          'NAME',    current_timestamp,            :TRUE,            :TRUE,             :FALS,                  :FALS,    :FALS,                  :FALS,    :FALS,            :TRUE,                   :FALS,    :FALS,    :FALS,    :FALS,    :FALS,    :FALS,    :FALS,    :FALS, :FALS),
--                              (:DEALER_S,          'NAME',    current_timestamp,    VALID,                      VALID,            VALID,                  INVAL,              INVAL,                  INVAL,          INVAL,            VALID,                  VALID,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:DEALER_U,          'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,        :FALS,              :FALS,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:DEALER_U,          'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  VALID,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:GROUP,             'NAME',    current_timestamp,            :TRUE,            :TRUE,             :FALS,                  :TRUE,          :FALS,                  :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS),
--                              (:GROUP,             'NAME',    current_timestamp,    VALID,                      VALID,            VALID,                  VALID,              INVAL,                  INVAL,          INVAL,            INVAL,                  VALID,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:GROUP_S,           'NAME',    current_timestamp,            :TRUE,            :TRUE,             :FALS,                  :FALS,          :FALS,                  :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS),
--                              (:GROUP_S,           'NAME',    current_timestamp,    VALID,                      VALID,            VALID,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  VALID,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:GROUP_U,           'NAME',    current_timestamp,          :FALS,          :FALS,             :FALS,                  :FALS,          :FALS,                  :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS),
--                              (:GROUP_U,           'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  VALID,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:BRANCH,            'NAME',    current_timestamp,          :FALS,          :FALS,             :FALS,                  :TRUE,          :FALS,                  :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS),
--                              (:BRANCH,            'NAME',    current_timestamp,    INVAL,                      INVAL,            VALID,                  VALID,              INVAL,                  INVAL,          INVAL,            INVAL,                  INVAL,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:BRANCH_S,          'NAME',    current_timestamp,          :FALS,          :FALS,             :FALS,                  :FALS,          :FALS,                  :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS,          :FALS),
--                              (:BRANCH_S,         'NAME',     current_timestamp,    INVAL,                      INVAL,            VALID,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  INVAL,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:PRODUCT,           'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,            :TRUE,            :TRUE,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:PRODUCT,           'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  INVAL,        VALID,              VALID,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:PRODUCT_S,         'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,            :TRUE,            :TRUE,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:PRODUCT_S,         'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  INVAL,        VALID,              VALID,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:PRODUCT_SP,        'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,            :TRUE,            :TRUE,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:PRODUCT_SP,        'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  INVAL,        VALID,              VALID,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:SCRIP_PACK,        'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,            :TRUE,            :TRUE,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:SCRIP_PACK,        'NAME',    current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  INVAL,        VALID,              VALID,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:SYMBOL,            'NAME',    current_timestamp,            :TRUE,            :TRUE,             :FALS,                  :TRUE,            :TRUE,                  :FALS,          :FALS,            :FALS,:FALS,            :TRUE,            :TRUE,            :TRUE,            :TRUE,  :FALS,              :FALS , :FALS , :FALS),
--                              (:SYMBOL,            'NAME',    current_timestamp,    VALID,                      VALID,            VALID,                  VALID,              VALID,                  VALID,          INVAL,            INVAL,                  VALID,        VALID,              VALID,              VALID,  VALID,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:UNDERLYING,        'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,:FALS,        :FALS,              :FALS,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:UNDERLYING,        'NAME',     current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,                  VALID,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              INVAL , INVAL, INVAL)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection,  max_margin_usage,max_single_order_qty_value,gross_quantity_value,  square_off_status,  order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:INFRA,             'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,        :FALS,              :FALS,              :FALS,  :FALS,  :FALS,            :TRUE, :FALS ,            :TRUE),
--                              (:INFRA,             'NAME',     current_timestamp,    INVAL,                      INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,          INVAL,            INVAL,          INVAL,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              VALID , INVAL, VALID)

--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection, max_margin_usage,  max_single_order_qty_value,gross_quantity_value,  square_off_status, order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:CLIENT_SG,          'NAME',    current_timestamp,    :FALS,                      :FALS,             :FALS,                  :FALS,                  :FALS,                  :FALS,          :FALS,            :FALS,                   :FALS,        :FALS,              :FALS,              :FALS,  :FALS,  :FALS,              :FALS , :FALS , :FALS),
--                              (:CLIENT_SG,          'NAME',    current_timestamp,    INVAL,         INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,               INVAL,            INVAL,          INVAL,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              VALID , INVAL, INVAL)
                              
--  INSERT INTO global_rms_settings(combination_type,updated_by,effective_time_stamp,max_buy_sell_open_outstanding_check,max_buy_sell_total_net,  max_turnover_limit, max_mtm_value,limit_close_price_protection, bad_price_protection, max_margin_usage,  max_single_order_qty_value,gross_quantity_value,  square_off_status, order_mode_allowed, ter,    dpr,    orders_per_second,  mapping_checks,client_category_ban, iv_check) VALUES
                                (:DEALER_SG,          'NAME',    current_timestamp,    :FALS,    :FALS,             :FALS,                  :FALS,              :FALS,                  :FALS,          :FALS,            :FALS,             :FALS,        :FALS,              :FALS,              :FALS,  :FALS,  :FALS,         :FALS , :FALS , :FALS);
--                              (:DEALER_SG,          'NAME',    current_timestamp,      INVAL,               INVAL,            INVAL,                  INVAL,              INVAL,                  INVAL,               INVAL,            INVAL,          INVAL,        INVAL,              INVAL,              INVAL,  INVAL,  INVAL,              VALID , INVAL, INVAL)
