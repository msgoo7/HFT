ALTER TABLE ${appmaster}.client ALTER COLUMN date_of_birth SET DEFAULT '1970-01-01';
UPDATE ${appmaster}.client set date_of_birth='1970-01-01' where date_of_birth is NULL;

ALTER TABLE ${appmaster}.dealer ALTER COLUMN date_of_birth SET DEFAULT '1970-01-01';
update ${appmaster}.dealer set date_of_birth='1970-01-01' where date_of_birth is NULL;
