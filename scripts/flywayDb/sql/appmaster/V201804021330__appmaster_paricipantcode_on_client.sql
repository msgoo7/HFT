-- ==========================================
-- A column added to keep seperate participant 
-- code for each client.
-- ==========================================

ALTER TABLE ${appmaster}.childparentcodemapping ADD COLUMN participantcode varchar;

-- ==========================================
-- Function to add participant code entries in 
-- table childparentcodemapping from clientcodedetail
-- ==========================================

CREATE OR REPLACE FUNCTION shift_participantcode()
RETURNS void AS $$
DECLARE 
titles TEXT DEFAULT '';
new_rec   RECORD;
cur_rec CURSOR FOR SELECT * FROM ${appmaster}.clientcodedetail;
BEGIN
  OPEN cur_rec;

  LOOP
    FETCH cur_rec INTO new_rec;
    EXIT WHEN NOT FOUND;

    update ${appmaster}.childparentcodemapping set participantcode = new_rec.participantcode where exchangeid = new_rec.exchangeid and segmenttype = new_rec.segmenttype and exchangeclientcode = new_rec.exchangeclientcode;

  END LOOP;

  CLOSE cur_rec;

END; $$

LANGUAGE plpgsql;

-- ==========================================
-- Executing the above mentioned function
-- ==========================================

SELECT shift_participantcode(); 
