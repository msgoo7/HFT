create table ${appmaster}.indices (
    source_id char(10),
    market_id char(10),
    security_id int NOT NULL UNIQUE,
    scrip_name varchar(100),
    symbol varchar(50) PRIMARY KEY
);
