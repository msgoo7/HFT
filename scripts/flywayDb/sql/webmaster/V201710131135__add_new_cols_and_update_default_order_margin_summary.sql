
----------------------------- CLEAR TC FROM TABLES TO AVOID ERRORS ----------------------------
DELETE FROM ${webmaster}.client_web_table_column_position WHERE wcat = 1 and wnum = 4;
DELETE FROM ${webmaster}.client_table_filter WHERE wnum = 4;

----------------------------- ADDING NEW COLUMNS --------------------------------
INSERT INTO ${webmaster}.client_webwidget_columns(widget_category, widget_number, display_name, column_name, data_type, default_order, user_order, acronym_number, from_database, filtersignal, showmanage, actual_order) values(1, 4, 'MTM Profit', 'x.mtmProfit', 3, 15, 15, 0, 1, 0, 1, 150);
INSERT INTO ${webmaster}.client_webwidget_columns(widget_category, widget_number, display_name, column_name, data_type, default_order, user_order, acronym_number, from_database, filtersignal, showmanage, actual_order) values(1, 4, 'MTM Loss', 'x.mtmLoss', 3, 16, 16, 0, 1, 0, 1, 160);
INSERT INTO ${webmaster}.client_webwidget_columns(widget_category, widget_number, display_name, column_name, data_type, default_order, user_order, acronym_number, from_database, filtersignal, showmanage, actual_order) values(1, 4, 'Booked Profit', 'x.bookedProfit', 3, 17, 17, 0, 1, 0, 1, 170);
INSERT INTO ${webmaster}.client_webwidget_columns(widget_category, widget_number, display_name, column_name, data_type, default_order, user_order, acronym_number, from_database, filtersignal, showmanage, actual_order) values(1, 4, 'Booked Loss', 'x.bookedLoss', 3, 18, 18, 0, 1, 0, 1, 180);
INSERT INTO ${webmaster}.client_webwidget_columns(widget_category, widget_number, display_name, column_name, data_type, default_order, user_order, acronym_number, from_database, filtersignal, showmanage, actual_order) values(1, 4, 'Option Buy Premium', 'x.optionBuyPremium', 3, 19, 19, 0, 1, 0, 1, 190);
INSERT INTO ${webmaster}.client_webwidget_columns(widget_category, widget_number, display_name, column_name, data_type, default_order, user_order, acronym_number, from_database, filtersignal, showmanage, actual_order) values(1, 4, 'Collateral', 'x.collateral', 3, 20, 20, 0, 1, 0, 1, 200);

----------------------------- UPDATE DEFAULT ORDRE OF COLUMNS ------------------------------
UPDATE ${webmaster}.client_webwidget_columns SET default_order=1,  user_order=1,  actual_order=10  WHERE widget_number=4 and widget_category = 1 and display_name = 'Client ID';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=2,  user_order=2,  actual_order=20  WHERE widget_number=4 and widget_category = 1 and display_name = 'Cash Ledger';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=3,  user_order=3,  actual_order=30  WHERE widget_number=4 and widget_category = 1 and display_name = 'Adhoc Cash';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=4,  user_order=4,  actual_order=40  WHERE widget_number=4 and widget_category = 1 and display_name = 'Cash Available';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=5,  user_order=5,  actual_order=50  WHERE widget_number=4 and widget_category = 1 and display_name = 'Cash Utilised';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=6,  user_order=6,  actual_order=60  WHERE widget_number=4 and widget_category = 1 and display_name = 'Collateral';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=7,  user_order=7,  actual_order=70  WHERE widget_number=4 and widget_category = 1 and display_name = 'Credit For Sale';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=8,  user_order=8,  actual_order=80  WHERE widget_number=4 and widget_category = 1 and display_name = 'M2M Loss/Profit';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=9,  user_order=9,  actual_order=90  WHERE widget_number=4 and widget_category = 1 and display_name = 'Booked Loss/Profit';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=10, user_order=10, actual_order=100 WHERE widget_number=4 and widget_category = 1 and display_name = 'MTM Profit';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=11, user_order=11, actual_order=110 WHERE widget_number=4 and widget_category = 1 and display_name = 'MTM Loss';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=12, user_order=12, actual_order=120 WHERE widget_number=4 and widget_category = 1 and display_name = 'Booked Profit';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=13, user_order=13, actual_order=130 WHERE widget_number=4 and widget_category = 1 and display_name = 'Booked Loss';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=14, user_order=14, actual_order=140 WHERE widget_number=4 and widget_category = 1 and display_name = 'Option Buy Premium';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=15, user_order=15, actual_order=150 WHERE widget_number=4 and widget_category = 1 and display_name = 'Option Sell Premium';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=16, user_order=16, actual_order=160 WHERE widget_number=4 and widget_category = 1 and display_name = 'Cash Payin';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=17, user_order=17, actual_order=170 WHERE widget_number=4 and widget_category = 1 and display_name = 'Cash Payout';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=18, user_order=18, actual_order=180 WHERE widget_number=4 and widget_category = 1 and display_name = 'Equity Margin';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=19, user_order=19, actual_order=190 WHERE widget_number=4 and widget_category = 1 and display_name = 'Derivative Margin';
UPDATE ${webmaster}.client_webwidget_columns SET default_order=20, user_order=20, actual_order=200 WHERE widget_number=4 and widget_category = 1 and display_name = 'Gross Commission';

--------------------------- DELETE COLUMNS FROM MARGIN SUMMARY -----------------------
DELETE FROM ${webmaster}.client_webwidget_columns WHERE display_name in ('Equity Margin', 'Derivative Margin', 'Gross Commission') and widget_number = 4;




