--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-2.pgdg90+1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-2.pgdg90+1)

-- Started on 2021-01-10 22:53:18 -04

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

SET default_with_oids = false;

--
-- TOC entry 318 (class 1259 OID 215340)
-- Name: skus; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.skus (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "shopId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.skus OWNER TO angelds;

--
-- TOC entry 317 (class 1259 OID 215338)
-- Name: skus_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.skus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skus_id_seq OWNER TO angelds;

--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 317
-- Name: skus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.skus_id_seq OWNED BY public.skus.id;


--
-- TOC entry 3106 (class 2604 OID 215343)
-- Name: skus id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.skus ALTER COLUMN id SET DEFAULT nextval('public.skus_id_seq'::regclass);


--
-- TOC entry 3234 (class 0 OID 215340)
-- Dependencies: 318
-- Data for Name: skus; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.skus (id, name, "shopId", "createdAt", "updatedAt") VALUES (1, 'Papelon Rayado', 115, '2020-10-29 01:08:38.842-04', '2020-11-01 20:10:52.78-04');
INSERT INTO public.skus (id, name, "shopId", "createdAt", "updatedAt") VALUES (5, 'Queso palmito', 115, '2020-11-01 20:57:24.751-04', '2020-11-01 20:57:24.751-04');
INSERT INTO public.skus (id, name, "shopId", "createdAt", "updatedAt") VALUES (6, 'Queso palmito', 123, '2020-11-10 14:48:02.453-04', '2020-11-10 14:48:02.453-04');
INSERT INTO public.skus (id, name, "shopId", "createdAt", "updatedAt") VALUES (7, 'Arroz Picao', 123, '2020-11-10 14:48:16.771-04', '2020-11-10 14:48:16.771-04');


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 317
-- Name: skus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.skus_id_seq', 8, true);


--
-- TOC entry 3108 (class 2606 OID 215389)
-- Name: skus sku_unique_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.skus
    ADD CONSTRAINT sku_unique_key UNIQUE (name, "shopId");


--
-- TOC entry 3110 (class 2606 OID 215345)
-- Name: skus skus_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.skus
    ADD CONSTRAINT skus_pkey PRIMARY KEY (id);


--
-- TOC entry 3111 (class 2606 OID 215346)
-- Name: skus skus_shopId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.skus
    ADD CONSTRAINT "skus_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES public.shops(id);


-- Completed on 2021-01-10 22:53:18 -04

--
-- PostgreSQL database dump complete
--

