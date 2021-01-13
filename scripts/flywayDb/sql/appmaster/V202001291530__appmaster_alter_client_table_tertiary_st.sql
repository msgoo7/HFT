ALTER TABLE ${appmaster}.client DROP COLUMN sender_comp_id;
ALTER TABLE ${appmaster}.client_history DROP COLUMN sender_comp_id;

ALTER TABLE ${appmaster}.client ADD COLUMN tertiary_st char varying default '';
ALTER TABLE ${appmaster}.client_history ADD COLUMN tertiary_st char varying default '';
