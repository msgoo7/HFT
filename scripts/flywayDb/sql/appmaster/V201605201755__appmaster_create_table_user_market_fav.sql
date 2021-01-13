
--
-- Name: user_market_fav; Type: TABLE; Schema: appmaster; Owner: mutrade; Tablespace:
--

CREATE TABLE user_market_fav (
  user_id character varying(20) NOT NULL,
  market_label_name character varying(20) NOT NULL,
  exchange_code character varying(10) NOT NULL,
  symbol character varying(50) NOT NULL,
  security_id integer,
  block_position integer,
  grid_position integer,
  market_watch_name character varying(50) DEFAULT 'Default Market Watch'::character varying NOT NULL,
  expiration_timestamp timestamp without time zone,
  market_label_id character varying(100)
);


ALTER TABLE appmaster.user_market_fav OWNER TO mutrade;

--
-- Name: user_market_fav_sarv; Type: TABLE; Schema: appmaster; Owner: mutrade; Tablespace:
--

