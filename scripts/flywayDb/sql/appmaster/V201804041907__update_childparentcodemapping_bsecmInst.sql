-- ==========================================
-- -- Function to create language
-- -- Description:
-- -- ==========================================

CREATE OR REPLACE FUNCTION make_plpgsql()
RETURNS VOID
LANGUAGE SQL
AS $$
CREATE LANGUAGE plpgsql;
$$;

-- ==========================================
-- -- Query checks the existence of language
-- -- Description:
-- -- ==========================================


SELECT
CASE
WHEN EXISTS(
    SELECT 1
      FROM pg_catalog.pg_language
        WHERE lanname='plpgsql'
      )
      THEN NULL
    ELSE make_plpgsql()
END;

--Getting exchangeclientcode from appmaster.clientcodedetail where exchange = bsecm and acc type =Inst
--Then setting parttype=Inst in appmaster.childparentcodemapping of immediate child and exchange=BSECM

CREATE OR REPLACE FUNCTION update_exchangeclientcode()
RETURNS void AS $$
DECLARE
cursor_exchangeclientcode CURSOR FOR SELECT exchangeclientcode from appmaster.clientcodedetail where exchangeid=1 and accounttype=3 ;--bsecm and inst
rec   RECORD;
BEGIN
  OPEN cursor_exchangeclientcode;
  LOOP
    FETCH cursor_exchangeclientcode into rec;
    EXIT WHEN NOT FOUND;
    UPDATE appmaster.childparentcodemapping SET parttype=2 where primaryclientcode=rec.exchangeclientcode and exchangeid=1;--parttype=INST
  END LOOP;
  CLOSE cursor_exchangeclientcode;
  END;$$

LANGUAGE plpgsql;

SELECT update_exchangeclientcode(); 


