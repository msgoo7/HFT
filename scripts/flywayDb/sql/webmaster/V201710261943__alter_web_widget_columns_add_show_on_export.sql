ALTER TABLE ${webmaster}.client_webwidget_columns ADD COLUMN "show_on_export" INTEGER DEFAULT 1;

UPDATE ${webmaster}.client_webwidget_columns SET show_on_export = 0  where widget_number = 2 and widget_category = 1 and display_name not in ('Exchange Order ID','Order Status','Market','Symbol','Buy Sell','Qty','Order Type','Price','Stop Price','Pending Qty','Filled Qty','Time','Messages')
