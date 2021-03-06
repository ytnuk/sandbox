--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: blog_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blog_category (
    id integer NOT NULL,
    menu_id integer NOT NULL
);


--
-- Name: blog_category_description; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blog_category_description (
    id integer NOT NULL,
    category_id integer NOT NULL,
    value integer NOT NULL
);


--
-- Name: blog_category_description_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_category_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_category_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_category_description_id_seq OWNED BY blog_category_description.id;


--
-- Name: blog_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_category_id_seq OWNED BY blog_category.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blog_post (
    id integer NOT NULL,
    link_id integer NOT NULL,
    content integer NOT NULL,
    title integer NOT NULL
);


--
-- Name: blog_post_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blog_post_category (
    id integer NOT NULL,
    post_id integer NOT NULL,
    category_id integer NOT NULL,
    "primary" boolean
);


--
-- Name: blog_post_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_post_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_post_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_post_category_id_seq OWNED BY blog_post_category.id;


--
-- Name: blog_post_description; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blog_post_description (
    id integer NOT NULL,
    post_id integer NOT NULL,
    value integer NOT NULL
);


--
-- Name: blog_post_description_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_post_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_post_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_post_description_id_seq OWNED BY blog_post_description.id;


--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_post_id_seq OWNED BY blog_post.id;


--
-- Name: link; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE link (
    id integer NOT NULL,
    module character varying NOT NULL,
    presenter character varying NOT NULL,
    action character varying NOT NULL
);


--
-- Name: link_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE link_id_seq OWNED BY link.id;


--
-- Name: link_parameter; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE link_parameter (
    id integer NOT NULL,
    link_id integer NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);


--
-- Name: link_parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE link_parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: link_parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE link_parameter_id_seq OWNED BY link_parameter.id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE menu (
    id integer NOT NULL,
    link_id integer NOT NULL,
    title integer NOT NULL
);


--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- Name: menu_node; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE menu_node (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    parent_id integer NOT NULL,
    "primary" boolean
);


--
-- Name: menu_node_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE menu_node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: menu_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE menu_node_id_seq OWNED BY menu_node.id;


--
-- Name: page; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE page (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    content integer NOT NULL
);


--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE page_id_seq OWNED BY page.id;


--
-- Name: shop_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shop_category (
    id integer NOT NULL,
    menu_id integer NOT NULL
);


--
-- Name: shop_category_description; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shop_category_description (
    id integer NOT NULL,
    category_id integer NOT NULL,
    value integer NOT NULL
);


--
-- Name: shop_category_description_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shop_category_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_category_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shop_category_description_id_seq OWNED BY shop_category_description.id;


--
-- Name: shop_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shop_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shop_category_id_seq OWNED BY shop_category.id;


--
-- Name: shop_product; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shop_product (
    id integer NOT NULL,
    link_id integer NOT NULL,
    title integer NOT NULL
);


--
-- Name: shop_product_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shop_product_category (
    id integer NOT NULL,
    product_id integer NOT NULL,
    category_id integer NOT NULL,
    "primary" boolean
);


--
-- Name: shop_product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shop_product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shop_product_category_id_seq OWNED BY shop_product_category.id;


--
-- Name: shop_product_content; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shop_product_content (
    id integer NOT NULL,
    product_id integer NOT NULL,
    value integer NOT NULL
);


--
-- Name: shop_product_content_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shop_product_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_product_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shop_product_content_id_seq OWNED BY shop_product_content.id;


--
-- Name: shop_product_description; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shop_product_description (
    id integer NOT NULL,
    product_id integer NOT NULL,
    value integer NOT NULL
);


--
-- Name: shop_product_description_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shop_product_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_product_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shop_product_description_id_seq OWNED BY shop_product_description.id;


--
-- Name: shop_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shop_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shop_product_id_seq OWNED BY shop_product.id;


--
-- Name: translation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE translation (
    id integer NOT NULL
);


--
-- Name: translation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE translation_id_seq OWNED BY translation.id;


--
-- Name: translation_locale; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE translation_locale (
    id character varying NOT NULL,
    name character varying NOT NULL
);


--
-- Name: translation_translate; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE translation_translate (
    id integer NOT NULL,
    translation_id integer NOT NULL,
    locale_id character varying NOT NULL,
    value text NOT NULL
);


--
-- Name: translation_translate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE translation_translate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: translation_translate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE translation_translate_id_seq OWNED BY translation_translate.id;


--
-- Name: web; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE web (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    name integer NOT NULL,
    alias character varying NOT NULL
);


--
-- Name: web_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE web_domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: web_domain; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE web_domain (
    id integer DEFAULT nextval('web_domain_id_seq'::regclass) NOT NULL,
    web_id integer NOT NULL,
    secured boolean DEFAULT true NOT NULL,
    host character varying NOT NULL
);


--
-- Name: web_domain_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE web_domain_locale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: web_domain_locale; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE web_domain_locale (
    id integer DEFAULT nextval('web_domain_locale_id_seq'::regclass) NOT NULL,
    domain_id integer NOT NULL,
    locale_id character varying NOT NULL,
    "primary" boolean
);


--
-- Name: web_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE web_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: web_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE web_id_seq OWNED BY web.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_category ALTER COLUMN id SET DEFAULT nextval('blog_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_category_description ALTER COLUMN id SET DEFAULT nextval('blog_category_description_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_post ALTER COLUMN id SET DEFAULT nextval('blog_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_post_category ALTER COLUMN id SET DEFAULT nextval('blog_post_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_post_description ALTER COLUMN id SET DEFAULT nextval('blog_post_description_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY link ALTER COLUMN id SET DEFAULT nextval('link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY link_parameter ALTER COLUMN id SET DEFAULT nextval('link_parameter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu_node ALTER COLUMN id SET DEFAULT nextval('menu_node_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY page ALTER COLUMN id SET DEFAULT nextval('page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_category ALTER COLUMN id SET DEFAULT nextval('shop_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_category_description ALTER COLUMN id SET DEFAULT nextval('shop_category_description_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product ALTER COLUMN id SET DEFAULT nextval('shop_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product_category ALTER COLUMN id SET DEFAULT nextval('shop_product_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product_content ALTER COLUMN id SET DEFAULT nextval('shop_product_content_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product_description ALTER COLUMN id SET DEFAULT nextval('shop_product_description_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY translation ALTER COLUMN id SET DEFAULT nextval('translation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY translation_translate ALTER COLUMN id SET DEFAULT nextval('translation_translate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY web ALTER COLUMN id SET DEFAULT nextval('web_id_seq'::regclass);


--
-- Name: blog_category_description_category_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_category_description
    ADD CONSTRAINT blog_category_description_category_id UNIQUE (category_id);


--
-- Name: blog_category_description_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_category_description
    ADD CONSTRAINT blog_category_description_id PRIMARY KEY (id);


--
-- Name: blog_category_description_value; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_category_description
    ADD CONSTRAINT blog_category_description_value UNIQUE (value);


--
-- Name: blog_category_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_category
    ADD CONSTRAINT blog_category_id PRIMARY KEY (id);


--
-- Name: blog_category_menu_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_category
    ADD CONSTRAINT blog_category_menu_id UNIQUE (menu_id);


--
-- Name: blog_post_category_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_post_category
    ADD CONSTRAINT blog_post_category_id PRIMARY KEY (id);


--
-- Name: blog_post_category_post_id_category_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_post_category
    ADD CONSTRAINT blog_post_category_post_id_category_id UNIQUE (post_id, category_id);


--
-- Name: blog_post_category_post_id_primary; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_post_category
    ADD CONSTRAINT blog_post_category_post_id_primary UNIQUE (post_id, "primary") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post_content; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_content UNIQUE (content);


--
-- Name: blog_post_description_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_post_description
    ADD CONSTRAINT blog_post_description_id PRIMARY KEY (id);


--
-- Name: blog_post_description_post_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_post_description
    ADD CONSTRAINT blog_post_description_post_id UNIQUE (post_id);


--
-- Name: blog_post_description_value; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_post_description
    ADD CONSTRAINT blog_post_description_value UNIQUE (value);


--
-- Name: blog_post_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_id PRIMARY KEY (id);


--
-- Name: blog_post_link_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_link_id UNIQUE (link_id);


--
-- Name: blog_post_title; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_title UNIQUE (title);


--
-- Name: link_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY link
    ADD CONSTRAINT link_id PRIMARY KEY (id);


--
-- Name: link_parameter_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY link_parameter
    ADD CONSTRAINT link_parameter_id PRIMARY KEY (id);


--
-- Name: link_parameter_link_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY link_parameter
    ADD CONSTRAINT link_parameter_link_id_key UNIQUE (link_id, key);


--
-- Name: menu_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_id PRIMARY KEY (id);


--
-- Name: menu_link_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_link_id UNIQUE (link_id);


--
-- Name: menu_node_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY menu_node
    ADD CONSTRAINT menu_node_id PRIMARY KEY (id);


--
-- Name: menu_node_menu_id_parent_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY menu_node
    ADD CONSTRAINT menu_node_menu_id_parent_id UNIQUE (menu_id, parent_id);


--
-- Name: menu_node_menu_id_primary; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY menu_node
    ADD CONSTRAINT menu_node_menu_id_primary UNIQUE (menu_id, "primary") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_title; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_title UNIQUE (title);


--
-- Name: page_content; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_content UNIQUE (content);


--
-- Name: page_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_id PRIMARY KEY (id);


--
-- Name: page_menu_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_menu_id UNIQUE (menu_id);


--
-- Name: shop_category_description_category_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_category_description
    ADD CONSTRAINT shop_category_description_category_id UNIQUE (category_id);


--
-- Name: shop_category_description_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_category_description
    ADD CONSTRAINT shop_category_description_id PRIMARY KEY (id);


--
-- Name: shop_category_description_value; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_category_description
    ADD CONSTRAINT shop_category_description_value UNIQUE (value);


--
-- Name: shop_category_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_category
    ADD CONSTRAINT shop_category_id PRIMARY KEY (id);


--
-- Name: shop_category_menu_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_category
    ADD CONSTRAINT shop_category_menu_id UNIQUE (menu_id);


--
-- Name: shop_product_category_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product_category
    ADD CONSTRAINT shop_product_category_id PRIMARY KEY (id);


--
-- Name: shop_product_category_product_id_category_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product_category
    ADD CONSTRAINT shop_product_category_product_id_category_id UNIQUE (product_id, category_id);


--
-- Name: shop_product_category_product_id_primary; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product_category
    ADD CONSTRAINT shop_product_category_product_id_primary UNIQUE (product_id, "primary") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product_content_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product_content
    ADD CONSTRAINT shop_product_content_id PRIMARY KEY (id);


--
-- Name: shop_product_content_product_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product_content
    ADD CONSTRAINT shop_product_content_product_id UNIQUE (product_id);


--
-- Name: shop_product_content_value; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product_content
    ADD CONSTRAINT shop_product_content_value UNIQUE (value);


--
-- Name: shop_product_description_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product_description
    ADD CONSTRAINT shop_product_description_id PRIMARY KEY (id);


--
-- Name: shop_product_description_product_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product_description
    ADD CONSTRAINT shop_product_description_product_id UNIQUE (product_id);


--
-- Name: shop_product_description_value; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product_description
    ADD CONSTRAINT shop_product_description_value UNIQUE (value);


--
-- Name: shop_product_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product
    ADD CONSTRAINT shop_product_id PRIMARY KEY (id);


--
-- Name: shop_product_link_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product
    ADD CONSTRAINT shop_product_link_id UNIQUE (link_id);


--
-- Name: shop_product_title; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shop_product
    ADD CONSTRAINT shop_product_title UNIQUE (title);


--
-- Name: translation_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translation
    ADD CONSTRAINT translation_id PRIMARY KEY (id);


--
-- Name: translation_locale_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translation_locale
    ADD CONSTRAINT translation_locale_id PRIMARY KEY (id);


--
-- Name: translation_locale_name; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translation_locale
    ADD CONSTRAINT translation_locale_name UNIQUE (name);


--
-- Name: translation_translate_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translation_translate
    ADD CONSTRAINT translation_translate_id PRIMARY KEY (id);


--
-- Name: translation_translate_translation_id_locale_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translation_translate
    ADD CONSTRAINT translation_translate_translation_id_locale_id UNIQUE (translation_id, locale_id);


--
-- Name: web_alias; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web
    ADD CONSTRAINT web_alias UNIQUE (alias);


--
-- Name: web_domain_host; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web_domain
    ADD CONSTRAINT web_domain_host UNIQUE (host);


--
-- Name: web_domain_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web_domain
    ADD CONSTRAINT web_domain_id PRIMARY KEY (id);


--
-- Name: web_domain_locale_domain_id_locale_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web_domain_locale
    ADD CONSTRAINT web_domain_locale_domain_id_locale_id UNIQUE (domain_id, locale_id);


--
-- Name: web_domain_locale_domain_id_primary; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web_domain_locale
    ADD CONSTRAINT web_domain_locale_domain_id_primary UNIQUE (domain_id, "primary");


--
-- Name: web_domain_locale_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web_domain_locale
    ADD CONSTRAINT web_domain_locale_id PRIMARY KEY (id);


--
-- Name: web_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web
    ADD CONSTRAINT web_id PRIMARY KEY (id);


--
-- Name: web_menu_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web
    ADD CONSTRAINT web_menu_id UNIQUE (menu_id);


--
-- Name: web_name; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web
    ADD CONSTRAINT web_name UNIQUE (name);


--
-- Name: blog_post_category_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX blog_post_category_category_id ON blog_post_category USING btree (category_id);


--
-- Name: blog_post_category_post_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX blog_post_category_post_id ON blog_post_category USING btree (post_id);


--
-- Name: link_parameter_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX link_parameter_key ON link_parameter USING btree (key);


--
-- Name: link_parameter_value; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX link_parameter_value ON link_parameter USING btree (value);


--
-- Name: menu_node_parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX menu_node_parent_id ON menu_node USING btree (parent_id);


--
-- Name: shop_product_category_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX shop_product_category_category_id ON shop_product_category USING btree (category_id);


--
-- Name: shop_product_category_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX shop_product_category_product_id ON shop_product_category USING btree (product_id);


--
-- Name: translation_translate_locale_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX translation_translate_locale_id ON translation_translate USING btree (locale_id);


--
-- Name: translation_translate_translation_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX translation_translate_translation_id ON translation_translate USING btree (translation_id);


--
-- Name: web_domain_locale_locale_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX web_domain_locale_locale_id ON web_domain_locale USING btree (locale_id);


--
-- Name: web_domain_web_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX web_domain_web_id ON web_domain USING btree (web_id);


--
-- Name: blog_category_description_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_category_description
    ADD CONSTRAINT blog_category_description_category_id_fkey FOREIGN KEY (category_id) REFERENCES blog_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: blog_category_description_value_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_category_description
    ADD CONSTRAINT blog_category_description_value_fkey FOREIGN KEY (value) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: blog_category_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_category
    ADD CONSTRAINT blog_category_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: blog_post_category_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_post_category
    ADD CONSTRAINT blog_post_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES blog_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: blog_post_category_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_post_category
    ADD CONSTRAINT blog_post_category_post_id_fkey FOREIGN KEY (post_id) REFERENCES blog_post(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: blog_post_content_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_content_fkey FOREIGN KEY (content) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: blog_post_description_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_post_description
    ADD CONSTRAINT blog_post_description_post_id_fkey FOREIGN KEY (post_id) REFERENCES blog_post(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: blog_post_description_value_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_post_description
    ADD CONSTRAINT blog_post_description_value_fkey FOREIGN KEY (value) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: blog_post_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_link_id_fkey FOREIGN KEY (link_id) REFERENCES link(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: blog_post_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_title_fkey FOREIGN KEY (title) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: link_parameter_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY link_parameter
    ADD CONSTRAINT link_parameter_link_id_fkey FOREIGN KEY (link_id) REFERENCES link(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: menu_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_link_id_fkey FOREIGN KEY (link_id) REFERENCES link(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: menu_node_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu_node
    ADD CONSTRAINT menu_node_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: menu_node_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu_node
    ADD CONSTRAINT menu_node_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: menu_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_title_fkey FOREIGN KEY (title) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: page_content_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_content_fkey FOREIGN KEY (content) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: page_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_category_description_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_category_description
    ADD CONSTRAINT shop_category_description_category_id_fkey FOREIGN KEY (category_id) REFERENCES shop_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_category_description_value_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_category_description
    ADD CONSTRAINT shop_category_description_value_fkey FOREIGN KEY (value) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_category_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_category
    ADD CONSTRAINT shop_category_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_product_category_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product_category
    ADD CONSTRAINT shop_product_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES shop_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_product_category_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product_category
    ADD CONSTRAINT shop_product_category_product_id_fkey FOREIGN KEY (product_id) REFERENCES shop_product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_product_content_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product_content
    ADD CONSTRAINT shop_product_content_product_id_fkey FOREIGN KEY (product_id) REFERENCES shop_product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_product_content_value_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product_content
    ADD CONSTRAINT shop_product_content_value_fkey FOREIGN KEY (value) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_product_description_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product_description
    ADD CONSTRAINT shop_product_description_product_id_fkey FOREIGN KEY (product_id) REFERENCES shop_product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_product_description_value_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product_description
    ADD CONSTRAINT shop_product_description_value_fkey FOREIGN KEY (value) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_product_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product
    ADD CONSTRAINT shop_product_link_id_fkey FOREIGN KEY (link_id) REFERENCES link(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shop_product_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shop_product
    ADD CONSTRAINT shop_product_title_fkey FOREIGN KEY (title) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: translation_translate_locale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY translation_translate
    ADD CONSTRAINT translation_translate_locale_id_fkey FOREIGN KEY (locale_id) REFERENCES translation_locale(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: translation_translate_translation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY translation_translate
    ADD CONSTRAINT translation_translate_translation_id_fkey FOREIGN KEY (translation_id) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: web_domain_locale_domain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY web_domain_locale
    ADD CONSTRAINT web_domain_locale_domain_id_fkey FOREIGN KEY (domain_id) REFERENCES web_domain(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: web_domain_locale_locale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY web_domain_locale
    ADD CONSTRAINT web_domain_locale_locale_id_fkey FOREIGN KEY (locale_id) REFERENCES translation_locale(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: web_domain_web_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY web_domain
    ADD CONSTRAINT web_domain_web_id_fkey FOREIGN KEY (web_id) REFERENCES web(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: web_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY web
    ADD CONSTRAINT web_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: web_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY web
    ADD CONSTRAINT web_name_fkey FOREIGN KEY (name) REFERENCES translation(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

