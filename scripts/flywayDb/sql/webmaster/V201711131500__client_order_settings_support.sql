CREATE TABLE ${webmaster}.client_order_settings
(
    id             character varying PRIMARY KEY,
    own_price      integer,
    price_join     integer,
    side           integer,
    tif            character varying,
    order_type     character varying,
    prod_type      character varying,
    oneclick       integer,
    volume         integer,
    o_tif          character varying,
    o_prod_type    character varying,
    o_price_join   integer,
    fflimit        integer,
    default_client character varying
);
