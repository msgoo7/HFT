--  include_bpl will tell whether to use booked profit loss while applying mtm check
--  i.e. mtm check will change to mtm + bpl check, using default true so that old limits will include bpl as it's the default behavior

ALTER TABLE ${appmaster}.user_limits ADD COLUMN include_bpl BOOLEAN DEFAULT true;
ALTER TABLE ${appmaster}.user_limits_history ADD COLUMN include_bpl BOOLEAN DEFAULT true;

ALTER TABLE ${appmaster}.security_wise_limits ADD COLUMN include_bpl BOOLEAN DEFAULT true;
ALTER TABLE ${appmaster}.security_wise_limits_history ADD COLUMN include_bpl BOOLEAN DEFAULT true;
