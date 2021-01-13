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

--------------------------------------------
--Function To Be Called From Trigger.
--------------------------------------------
CREATE OR REPLACE FUNCTION Delete_From_Broker_Details ()
RETURNS trigger 
AS $Delete_From_Broker$
BEGIN
  DELETE from broker_details
  where market_id   = OLD.market_id
  AND   security_id = OLD.security_id;
  RETURN OLD;
END;
$Delete_From_Broker$
LANGUAGE plpgsql;

--------------------------------------------------
--Introduce Trigger for deletion.
--------------------------------------------------
CREATE TRIGGER Delete_From_Broker BEFORE DELETE ON scrip_master
FOR EACH ROW EXECUTE PROCEDURE Delete_From_Broker_Details();

