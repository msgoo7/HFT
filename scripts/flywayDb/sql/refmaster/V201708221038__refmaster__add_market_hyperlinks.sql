CREATE TABLE ${refmaster}.market_hyperlinks (
    ordernum integer NOT NULL,
    link character varying(70) NOT NULL,
    name character varying(25) NOT NULL,
    is_relative boolean DEFAULT false,
    open_tab boolean,
    show_web boolean,
    show_mobile boolean,
    show_desktop boolean
);


INSERT INTO ${refmaster}.market_hyperlinks (ordernum, link, name, is_relative, open_tab, show_web, show_mobile, show_desktop) VALUES (1, 'http://www.nseindia.com/', 'NSE', false, true, true, true, NULL);
INSERT INTO ${refmaster}.market_hyperlinks (ordernum, link, name, is_relative, open_tab, show_web, show_mobile, show_desktop) VALUES (2, 'http://www.sebi.gov.in/', 'SEBI', false, true, true, true, NULL);
INSERT INTO ${refmaster}.market_hyperlinks (ordernum, link, name, is_relative, open_tab, show_web, show_mobile, show_desktop) VALUES (3, '/static/utrade/WEB.chm', 'User Manual', true, true, true, true, NULL);
INSERT INTO ${refmaster}.market_hyperlinks (ordernum, link, name, is_relative, open_tab, show_web, show_mobile, show_desktop) VALUES (4, '/terms_conditions', 'Terms and Conditions', true, true, true, true, NULL);
INSERT INTO ${refmaster}.market_hyperlinks (ordernum, link, name, is_relative, open_tab, show_web, show_mobile, show_desktop) VALUES (5, '/disclaimer', 'Disclaimer', true, true, true, true, NULL);
INSERT INTO ${refmaster}.market_hyperlinks (ordernum, link, name, is_relative, open_tab, show_web, show_mobile, show_desktop) VALUES (6, '/static/utrade/Mobile_Manual_V_1.26.2.pdf', 'Mobile Help', true, true, true, true, NULL);
