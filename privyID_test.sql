--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1 (Debian 11.1-1.pgdg90+1)
-- Dumped by pg_dump version 11.1 (Debian 11.1-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: serial; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serial
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.serial OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: category_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_products (
    product_id bigint NOT NULL,
    category_id bigint NOT NULL,
    id bigint DEFAULT nextval('public.serial'::regclass) NOT NULL
);


ALTER TABLE public.category_products OWNER TO postgres;

--
-- Name: categorys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorys (
    id bigint DEFAULT nextval('public.serial'::regclass) NOT NULL,
    name text NOT NULL,
    enable boolean NOT NULL
);


ALTER TABLE public.categorys OWNER TO postgres;

--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id bigint DEFAULT nextval('public.serial'::regclass) NOT NULL,
    name text NOT NULL,
    file text NOT NULL,
    enable boolean NOT NULL
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    id bigint DEFAULT nextval('public.serial'::regclass) NOT NULL,
    product_id bigint NOT NULL,
    image_id bigint NOT NULL
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint DEFAULT nextval('public.serial'::regclass) NOT NULL,
    name text,
    description text,
    enable boolean NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Data for Name: category_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_products (product_id, category_id, id) FROM stdin;
\.


--
-- Data for Name: categorys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorys (id, name, enable) FROM stdin;
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, name, file, enable) FROM stdin;
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, product_id, image_id) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, enable) FROM stdin;
101			f
102			f
103	API	Interface to get access to database	f
104	API	Interface to get access to database	f
105	API	Interface to get access to database	t
106	API	Interface to get access to database	t
107	api	interface to procced data into database	t
108	api	interface to procced data into database	f
109	api	interface to procced data into database	f
110	api	interface to procced data into database	t
111	Signature	handwriting signature	t
112	Signature	handwriting signature	t
113	Signature	handwriting signature	t
114	Signature	handwriting signature	t
115	Signature	handwriting signature	t
\.


--
-- Name: serial; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serial', 115, true);


--
-- Name: categorys category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorys
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- Name: images image_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT image_pk PRIMARY KEY (id);


--
-- Name: product_images product_image_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_image_pk PRIMARY KEY (id);


--
-- Name: products product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_pk PRIMARY KEY (id);


--
-- Name: category_product_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX category_product_product_id_idx ON public.category_products USING btree (product_id);


--
-- Name: image_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX image_id_idx ON public.images USING btree (id);


--
-- Name: newtable_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX newtable_id_idx ON public.categorys USING btree (id);


--
-- Name: product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_id_idx ON public.products USING btree (id);


--
-- Name: product_image_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_image_id_idx ON public.product_images USING btree (id, product_id, image_id);


--
-- Name: category_products category_product_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_products
    ADD CONSTRAINT category_product_category_fk FOREIGN KEY (id) REFERENCES public.categorys(id);


--
-- Name: category_products category_product_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_products
    ADD CONSTRAINT category_product_product_fk FOREIGN KEY (id) REFERENCES public.products(id);


--
-- Name: product_images product_image_image_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_image_image_fk FOREIGN KEY (id) REFERENCES public.images(id);


--
-- Name: product_images product_image_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_image_product_fk FOREIGN KEY (id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

