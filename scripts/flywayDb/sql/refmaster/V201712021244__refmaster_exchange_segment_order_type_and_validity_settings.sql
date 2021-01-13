--
-- Name: exchange_segment_order_type_and_validity_settings; Type: TABLE; Schema: refmaster; 
--

CREATE TABLE ${refmaster}.exchange_segment_order_type_and_validity_settings
(
  broker char varying,
  exchange char varying, 
  instrument char varying,
  order_type char varying,
  order_validity char varying,
  updated_by char varying,
  CONSTRAINT exchange_segment_order_type_and_validity_settings_pkey PRIMARY KEY (broker, exchange, instrument, order_type, order_validity)
);
