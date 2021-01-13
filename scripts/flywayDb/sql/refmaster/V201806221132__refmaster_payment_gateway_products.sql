-- Merchant Products Table --
CREATE TABLE refmaster.payment_gateway_products (
    product_id character varying NOT NULL PRIMARY KEY,
    product_display character varying NOT NULL,
    product_enum integer NOT NULL
);
