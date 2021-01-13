--
-- Name: day_counter; Type: TABLE; Schema: appmaster; Owner: utrade; Tablespace:
--

CREATE TABLE day_counter (
  date integer NOT NULL,
  counter integer
);

--
-- Name: day_counter_pk; Type: CONSTRAINT; Schema: appmaster; Owner: utrade; Tablespace:
--

ALTER TABLE ONLY day_counter
    ADD CONSTRAINT day_counter_pk PRIMARY KEY (date);


