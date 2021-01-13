-- ==========================================
-- NSE Mandatory Changes : PAN inclusion
-- Remove Reject Reason 
-- Add PAN,Reject Reason
-- ==========================================

ALTER TABLE appmaster.clientcodedetail ADD COLUMN PAN text DEFAULT ''::text;
