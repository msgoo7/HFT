-- ============================================================================
-- As number of types of client_type for a client has been reduced so ,this 
-- query will change the client_type of already created clients to a default 
-- value (which is decided as 'CLIENT' or 1). 
--
-- This Patch is not of any use for new clients. 
-- ============================================================================

UPDATE client 
SET client_type = 1;

