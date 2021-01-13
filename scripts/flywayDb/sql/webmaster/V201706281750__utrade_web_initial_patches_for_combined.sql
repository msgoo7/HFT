CREATE SCHEMA ${webmaster};

CREATE TABLE ${webmaster}.client_web_indices
(
    id character varying,
    security_id integer,
    market_id character varying,
    instrument_type character varying NOT NULL,
    CONSTRAINT client_web_indices_pkey PRIMARY KEY (id, security_id, market_id)
);

CREATE TABLE ${webmaster}.client_web_page
(
    id character varying NOT NULL,
    wcat integer NOT NULL,
    wnum integer NOT NULL,
    maxworw integer NOT NULL,
    pageno integer NOT NULL,
    sortby character varying,
    sortdir integer DEFAULT 0,
    no_of_rows integer,
    CONSTRAINT client_web_page_pkey PRIMARY KEY (id, wcat, wnum, maxworw, pageno)
);


CREATE TABLE ${webmaster}.client_web_state
(
    id character varying NOT NULL,
    marketfav character varying,
    lastclickedquote character varying,
    blockorgrid integer,
    transview integer,
    webview integer,
    positionview integer,
    indices_view integer,
    order_depth integer DEFAULT 5,
    mw_css character varying,
    show_notification integer,
    od_position character varying,
    order_cnf integer,
    warning_notification integer DEFAULT 1,
    broadcast_notification integer DEFAULT 1,
    CONSTRAINT client_web_state_pkey PRIMARY KEY (id)
);

CREATE TABLE ${webmaster}.client_web_table_column
(
    id character varying NOT NULL,
    wcat integer NOT NULL,
    wnum integer NOT NULL,
    theader character varying,
    CONSTRAINT client_web_table_column_pkey PRIMARY KEY (id, wcat, wnum)
);

CREATE TABLE ${webmaster}.client_web_table_column_position
(
    id character varying NOT NULL,
    maxworw integer NOT NULL,
    wcat integer NOT NULL,
    wnum integer NOT NULL,
    theader character varying,
    CONSTRAINT client_web_table_column_position_pkey PRIMARY KEY (id, maxworw, wcat, wnum)
);

CREATE TABLE ${webmaster}.client_web_theme
(
    id character varying NOT NULL,
    theme character varying,
    CONSTRAINT client_web_theme_pkey PRIMARY KEY (id)
);

CREATE TABLE ${webmaster}.client_web_zoom
(
    id character varying NOT NULL,
    zoomlevel character varying,
    CONSTRAINT client_web_zoom_pkey PRIMARY KEY (id)
);

CREATE TABLE ${webmaster}.client_widgetstate
(
    id character varying NOT NULL,
    leftw character varying,
    middlew character varying,
    rightw character varying,
    CONSTRAINT client_widget_pkey PRIMARY KEY (id)
);

CREATE TABLE ${webmaster}.client_web_locale
(
    pid SERIAL PRIMARY KEY,
    id character varying NOT NULL,
    locale character varying,
    expiration_timestamp timestamp with time zone
);

CREATE SEQUENCE ${webmaster}.client_webwidget_columns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
    
CREATE TABLE ${webmaster}.client_webwidget_columns
(
    id integer NOT NULL DEFAULT nextval('webmaster.client_webwidget_columns_id_seq'::regclass),
    widget_category integer NOT NULL,
    widget_number integer NOT NULL,
    display_name character varying NOT NULL,
    column_name character varying,
    data_type integer NOT NULL,
    default_order integer NOT NULL,
    user_order integer NOT NULL,
    acronym_number integer NOT NULL,
    from_database integer NOT NULL,
    filtersignal integer NOT NULL,
    showmanage integer,
    actual_order integer NOT NULL,
    CONSTRAINT webwidget_columns_pkey PRIMARY KEY (widget_category, widget_number, display_name)
);

CREATE TABLE ${webmaster}.web_widget_list (
    wname character varying,
    category integer,
    wnumber integer,
    show_widget integer,
    widget_id integer NOT NULL,
    CONSTRAINT pk_widget_id PRIMARY KEY (widget_id)
);

CREATE TABLE ${webmaster}.client_table_filter (
    id character varying NOT NULL,
    wcat integer NOT NULL,
    wnum integer NOT NULL,
    criteria character varying,
    CONSTRAINT client_table_filter_pkey PRIMARY KEY (id, wcat, wnum)
);

CREATE TABLE ${webmaster}.client_depth_scalper (
    id character varying,
    depth_scapler_name character varying,
    tbody character varying,
    market_id character varying,
    security_id character varying,
    CONSTRAINT client_depth_scalper_pkey PRIMARY KEY (id, depth_scapler_name)
);

CREATE TABLE ${webmaster}.client_multi_depth (
    id character varying NOT NULL,
    multi_depth_name character varying,
    multi_depth_id character varying,
    md_tabs character varying,
    top_left character varying,
    oneclick integer,
    active character varying,
    level integer,
    CONSTRAINT client_multi_depth_pkey PRIMARY KEY (id, multi_depth_name, multi_depth_id)
);


