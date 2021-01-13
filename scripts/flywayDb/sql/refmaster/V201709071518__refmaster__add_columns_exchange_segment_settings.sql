ALTER TABLE ${refmaster}.exchange_segment_settings ADD COLUMN exchange_desc character varying,
                                                   ADD COLUMN parent_exchange character varying, 
                                                   ADD COLUMN broker character varying;

UPDATE ${refmaster}.exchange_segment_settings set exchange_desc = 'NSECM', parent_exchange = 'NSE', broker = 'DEFAULT' where exchange = 'NSECM';
UPDATE ${refmaster}.exchange_segment_settings set exchange_desc = 'NSEFO', parent_exchange = 'NSE', broker = 'DEFAULT' where exchange = 'NSEFO';
UPDATE ${refmaster}.exchange_segment_settings set exchange_desc = 'NSECDS', parent_exchange = 'NSE', broker = 'DEFAULT' where exchange = 'NSECDS';
UPDATE ${refmaster}.exchange_segment_settings set exchange_desc = 'BSECM', parent_exchange = 'BSE', broker = 'DEFAULT' where exchange = 'BSECM';
UPDATE ${refmaster}.exchange_segment_settings set exchange_desc = 'BSEFO', parent_exchange = 'BSE', broker = 'DEFAULT' where exchange = 'BSEFO';
UPDATE ${refmaster}.exchange_segment_settings set exchange_desc = 'BSECDS', parent_exchange = 'BSE', broker = 'DEFAULT' where exchange = 'BSECDS';
UPDATE ${refmaster}.exchange_segment_settings set exchange_desc = 'BSEINX', parent_exchange = 'BSE', broker = 'DEFAULT' where exchange = 'BSEINX';


--
-- Name: language_support; Type: TABLE; Schema: refmaster; 
--

CREATE TABLE ${refmaster}.language_support (
    language_name character varying NOT NULL,
    language_code character varying NOT NULL,
    locale character varying NOT NULL,
    encoding character varying NOT NULL,
    web boolean,
    mobile boolean,
    desktop boolean
);

--
-- Data for Name: language_support; Type: TABLE DATA; Schema: refmaster;
--

INSERT INTO ${refmaster}.language_support (language_name, language_code, locale, encoding, web, mobile, desktop) VALUES ('English', 'en-us', 'en_US', 'UTF-8', true, true, true);
INSERT INTO ${refmaster}.language_support (language_name, language_code, locale, encoding, web, mobile, desktop) VALUES ('Spanish', 'es', 'es_ES', 'UTF-8', false, false, false);
INSERT INTO ${refmaster}.language_support (language_name, language_code, locale, encoding, web, mobile, desktop) VALUES ('Hindi', 'hi', 'hi', 'UTF-8', false, false, false);
INSERT INTO ${refmaster}.language_support (language_name, language_code, locale, encoding, web, mobile, desktop) VALUES ('Punjabi', 'pa', 'pa', 'UTF-8', false, false, false);

