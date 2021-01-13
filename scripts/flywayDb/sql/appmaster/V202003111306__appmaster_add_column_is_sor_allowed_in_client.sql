ALTER TABLE ${appmaster}.client ADD COLUMN is_sor_allowed boolean DEFAULT false;
ALTER TABLE ${appmaster}.client_history  ADD COLUMN is_sor_allowed boolean DEFAULT false;
