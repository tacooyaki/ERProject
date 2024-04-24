--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_text_rich_texts OWNER TO postgres;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNER TO postgres;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO postgres;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_admin_comments_id_seq OWNER TO postgres;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    user_id integer,
    street character varying,
    city character varying,
    province character varying,
    postal_code character varying,
    country character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    unit_price numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id integer,
    total_price numeric,
    status character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    shipping_address_id bigint,
    billing_address_id bigint,
    subtotal numeric,
    tax numeric,
    total numeric
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    description text,
    price numeric,
    category_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    is_on_sale boolean,
    sale_price numeric
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: static_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.static_pages (
    id bigint NOT NULL,
    title character varying,
    content text,
    slug character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.static_pages OWNER TO postgres;

--
-- Name: static_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.static_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.static_pages_id_seq OWNER TO postgres;

--
-- Name: static_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.static_pages_id_seq OWNED BY public.static_pages.id;


--
-- Name: tax_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_rates (
    id bigint NOT NULL,
    province character varying,
    gst numeric,
    pst numeric,
    hst numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.tax_rates OWNER TO postgres;

--
-- Name: tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_rates_id_seq OWNER TO postgres;

--
-- Name: tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_rates_id_seq OWNED BY public.tax_rates.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying,
    password_digest character varying,
    name character varying,
    role character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: static_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.static_pages ALTER COLUMN id SET DEFAULT nextval('public.static_pages_id_seq'::regclass);


--
-- Name: tax_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rates ALTER COLUMN id SET DEFAULT nextval('public.tax_rates_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
1	content	This is an about us page.	StaticPage	1	2024-03-22 03:57:34.836598	2024-03-22 03:57:34.836598
\.


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
8	images	Product	1	8	2024-04-04 16:51:04.602567
9	image	ActiveStorage::VariantRecord	3	9	2024-04-04 16:51:45.594509
10	images	Product	2	10	2024-04-09 03:44:12.918811
11	images	Product	3	11	2024-04-09 03:47:05.043325
12	images	Product	4	12	2024-04-09 03:51:33.094993
13	images	Product	5	13	2024-04-09 03:54:02.487722
14	image	ActiveStorage::VariantRecord	4	14	2024-04-10 04:12:28.599698
15	image	ActiveStorage::VariantRecord	5	15	2024-04-11 03:52:03.920377
16	image	ActiveStorage::VariantRecord	6	16	2024-04-17 04:08:49.23004
17	image	ActiveStorage::VariantRecord	7	17	2024-04-17 05:44:13.694213
18	image	ActiveStorage::VariantRecord	10	19	2024-04-20 18:53:13.436498
19	image	ActiveStorage::VariantRecord	11	18	2024-04-20 18:53:13.43898
20	image	ActiveStorage::VariantRecord	12	20	2024-04-20 18:53:13.441413
21	image	ActiveStorage::VariantRecord	8	21	2024-04-20 18:53:13.443724
22	image	ActiveStorage::VariantRecord	9	22	2024-04-20 18:53:13.446201
23	image	ActiveStorage::VariantRecord	13	23	2024-04-20 18:54:47.14629
24	image	ActiveStorage::VariantRecord	14	24	2024-04-20 18:54:47.14954
25	image	ActiveStorage::VariantRecord	15	25	2024-04-20 18:54:47.294642
26	image	ActiveStorage::VariantRecord	16	26	2024-04-20 18:54:47.317941
27	image	ActiveStorage::VariantRecord	17	27	2024-04-20 18:54:47.356035
28	image	ActiveStorage::VariantRecord	18	28	2024-04-20 18:57:31.11688
29	image	ActiveStorage::VariantRecord	19	29	2024-04-20 18:57:31.130899
30	image	ActiveStorage::VariantRecord	20	30	2024-04-20 18:57:31.277422
31	image	ActiveStorage::VariantRecord	21	31	2024-04-20 18:57:31.304084
32	image	ActiveStorage::VariantRecord	22	32	2024-04-20 18:57:31.429572
33	image	ActiveStorage::VariantRecord	23	33	2024-04-20 18:57:41.616798
34	image	ActiveStorage::VariantRecord	24	34	2024-04-20 18:57:41.730072
35	image	ActiveStorage::VariantRecord	25	35	2024-04-20 18:57:41.762533
36	image	ActiveStorage::VariantRecord	26	36	2024-04-20 18:57:41.975693
37	image	ActiveStorage::VariantRecord	27	37	2024-04-20 18:57:41.979011
38	images	Product	6	38	2024-04-23 04:27:26.99767
39	image	ActiveStorage::VariantRecord	28	39	2024-04-23 04:29:38.520135
40	image	ActiveStorage::VariantRecord	29	40	2024-04-23 04:29:42.855431
41	images	Product	7	41	2024-04-23 04:30:59.227267
42	image	ActiveStorage::VariantRecord	30	42	2024-04-23 04:31:14.250648
43	image	ActiveStorage::VariantRecord	31	43	2024-04-23 04:31:16.93631
44	images	Product	8	44	2024-04-23 04:32:06.335674
45	images	Product	9	45	2024-04-23 04:32:32.960661
46	image	ActiveStorage::VariantRecord	32	46	2024-04-23 04:32:37.420173
47	image	ActiveStorage::VariantRecord	33	47	2024-04-23 04:32:37.500293
48	images	Product	10	48	2024-04-23 04:33:24.563063
49	image	ActiveStorage::VariantRecord	34	49	2024-04-23 04:34:12.499025
50	images	Product	11	50	2024-04-23 04:35:27.699937
51	image	ActiveStorage::VariantRecord	35	51	2024-04-23 04:35:32.25715
52	images	Product	12	52	2024-04-23 04:37:26.586737
53	images	Product	13	53	2024-04-23 04:37:52.361281
54	images	Product	14	54	2024-04-23 04:38:16.380817
55	images	Product	15	55	2024-04-23 04:38:42.322021
56	image	ActiveStorage::VariantRecord	36	56	2024-04-23 04:38:49.056126
57	image	ActiveStorage::VariantRecord	37	57	2024-04-23 04:38:49.090897
58	image	ActiveStorage::VariantRecord	38	58	2024-04-23 04:38:49.336936
59	image	ActiveStorage::VariantRecord	39	59	2024-04-23 04:38:49.348311
60	image	ActiveStorage::VariantRecord	40	60	2024-04-23 04:44:29.679507
61	image	ActiveStorage::VariantRecord	41	61	2024-04-23 05:08:40.681614
62	image	ActiveStorage::VariantRecord	42	62	2024-04-24 18:42:34.127768
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
22	brk9sqq5azsridurmc5tazs0sd0u	test.jpg	image/jpeg	{"identified":true,"width":300,"height":200,"analyzed":true}	local	4911	EQQyETBfNmlY7F5MneAO4w==	2024-04-20 18:53:13.433779
20	9w55l8hhkzvb5vpxv7v6n8t1boyj	cottegestickers.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	83381	G3/il5PAt6gkza27V96Row==	2024-04-20 18:53:13.428904
18	tea6stodkleynpioqepy4bt991gp	flowerpot.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	72230	/nECws3rsR8A2nUvuJH1Wg==	2024-04-20 18:53:13.4233
19	j7kguajmodlhniapczsxitt50g13	gardenmug.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	101871	5ahkNsxRSe8Jm1YGAHF++A==	2024-04-20 18:53:13.426328
8	fqzsvjfqdj3rz18bl3v2wc551eq7	test.jpg	image/jpeg	{"identified":true,"width":894,"height":748,"analyzed":true}	local	17404	X6hb0r6Olkcq3KYf9UaZ0w==	2024-04-04 16:51:04.591674
9	ms8vpskz87ypal8m0b4z20fdtanf	test.jpg	image/jpeg	{"identified":true,"width":500,"height":418,"analyzed":true}	local	11393	2TDWsrCM/MVAEorBY28I5A==	2024-04-04 16:51:45.591315
10	op23rgp8at5iyf2o7rhjzlpcevzt	flowerpot.png	image/png	{"identified":true,"width":1080,"height":1136,"analyzed":true}	local	506662	YxffLVX4U4Y+CATnJiQz6g==	2024-04-09 03:44:12.91241
11	qgzlpci4bhqjsoeyqbmx4irvg5ar	gardenfood.jpg	image/jpeg	{"identified":true,"width":602,"height":850,"analyzed":true}	local	308705	f5LhwAEqETS19D9N2zlMkQ==	2024-04-09 03:47:05.039954
12	crttc6xooeywrkyr4szivgzxw8qa	gardenmug.png	image/png	{"identified":true,"width":428,"height":428,"analyzed":true}	local	470473	s9R5z802Ol1O+cwksFimSg==	2024-04-09 03:51:33.092068
13	l21rt4fqc0911v7rx3mgtdz89iur	cottegestickers.png	image/png	{"identified":true,"width":646,"height":835,"analyzed":true}	local	729637	an/wERe+P8d/Cih/ELOX3Q==	2024-04-09 03:54:02.484909
14	npo4t0kuw1k9rh4ewvsucq1673x5	gardenfood.jpg	image/jpeg	{"identified":true,"width":354,"height":500,"analyzed":true}	local	167724	Fc1RtEXNYxTE3BZvlfsaIA==	2024-04-10 04:12:28.595638
15	wortb3zohw91b20cgny3sudgxbh7	gardenmug.png	image/png	{"identified":true,"width":428,"height":428,"analyzed":true}	local	305712	nL0Z+ikZUB+YOeWPB7+RHg==	2024-04-11 03:52:03.916682
16	66ruonjupfnoj9hzf97ie7yk8a23	cottegestickers.png	image/png	{"identified":true,"width":387,"height":500,"analyzed":true}	local	229676	ngBZ/9cPPmuKaBVqK03PEw==	2024-04-17 04:08:49.225584
17	h9znbfdmkgj657smbw1bz7mwmrvh	flowerpot.png	image/png	{"identified":true,"width":475,"height":500,"analyzed":true}	local	231235	VknEdrnE43VmzB8RdoPSDA==	2024-04-17 05:44:13.690567
21	f29asgesz0tkxf5ylwsdf2xt7ffx	gardenfood.jpg	image/jpeg	{"identified":true,"width":300,"height":200,"analyzed":true}	local	70221	mYploiJ91gbpLhrYSshtpA==	2024-04-20 18:53:13.431241
24	u9fw3gws1vr5ju7chswxptuwq98i	gardenfood.jpg	image/jpeg	{"identified":true,"width":350,"height":700,"analyzed":true}	local	231008	0yGOygaRwEv9G9vgmYRURA==	2024-04-20 18:54:47.142802
23	0lvtxv2ngw8ge8hqztk8qeqlbqwj	test.jpg	image/jpeg	{"identified":true,"width":350,"height":700,"analyzed":true}	local	10653	VbDK8R0065D+o0Jxxm5rzQ==	2024-04-20 18:54:47.139745
26	qvf3enicruil1qtc4cr3sgwlh2lz	flowerpot.png	image/png	{"identified":true,"width":350,"height":700,"analyzed":true}	local	399576	ZXSfo1SX0qOM3OCaNUxd9w==	2024-04-20 18:54:47.314514
27	rhjjztgjyfcm3st6to2stae9f5up	gardenmug.png	image/png	{"identified":true,"width":350,"height":700,"analyzed":true}	local	297296	u42sjvo78xDsCISEgc88GQ==	2024-04-20 18:54:47.352701
25	zygdoxsymf9bioun0urvfyas550f	cottegestickers.png	image/png	{"identified":true,"width":350,"height":700,"analyzed":true}	local	303040	4PwKmCWQcTjxwHCZsjRZ1w==	2024-04-20 18:54:47.290713
28	v28pk1ck0ioqcj6vsxiam8anz4vh	test.jpg	image/jpeg	{"identified":true,"width":350,"height":600,"analyzed":true}	local	9917	GbTXMtj+gAcE7oWYIxGv7w==	2024-04-20 18:57:31.109198
29	j8czykmq5mk5oyl3jl9fd5azm5or	gardenfood.jpg	image/jpeg	{"identified":true,"width":350,"height":600,"analyzed":true}	local	207239	5t+W7o5lTF4h4wzIX9ICLg==	2024-04-20 18:57:31.126346
30	vjo7ammkips6r7tu9b18qb81kepe	cottegestickers.png	image/png	{"identified":true,"width":350,"height":600,"analyzed":true}	local	278469	Zx7ee3pT/3ILw4vPQtwqaQ==	2024-04-20 18:57:31.273218
31	z00auxd8wpxz5tuov9nxdhmg1h03	flowerpot.png	image/png	{"identified":true,"width":350,"height":600,"analyzed":true}	local	308453	uXrj5JO5g29ELoHDLyYjgA==	2024-04-20 18:57:31.300513
32	q2gjg54mvwyljayt5mx30ojbk2bc	gardenmug.png	image/png	{"identified":true,"width":350,"height":600,"analyzed":true}	local	277360	NlEfsZNQ0MTBbxrgV1s4JA==	2024-04-20 18:57:31.42605
33	lzjt8cfs9h18epaq2mxtv0iy29ih	test.jpg	image/jpeg	{"identified":true,"width":350,"height":570,"analyzed":true}	local	9780	CCs6bckV1+u72AxfbEVP7g==	2024-04-20 18:57:41.612294
34	pmwbc0tulj8k4bhtfruqgzgmwhd6	gardenfood.jpg	image/jpeg	{"identified":true,"width":350,"height":570,"analyzed":true}	local	200063	7G6MJbC5i4SrJHhStzHSiQ==	2024-04-20 18:57:41.726044
35	efm8hynmhvu60evt04gdst9f6x6u	flowerpot.png	image/png	{"identified":true,"width":350,"height":570,"analyzed":true}	local	282504	3y/cz9meulydnvjmwuePVw==	2024-04-20 18:57:41.75921
36	5n5snrcc5kqaf3p0lx05pd6binx7	cottegestickers.png	image/png	{"identified":true,"width":350,"height":570,"analyzed":true}	local	266876	FW2ROjcbE9YrFk8ZhiSm4w==	2024-04-20 18:57:41.969786
37	6bkawnn7iecxwn4jl12h2tfoniiq	gardenmug.png	image/png	{"identified":true,"width":350,"height":570,"analyzed":true}	local	270599	8asV1d51JXiALs88k7L8Sg==	2024-04-20 18:57:41.973028
38	o33ko8tbjvpvccosocfxstry1sfo	botanical_print.png	image/png	{"identified":true,"width":820,"height":614,"analyzed":true}	local	196539	uphAsph5AoCeWqOKQe+/fw==	2024-04-23 04:27:26.990655
39	bwi8r1fn0dcndp20gosbu5izw51l	botanical_print.png	image/png	{"identified":true,"width":500,"height":374,"analyzed":true}	local	78785	xPjFshiIiOTLHvEYFOy32Q==	2024-04-23 04:29:38.516378
40	ylamott8anoif9z1hvrbl930a0qf	botanical_print.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	34556	91dJU3ZJ608lXsgk87Z2yg==	2024-04-23 04:29:42.851248
41	v9mdlgbc9qdsxc2hu17z3a55ruyg	floral_mug.png	image/png	{"identified":true,"width":936,"height":702,"analyzed":true}	local	276618	GGLylYw6BLNnDzQsBMFh0g==	2024-04-23 04:30:59.224088
42	3fip7gt7djgjjh8nrqww61jqx32v	floral_mug.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	39137	ZDYUnln7xr7n+rjtRFQodA==	2024-04-23 04:31:14.247493
43	ls80say8ggil4ppb9z2e4hh9w6di	floral_mug.png	image/png	{"identified":true,"width":500,"height":375,"analyzed":true}	local	87756	d/YruqXfssSp7+dZxKh80Q==	2024-04-23 04:31:16.933605
44	6kjkqm8eywn4kts2ut721mdtsp5c	Serene_Lake_Sunset_Poster.png	image/png	{"identified":true,"width":820,"height":614,"analyzed":true}	local	936726	a94DDsEjMvIQucZc0KCtbQ==	2024-04-23 04:32:06.332067
45	cgwn0nwquad7n8ar7g5oiuv233lt	Enchanted_Forest_Sunset_Scene.png	image/png	{"identified":true,"width":792,"height":593,"analyzed":true}	local	1011503	NyGhrtK63PY3SJLKvgNVKA==	2024-04-23 04:32:32.95755
46	9i8l8u47gjgj0j8em3szv69jxqmb	Serene_Lake_Sunset_Poster.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	81585	HeoLn0kDUWgBAGa0b5yVng==	2024-04-23 04:32:37.409648
47	tuk44exn8rh47umebg9a7nxkmkzl	Enchanted_Forest_Sunset_Scene.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	94191	Isqj/yszq9Ln0cNAmLtddA==	2024-04-23 04:32:37.494405
48	9weoby3bhcev71hy1a5bc56mkul5	Black_Raven_Sticker.png	image/png	{"identified":true,"width":578,"height":433,"analyzed":true}	local	100235	jCLv9pyOBICtaZl2tgR3/w==	2024-04-23 04:33:24.559971
49	csrmnsec936rl3jsx237cytwlyt9	Black_Raven_Sticker.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	28575	HJVOtAtqTJ0ZuI6jHOQyGg==	2024-04-23 04:34:12.49621
50	y6cv3jvotif1cyviq9f7jv7q1ujs	Vintage_Butterfly_Sticker.png	image/png	{"identified":true,"width":727,"height":545,"analyzed":true}	local	190465	KEy+xtBGLLqmSp0us7CT1Q==	2024-04-23 04:35:27.695677
51	rrzccgc93uq6pjkjre5z30q5cv3e	Vintage_Butterfly_Sticker.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	37498	XnDYRARpxyLHK32kEZ5DXA==	2024-04-23 04:35:32.253363
52	m7p9geademg8c5sntcbyb5btsdfk	Retro_Sunset_Mountain.png	image/png	{"identified":true,"width":672,"height":503,"analyzed":true}	local	152296	P7XBGtZ6uemK1WSw+FAt6g==	2024-04-23 04:37:26.583059
53	kvx1im4vefts92j9k1wjfxq8hqug	Abstract_Art_T.png	image/png	{"identified":true,"width":809,"height":606,"analyzed":true}	local	166677	Y7XwNvomzQai7thN8WlWvA==	2024-04-23 04:37:52.357431
54	yadqvx7bl2yz1o1gfj6go32fewz9	Wave_After_Wave.png	image/png	{"identified":true,"width":767,"height":575,"analyzed":true}	local	139144	mqS/7y+vdpEcZYcLaFYhbw==	2024-04-23 04:38:16.377217
55	vd0nuo4oiin1og20dh0izz4kjxd3	Floral_Heart_T.png	image/png	{"identified":true,"width":807,"height":605,"analyzed":true}	local	199765	vQVfrDir2PpO2Vp2GQZBgw==	2024-04-23 04:38:42.318726
56	7u9tzgepgdoz34yz6lzosjrex4er	Floral_Heart_T.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	32670	B+CjiQoVDYYBam2Zjl/YGA==	2024-04-23 04:38:49.050928
57	rb9m4a8b3v7xzr2td1o86y4vqszb	Retro_Sunset_Mountain.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	31295	Td6FaybvSQqVTOorIVp6Ow==	2024-04-23 04:38:49.085946
59	c3cmt1ckqk91np1oa2lmc0hw8xqa	Abstract_Art_T.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	28637	O3GpJoymwh51fvJjR3FM6A==	2024-04-23 04:38:49.340315
58	fk40ehno8k2fwxaw3k19qbu8j6dc	Wave_After_Wave.png	image/png	{"identified":true,"width":300,"height":200,"analyzed":true}	local	28864	8m4ORYWVlABmOZD+Ho2HZQ==	2024-04-23 04:38:49.331449
60	iu4jmxqxesstx6lutm6mm0pe95ib	Floral_Heart_T.png	image/png	{"identified":true,"width":500,"height":375,"analyzed":true}	local	77124	F3f4D3fP//EQANSHdXZH/g==	2024-04-23 04:44:29.676109
61	ilnlhalsqwtqel4bj85s4slk7qk0	Retro_Sunset_Mountain.png	image/png	{"identified":true,"width":500,"height":374,"analyzed":true}	local	73088	tM/mIs7C+SzwMD+jn80YuA==	2024-04-23 05:08:40.677096
62	rsc4crvloles4j0lqc2dwl8btlfy	Vintage_Butterfly_Sticker.png	image/png	{"identified":true,"width":500,"height":375,"analyzed":true}	local	89979	cRxmmpW9ugK5296oKEX74A==	2024-04-24 18:42:34.121544
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
3	8	o6FvqsFkA8vhEYgai/NTHqoEOlQ=
4	11	o6FvqsFkA8vhEYgai/NTHqoEOlQ=
5	12	grOmaDDD+qNEEvS3BZzaB227f44=
6	13	grOmaDDD+qNEEvS3BZzaB227f44=
7	10	grOmaDDD+qNEEvS3BZzaB227f44=
8	11	o52WXDkhM3vgCX/mdiDHRo7eMqY=
9	8	o52WXDkhM3vgCX/mdiDHRo7eMqY=
10	12	v9ixxqrLiexYqO1930VvoNyjstE=
11	10	v9ixxqrLiexYqO1930VvoNyjstE=
12	13	v9ixxqrLiexYqO1930VvoNyjstE=
13	8	e+nUuGt1S45aYS0O6ghT2qqLpIg=
14	11	e+nUuGt1S45aYS0O6ghT2qqLpIg=
15	13	QYrIw3psnKBj5UKKl/V9wKX/Ryo=
16	10	QYrIw3psnKBj5UKKl/V9wKX/Ryo=
17	12	QYrIw3psnKBj5UKKl/V9wKX/Ryo=
18	8	LYt3vEb7zqzt5hrpbpk3nXRZAcE=
19	11	LYt3vEb7zqzt5hrpbpk3nXRZAcE=
20	13	01VCj2WsfqfPZnCyWvPT+CIkNkg=
21	10	01VCj2WsfqfPZnCyWvPT+CIkNkg=
22	12	01VCj2WsfqfPZnCyWvPT+CIkNkg=
23	8	s49xk5eeQiKo2CwahHg5LoKfdHU=
24	11	s49xk5eeQiKo2CwahHg5LoKfdHU=
25	10	0ysOV/QXeA9Kqx2nlAcP5fD+vDU=
26	13	0ysOV/QXeA9Kqx2nlAcP5fD+vDU=
27	12	0ysOV/QXeA9Kqx2nlAcP5fD+vDU=
28	38	grOmaDDD+qNEEvS3BZzaB227f44=
29	38	v9ixxqrLiexYqO1930VvoNyjstE=
30	41	v9ixxqrLiexYqO1930VvoNyjstE=
31	41	grOmaDDD+qNEEvS3BZzaB227f44=
32	44	v9ixxqrLiexYqO1930VvoNyjstE=
33	45	v9ixxqrLiexYqO1930VvoNyjstE=
34	48	v9ixxqrLiexYqO1930VvoNyjstE=
35	50	v9ixxqrLiexYqO1930VvoNyjstE=
36	55	v9ixxqrLiexYqO1930VvoNyjstE=
37	52	v9ixxqrLiexYqO1930VvoNyjstE=
38	54	v9ixxqrLiexYqO1930VvoNyjstE=
39	53	v9ixxqrLiexYqO1930VvoNyjstE=
40	55	grOmaDDD+qNEEvS3BZzaB227f44=
41	52	grOmaDDD+qNEEvS3BZzaB227f44=
42	50	grOmaDDD+qNEEvS3BZzaB227f44=
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, user_id, street, city, province, postal_code, country, created_at, updated_at) FROM stdin;
1	1	Test street	Test town	Manitoba	R1A2P2	Canada	2024-04-17 03:49:21.421651	2024-04-17 03:49:21.421651
2	1	Test street 2	Test town 2	Manitoba	R1A2P2	Canada	2024-04-17 03:54:30.12136	2024-04-17 03:54:30.12136
3	1	Test street 3	Test town 3	Manitoba	R1A2P2	Canada	2024-04-17 05:11:16.461621	2024-04-18 05:54:50.869726
4	1	Test street 4	Test town 4	Manitoba	R1A2P2	Canada	2024-04-18 02:29:45.554541	2024-04-18 05:54:50.876257
7	2	Tester 2 street 3	Tester 2 Town 1	MB	R1A2P2	Canada	2024-04-18 05:58:12.826999	2024-04-18 05:58:12.826999
9	2	Tester 2 street 4	Tester 2 Town 2	Alberta	T9J3N2	Canada	2024-04-19 18:52:40.651756	2024-04-19 18:52:40.651756
8	2	Tester 2 empty street test 1 and edit 1	Tester 2 empty city test 1 and edit 1		R1A2P2	Canada	2024-04-19 18:48:38.483631	2024-04-19 19:04:25.749546
5	2	Tester 2 stree	Tester 2 Town	Manitoba	R1A2P2	Canada	2024-04-18 04:16:06.602311	2024-04-19 19:07:12.363558
6	2	Tester 2 street 2	Tester 2 city 2	Manitoba	R1A2P2	Canada	2024-04-18 05:57:23.142138	2024-04-19 19:08:26.078627
10	5	Test street 5	Tester 5 city	British Columbia	R1A2P2	Canada	2024-04-19 20:18:27.547113	2024-04-19 20:18:27.547113
11	6	Elm Street	Berry	Alberta	T9J3N2	Canada	2024-04-19 20:23:36.497263	2024-04-19 20:23:44.106324
12	7	1 Keyano	Fort McMurray	Prince Edward Island	A1A2B2	Canada	2024-04-23 05:06:57.58836	2024-04-23 05:06:57.58836
13	8	Elm Street	Berry	New Brunswick	A1A3C4	Canada	2024-04-24 18:42:03.626539	2024-04-24 18:42:03.626539
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
1	admin@example.com	$2a$12$yHzrhEzFCzDOOh.WjU2sNeyHUPu8oBDwPgosxjdpmKj06ekHI41Na	\N	\N	\N	2024-03-14 19:50:54.805345	2024-03-14 19:50:54.805345
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-03-14 03:42:07.496613	2024-03-14 03:42:07.496617
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
1	Gardening Tools	2024-03-26 19:32:11.354657	2024-03-26 19:32:11.354657
2	T-Shirts	2024-04-02 19:06:07.688609	2024-04-02 19:06:07.688609
3	Posters	2024-04-02 19:06:23.640955	2024-04-02 19:06:23.640955
4	Mugs	2024-04-02 19:06:36.880471	2024-04-02 19:06:36.880471
5	Stickers	2024-04-02 19:06:52.64999	2024-04-02 19:06:52.64999
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, product_id, quantity, unit_price, created_at, updated_at) FROM stdin;
1	1	1	1	9.99	2024-04-17 03:54:46.442479	2024-04-17 03:54:46.442479
2	1	4	3	7.99	2024-04-17 03:54:46.446512	2024-04-17 03:54:46.446512
3	2	1	1	9.99	2024-04-17 03:56:12.992019	2024-04-17 03:56:12.992019
4	2	4	3	7.99	2024-04-17 03:56:12.995343	2024-04-17 03:56:12.995343
5	3	4	3	7.99	2024-04-17 05:34:02.077464	2024-04-17 05:34:02.077464
6	3	3	4	17.99	2024-04-17 05:34:02.08069	2024-04-17 05:34:02.08069
7	4	5	2	6.99	2024-04-17 05:41:25.246132	2024-04-17 05:41:25.246132
8	4	3	2	17.99	2024-04-17 05:41:25.249166	2024-04-17 05:41:25.249166
9	5	2	1	12.99	2024-04-17 05:44:20.783848	2024-04-17 05:44:20.783848
10	6	1	1	9.99	2024-04-17 05:54:42.586678	2024-04-17 05:54:42.586678
11	7	1	1	9.99	2024-04-17 06:02:08.699484	2024-04-17 06:02:08.699484
12	8	5	1	6.99	2024-04-17 06:06:02.55137	2024-04-17 06:06:02.55137
13	9	5	1	6.99	2024-04-17 06:12:23.089946	2024-04-17 06:12:23.089946
14	10	2	4	12.99	2024-04-17 19:40:47.275967	2024-04-17 19:40:47.275967
15	11	1	2	9.99	2024-04-18 02:58:11.482976	2024-04-18 02:58:11.482976
16	12	1	1	9.99	2024-04-18 04:44:06.199564	2024-04-18 04:44:06.199564
17	13	5	1	6.99	2024-04-18 05:25:13.649195	2024-04-18 05:25:13.649195
18	14	1	1	9.99	2024-04-18 05:28:25.691136	2024-04-18 05:28:25.691136
19	15	1	2	9.99	2024-04-18 05:39:37.574637	2024-04-18 05:39:37.574637
20	16	1	1	9.99	2024-04-18 06:13:16.450511	2024-04-18 06:13:16.450511
21	17	5	2	6.99	2024-04-18 20:00:56.290315	2024-04-18 20:00:56.290315
22	18	5	1	6.99	2024-04-18 20:03:13.156743	2024-04-18 20:03:13.156743
23	19	5	2	6.99	2024-04-19 16:36:23.67208	2024-04-19 16:36:23.67208
24	20	5	1	6.99	2024-04-19 17:04:11.146453	2024-04-19 17:04:11.146453
25	21	5	1	6.99	2024-04-19 17:08:23.45335	2024-04-19 17:08:23.45335
26	22	5	1	6.99	2024-04-19 17:48:30.86876	2024-04-19 17:48:30.86876
27	22	5	1	6.99	2024-04-19 17:48:30.871772	2024-04-19 17:48:30.871772
28	23	4	2	7.99	2024-04-19 17:58:01.889231	2024-04-19 17:58:01.889231
29	23	4	2	7.99	2024-04-19 17:58:01.891494	2024-04-19 17:58:01.891494
30	24	4	4	7.99	2024-04-19 18:22:16.485151	2024-04-19 18:22:16.485151
31	24	4	4	7.99	2024-04-19 18:22:16.487731	2024-04-19 18:22:16.487731
32	25	5	1	6.99	2024-04-19 18:53:03.753162	2024-04-19 18:53:03.753162
33	25	5	1	6.99	2024-04-19 18:53:03.75642	2024-04-19 18:53:03.75642
34	26	2	1	12.99	2024-04-19 20:27:05.829691	2024-04-19 20:27:05.829691
35	26	5	2	6.99	2024-04-19 20:27:05.833092	2024-04-19 20:27:05.833092
36	26	3	1	17.99	2024-04-19 20:27:05.836038	2024-04-19 20:27:05.836038
37	26	1	1	9.99	2024-04-19 20:27:05.838591	2024-04-19 20:27:05.838591
38	26	4	1	7.99	2024-04-19 20:27:05.841604	2024-04-19 20:27:05.841604
39	26	2	1	12.99	2024-04-19 20:27:05.844205	2024-04-19 20:27:05.844205
40	26	5	2	6.99	2024-04-19 20:27:05.846795	2024-04-19 20:27:05.846795
41	26	3	1	17.99	2024-04-19 20:27:05.849716	2024-04-19 20:27:05.849716
42	26	1	1	9.99	2024-04-19 20:27:05.85275	2024-04-19 20:27:05.85275
43	26	4	1	7.99	2024-04-19 20:27:05.855063	2024-04-19 20:27:05.855063
44	27	15	1	36.99	2024-04-23 05:07:09.645126	2024-04-23 05:07:09.645126
45	27	15	1	36.99	2024-04-23 05:07:09.649073	2024-04-23 05:07:09.649073
46	28	15	1	36.99	2024-04-24 18:42:17.446176	2024-04-24 18:42:17.446176
47	28	15	1	36.99	2024-04-24 18:42:17.449885	2024-04-24 18:42:17.449885
48	29	11	1	7.99	2024-04-24 18:42:41.172956	2024-04-24 18:42:41.172956
49	29	11	1	7.99	2024-04-24 18:42:41.175441	2024-04-24 18:42:41.175441
50	30	12	1	3.99	2024-04-24 18:56:23.885243	2024-04-24 18:56:23.885243
51	31	12	1	3.99	2024-04-24 18:57:06.124368	2024-04-24 18:57:06.124368
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, total_price, status, created_at, updated_at, shipping_address_id, billing_address_id, subtotal, tax, total) FROM stdin;
1	1	\N	\N	2024-04-17 03:54:46.436296	2024-04-17 03:54:46.436296	\N	\N	33.96	0.0	33.96
2	1	\N	\N	2024-04-17 03:56:12.987651	2024-04-17 03:56:12.987651	\N	\N	33.96	0.0	33.96
3	1	\N	\N	2024-04-17 05:34:02.072553	2024-04-17 05:34:02.072553	3	\N	95.93	0.0	95.93
4	1	\N	\N	2024-04-17 05:41:25.241557	2024-04-17 05:41:25.241557	3	\N	49.96	0.0	49.96
5	1	\N	\N	2024-04-17 05:44:20.779275	2024-04-17 05:44:20.779275	3	\N	12.99	0.0	12.99
6	1	\N	\N	2024-04-17 05:54:42.582555	2024-04-17 05:54:42.582555	3	\N	9.99	0.0	9.99
7	1	\N	\N	2024-04-17 06:02:08.694808	2024-04-17 06:02:08.694808	3	\N	9.99	0.0	9.99
8	1	\N	\N	2024-04-17 06:06:02.547411	2024-04-17 06:06:02.547411	3	\N	6.99	0.0	6.99
9	1	\N	\N	2024-04-17 06:12:23.085952	2024-04-17 06:12:23.085952	3	\N	6.99	0.0	6.99
10	1	\N	\N	2024-04-17 19:40:47.264839	2024-04-17 19:40:47.264839	3	\N	51.96	0.0	51.96
11	1	\N	\N	2024-04-18 02:58:11.476852	2024-04-18 02:58:11.476852	4	\N	19.98	0.0	19.98
12	2	\N	\N	2024-04-18 04:44:06.194747	2024-04-18 04:44:06.194747	5	\N	9.99	0.0	9.99
13	2	\N	\N	2024-04-18 05:25:13.644679	2024-04-18 05:25:13.644679	5	\N	6.99	0.0	6.99
14	2	\N	\N	2024-04-18 05:28:25.686092	2024-04-18 05:28:25.686092	5	\N	9.99	0.0	9.99
15	2	\N	\N	2024-04-18 05:39:37.570602	2024-04-18 05:39:37.570602	5	\N	19.98	0.0	19.98
16	2	\N	\N	2024-04-18 06:13:16.445447	2024-04-18 06:13:16.445447	5	\N	9.99	1.1988	11.1888
18	2	\N	\N	2024-04-18 20:03:13.153459	2024-04-18 20:03:13.153459	7	\N	6.99	0.0	6.99
17	2	\N	\N	2024-04-18 20:00:56.279175	2024-04-18 21:43:29.275095	1	\N	13.98	1.6776	15.6576
19	2	\N	\N	2024-04-19 16:36:23.652037	2024-04-19 16:36:23.652037	5	\N	13.98	1.6776	15.6576
20	2	\N	\N	2024-04-19 17:04:11.13935	2024-04-19 17:04:11.13935	5	\N	6.99	0.8388	7.8288
21	2	\N	\N	2024-04-19 17:08:23.449922	2024-04-19 17:08:23.449922	5	\N	6.99	0.8388	7.8288
22	2	\N	\N	2024-04-19 17:48:30.863411	2024-04-19 17:48:30.863411	5	\N	13.98	1.6776	15.6576
23	2	\N	\N	2024-04-19 17:58:01.886605	2024-04-19 17:58:01.886605	5	\N	31.96	3.8352	35.7952
24	2	\N	\N	2024-04-19 18:22:16.481365	2024-04-19 18:22:16.481365	5	\N	63.92	7.6704	71.5904
25	2	\N	\N	2024-04-19 18:53:03.750126	2024-04-19 18:53:03.750126	9	\N	13.98	0.699	14.679
26	6	\N	\N	2024-04-19 20:27:05.826582	2024-04-19 20:27:05.826582	11	\N	125.88	6.294	132.174
27	7	\N	\N	2024-04-23 05:07:09.640485	2024-04-23 05:07:09.640485	12	\N	73.98	11.097	85.077
28	8	\N	\N	2024-04-24 18:42:17.437133	2024-04-24 18:42:17.437133	13	\N	73.98	11.097	85.077
29	8	\N	\N	2024-04-24 18:42:41.170251	2024-04-24 18:42:41.170251	13	\N	15.98	2.397	18.377
30	8	\N	\N	2024-04-24 18:56:23.866804	2024-04-24 18:56:23.866804	13	\N	3.99	0.5985	4.5885
31	7	\N	\N	2024-04-24 18:57:06.119855	2024-04-24 18:57:06.119855	12	\N	3.99	0.5985	4.5885
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, price, category_id, created_at, updated_at, is_on_sale, sale_price) FROM stdin;
15	Floral Heart T-Shirt	Add a touch of nature's beauty to your wardrobe with this unisex white tee featuring a vibrant, heart-shaped floral print made of various succulents and flowers. Perfect for casual outings or as a thoughtful gift, this t-shirt pairs well with jeans for a relaxed, yet stylish look.	36.99	2	2024-04-23 04:38:42.314004	2024-04-23 04:38:42.80828	f	\N
7	Floral Mug	Savor your morning coffee or tea with this beautifully designed floral mug, featuring a vibrant print of spring flowers. Perfect as a gift or a treat for yourself, this botanical art print cup will brighten your day every time you use it.	10.99	4	2024-04-23 04:30:59.21881	2024-04-23 04:30:59.652889	t	\N
12	Retro Sunset Mountain Vinyl Sticker	Add a pop of color and retro charm with this vivid sunset mountain sticker! Perfect for customizing laptops, notebooks, or water bottles, this high-quality vinyl decal features a stunning design of a sunset behind mountain silhouettes in a captivating color palette.	3.99	5	2024-04-23 04:37:26.578463	2024-04-23 04:37:26.965111	t	\N
8	Serene Lake Sunset Poster	Bring tranquility to any room with this stunning print featuring a serene lake at sunset in shades of purple and pink. Two charming bunnies add a touch of whimsy to the peaceful landscape. Perfect for adding a calming nature scene to your living room, bedroom, or office.	7.99	3	2024-04-23 04:32:06.32755	2024-04-23 04:32:06.839955	f	\N
9	Enchanted Forest Sunset Scene Poster	Immerse yourself in the enchanting beauty of this sunset scene. Perfect for adding a touch of fantasy and warmth to your living space, this wall art illustrates a serene landscape illuminated by glowing lanterns among fireflies. The vivid colors and detailed artwork make this piece a captivating focal point in any room.	19.99	3	2024-04-23 04:32:32.953612	2024-04-23 04:32:33.371734	f	\N
13	Abstract Art T-Shirt	Spice up your wardrobe with this eye-catching abstract art T-shirt. Ideal for any gender, this shirt features a unique modern graphic that blends intriguing shapes and vibrant colors. Whether you're stepping out for a casual coffee date or just hanging out with friends, this tee ensures comfort without compromising on style.	27.99	2	2024-04-23 04:37:52.353697	2024-04-23 04:37:52.764788	f	\N
10	Black Raven Sticker	Enhance your surfaces with this striking black raven sticker, meticulously detailed to add a gothic touch to any item. Perfect for adorning laptops, water bottles, and notebooks, this vinyl decal captures the enigmatic allure of the raven.	5.99	5	2024-04-23 04:33:24.555808	2024-04-23 04:34:06.81007	t	\N
11	Vintage Butterfly Sticker	Adorn your belongings with this beautifully crafted vintage butterfly sticker. Designed with intricate details and a unique pattern, this vinyl decal is perfect for enhancing the look of your laptop, notebooks, or water bottles.	7.99	5	2024-04-23 04:35:06.994402	2024-04-23 04:35:28.073748	f	\N
14	Wave After Wave Beach Inspired T-Shirt	Ride the waves all summer long with our "Wave After Wave" t-shirt that brings a touch of vintage surf style and coastal charm to your wardrobe. Perfect for beach days or casual wear, this tee features a stunning ocean graphic encased in a dreamy circle design that speaks to every sea lover's heart.	22.79	2	2024-04-23 04:38:16.373423	2024-04-23 04:38:16.775255	f	\N
2	Flower Shirt	A flower growing in a pot on a t-shirt.	12.99	2	2024-04-09 03:44:12.897933	2024-04-09 03:44:14.156815	f	\N
3	Garden Food	Poster with commonly grown food.	17.99	3	2024-04-09 03:47:05.036276	2024-04-09 03:47:05.659393	f	\N
1	Garden Trowel	A hand-held tool for gardeners.	9.99	1	2024-03-26 19:32:23.961055	2024-04-09 03:58:21.072613	f	\N
5	Cottege Garden	Assorted cottage themed garden stickers.	6.99	5	2024-04-09 03:54:02.481595	2024-04-10 04:15:56.132117	f	\N
4	Fruit mug	A simple tea cup garden mug.	7.99	4	2024-04-09 03:51:33.08865	2024-04-10 04:16:02.23702	f	\N
6	Vintage Botanical Print Mug	Enjoy your favorite brew in this charming coffee mug featuring a vintage botanical print of delicate forget-me-not flowers. This mug captures the essence of classic floral illustrations, making it the perfect gift for garden and nature lovers alike. Great for use at home or in the office, it's sure to add a touch of elegance to your daily routine.	11.99	4	2024-04-23 04:27:26.972604	2024-04-23 04:27:27.984056	f	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20240313035152
20240313035259
20240313035325
20240313035741
20240313035803
20240313035836
20240314194103
20240314194111
20240321033635
20240321033746
20240321033747
20240327034615
20240409050853
20240412032309
20240416024945
20240416032649
20240418055326
\.


--
-- Data for Name: static_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.static_pages (id, title, content, slug, created_at, updated_at) FROM stdin;
1	About	\N	about-us	2024-03-22 03:57:34.722334	2024-03-22 03:57:34.840392
\.


--
-- Data for Name: tax_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_rates (id, province, gst, pst, hst, created_at, updated_at) FROM stdin;
1	Alberta	5.0	0.0	0.0	2024-04-17 04:43:08.232752	2024-04-17 04:43:08.232752
2	British Columbia	5.0	7.0	0.0	2024-04-17 04:43:08.241573	2024-04-17 04:43:08.241573
3	Manitoba	5.0	7.0	0.0	2024-04-17 04:43:08.247787	2024-04-17 04:43:08.247787
4	New Brunswick	0.0	0.0	15.0	2024-04-17 04:43:08.253804	2024-04-17 04:43:08.253804
5	Newfoundland and Labrador	0.0	0.0	15.0	2024-04-17 04:43:08.259281	2024-04-17 04:43:08.259281
6	Northwest Territories	5.0	0.0	0.0	2024-04-17 04:43:08.268924	2024-04-17 04:43:08.268924
7	Nova Scotia	0.0	0.0	15.0	2024-04-17 04:43:08.274962	2024-04-17 04:43:08.274962
8	Nunavut	5.0	0.0	0.0	2024-04-17 04:43:08.280791	2024-04-17 04:43:08.280791
9	Ontario	0.0	0.0	13.0	2024-04-17 04:43:08.286373	2024-04-17 04:43:08.286373
10	Prince Edward Island	0.0	0.0	15.0	2024-04-17 04:43:08.292042	2024-04-17 04:43:08.292042
11	Quebec	5.0	9.975	0.0	2024-04-17 04:43:08.297842	2024-04-17 04:43:08.297842
12	Saskatchewan	5.0	6.0	0.0	2024-04-17 04:43:08.303513	2024-04-17 04:43:08.303513
13	Yukon	5.0	0.0	0.0	2024-04-17 04:43:08.31071	2024-04-17 04:43:08.31071
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password_digest, name, role, created_at, updated_at, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at) FROM stdin;
1	test@testing.ca	\N	Tester 1	\N	2024-04-12 04:33:43.351746	2024-04-17 19:52:05.083735	$2a$12$hdTmgzqucXc7ZklqhCf5..iAw835DrKK03FgDtKR.RXnktWZmHAkS	\N	\N	\N
2	test1@testing.ca	\N	Tester 2	\N	2024-04-18 04:15:29.496505	2024-04-18 04:15:29.496505	$2a$12$pU3cskUfA5KbiNu4N7.GcOHC1zt5i74Ag5rzYaddhOO7laQkkIxoi	\N	\N	\N
6	test2@testing.ca	\N	Tester 2	\N	2024-04-19 20:22:47.163941	2024-04-19 20:22:47.163941	$2a$12$zjTUTmdzVBiuKNpcrzg.RunV/t0CMh/eCSvXry6S6l9d3NuC06VH6	\N	\N	\N
7	test3@testing.ca	\N	Tester 3	\N	2024-04-23 04:44:00.713055	2024-04-23 04:44:00.713055	$2a$12$SpoOXGT4ro/Ti8olLJhGk.8SWwil5YooGF4lKnhe7UhZkS1rcyS9i	\N	\N	\N
8	loco@test.com	\N	Eltoro	\N	2024-04-24 18:41:46.342276	2024-04-24 18:41:46.342276	$2a$12$3G8MZB4UhBxnSKhpbGIS5OFcr1D/kk09BNwxp8CGjJNZI7bw0Cjfu	\N	\N	\N
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 1, true);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 62, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 62, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 42, true);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 13, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 51, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 31, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 15, true);


--
-- Name: static_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.static_pages_id_seq', 1, true);


--
-- Name: tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_rates_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: static_pages static_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.static_pages
    ADD CONSTRAINT static_pages_pkey PRIMARY KEY (id);


--
-- Name: tax_rates tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rates
    ADD CONSTRAINT tax_rates_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_admin_comments_on_author; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_admin_comments_on_author ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_admin_comments_on_resource ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_admin_users_on_email ON public.admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON public.admin_users USING btree (reset_password_token);


--
-- Name: index_orders_on_billing_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_orders_on_billing_address_id ON public.orders USING btree (billing_address_id);


--
-- Name: index_orders_on_shipping_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_orders_on_shipping_address_id ON public.orders USING btree (shipping_address_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: orders fk_rails_267c198c1b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_267c198c1b FOREIGN KEY (shipping_address_id) REFERENCES public.addresses(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: orders fk_rails_b7a8fe49ff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_b7a8fe49ff FOREIGN KEY (billing_address_id) REFERENCES public.addresses(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

