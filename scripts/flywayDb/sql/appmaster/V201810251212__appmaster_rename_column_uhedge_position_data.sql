ALTER TABLE ${appmaster}.uhedge_position_data RENAME COLUMN average_buy_traded_price TO buy_traded_amount;
ALTER TABLE ${appmaster}.uhedge_position_data RENAME COLUMN average_sell_traded_price TO sell_traded_amount;
