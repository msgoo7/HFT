ALTER TABLE ${appmaster}.uhedge_strategy_portfolios RENAME COLUMN positive_delta TO max_delta;
ALTER TABLE ${appmaster}.uhedge_strategy_portfolios RENAME COLUMN negative_delta TO min_delta;
