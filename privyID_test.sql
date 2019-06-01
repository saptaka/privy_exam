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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id bigint DEFAULT nextval('public.serial'::regclass) NOT NULL,
    name text NOT NULL,
    enable boolean NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_product (
    product_id bigint NOT NULL,
    category_id bigint NOT NULL,
    id bigint DEFAULT nextval('public.serial'::regclass) NOT NULL
);


ALTER TABLE public.category_product OWNER TO postgres;

--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id bigint DEFAULT nextval('public.serial'::regclass) NOT NULL,
    name text NOT NULL,
    file text NOT NULL,
    enable boolean NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id bigint DEFAULT nextval('public.serial'::regclass) NOT NULL,
    name text,
    description text,
    enable boolean NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_image (
    id bigint DEFAULT nextval('public.serial'::regclass) NOT NULL,
    product_id bigint NOT NULL,
    image_id bigint NOT NULL
);


ALTER TABLE public.product_image OWNER TO postgres;

--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, enable) FROM stdin;
\.


--
-- Data for Name: category_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_product (product_id, category_id, id) FROM stdin;
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.image (id, name, file, enable) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, description, enable) FROM stdin;
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
116	Signature	handwriting signature	t
\.


--
-- Data for Name: product_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_image (id, product_id, image_id) FROM stdin;
\.


--
-- Name: serial; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serial', 116, true);


--
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- Name: image image_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pk PRIMARY KEY (id);


--
-- Name: product_image product_image_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_pk PRIMARY KEY (id);


--
-- Name: product product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pk PRIMARY KEY (id);


--
-- Name: category_product_product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX category_product_product_id_idx ON public.category_product USING btree (product_id);


--
-- Name: image_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX image_id_idx ON public.image USING btree (id);


--
-- Name: newtable_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX newtable_id_idx ON public.category USING btree (id);


--
-- Name: product_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_id_idx ON public.product USING btree (id);


--
-- Name: product_image_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_image_id_idx ON public.product_image USING btree (id, product_id, image_id);


--
-- Name: category_product category_product_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_product
    ADD CONSTRAINT category_product_category_fk FOREIGN KEY (id) REFERENCES public.category(id);


--
-- Name: category_product category_product_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_product
    ADD CONSTRAINT category_product_product_fk FOREIGN KEY (id) REFERENCES public.product(id);


--
-- Name: product_image product_image_image_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_image_fk FOREIGN KEY (id) REFERENCES public.image(id);


--
-- Name: product_image product_image_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_product_fk FOREIGN KEY (id) REFERENCES public.product(id);


--
-- PostgreSQL database dump complete
--

