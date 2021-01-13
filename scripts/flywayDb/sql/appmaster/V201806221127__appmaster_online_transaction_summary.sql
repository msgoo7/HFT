CREATE TABLE appmaster.online_transaction_summary (
    id character varying NOT NULL,
    transaction_id character varying NOT NULL,
    mihpayid character varying NOT NULL,
    bank_code character varying NOT NULL,
    amount bigint NOT NULL,
    mode character varying NOT NULL,
    pg_type character varying NOT NULL,
    status character varying NOT NULL,
    error_text character varying NOT NULL,
    transaction_timestamp timestamp without time zone NOT NULL,
    deposit_type integer NOT NULL,
    updated_by character varying NOT NULL,
    remark character varying,
    effective_timestamp timestamp without time zone NOT NULL,
    bank_transaction_id character varying,
    product_enum integer
);
