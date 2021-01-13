-- Add column in user_product_settings & user_product_settings_history --
-- other_margins  : This decides whether following other margins to applied on mcx or not --
-- initial_margin --
-- tender_margin --
-- additional_margin --
-- special_margin --
-- delivery_margin --

ALTER TABLE ${appmaster}.user_product_settings
  ADD COLUMN other_margins boolean DEFAULT false, 
  ADD COLUMN initial_margin boolean DEFAULT false,
  ADD COLUMN tender_margin boolean DEFAULT false, 
  ADD COLUMN additional_margin boolean DEFAULT false, 
  ADD COLUMN special_margin boolean DEFAULT false, 
  ADD COLUMN delivery_margin boolean DEFAULT false;

ALTER TABLE ${appmaster}.user_product_settings_history 
  ADD COLUMN other_margins boolean DEFAULT false, 
  ADD COLUMN initial_margin boolean DEFAULT false,
  ADD COLUMN tender_margin boolean DEFAULT false, 
  ADD COLUMN additional_margin boolean DEFAULT false, 
  ADD COLUMN special_margin boolean DEFAULT false, 
  ADD COLUMN delivery_margin boolean DEFAULT false;
