--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-2.pgdg90+1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-2.pgdg90+1)

-- Started on 2020-10-27 15:46:42 -04

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
-- TOC entry 216 (class 1259 OID 100574)
-- Name: Accounts; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Accounts" (
    id integer NOT NULL,
    name character varying(255),
    pass character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "peopleId" integer,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "confirmStatus" boolean DEFAULT false,
    "hashConfirm" text,
    preference jsonb
);


ALTER TABLE public."Accounts" OWNER TO angelds;

--
-- TOC entry 217 (class 1259 OID 100580)
-- Name: Accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Accounts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Accounts_id_seq" OWNER TO angelds;

--
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 217
-- Name: Accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Accounts_id_seq" OWNED BY public."Accounts".id;


--
-- TOC entry 254 (class 1259 OID 101252)
-- Name: Bids; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Bids" (
    id integer NOT NULL,
    "bidType" integer NOT NULL,
    title character varying(255) NOT NULL,
    "brandId" integer NOT NULL,
    "longDesc" text NOT NULL,
    "smallDesc" character varying(255) NOT NULL,
    disponibility integer NOT NULL,
    "time" integer NOT NULL,
    devolution boolean,
    include character varying(255) NOT NULL,
    customize character varying(255),
    garanty character varying(255),
    tags json,
    photos jsonb NOT NULL,
    category json NOT NULL,
    variation json NOT NULL,
    "shopId" integer NOT NULL,
    "WarehouseId" integer,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    schedule jsonb,
    weight character varying NOT NULL,
    materials jsonb,
    reasons jsonb,
    customizable boolean NOT NULL,
    dimesion jsonb
);


ALTER TABLE public."Bids" OWNER TO angelds;

--
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN "Bids".weight; Type: COMMENT; Schema: public; Owner: angelds
--

COMMENT ON COLUMN public."Bids".weight IS 'Peso del producto';


--
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN "Bids".materials; Type: COMMENT; Schema: public; Owner: angelds
--

COMMENT ON COLUMN public."Bids".materials IS 'Materiales de Fabricación del Producto';


--
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN "Bids".reasons; Type: COMMENT; Schema: public; Owner: angelds
--

COMMENT ON COLUMN public."Bids".reasons IS 'Motivos de la publicaión';


--
-- TOC entry 3608 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN "Bids".customizable; Type: COMMENT; Schema: public; Owner: angelds
--

COMMENT ON COLUMN public."Bids".customizable IS 'para saber su un producto es personalizable';


--
-- TOC entry 3609 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN "Bids".dimesion; Type: COMMENT; Schema: public; Owner: angelds
--

COMMENT ON COLUMN public."Bids".dimesion IS 'Dimesion Alto x Largo x Profundo';


--
-- TOC entry 253 (class 1259 OID 101250)
-- Name: Bids_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Bids_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Bids_id_seq" OWNER TO angelds;

--
-- TOC entry 3610 (class 0 OID 0)
-- Dependencies: 253
-- Name: Bids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Bids_id_seq" OWNED BY public."Bids".id;


--
-- TOC entry 252 (class 1259 OID 101189)
-- Name: Brands; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Brands" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Brands" OWNER TO angelds;

--
-- TOC entry 251 (class 1259 OID 101187)
-- Name: Brands_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Brands_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Brands_id_seq" OWNER TO angelds;

--
-- TOC entry 3611 (class 0 OID 0)
-- Dependencies: 251
-- Name: Brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Brands_id_seq" OWNED BY public."Brands".id;


--
-- TOC entry 218 (class 1259 OID 100600)
-- Name: Dashboards; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Dashboards" (
    id integer NOT NULL,
    "ModuleId" integer NOT NULL,
    "subModuleId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    path character varying(255),
    icontype character varying(255),
    "StatusId" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public."Dashboards" OWNER TO angelds;

--
-- TOC entry 219 (class 1259 OID 100607)
-- Name: Dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Dashboards_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Dashboards_id_seq" OWNER TO angelds;

--
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 219
-- Name: Dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Dashboards_id_seq" OWNED BY public."Dashboards".id;


--
-- TOC entry 220 (class 1259 OID 100609)
-- Name: Genders; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Genders" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Genders" OWNER TO angelds;

--
-- TOC entry 221 (class 1259 OID 100612)
-- Name: Genders_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Genders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Genders_id_seq" OWNER TO angelds;

--
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 221
-- Name: Genders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Genders_id_seq" OWNED BY public."Genders".id;


--
-- TOC entry 222 (class 1259 OID 100614)
-- Name: Modules; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Modules" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    description text
);


ALTER TABLE public."Modules" OWNER TO angelds;

--
-- TOC entry 223 (class 1259 OID 100617)
-- Name: Modules_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Modules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Modules_id_seq" OWNER TO angelds;

--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 223
-- Name: Modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Modules_id_seq" OWNED BY public."Modules".id;


--
-- TOC entry 224 (class 1259 OID 100619)
-- Name: Nationalities; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Nationalities" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Nationalities" OWNER TO angelds;

--
-- TOC entry 225 (class 1259 OID 100622)
-- Name: Nationalities_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Nationalities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Nationalities_id_seq" OWNER TO angelds;

--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 225
-- Name: Nationalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Nationalities_id_seq" OWNED BY public."Nationalities".id;


--
-- TOC entry 226 (class 1259 OID 100624)
-- Name: People; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."People" (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    "genderId" integer NOT NULL,
    "nationalityId" integer NOT NULL,
    "birthDate" timestamp with time zone NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    document jsonb
);


ALTER TABLE public."People" OWNER TO angelds;

--
-- TOC entry 227 (class 1259 OID 100630)
-- Name: People_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."People_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."People_id_seq" OWNER TO angelds;

--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 227
-- Name: People_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."People_id_seq" OWNED BY public."People".id;


--
-- TOC entry 228 (class 1259 OID 100632)
-- Name: Permissions; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Permissions" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Permissions" OWNER TO angelds;

--
-- TOC entry 229 (class 1259 OID 100635)
-- Name: Permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Permissions_id_seq" OWNER TO angelds;

--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 229
-- Name: Permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Permissions_id_seq" OWNED BY public."Permissions".id;


--
-- TOC entry 230 (class 1259 OID 100642)
-- Name: Properties; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Properties" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Properties" OWNER TO angelds;

--
-- TOC entry 231 (class 1259 OID 100645)
-- Name: Properties_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Properties_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Properties_id_seq" OWNER TO angelds;

--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 231
-- Name: Properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Properties_id_seq" OWNED BY public."Properties".id;


--
-- TOC entry 232 (class 1259 OID 100652)
-- Name: Roles; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Roles" OWNER TO angelds;

--
-- TOC entry 233 (class 1259 OID 100655)
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Roles_id_seq" OWNER TO angelds;

--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 233
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;


--
-- TOC entry 234 (class 1259 OID 100657)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO angelds;

--
-- TOC entry 235 (class 1259 OID 100660)
-- Name: Status; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Status" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Status" OWNER TO angelds;

--
-- TOC entry 236 (class 1259 OID 100663)
-- Name: Status_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Status_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Status_id_seq" OWNER TO angelds;

--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 236
-- Name: Status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Status_id_seq" OWNED BY public."Status".id;


--
-- TOC entry 256 (class 1259 OID 116969)
-- Name: Subscribes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Subscribes" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "hashConfirm" jsonb
);


ALTER TABLE public."Subscribes" OWNER TO angelds;

--
-- TOC entry 255 (class 1259 OID 116967)
-- Name: Subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Subscribes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Subscribes_id_seq" OWNER TO angelds;

--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 255
-- Name: Subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Subscribes_id_seq" OWNED BY public."Subscribes".id;


--
-- TOC entry 237 (class 1259 OID 100670)
-- Name: Warehouses; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Warehouses" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    address jsonb,
    phone jsonb,
    "shopId" integer
);


ALTER TABLE public."Warehouses" OWNER TO angelds;

--
-- TOC entry 238 (class 1259 OID 100673)
-- Name: Warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Warehouses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Warehouses_id_seq" OWNER TO angelds;

--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 238
-- Name: Warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Warehouses_id_seq" OWNED BY public."Warehouses".id;


--
-- TOC entry 239 (class 1259 OID 100675)
-- Name: accountRoles; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."accountRoles" (
    id integer NOT NULL,
    "AccountId" integer NOT NULL,
    "RoleId" integer NOT NULL,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."accountRoles" OWNER TO angelds;

--
-- TOC entry 240 (class 1259 OID 100678)
-- Name: accountRoles_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."accountRoles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."accountRoles_id_seq" OWNER TO angelds;

--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 240
-- Name: accountRoles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."accountRoles_id_seq" OWNED BY public."accountRoles".id;


--
-- TOC entry 241 (class 1259 OID 100685)
-- Name: addressTypes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."addressTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."addressTypes" OWNER TO angelds;

--
-- TOC entry 242 (class 1259 OID 100688)
-- Name: addressTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."addressTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."addressTypes_id_seq" OWNER TO angelds;

--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 242
-- Name: addressTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."addressTypes_id_seq" OWNED BY public."addressTypes".id;


--
-- TOC entry 266 (class 1259 OID 117176)
-- Name: affirmations; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.affirmations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.affirmations OWNER TO angelds;

--
-- TOC entry 265 (class 1259 OID 117174)
-- Name: affirmations_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.affirmations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.affirmations_id_seq OWNER TO angelds;

--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 265
-- Name: affirmations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.affirmations_id_seq OWNED BY public.affirmations.id;


--
-- TOC entry 286 (class 1259 OID 149797)
-- Name: attachments; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.attachments (
    id integer NOT NULL,
    data bytea NOT NULL,
    tabs jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.attachments OWNER TO angelds;

--
-- TOC entry 285 (class 1259 OID 149795)
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO angelds;

--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 285
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- TOC entry 274 (class 1259 OID 125202)
-- Name: banks; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.banks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sbif character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.banks OWNER TO angelds;

--
-- TOC entry 273 (class 1259 OID 125200)
-- Name: banks_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.banks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banks_id_seq OWNER TO angelds;

--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 273
-- Name: banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;


--
-- TOC entry 284 (class 1259 OID 149787)
-- Name: bidTypes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."bidTypes" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."bidTypes" OWNER TO angelds;

--
-- TOC entry 283 (class 1259 OID 149785)
-- Name: bidTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."bidTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."bidTypes_id_seq" OWNER TO angelds;

--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 283
-- Name: bidTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."bidTypes_id_seq" OWNED BY public."bidTypes".id;


--
-- TOC entry 308 (class 1259 OID 174488)
-- Name: cat1s; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.cat1s (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    url character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.cat1s OWNER TO angelds;

--
-- TOC entry 307 (class 1259 OID 174486)
-- Name: cat1s_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.cat1s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cat1s_id_seq OWNER TO angelds;

--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 307
-- Name: cat1s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.cat1s_id_seq OWNED BY public.cat1s.id;


--
-- TOC entry 310 (class 1259 OID 174499)
-- Name: cat2s; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.cat2s (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    url character varying(255),
    "cat1Id" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.cat2s OWNER TO angelds;

--
-- TOC entry 309 (class 1259 OID 174497)
-- Name: cat2s_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.cat2s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cat2s_id_seq OWNER TO angelds;

--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 309
-- Name: cat2s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.cat2s_id_seq OWNED BY public.cat2s.id;


--
-- TOC entry 312 (class 1259 OID 174510)
-- Name: cat3s; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.cat3s (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    url character varying(255),
    "cat2Id" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.cat3s OWNER TO angelds;

--
-- TOC entry 311 (class 1259 OID 174508)
-- Name: cat3s_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.cat3s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cat3s_id_seq OWNER TO angelds;

--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 311
-- Name: cat3s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.cat3s_id_seq OWNED BY public.cat3s.id;


--
-- TOC entry 314 (class 1259 OID 174521)
-- Name: cat4s; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.cat4s (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    url character varying(255) NOT NULL,
    "cat3Id" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.cat4s OWNER TO angelds;

--
-- TOC entry 313 (class 1259 OID 174519)
-- Name: cat4s_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.cat4s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cat4s_id_seq OWNER TO angelds;

--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 313
-- Name: cat4s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.cat4s_id_seq OWNED BY public.cat4s.id;


--
-- TOC entry 294 (class 1259 OID 166170)
-- Name: civilStatuses; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."civilStatuses" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."civilStatuses" OWNER TO angelds;

--
-- TOC entry 293 (class 1259 OID 166168)
-- Name: civilStatuses_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."civilStatuses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."civilStatuses_id_seq" OWNER TO angelds;

--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 293
-- Name: civilStatuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."civilStatuses_id_seq" OWNED BY public."civilStatuses".id;


--
-- TOC entry 280 (class 1259 OID 125317)
-- Name: comunas; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.comunas (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "provinceId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.comunas OWNER TO angelds;

--
-- TOC entry 279 (class 1259 OID 125315)
-- Name: comunas_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.comunas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comunas_id_seq OWNER TO angelds;

--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 279
-- Name: comunas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.comunas_id_seq OWNED BY public.comunas.id;


--
-- TOC entry 243 (class 1259 OID 100695)
-- Name: dashboardPermissions; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."dashboardPermissions" (
    id integer NOT NULL,
    "DashboardId" integer NOT NULL,
    "PermissionId" integer NOT NULL,
    "StatusId" integer DEFAULT 2 NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."dashboardPermissions" OWNER TO angelds;

--
-- TOC entry 244 (class 1259 OID 100699)
-- Name: dashboardPermissions_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."dashboardPermissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."dashboardPermissions_id_seq" OWNER TO angelds;

--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 244
-- Name: dashboardPermissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."dashboardPermissions_id_seq" OWNED BY public."dashboardPermissions".id;


--
-- TOC entry 304 (class 1259 OID 174435)
-- Name: deliveries; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.deliveries (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.deliveries OWNER TO angelds;

--
-- TOC entry 303 (class 1259 OID 174433)
-- Name: deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.deliveries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deliveries_id_seq OWNER TO angelds;

--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 303
-- Name: deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.deliveries_id_seq OWNED BY public.deliveries.id;


--
-- TOC entry 288 (class 1259 OID 149814)
-- Name: disponibilities; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.disponibilities (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.disponibilities OWNER TO angelds;

--
-- TOC entry 287 (class 1259 OID 149812)
-- Name: disponibilities_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.disponibilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disponibilities_id_seq OWNER TO angelds;

--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 287
-- Name: disponibilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.disponibilities_id_seq OWNED BY public.disponibilities.id;


--
-- TOC entry 268 (class 1259 OID 117191)
-- Name: docTypes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."docTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "peopleTypeId" integer
);


ALTER TABLE public."docTypes" OWNER TO angelds;

--
-- TOC entry 267 (class 1259 OID 117189)
-- Name: docTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."docTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."docTypes_id_seq" OWNER TO angelds;

--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 267
-- Name: docTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."docTypes_id_seq" OWNED BY public."docTypes".id;


--
-- TOC entry 306 (class 1259 OID 174459)
-- Name: envoiceNotifies; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."envoiceNotifies" (
    id integer NOT NULL,
    "envoiceTypeId" integer,
    "envoiceNum" integer NOT NULL,
    "dateNotify" timestamp with time zone NOT NULL,
    "deliveryId" integer,
    taxes json,
    "attachmentId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "shopId" integer
);


ALTER TABLE public."envoiceNotifies" OWNER TO angelds;

--
-- TOC entry 305 (class 1259 OID 174457)
-- Name: envoiceNotifies_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."envoiceNotifies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."envoiceNotifies_id_seq" OWNER TO angelds;

--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 305
-- Name: envoiceNotifies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."envoiceNotifies_id_seq" OWNED BY public."envoiceNotifies".id;


--
-- TOC entry 302 (class 1259 OID 174387)
-- Name: envoiceTypes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."envoiceTypes" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."envoiceTypes" OWNER TO angelds;

--
-- TOC entry 301 (class 1259 OID 174385)
-- Name: envoiceTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."envoiceTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."envoiceTypes_id_seq" OWNER TO angelds;

--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 301
-- Name: envoiceTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."envoiceTypes_id_seq" OWNED BY public."envoiceTypes".id;


--
-- TOC entry 245 (class 1259 OID 100701)
-- Name: grantRoles; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."grantRoles" (
    id integer NOT NULL,
    "dashboardPermissionId" integer NOT NULL,
    "RoleId" integer NOT NULL,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."grantRoles" OWNER TO angelds;

--
-- TOC entry 246 (class 1259 OID 100704)
-- Name: grantRoles_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."grantRoles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."grantRoles_id_seq" OWNER TO angelds;

--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 246
-- Name: grantRoles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."grantRoles_id_seq" OWNED BY public."grantRoles".id;


--
-- TOC entry 292 (class 1259 OID 149834)
-- Name: materials; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.materials (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.materials OWNER TO angelds;

--
-- TOC entry 291 (class 1259 OID 149832)
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_id_seq OWNER TO angelds;

--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 291
-- Name: materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;


--
-- TOC entry 316 (class 1259 OID 207131)
-- Name: peopleTypes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."peopleTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."peopleTypes" OWNER TO angelds;

--
-- TOC entry 315 (class 1259 OID 207129)
-- Name: peopleTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."peopleTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."peopleTypes_id_seq" OWNER TO angelds;

--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 315
-- Name: peopleTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."peopleTypes_id_seq" OWNED BY public."peopleTypes".id;


--
-- TOC entry 260 (class 1259 OID 117131)
-- Name: phoneTypes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."phoneTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."phoneTypes" OWNER TO angelds;

--
-- TOC entry 259 (class 1259 OID 117129)
-- Name: phoneTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."phoneTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."phoneTypes_id_seq" OWNER TO angelds;

--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 259
-- Name: phoneTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."phoneTypes_id_seq" OWNED BY public."phoneTypes".id;


--
-- TOC entry 247 (class 1259 OID 100706)
-- Name: postalCodes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."postalCodes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."postalCodes" OWNER TO angelds;

--
-- TOC entry 248 (class 1259 OID 100709)
-- Name: postalCodes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."postalCodes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."postalCodes_id_seq" OWNER TO angelds;

--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 248
-- Name: postalCodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."postalCodes_id_seq" OWNED BY public."postalCodes".id;


--
-- TOC entry 270 (class 1259 OID 125151)
-- Name: processTypes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."processTypes" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."processTypes" OWNER TO angelds;

--
-- TOC entry 269 (class 1259 OID 125149)
-- Name: processTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."processTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."processTypes_id_seq" OWNER TO angelds;

--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 269
-- Name: processTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."processTypes_id_seq" OWNED BY public."processTypes".id;


--
-- TOC entry 278 (class 1259 OID 125292)
-- Name: provinces; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "regionId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.provinces OWNER TO angelds;

--
-- TOC entry 277 (class 1259 OID 125290)
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provinces_id_seq OWNER TO angelds;

--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 277
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;


--
-- TOC entry 290 (class 1259 OID 149824)
-- Name: reasons; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.reasons (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.reasons OWNER TO angelds;

--
-- TOC entry 289 (class 1259 OID 149822)
-- Name: reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.reasons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reasons_id_seq OWNER TO angelds;

--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 289
-- Name: reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.reasons_id_seq OWNED BY public.reasons.id;


--
-- TOC entry 276 (class 1259 OID 125227)
-- Name: regions; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ordinal character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.regions OWNER TO angelds;

--
-- TOC entry 275 (class 1259 OID 125225)
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO angelds;

--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 275
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- TOC entry 264 (class 1259 OID 117161)
-- Name: salesChannels; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."salesChannels" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."salesChannels" OWNER TO angelds;

--
-- TOC entry 263 (class 1259 OID 117159)
-- Name: salesChannels_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."salesChannels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."salesChannels_id_seq" OWNER TO angelds;

--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 263
-- Name: salesChannels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."salesChannels_id_seq" OWNED BY public."salesChannels".id;


--
-- TOC entry 296 (class 1259 OID 166188)
-- Name: shopContracts; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."shopContracts" (
    id integer NOT NULL,
    "contractId" integer NOT NULL,
    "shopId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "contractDesc" jsonb
);


ALTER TABLE public."shopContracts" OWNER TO angelds;

--
-- TOC entry 295 (class 1259 OID 166186)
-- Name: shopContracts_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."shopContracts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."shopContracts_id_seq" OWNER TO angelds;

--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 295
-- Name: shopContracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."shopContracts_id_seq" OWNED BY public."shopContracts".id;


--
-- TOC entry 258 (class 1259 OID 117025)
-- Name: shopRequests; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."shopRequests" (
    id integer NOT NULL,
    "AccountId" integer NOT NULL,
    status jsonb NOT NULL,
    phone jsonb NOT NULL,
    marca character varying(400) NOT NULL,
    "storeType" jsonb NOT NULL,
    "startActivity" boolean NOT NULL,
    "isStore" boolean NOT NULL,
    "descShop" character varying(400) NOT NULL,
    "salesChannels" jsonb NOT NULL,
    affirmations jsonb NOT NULL,
    employees integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    process jsonb
);


ALTER TABLE public."shopRequests" OWNER TO angelds;

--
-- TOC entry 257 (class 1259 OID 117023)
-- Name: shopRequests_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."shopRequests_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."shopRequests_id_seq" OWNER TO angelds;

--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 257
-- Name: shopRequests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."shopRequests_id_seq" OWNED BY public."shopRequests".id;


--
-- TOC entry 272 (class 1259 OID 125179)
-- Name: shops; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.shops (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    logo character varying(255),
    "shopDescription" text NOT NULL,
    "isLocal" boolean,
    employees integer,
    partner jsonb,
    address jsonb,
    "paymentCong" jsonb,
    "startActivityAttachment" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "shopRequestId" integer,
    "processId" jsonb,
    "statusId" integer NOT NULL,
    phone jsonb NOT NULL,
    "startActivity" boolean NOT NULL,
    "storeType" jsonb NOT NULL
);


ALTER TABLE public.shops OWNER TO angelds;

--
-- TOC entry 271 (class 1259 OID 125177)
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.shops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shops_id_seq OWNER TO angelds;

--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 271
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.shops_id_seq OWNED BY public.shops.id;


--
-- TOC entry 282 (class 1259 OID 149777)
-- Name: statusProcesses; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."statusProcesses" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."statusProcesses" OWNER TO angelds;

--
-- TOC entry 281 (class 1259 OID 149775)
-- Name: statusProcesses_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."statusProcesses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."statusProcesses_id_seq" OWNER TO angelds;

--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 281
-- Name: statusProcesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."statusProcesses_id_seq" OWNED BY public."statusProcesses".id;


--
-- TOC entry 262 (class 1259 OID 117146)
-- Name: storeTypes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."storeTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."storeTypes" OWNER TO angelds;

--
-- TOC entry 261 (class 1259 OID 117144)
-- Name: storeTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."storeTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."storeTypes_id_seq" OWNER TO angelds;

--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 261
-- Name: storeTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."storeTypes_id_seq" OWNED BY public."storeTypes".id;


--
-- TOC entry 249 (class 1259 OID 100711)
-- Name: subModules; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."subModules" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    route character varying(255) NOT NULL,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ModuleId" integer NOT NULL,
    description text
);


ALTER TABLE public."subModules" OWNER TO angelds;

--
-- TOC entry 250 (class 1259 OID 100717)
-- Name: subModules_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."subModules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."subModules_id_seq" OWNER TO angelds;

--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 250
-- Name: subModules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."subModules_id_seq" OWNED BY public."subModules".id;


--
-- TOC entry 300 (class 1259 OID 174369)
-- Name: taxValues; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."taxValues" (
    id integer NOT NULL,
    "taxId" integer,
    value numeric,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."taxValues" OWNER TO angelds;

--
-- TOC entry 299 (class 1259 OID 174367)
-- Name: taxValues_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."taxValues_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."taxValues_id_seq" OWNER TO angelds;

--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 299
-- Name: taxValues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."taxValues_id_seq" OWNED BY public."taxValues".id;


--
-- TOC entry 298 (class 1259 OID 174359)
-- Name: taxes; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public.taxes (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.taxes OWNER TO angelds;

--
-- TOC entry 297 (class 1259 OID 174357)
-- Name: taxes_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public.taxes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxes_id_seq OWNER TO angelds;

--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 297
-- Name: taxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public.taxes_id_seq OWNED BY public.taxes.id;


--
-- TOC entry 3078 (class 2604 OID 100719)
-- Name: Accounts id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts" ALTER COLUMN id SET DEFAULT nextval('public."Accounts_id_seq"'::regclass);


--
-- TOC entry 3099 (class 2604 OID 101255)
-- Name: Bids id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids" ALTER COLUMN id SET DEFAULT nextval('public."Bids_id_seq"'::regclass);


--
-- TOC entry 3098 (class 2604 OID 101192)
-- Name: Brands id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Brands" ALTER COLUMN id SET DEFAULT nextval('public."Brands_id_seq"'::regclass);


--
-- TOC entry 3081 (class 2604 OID 100723)
-- Name: Dashboards id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards" ALTER COLUMN id SET DEFAULT nextval('public."Dashboards_id_seq"'::regclass);


--
-- TOC entry 3082 (class 2604 OID 100724)
-- Name: Genders id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Genders" ALTER COLUMN id SET DEFAULT nextval('public."Genders_id_seq"'::regclass);


--
-- TOC entry 3083 (class 2604 OID 100725)
-- Name: Modules id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Modules" ALTER COLUMN id SET DEFAULT nextval('public."Modules_id_seq"'::regclass);


--
-- TOC entry 3084 (class 2604 OID 100726)
-- Name: Nationalities id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Nationalities" ALTER COLUMN id SET DEFAULT nextval('public."Nationalities_id_seq"'::regclass);


--
-- TOC entry 3085 (class 2604 OID 100727)
-- Name: People id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People" ALTER COLUMN id SET DEFAULT nextval('public."People_id_seq"'::regclass);


--
-- TOC entry 3086 (class 2604 OID 100728)
-- Name: Permissions id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Permissions" ALTER COLUMN id SET DEFAULT nextval('public."Permissions_id_seq"'::regclass);


--
-- TOC entry 3087 (class 2604 OID 100730)
-- Name: Properties id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Properties" ALTER COLUMN id SET DEFAULT nextval('public."Properties_id_seq"'::regclass);


--
-- TOC entry 3088 (class 2604 OID 100732)
-- Name: Roles id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);


--
-- TOC entry 3089 (class 2604 OID 100733)
-- Name: Status id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Status" ALTER COLUMN id SET DEFAULT nextval('public."Status_id_seq"'::regclass);


--
-- TOC entry 3100 (class 2604 OID 116972)
-- Name: Subscribes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Subscribes" ALTER COLUMN id SET DEFAULT nextval('public."Subscribes_id_seq"'::regclass);


--
-- TOC entry 3090 (class 2604 OID 100735)
-- Name: Warehouses id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Warehouses" ALTER COLUMN id SET DEFAULT nextval('public."Warehouses_id_seq"'::regclass);


--
-- TOC entry 3091 (class 2604 OID 100736)
-- Name: accountRoles id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles" ALTER COLUMN id SET DEFAULT nextval('public."accountRoles_id_seq"'::regclass);


--
-- TOC entry 3092 (class 2604 OID 100738)
-- Name: addressTypes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."addressTypes" ALTER COLUMN id SET DEFAULT nextval('public."addressTypes_id_seq"'::regclass);


--
-- TOC entry 3105 (class 2604 OID 117179)
-- Name: affirmations id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.affirmations ALTER COLUMN id SET DEFAULT nextval('public.affirmations_id_seq'::regclass);


--
-- TOC entry 3115 (class 2604 OID 149800)
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- TOC entry 3109 (class 2604 OID 125205)
-- Name: banks id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);


--
-- TOC entry 3114 (class 2604 OID 149790)
-- Name: bidTypes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."bidTypes" ALTER COLUMN id SET DEFAULT nextval('public."bidTypes_id_seq"'::regclass);


--
-- TOC entry 3126 (class 2604 OID 174491)
-- Name: cat1s id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.cat1s ALTER COLUMN id SET DEFAULT nextval('public.cat1s_id_seq'::regclass);


--
-- TOC entry 3127 (class 2604 OID 174502)
-- Name: cat2s id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.cat2s ALTER COLUMN id SET DEFAULT nextval('public.cat2s_id_seq'::regclass);


--
-- TOC entry 3128 (class 2604 OID 174513)
-- Name: cat3s id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.cat3s ALTER COLUMN id SET DEFAULT nextval('public.cat3s_id_seq'::regclass);


--
-- TOC entry 3129 (class 2604 OID 174524)
-- Name: cat4s id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.cat4s ALTER COLUMN id SET DEFAULT nextval('public.cat4s_id_seq'::regclass);


--
-- TOC entry 3119 (class 2604 OID 166173)
-- Name: civilStatuses id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."civilStatuses" ALTER COLUMN id SET DEFAULT nextval('public."civilStatuses_id_seq"'::regclass);


--
-- TOC entry 3112 (class 2604 OID 125320)
-- Name: comunas id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.comunas ALTER COLUMN id SET DEFAULT nextval('public.comunas_id_seq'::regclass);


--
-- TOC entry 3094 (class 2604 OID 100740)
-- Name: dashboardPermissions id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions" ALTER COLUMN id SET DEFAULT nextval('public."dashboardPermissions_id_seq"'::regclass);


--
-- TOC entry 3124 (class 2604 OID 174438)
-- Name: deliveries id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.deliveries ALTER COLUMN id SET DEFAULT nextval('public.deliveries_id_seq'::regclass);


--
-- TOC entry 3116 (class 2604 OID 149817)
-- Name: disponibilities id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.disponibilities ALTER COLUMN id SET DEFAULT nextval('public.disponibilities_id_seq'::regclass);


--
-- TOC entry 3106 (class 2604 OID 117194)
-- Name: docTypes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."docTypes" ALTER COLUMN id SET DEFAULT nextval('public."docTypes_id_seq"'::regclass);


--
-- TOC entry 3125 (class 2604 OID 174462)
-- Name: envoiceNotifies id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."envoiceNotifies" ALTER COLUMN id SET DEFAULT nextval('public."envoiceNotifies_id_seq"'::regclass);


--
-- TOC entry 3123 (class 2604 OID 174390)
-- Name: envoiceTypes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."envoiceTypes" ALTER COLUMN id SET DEFAULT nextval('public."envoiceTypes_id_seq"'::regclass);


--
-- TOC entry 3095 (class 2604 OID 100741)
-- Name: grantRoles id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles" ALTER COLUMN id SET DEFAULT nextval('public."grantRoles_id_seq"'::regclass);


--
-- TOC entry 3118 (class 2604 OID 149837)
-- Name: materials id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);


--
-- TOC entry 3130 (class 2604 OID 207134)
-- Name: peopleTypes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."peopleTypes" ALTER COLUMN id SET DEFAULT nextval('public."peopleTypes_id_seq"'::regclass);


--
-- TOC entry 3102 (class 2604 OID 117134)
-- Name: phoneTypes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."phoneTypes" ALTER COLUMN id SET DEFAULT nextval('public."phoneTypes_id_seq"'::regclass);


--
-- TOC entry 3096 (class 2604 OID 100742)
-- Name: postalCodes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."postalCodes" ALTER COLUMN id SET DEFAULT nextval('public."postalCodes_id_seq"'::regclass);


--
-- TOC entry 3107 (class 2604 OID 125154)
-- Name: processTypes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."processTypes" ALTER COLUMN id SET DEFAULT nextval('public."processTypes_id_seq"'::regclass);


--
-- TOC entry 3111 (class 2604 OID 125295)
-- Name: provinces id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);


--
-- TOC entry 3117 (class 2604 OID 149827)
-- Name: reasons id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.reasons ALTER COLUMN id SET DEFAULT nextval('public.reasons_id_seq'::regclass);


--
-- TOC entry 3110 (class 2604 OID 125230)
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- TOC entry 3104 (class 2604 OID 117164)
-- Name: salesChannels id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."salesChannels" ALTER COLUMN id SET DEFAULT nextval('public."salesChannels_id_seq"'::regclass);


--
-- TOC entry 3120 (class 2604 OID 166191)
-- Name: shopContracts id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."shopContracts" ALTER COLUMN id SET DEFAULT nextval('public."shopContracts_id_seq"'::regclass);


--
-- TOC entry 3101 (class 2604 OID 117028)
-- Name: shopRequests id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."shopRequests" ALTER COLUMN id SET DEFAULT nextval('public."shopRequests_id_seq"'::regclass);


--
-- TOC entry 3108 (class 2604 OID 125182)
-- Name: shops id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.shops ALTER COLUMN id SET DEFAULT nextval('public.shops_id_seq'::regclass);


--
-- TOC entry 3113 (class 2604 OID 149780)
-- Name: statusProcesses id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."statusProcesses" ALTER COLUMN id SET DEFAULT nextval('public."statusProcesses_id_seq"'::regclass);


--
-- TOC entry 3103 (class 2604 OID 117149)
-- Name: storeTypes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."storeTypes" ALTER COLUMN id SET DEFAULT nextval('public."storeTypes_id_seq"'::regclass);


--
-- TOC entry 3097 (class 2604 OID 100743)
-- Name: subModules id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."subModules" ALTER COLUMN id SET DEFAULT nextval('public."subModules_id_seq"'::regclass);


--
-- TOC entry 3122 (class 2604 OID 174372)
-- Name: taxValues id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."taxValues" ALTER COLUMN id SET DEFAULT nextval('public."taxValues_id_seq"'::regclass);


--
-- TOC entry 3121 (class 2604 OID 174362)
-- Name: taxes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.taxes ALTER COLUMN id SET DEFAULT nextval('public.taxes_id_seq'::regclass);


--
-- TOC entry 3498 (class 0 OID 100574)
-- Dependencies: 216
-- Data for Name: Accounts; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Accounts" (id, name, pass, email, "peopleId", "statusId", "createdAt", "updatedAt", "confirmStatus", "hashConfirm", preference) VALUES (172, NULL, '$2a$10$.UTxj7lLy0UZp/ZhSE3k../iR0AlVHOXIHr3LVdl3mjeY.rM/SlCq', 'angel@gmail.com', NULL, 1, '2020-08-22 17:19:41.428-04', '2020-08-22 17:19:41.428-04', false, '721751d523fbaaee9ba88c8d89b74e94c9fe193e5cb17b3772329c0747f8392a9cfa4e75f09a915dbea237a8aaeb0479a14275b4a686c0f8b54c00e9ed84e16239a28b987d3cab27a8e33fdf19682235ab7aba694a731f5fd47a9617347cb208cbf196e2b75022a24d3ba7a509e83d8fc289994951bf1821f2a002b11d46cb866b8c1097a2327227b8cd5d5fe955b327f24b07a97c69769ff127cb9fe9f071268e6221d3d724e1775877a00cfb243dc103e52f12051228c0e0d71233b9deae33b22fde5e88f01c643784410ebcec881e4a2a0dfe05583e93c46bc2f646b8022edda6d9705cd585c5f0f74f4f2046521b815ec84565e1758e1d5b746ac7f4cff3441206d9a29c0376243f549ad6adb927baa2381321a674118f9c6d556b5930b31704d756073586cc97139b2db20b06598d13cd68542a0b8891ce1b98f8e8e8bf0b3d786d467fb69eaf0e80c9204f3d7b887982882599605c8152284baad1ce8ad000bc63993e0974c2446b816bae0574bf5c9c1598131181426', '{"id": 1, "name": "Comida"}');
INSERT INTO public."Accounts" (id, name, pass, email, "peopleId", "statusId", "createdAt", "updatedAt", "confirmStatus", "hashConfirm", preference) VALUES (188, NULL, '$2a$10$7KVnoN.sxaUu4z/FnN3c8.sg6R9hYvGION4E6R/NchjxZlCaRfyZq', 'angel.elcampeon@gmail.com', 166, 1, '2020-08-22 18:38:43.626-04', '2020-09-28 15:54:21.854-04', true, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0eXBlIjoiZm9yZ290IiwiYWNjb3VudCI6MTg4LCJyb2xlIjoxNjAwMzk3OTEyLCJwZW9wbGUiOiJhbmdlbC5lbGNhbXBlb25AZ21haWwuY29tIiwicmVtIjoibG8tdmVyZW1vcy1jYXJhLWEtY2FyYSIsImlhdCI6MTYwMDM5NzkxMiwiZXhwIjoxNjAwNDg0MzEyfQ.01Lw_W4wZ1NQ3BNkhhnrWcaMkW816-6KkHrfuuF4VAk', '{"id": 1, "name": "Comida"}');
INSERT INTO public."Accounts" (id, name, pass, email, "peopleId", "statusId", "createdAt", "updatedAt", "confirmStatus", "hashConfirm", preference) VALUES (193, NULL, '$2a$10$3ufKmlPkxwrDk7qSaTkR7eSq6iLn8FDE4uXgHe7MslYI.0lcF.Hiu', 'angelangelds3@yahoo.es', NULL, 1, '2020-09-08 19:51:01.591-04', '2020-09-08 19:51:01.591-04', false, NULL, '{"id": 1, "name": "Comida"}');
INSERT INTO public."Accounts" (id, name, pass, email, "peopleId", "statusId", "createdAt", "updatedAt", "confirmStatus", "hashConfirm", preference) VALUES (196, NULL, '$2a$10$Hdhxogy5QZr/BAls702oaePmhd13XdagQ65TvhBt7AWdV0yF1nVLy', 'angelangelds@yahoo1.es', NULL, 1, '2020-09-19 15:17:35.601-04', '2020-09-19 15:17:35.601-04', false, NULL, '{"id": 1, "name": "Comida"}');
INSERT INTO public."Accounts" (id, name, pass, email, "peopleId", "statusId", "createdAt", "updatedAt", "confirmStatus", "hashConfirm", preference) VALUES (197, NULL, '$2a$10$CQG38OO9dGvMmgVvbkOS1OYrgTs/ony5V1GI/G1hTnDs6oKBlR7B6', 'angelangelds@yahoooo.es', NULL, 1, '2020-09-19 15:19:56.139-04', '2020-09-19 16:21:24.629-04', true, NULL, '{"id": 1, "name": "Comida"}');
INSERT INTO public."Accounts" (id, name, pass, email, "peopleId", "statusId", "createdAt", "updatedAt", "confirmStatus", "hashConfirm", preference) VALUES (195, NULL, '$2a$10$rACPp2JOiroTqvbgUCg.luIRZS4sTJx.nnGbGPdg5LKkG.4sMwNeq', 'angelangelds@yahoo.es3', NULL, 1, '2020-09-19 15:14:36.217-04', '2020-09-19 15:14:36.217-04', false, NULL, '{"id": 1, "name": "Comida"}');
INSERT INTO public."Accounts" (id, name, pass, email, "peopleId", "statusId", "createdAt", "updatedAt", "confirmStatus", "hashConfirm", preference) VALUES (199, NULL, '$2a$10$f8FGivZQt/vrZIduuxzSTeEmEZbstm2H7eUsqytQ6LOHYGmI67Nv6', 'angelangelds@yahoo.es', NULL, 1, '2020-09-19 16:30:31.429-04', '2020-09-19 16:31:30.455-04', true, NULL, '{"id": 1, "name": "Comida"}');


--
-- TOC entry 3536 (class 0 OID 101252)
-- Dependencies: 254
-- Data for Name: Bids; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Bids" (id, "bidType", title, "brandId", "longDesc", "smallDesc", disponibility, "time", devolution, include, customize, garanty, tags, photos, category, variation, "shopId", "WarehouseId", "StatusId", "createdAt", "updatedAt", schedule, weight, materials, reasons, customizable, dimesion) VALUES (25, 1, 'Zapatos de Cuero originales', 1, 'Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,', 'Bla, bla,Bla, bla,Bla, bla,', 1, 1, true, 'Par de Zapatos con trenzas', 'Con mi nombre', '9', '[{"name":"zapatos"},{"name":"cuero"},{"name":"hombres"}]', '[{"id": 1}, {"id": 2}]', '[{"category":[{"id":4,"name":"Ropa"}],"subCategory":[{"id":1,"name":"Hombre"},{"id":2,"name":"Cuero"}]}]', '[{"price":300,"size":{"id":1,"name":"S"},"piceType":{"id":1,"name":"blusa"},"cantidad":"60","descuento":70,"color":"#454d2"}]', 115, 12, 1, '2020-09-02 15:15:20.177-04', '2020-09-02 15:15:20.177-04', NULL, '0.8', '[{"id": 1, "name": "acb"}]', '[{"id": 2, "name": "En Evaluación"}]', true, '{"alto": 17, "ancho": 32, "profundo": 2}');
INSERT INTO public."Bids" (id, "bidType", title, "brandId", "longDesc", "smallDesc", disponibility, "time", devolution, include, customize, garanty, tags, photos, category, variation, "shopId", "WarehouseId", "StatusId", "createdAt", "updatedAt", schedule, weight, materials, reasons, customizable, dimesion) VALUES (29, 2, 'Zapatos de Cuero 1', 1, 'Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,Bla, bla,', 'Bla, bla,Bla, bla,Bla, bla,', 1, 1, true, 'Par de Zapatos con trenzas', 'Con mi nombre', '9', '[{"name":"zapatos"},{"name":"cuero"},{"name":"hombres"}]', '[{"id": 1}, {"id": 2}]', '[{"category":[{"id":4,"name":"Ropa"}],"subCategory":[{"id":1,"name":"Hombre"},{"id":2,"name":"Cuero"}]}]', '[{"price":300,"size":{"id":1,"name":"S"},"piceType":{"id":1,"name":"blusa"},"cuantity":"60","discount":70,"color":"#454d2"}]', 115, 12, 1, '2020-09-02 20:57:18.912-04', '2020-09-02 20:57:18.912-04', NULL, '0.8', '[{"id": 1, "name": "acb"}]', '[{"id": 2, "name": "En Evaluación"}]', true, '{"depth": 2, "width": 32, "height": 17}');


--
-- TOC entry 3534 (class 0 OID 101189)
-- Dependencies: 252
-- Data for Name: Brands; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Brands" (id, name, "createdAt", "updatedAt") VALUES (1, 'Stanley', '2020-06-29 18:51:20.74-04', '2020-06-29 18:51:20.74-04');
INSERT INTO public."Brands" (id, name, "createdAt", "updatedAt") VALUES (2, 'Truppe', '2020-06-29 18:51:20.74-04', '2020-06-29 18:51:20.74-04');
INSERT INTO public."Brands" (id, name, "createdAt", "updatedAt") VALUES (3, 'Acadia', '2020-06-29 18:51:20.74-04', '2020-06-29 18:51:20.74-04');


--
-- TOC entry 3500 (class 0 OID 100600)
-- Dependencies: 218
-- Data for Name: Dashboards; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (1, 1, 1, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/processRequest', '', 1);
INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (2, 1, 2, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/selectRequest', '', 1);
INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (3, 1, 3, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/selectRequest', '', 1);
INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (4, 6, 4, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/inventoryByShop', '', 1);
INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (5, 6, 5, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/inventoryByProduct', '', 1);
INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (6, 6, 6, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/inventoryByLocation', '', 1);
INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (7, 2, 7, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/createContrat', '', 1);
INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (8, 2, 8, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/viewContrat', '', 1);
INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (9, 4, 9, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/shopSalesMonitor', '', 1);
INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (10, 3, 10, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/upgradePolitics', '', 1);
INSERT INTO public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") VALUES (12, 5, 12, '2020-10-27 11:04:47.778-04', '2020-10-27 11:04:47.778-04', '/notificaionSend', '', 1);


--
-- TOC entry 3502 (class 0 OID 100609)
-- Dependencies: 220
-- Data for Name: Genders; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Genders" (id, name, "createdAt", "updatedAt") VALUES (1, 'Hombre', '2020-06-06 21:32:49.326-04', '2020-06-06 21:32:49.326-04');
INSERT INTO public."Genders" (id, name, "createdAt", "updatedAt") VALUES (2, 'Mujer', '2020-06-06 21:32:49.326-04', '2020-06-06 21:32:49.326-04');


--
-- TOC entry 3504 (class 0 OID 100614)
-- Dependencies: 222
-- Data for Name: Modules; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Modules" (id, name, "StatusId", "createdAt", "updatedAt", description) VALUES (1, 'Postulaciones', 1, '2020-10-26 12:28:17.018-04', '2020-10-26 12:28:17.018-04', 'Gestiona las postulaciones sin aprobación');
INSERT INTO public."Modules" (id, name, "StatusId", "createdAt", "updatedAt", description) VALUES (2, 'Contratos', 1, '2020-10-26 12:28:17.018-04', '2020-10-26 12:28:17.018-04', 'Gestiona los contratos con tiendas');
INSERT INTO public."Modules" (id, name, "StatusId", "createdAt", "updatedAt", description) VALUES (3, 'Politicas de Vendedor', 1, '2020-10-26 12:28:17.018-04', '2020-10-26 12:28:17.018-04', 'Gestiona acuerdos comerciales');
INSERT INTO public."Modules" (id, name, "StatusId", "createdAt", "updatedAt", description) VALUES (4, 'Tiendas', 1, '2020-10-26 12:28:17.018-04', '2020-10-26 12:28:17.018-04', 'Adminsitra y consulta las activiades de las tiendas');
INSERT INTO public."Modules" (id, name, "StatusId", "createdAt", "updatedAt", description) VALUES (5, 'Notificaciones', 1, '2020-10-26 12:28:17.018-04', '2020-10-26 12:28:17.018-04', 'Gestiona las notificaciones para los usuarios');
INSERT INTO public."Modules" (id, name, "StatusId", "createdAt", "updatedAt", description) VALUES (6, 'Invetario Global', 1, '2020-10-26 12:28:17.018-04', '2020-10-26 12:28:17.018-04', 'Monitoreo de inventario global de tiendas Pampatar');


--
-- TOC entry 3506 (class 0 OID 100619)
-- Dependencies: 224
-- Data for Name: Nationalities; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Nationalities" (id, name, "createdAt", "updatedAt") VALUES (2, 'Extranjera', '2020-06-06 21:47:28.603-04', '2020-06-06 21:47:28.603-04');
INSERT INTO public."Nationalities" (id, name, "createdAt", "updatedAt") VALUES (1, 'Chilena', '2020-06-06 21:47:28.603-04', '2020-06-06 21:47:28.603-04');


--
-- TOC entry 3508 (class 0 OID 100624)
-- Dependencies: 226
-- Data for Name: People; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (71, 'Angel', 'DIaz', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-05 02:53:21.999-04', '2020-08-05 02:53:21.999-04', '[{"docType": 1, "docNumber": "23546985", "attachment": "null"}, {"docType": 2, "docNumber": "p4562654455", "attachment": "null"}]');
INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (72, 'Angel', 'DIaz', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-05 02:56:03.863-04', '2020-08-05 02:56:03.863-04', '[{"docType": 1, "docNumber": "23546985", "attachment": "null"}, {"docType": 2, "docNumber": "p4562654455", "attachment": "null"}]');
INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (73, 'Angel', 'DIaz', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-05 06:14:54.192-04', '2020-08-05 06:14:54.192-04', '[{"docType": 1, "docNumber": "23546985", "attachment": "null"}, {"docType": 2, "docNumber": "p4562654455", "attachment": "null"}]');
INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (74, 'Angel', 'DIaz', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-05 06:17:35.967-04', '2020-08-05 06:17:35.967-04', '[{"docType": 1, "docNumber": "23546985", "attachment": "null"}, {"docType": 2, "docNumber": "p4562654455", "attachment": "null"}]');
INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (75, 'Angel', 'DIaz', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-05 06:18:32.185-04', '2020-08-05 06:18:32.185-04', '[{"docType": 1, "docNumber": "23546985", "attachment": "null"}, {"docType": 2, "docNumber": "p4562654455", "attachment": "null"}]');
INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (76, 'Angel', 'DIaz', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-05 06:19:53.518-04', '2020-08-05 06:19:53.518-04', '[{"docType": 1, "docNumber": "23546985", "attachment": "null"}, {"docType": 2, "docNumber": "p4562654455", "attachment": "null"}]');
INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (163, 'Juana', 'Guerrero', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-09 19:53:47.401-04', '2020-08-16 12:26:24.322-04', '[{"number": "235469s853", "docType": {"id": 1, "name": "DNI"}}, {"number": "23s5469853", "docType": {"id": 1, "name": "DNI"}}]');
INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (160, 'Angel', 'DIaz', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-09 19:36:00.129-04', '2020-08-09 19:36:00.129-04', '[{"docType": 1, "docNumber": "23546985", "attachment": "null"}, {"docType": 2, "docNumber": "p4562654455", "attachment": "null"}]');
INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (166, 'Angel', 'DIaz', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-23 23:06:50.591-04', '2020-08-23 23:06:50.591-04', '[{"docType": 1, "docNumber": "23546985", "attachment": "null"}, {"docType": 2, "docNumber": "p4562654455", "attachment": "null"}]');
INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (124, 'Angel', 'DIaz', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-08 14:56:00.935-04', '2020-08-08 14:56:00.935-04', '[{"docType": 1, "docNumber": "23546985", "attachment": "null"}, {"docType": 2, "docNumber": "p4562654455", "attachment": "null"}]');
INSERT INTO public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) VALUES (128, 'Angel', 'DIaz', 1, 1, '1985-09-11 00:00:00-04', 1, '2020-08-08 17:44:31.363-04', '2020-08-08 17:44:31.363-04', '[{"docType": 1, "docNumber": "23546985", "attachment": "null"}, {"docType": 2, "docNumber": "p4562654455", "attachment": "null"}]');


--
-- TOC entry 3510 (class 0 OID 100632)
-- Dependencies: 228
-- Data for Name: Permissions; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Permissions" (id, name, "StatusId", "createdAt", "updatedAt") VALUES (1, 'Agregar', 1, '2020-06-16 00:32:09.533-04', '2020-06-16 00:32:09.533-04');
INSERT INTO public."Permissions" (id, name, "StatusId", "createdAt", "updatedAt") VALUES (2, 'Modificar', 1, '2020-06-16 00:32:09.533-04', '2020-06-16 00:32:09.533-04');
INSERT INTO public."Permissions" (id, name, "StatusId", "createdAt", "updatedAt") VALUES (3, 'Consultar', 1, '2020-06-16 00:32:09.533-04', '2020-06-16 00:32:09.533-04');
INSERT INTO public."Permissions" (id, name, "StatusId", "createdAt", "updatedAt") VALUES (4, 'Imprimir', 1, '2020-06-16 00:32:09.533-04', '2020-06-16 00:32:09.533-04');
INSERT INTO public."Permissions" (id, name, "StatusId", "createdAt", "updatedAt") VALUES (5, 'Descargar', 1, '2020-06-16 00:32:09.533-04', '2020-06-16 00:32:09.533-04');


--
-- TOC entry 3512 (class 0 OID 100642)
-- Dependencies: 230
-- Data for Name: Properties; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3514 (class 0 OID 100652)
-- Dependencies: 232
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Roles" (id, name, "StatusId", "createdAt", "updatedAt") VALUES (6, 'Comprador', 1, '2020-06-07 13:53:11.409-04', '2020-06-07 13:53:11.409-04');
INSERT INTO public."Roles" (id, name, "StatusId", "createdAt", "updatedAt") VALUES (7, 'Administrador', 1, '2020-06-07 13:53:11.409-04', '2020-06-07 13:53:11.409-04');
INSERT INTO public."Roles" (id, name, "StatusId", "createdAt", "updatedAt") VALUES (5, 'Vendedor', 1, '2020-06-07 13:53:11.409-04', '2020-06-07 13:53:11.409-04');


--
-- TOC entry 3516 (class 0 OID 100657)
-- Dependencies: 234
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."SequelizeMeta" (name) VALUES ('0-create-nationality.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('00-create-status.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('1-create-gender.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('2-create-people.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604021818-create-address-type.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604024238-create-country.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604024252-create-postal-code.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('3-create-account.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200522150259-create-roles.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604024200-create-province.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200522153843-create-account-roles.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604021727-create-address.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604024449-create-address-account.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604172505-create-products.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604172930-create-properties.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604173503-create-wharehouse.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604174323-create-wharehouse.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604184146-create-warehouse.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200609215220-create-module.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200609222040-create-sub-module.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200609224058-create-permision.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200609231716-create-dashboard.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200610020959-create-dashboard-permission.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200610024842-create-grant-role.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('add-index-account-roles.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('add-index-address-account.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200615230251-modify_dashboard_add_new_fields.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200615230251-edit_dashboard_add_icontype.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200615230251-edit_dashboard_add_icontypeAndPath.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200615230251-edit_dashboard_add_path.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200615230251-edit_dashboard_add_icontype_file.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200615230251-edit_dashboard_add_dashboard_status.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604172544-create-tags.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200629190303-create-brands.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200604175923-create-bid.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200720111708-create-subscribe.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200730081638-create-shop-request.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200730081638-create-shop-request.mdl.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200801164544-create-phone-type.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200801164653-create-store-type.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200801164752-create-sales-channels.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200801164843-create-affirmations.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200801164325-create-doc-type.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200804055325-create-process-type.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200804055326-create-shop.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200804060231-create-bank.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200804060312-create-account-type.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200804064204-create-address-type.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200804081350-create-region.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200804081810-create-province.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200804082130-create-comuna.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200808170620-create-process.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200818014439-create-status-process.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200818021901-create-bid-type.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200818024008-create-attachment.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200818033459-create-disponibility.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200818041138-create-reasons.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200818053601-create-materials.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200821230611-create-civil-status.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200828225414-create-shop-contract.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200904042432-create-tax.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200904044447-create-tax-value.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200904055457-create-envoice-type.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200904055456-create-delivery.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200904055458-create-envoice-notify.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200908013516-create-cat-1.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200908022217-create-cat-2.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200908022231-create-cat-3.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20200908022242-create-cat-4.js');
INSERT INTO public."SequelizeMeta" (name) VALUES ('20201011195850-create-people-type.js');


--
-- TOC entry 3517 (class 0 OID 100660)
-- Dependencies: 235
-- Data for Name: Status; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Status" (id, name, "createdAt", "updatedAt") VALUES (1, 'Active', '2020-06-06 21:51:28.107-04', '2020-06-06 21:51:28.107-04');
INSERT INTO public."Status" (id, name, "createdAt", "updatedAt") VALUES (2, 'Inactive', '2020-06-06 21:51:28.107-04', '2020-06-06 21:51:28.107-04');


--
-- TOC entry 3538 (class 0 OID 116969)
-- Dependencies: 256
-- Data for Name: Subscribes; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Subscribes" (id, email, "createdAt", "updatedAt", "hashConfirm") VALUES (85, 'angel.elcampeon@gmail.com', '2020-08-22 15:57:27.772-04', '2020-08-22 15:57:27.772-04', '{"exp": 1598212647, "hash": "9f75a0c2b898b480661f3c5fe0c8b6d75dc07655aef09c52964c39b4d68fca1e278bdd99aa239ec20c8d5319038a79a280c3257a7a3eb7181c0b4e7524219ff0c62374efda88616ca86566214602887f05fbfc0c79a0bed668e7ab3ba1057a11ebe3da4d7894d26ea44fd04d7800d7a17f6e8ebf618ba011509abb7275d69d7a0e889e2670ba4fed76f294c545eb880de2c25dda66f2f94641c76644a1754b186c1268dcec1e2b5f0c5d07603488a1f466ab6d56550ea514ec87ed3a1eaced11c835f51598126247770"}');
INSERT INTO public."Subscribes" (id, email, "createdAt", "updatedAt", "hashConfirm") VALUES (86, 'mayelagr24@gmail.com', '2020-08-22 16:11:57.029-04', '2020-08-22 16:11:57.029-04', '{"exp": 1598213517, "hash": "6c6e2735adf6a44a48fb910c2bb73df512bfbe9f36673f584a809092ef477aed14891240d89584a5b95fe8c135835d7bf1335c2f7196d431ddfacad75379af5a6a2520d5c169c2fcf6bc4e75e490186ec89a0780b6f3dfd895f4283ba4ddb81b9167ab19ca9311b1e0bd7197e986be385da2223b9999fbe9ab10d2fe17a9f393ad81c93fb70eb6baadc0b85df0558050644bd058d34889fbfb54603424e7d816769925dbf86dccedb95866419d0f89235535abe18c35e70545df5552088b3f959e58dd1598127117028"}');
INSERT INTO public."Subscribes" (id, email, "createdAt", "updatedAt", "hashConfirm") VALUES (87, 'veronicacestari@gmail.com', '2020-08-22 16:12:32.828-04', '2020-08-22 16:12:32.828-04', '{"exp": 1598213552, "hash": "9084f0b7fe0638eaf227149e44df4be5cc99031cf41d2d6f2469e9cc81bfc3ca04f0ffa27c91148a50e1b6bc71dabbd5549d3d7bbf947465449bc37ad8bf7a1f15e22e1f0a8b460d0afae1f7e61fcafdf647516548bb13ccd47114849c714f4e7b00135507cc3140d7435bbd65af400162b2a7029e8d8bf0f5b3b0e6dbdc63c2a210dffe9934a96932bb1ae1fc6e513a86936cf2f6b6e2962ee10119cd4a4584260240661d597cc3a0dda042fa7286cd21d2844844a5983c33e22bc51c5ef375f2e1761598127152828"}');
INSERT INTO public."Subscribes" (id, email, "createdAt", "updatedAt", "hashConfirm") VALUES (88, 'leomarinmaculada@gmail.com', '2020-08-22 16:16:26.742-04', '2020-08-22 16:16:26.742-04', '{"exp": 1598213786, "hash": "5047dcce47b01fea1604a7f2bee58f610b0911ff5292a85cf45717f13d0db26bec1167f691ae462b80ae9c309669d763dc330e98185e4b97ee54696815cb1da627e6c9ec07a4b3273cc344bc53ce7ec4bd8bef0812fa6a9dd3a84577a12f4e37c83deb77e87df35dbda6294f269c5498b327d1cf13bb8de0a116a4a6ae632ddd6ff1c107c7a9abfcccd219442f2d5ba8bdeb8ad7118b074c1c73d2c014d4f976f140b3dec49a98c306fd70005d1ffb2ec7e79e3678842c11195874509e76aee7e0c90f1598127386742"}');
INSERT INTO public."Subscribes" (id, email, "createdAt", "updatedAt", "hashConfirm") VALUES (90, 'boza.carmen16@gmail.com', '2020-08-22 16:23:23.131-04', '2020-08-22 16:23:23.131-04', '{"exp": 1598214203, "hash": "aa35c6b7ef77934fdac415d945484535dd00047950404f6c7f93de5bae7ecc1e6e6da0bfa5b20d71007b99f8ba4fd26c26c71e2550fc144a18b78aeaace2cd959c72a4b72d5fd6901d29a179d8ba6c47cd8787476021d49be29503b4a9364cb990bb6853787a91dd806e69870b0a16e2b745b032e81f2632f5424835076afa7648e75b11f63127181131fe06bbdea6b27b43218d8ba9031ecc962cbce9039da5d17ec2fdd7cc834f0ba8c124e8b905c6ed5c9a36227aa21829bda73a593e937e84e9f51598127803129"}');
INSERT INTO public."Subscribes" (id, email, "createdAt", "updatedAt", "hashConfirm") VALUES (91, 'boza.carmen160@gmail.com', '2020-09-08 21:53:18.808-04', '2020-09-08 21:53:18.808-04', '{"exp": 1599702798, "hash": "95f2ad0a30205dad36aac2741642148efece8583c4d8d54760e6300b3688a57e5339d4b0cddf85688889145d3dc173d3f8da3e40fc643dc76786025ea7abde3e709744ff421469642ca003ff3714622bdaa66ae358913519fec5cde9ef93ab945dbff0fb12072dd671bc7c7eb57801969d155ef2e3cc31258864aaaf1a6b9be48d7efe703f11870471f1783e2d07f3145eab341f0ac6323ee7079f295ed2b9c05c3e63132e827ee4e73b686d809d7dc3a830b4fd18598ef21141fdf9cf08b8747f69ca1599616398795"}');


--
-- TOC entry 3519 (class 0 OID 100670)
-- Dependencies: 237
-- Data for Name: Warehouses; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (12, 'Bodega Central', 1, '2020-09-02 00:47:06.556-04', '2020-09-02 00:47:06.556-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"phoneType1": 2, "phoneNmber1": 5655656}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (15, 'Bodega Central2', 1, '2020-09-02 00:52:07.052-04', '2020-09-02 00:52:07.052-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"number": 56556666666666670000000, "phoneType": 2}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (16, 'Bodega Central21', 1, '2020-09-02 00:53:46.111-04', '2020-09-02 00:53:46.111-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"numbewr": 56556666666666670000000, "phoneType": 2}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (17, 'Bodega Central221', 1, '2020-09-02 00:54:23.847-04', '2020-09-02 00:54:23.847-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"numbewr": 56556666666666670000000, "phoneType": 2}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (18, 'Bodega Central2212', 1, '2020-09-02 00:57:36.373-04', '2020-09-02 00:57:36.373-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"numbewr": 56556666666666670000000, "phoneType": 2}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (20, 'Bodega Central22123', 1, '2020-09-02 01:00:16.613-04', '2020-09-02 01:00:16.613-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"numbewr": 56556666666666670000000, "phoneType": 2}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (24, 'Bodega Central212', 1, '2020-09-02 11:03:27.345-04', '2020-09-02 11:03:27.345-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"number": 56556666666666670000000, "phoneType": 2}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (25, 'Bodega Central219', 1, '2020-09-02 11:03:49.753-04', '2020-09-02 11:03:49.753-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"numbder": 56556666666666670000000, "phoneType": 2}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (26, 'Bodega Centra0', 1, '2020-09-02 11:04:40.191-04', '2020-09-02 11:04:40.191-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"numbder": 56556666666666670000000, "phoneType": 2}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (28, 'Bodega Centra01', 1, '2020-09-02 11:05:26.99-04', '2020-09-02 11:05:26.99-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"phoneType": 2}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (29, 'Bodega Central2193', 1, '2020-09-02 12:36:41.233-04', '2020-09-02 12:36:41.233-04', '{"calle": "erer", "local": "5569", "comuna": {"id": 123, "name": "El 487"}, "numero": "4669", "region": {"id": 23, "name": "chuu tana"}, "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"number": 56556666666666670000000, "phoneType": {"id": 2, "name": "movil"}}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (31, 'Bodega Central211', 1, '2020-09-02 13:39:10.687-04', '2020-09-02 13:39:10.687-04', '{"local": "5569", "comuna": {"id": 123, "name": "El 487"}, "number": "4669", "region": {"id": 23, "name": "chuu tana"}, "street": "erer", "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}', '[{"number": 56556666666666670000000, "phoneType": {"id": 2, "name": "Vivienda"}}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (33, 'Bodega Central21133', 1, '2020-09-02 13:40:06.721-04', '2020-09-02 13:40:06.721-04', '{"local": "5569", "comuna": {"id": 123, "name": "El 487"}, "number": "4669", "region": {"id": 23, "name": "chuu tana"}, "street": "erer", "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "na3me": "chuu tana"}}', '[{"number": 56556666666666670000000, "phoneType": {"id": 2, "name": "Vivienda"}}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (35, 'Bodega Central213133', 1, '2020-09-02 13:51:58.485-04', '2020-09-02 13:51:58.485-04', '{"local": "5569", "comuna": {"id": 123, "name": "El 487"}, "number": "4669", "region": {"id": 23, "name": "chuu tana"}, "street": "erer", "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45}}', '[{"number": 56556666666666670000000, "phoneType": {"id": 2, "name": "Vivienda"}}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (36, 'Bodega Central2131033', 1, '2020-09-02 13:52:13.85-04', '2020-09-02 13:52:13.85-04', '{"local": "5569", "comuna": {"id": 123, "name": "El 487"}, "number": "4669", "region": {"id": 23, "name": "chuu tana"}, "street": "erer", "dirType": {"id": 1, "name": "tee"}}', '[{"number": 56556666666666670000000, "phoneType": {"id": 2, "name": "Vivienda"}}]', 115);
INSERT INTO public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") VALUES (37, 'Bodega Central23', 1, '2020-09-02 13:52:59.285-04', '2020-09-02 13:52:59.285-04', '[{"local": "5569", "comuna": {"id": 123, "name": "El 487"}, "number": "4669", "region": {"id": 23, "name1": "chuu tana"}, "street": "erer", "dirType": {"id": 1, "name": "tee"}, "province": {"id": 45, "name": "chuu tana"}}]', '[{"number": 56556666666666670000000, "phoneType": {"id": 2, "name": "Vivienda"}}]', 115);


--
-- TOC entry 3521 (class 0 OID 100675)
-- Dependencies: 239
-- Data for Name: accountRoles; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."accountRoles" (id, "AccountId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (97, 193, 6, 1, '2020-09-08 19:51:01.608-04', '2020-09-08 19:51:01.608-04');
INSERT INTO public."accountRoles" (id, "AccountId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (98, 188, 6, 1, '2020-09-08 19:51:01.608-04', '2020-09-08 19:51:01.608-04');
INSERT INTO public."accountRoles" (id, "AccountId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (99, 188, 7, 1, '2020-09-08 19:51:01.608-04', '2020-09-08 19:51:01.608-04');
INSERT INTO public."accountRoles" (id, "AccountId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (100, 188, 5, 1, '2020-09-08 19:51:01.608-04', '2020-09-08 19:51:01.608-04');
INSERT INTO public."accountRoles" (id, "AccountId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (101, 195, 6, 1, '2020-09-19 15:14:36.286-04', '2020-09-19 15:14:36.286-04');
INSERT INTO public."accountRoles" (id, "AccountId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (102, 196, 6, 1, '2020-09-19 15:17:35.624-04', '2020-09-19 15:17:35.624-04');
INSERT INTO public."accountRoles" (id, "AccountId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (103, 197, 6, 1, '2020-09-19 15:19:56.16-04', '2020-09-19 15:19:56.16-04');
INSERT INTO public."accountRoles" (id, "AccountId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (104, 199, 6, 1, '2020-09-19 16:30:31.458-04', '2020-09-19 16:30:31.458-04');


--
-- TOC entry 3523 (class 0 OID 100685)
-- Dependencies: 241
-- Data for Name: addressTypes; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3548 (class 0 OID 117176)
-- Dependencies: 266
-- Data for Name: affirmations; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.affirmations (id, name, "statusId", "createdAt", "updatedAt") VALUES (1, 'Estoy empezando, me vendría bien ayuda para profesionalizar mi negocio y poder dedicarme tiempo completo', 1, '2020-08-02 00:43:00.915-04', '2020-08-02 00:43:00.915-04');
INSERT INTO public.affirmations (id, name, "statusId", "createdAt", "updatedAt") VALUES (2, 'Tengo una marca en desarrollo con ventas, Me vendría bien ayuda en la gestión para poder escalar mi negocio', 1, '2020-08-02 00:43:00.915-04', '2020-08-02 00:43:00.915-04');
INSERT INTO public.affirmations (id, name, "statusId", "createdAt", "updatedAt") VALUES (3, 'Tengo un negocio consolidado y una marca reconocida, me vendría bien poder ofrecerlo de forma Omnicanal y así captar más mercado', 1, '2020-08-02 00:43:00.915-04', '2020-08-02 00:43:00.915-04');


--
-- TOC entry 3568 (class 0 OID 149797)
-- Dependencies: 286
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (18, '\x303130313031303130313031303130313031303130313031303130', '[{"name": "contrato"}, {"name": "2020-02-01"}, {"name": "2021-02-01"}, "Mis Colores"]', '2020-08-31 16:20:59.19-04', '2020-08-31 16:20:59.19-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (19, '\x303130313031303130313031303130313031303130313031303130', '[{"name": "contrato"}, {"name": "2020-02-01"}, {"name": "2021-02-01"}, "Mis Colores"]', '2020-08-31 16:32:39.414-04', '2020-08-31 16:32:39.414-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (20, '\x303130313031303130313031303130313031303130313031303130', '[{"name": "contrato"}, {"name": "2020-02-01"}, {"name": "2021-02-01"}, "Mis Colores"]', '2020-08-31 16:42:08.463-04', '2020-08-31 16:42:08.463-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (21, '\x303130313031303130313031303130313031303130313031303130', '[{"name": "contrato"}, {"name": "2020-02-01"}, {"name": "2021-02-01"}, "Mis Colores"]', '2020-08-31 18:47:34.597-04', '2020-08-31 18:47:34.597-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (31, '\x303130313031303130313031303130313031303130', '[{"name": "Boleta"}, {"name": "Mis Colores"}, {"name": "boleta45623"}, {"name": 1}, {"name": "Pedido 2"}]', '2020-09-06 22:31:49.665-04', '2020-09-06 22:31:49.665-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (33, '\x303130313031303130313031303130313031303130', '[{"name": "Boleta"}, {"name": "Mis Colores"}, {"name": "boleta4562000"}, {"name": 1}, {"name": "Pedido 2"}]', '2020-09-06 22:36:44.392-04', '2020-09-06 22:36:44.392-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (35, '\x303130313031303130313031303130313031303130', '[{"name": "Boleta"}, {"name": "Mis Colores"}, {"name": "boleta45623036"}, {"name": 1}, {"name": "Pedido 2"}]', '2020-09-06 22:41:49.081-04', '2020-09-06 22:41:49.081-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (36, '\x303130313031303130313031303130313031303130', '[{"name": "Boleta"}, {"name": "Mis Colores"}, {"name": "boleta456230306"}, {"name": 1}, {"name": "Pedido 2"}]', '2020-09-06 22:43:15.324-04', '2020-09-06 22:43:15.324-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (37, '\x303130313031303130313031303130313031303130', '[{"name": "Boleta"}, {"name": "Mis Colores"}, {"name": "boleta430306"}, {"name": 1}, {"name": "Pedido 2"}]', '2020-09-06 22:44:44.661-04', '2020-09-06 22:44:44.661-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (38, '\x303130313031303130313031303130313031303130', '[{"name": "Boleta"}, {"name": "Mis Colores"}, {"name": "boleta43030456"}, {"name": 1}, {"name": "Pedido 2"}]', '2020-09-06 22:46:11.133-04', '2020-09-06 22:46:11.133-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (39, '\x303130313031303130313031303130313031303130', '[{"name": "Boleta"}, {"name": "Mis Colores"}, {"name": "boleta430304563"}, {"name": 1}, {"name": "Pedido 2"}]', '2020-09-06 22:49:53.396-04', '2020-09-06 22:49:53.396-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (41, '\x303130313031303130313031303130313031303130', '[{"name": "Boleta"}, {"name": "Mis Colores"}, {"name": "boleta4309563"}, {"name": 1}, {"name": "Pedido 2"}]', '2020-09-06 22:51:14.243-04', '2020-09-06 22:51:14.243-04');
INSERT INTO public.attachments (id, data, tabs, "createdAt", "updatedAt") VALUES (42, '\x303130313031303130313031303130313031303130', '[{"name": "Boleta"}, {"name": "Mis Colores"}, {"name": "boleta430956113"}, {"name": 1}, {"name": "Pedido 2"}]', '2020-09-06 22:53:46.015-04', '2020-09-06 22:53:46.015-04');


--
-- TOC entry 3556 (class 0 OID 125202)
-- Dependencies: 274
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (1, 'BANCO DE CHILE', '001', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (2, 'BANCO INTERNACIONAL', '009', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (3, 'SCOTIABANK CHILE', '014', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (4, 'BANCO DE CREDITO E INVERSIONES', '016', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (5, 'BANCO BICE', '028', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (6, 'HSBC BANK (CHILE)', '031', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (7, 'BANCO SANTANDER-CHILE', '037', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (8, 'ITAÚ CORPBANCA', '039', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (9, 'BANCO SECURITY', '049', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (10, 'BANCO FALABELLA', '051', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (11, 'BANCO RIPLEY', '053', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (12, 'BANCO CONSORCIO', '055', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (13, 'SCOTIABANK AZUL', '504', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');
INSERT INTO public.banks (id, name, sbif, "createdAt", "updatedAt") VALUES (14, 'BANCO BTG PACTUAL CHILE', '059', '2020-08-04 09:56:10.593388-04', '2020-08-04 09:56:10.593388-04');


--
-- TOC entry 3566 (class 0 OID 149787)
-- Dependencies: 284
-- Data for Name: bidTypes; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."bidTypes" (id, name, "createdAt", "updatedAt") VALUES (1, 'Servicio', '2020-08-21 01:25:25.306-04', '2020-08-21 01:25:25.306-04');
INSERT INTO public."bidTypes" (id, name, "createdAt", "updatedAt") VALUES (2, 'Producto', '2020-08-21 01:25:25.306-04', '2020-08-21 01:25:25.306-04');


--
-- TOC entry 3590 (class 0 OID 174488)
-- Dependencies: 308
-- Data for Name: cat1s; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.cat1s (id, name, icon, url, "createdAt", "updatedAt") VALUES (1, 'Hecho a Mano', NULL, NULL, '2020-09-07 22:49:07.640712-04', '2020-09-07 22:49:07.640712-04');
INSERT INTO public.cat1s (id, name, icon, url, "createdAt", "updatedAt") VALUES (2, 'Talleres', NULL, NULL, '2020-09-07 22:49:07.640712-04', '2020-09-07 22:49:07.640712-04');
INSERT INTO public.cat1s (id, name, icon, url, "createdAt", "updatedAt") VALUES (3, 'Tutoriales', NULL, NULL, '2020-09-07 22:49:07.640712-04', '2020-09-07 22:49:07.640712-04');
INSERT INTO public.cat1s (id, name, icon, url, "createdAt", "updatedAt") VALUES (4, 'Materiales', NULL, NULL, '2020-09-07 22:49:07.640712-04', '2020-09-07 22:49:07.640712-04');


--
-- TOC entry 3592 (class 0 OID 174499)
-- Dependencies: 310
-- Data for Name: cat2s; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (1, 'Hogar', NULL, '#', 1, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (2, 'Moda', NULL, '#', 1, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (3, 'Belleza y Cuidado', NULL, '#', 1, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (4, 'Joyería', NULL, '#', 1, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (5, 'Niños', NULL, '#', 1, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (6, 'Maternidad', NULL, '#', 1, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (7, 'Celebraciones', NULL, '#', 1, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (8, 'Matrimonios', NULL, '#', 1, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (9, 'Arte en papel', NULL, '#', 4, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (10, 'Orfebrería', NULL, '#', 4, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (11, 'Manualidades', NULL, '#', 4, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (12, 'Tejido y bordado', NULL, '#', 4, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (13, 'Textil', NULL, '#', 4, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (14, 'Repostería y Cocina', NULL, '#', 4, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');
INSERT INTO public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") VALUES (15, 'Artículos para Fiestas', NULL, '#', 4, '2020-09-07 23:04:00.507488-04', '2020-09-07 23:04:00.507488-04');


--
-- TOC entry 3594 (class 0 OID 174510)
-- Dependencies: 312
-- Data for Name: cat3s; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (1, 'Mascotas', NULL, '#', 1, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (2, 'Cocina', NULL, '#', 1, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (3, 'Terraza', NULL, '#', 1, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (4, 'Living', NULL, '#', 1, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (5, 'Baño', NULL, '#', 1, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (6, 'Escritorio', NULL, '#', 1, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (7, 'Dormitorio', NULL, '#', 1, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (9, 'Calzado', NULL, '#', 2, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (10, 'Accesorios', NULL, '#', 2, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (14, 'Ecológico', NULL, '#', 3, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (15, 'Fragancias', NULL, '#', 3, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (17, 'Aros y piercings', NULL, '#', 4, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (18, 'Brazaletes', NULL, '#', 4, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (19, 'Collares y dijes', NULL, '#', 4, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (20, 'Anillos', NULL, '#', 4, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (21, 'Relojes', NULL, '#', 4, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (23, 'Juguetes', NULL, '#', 5, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (24, 'Deco niños', NULL, '#', 5, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (25, 'Bebés', NULL, '#', 5, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (26, 'Cumpleaños', NULL, '#', 7, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (27, 'Religiosos', NULL, '#', 7, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (28, 'Baby Shower', NULL, '#', 7, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (29, 'Gender revele', NULL, '#', 7, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (30, 'Aniversarios', NULL, '#', 7, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (31, 'Graduaciones', NULL, '#', 7, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (32, 'Accesorios novios', NULL, '#', 8, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (33, 'Papelería y partes', NULL, '#', 8, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (34, 'Souvenirs', NULL, '#', 8, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (35, 'Ceremonia', NULL, '#', 8, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (36, 'Recepción', NULL, '#', 8, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (37, 'Cotillón', NULL, '#', 8, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (38, 'Lettering', NULL, '#', 9, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (41, 'Scrapbooking', NULL, '#', 9, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (44, 'Soutache', NULL, '#', 10, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (45, 'Alambrismo', NULL, '#', 10, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (46, 'Bisutería', NULL, '#', 10, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (48, 'Pintura', NULL, '#', 11, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (22, 'Ropa', NULL, '#', 5, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (49, 'Resina', NULL, '#', 11, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (50, 'Mosaico', NULL, '#', 11, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (51, 'Escultura y modelado', NULL, '#', 11, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (52, 'Velas y jabones', NULL, '#', 11, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (53, 'Madera', NULL, '#', 11, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (54, 'Floristería', NULL, '#', 11, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (55, 'Macramé', NULL, '#', 12, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (56, 'Crochet', NULL, '#', 12, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (57, 'Bordado', NULL, '#', 12, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (58, 'Telares', NULL, '#', 12, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (59, 'Frivolitle', NULL, '#', 12, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (60, 'Punto Cruz', NULL, '#', 12, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (61, 'Tejido a mano', NULL, '#', 12, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (63, 'Sublimación', NULL, '#', 13, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (64, 'Estampado', NULL, '#', 13, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (65, 'Costura', NULL, '#', 13, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (66, 'Ingredientes', NULL, '#', 14, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (67, 'Utensilios', NULL, '#', 14, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (68, 'Complementos', NULL, '#', 14, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (69, 'Menaje', NULL, '#', 14, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (70, 'Decoración', NULL, '#', 15, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (71, 'Mesa de fiesta', NULL, '#', 15, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (72, 'Regalos', NULL, '#', 15, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (8, 'Vestuario', NULL, '#', 2, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (11, 'Rostro', NULL, '#', 3, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (12, 'Cuerpo', NULL, '#', 3, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (13, 'Manos y pies', NULL, '#', 3, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (16, 'Cabello', NULL, '#', 3, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (39, 'Planners', NULL, '#', 9, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (42, 'Mixedmedia', NULL, '#', 9, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (62, 'Palillos', NULL, '#', 12, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');
INSERT INTO public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") VALUES (47, 'Arcilla Polimérica', NULL, '#', 11, '2020-09-07 23:32:21.026593-04', '2020-09-07 23:32:21.026593-04');


--
-- TOC entry 3596 (class 0 OID 174521)
-- Dependencies: 314
-- Data for Name: cat4s; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (1, 'Flores y plantas', NULL, '#', 3, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (2, 'Comedores', NULL, '#', 3, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (3, 'Mesas', NULL, '#', 4, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (4, 'Sillas', NULL, '#', 4, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (5, 'Organizadores', NULL, '#', 6, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (8, 'Dama', NULL, '#', 9, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (9, 'Caballeros', NULL, '#', 9, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (10, 'Mochilas y carteras', NULL, '#', 10, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (11, 'Billeteras', NULL, '#', 10, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (12, 'Sombreros', NULL, '#', 10, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (13, 'Para el cabello', NULL, '#', 10, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (14, 'Pañales eco', NULL, '#', 25, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (15, 'Ajuar recién nacido', NULL, '#', 25, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (16, 'Dulces', NULL, '#', 66, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (17, 'Veganos', NULL, '#', 66, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (18, 'Salados', NULL, '#', 66, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (19, 'Embosing', NULL, '#', 42, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (20, 'Tarjetería artesanal', NULL, '#', 41, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (7, 'Pantalones', NULL, '#', 8, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (6, 'Poleras', NULL, '#', 8, '2020-09-07 23:46:16.563746-04', '2020-09-07 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (21, 'Chaquetas', NULL, '#', 8, '2020-10-03 23:46:16.563746-04', '2020-10-03 23:46:16.563746-04');
INSERT INTO public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") VALUES (22, 'Vestidos y faldas', NULL, '#', 8, '2020-10-03 23:46:16.563746-04', '2020-10-03 23:46:16.563746-04');


--
-- TOC entry 3576 (class 0 OID 166170)
-- Dependencies: 294
-- Data for Name: civilStatuses; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3562 (class 0 OID 125317)
-- Dependencies: 280
-- Data for Name: comunas; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (1, 'Arica', 1, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (2, 'Camarones', 1, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (3, 'General Lagos', 2, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (4, 'Putre', 2, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (5, 'Alto Hospicio', 3, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (6, 'Iquique', 3, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (7, 'Camiña', 4, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (8, 'Colchane', 4, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (9, 'Huara', 4, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (10, 'Pica', 4, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (11, 'Pozo Almonte', 4, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (12, 'Antofagasta', 5, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (13, 'Mejillones', 5, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (14, 'Sierra Gorda', 5, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (15, 'Taltal', 5, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (16, 'Calama', 6, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (17, 'Ollague', 6, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (18, 'San Pedro de Atacama', 6, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (19, 'María Elena', 7, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (20, 'Tocopilla', 7, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (21, 'Chañaral', 8, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (22, 'Diego de Almagro', 8, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (23, 'Caldera', 9, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (24, 'Copiapó', 9, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (25, 'Tierra Amarilla', 9, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (26, 'Alto del Carmen', 10, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (27, 'Freirina', 10, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (28, 'Huasco', 10, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (29, 'Vallenar', 10, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (30, 'Canela', 11, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (31, 'Illapel', 11, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (32, 'Los Vilos', 11, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (33, 'Salamanca', 11, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (34, 'Andacollo', 12, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (35, 'Coquimbo', 12, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (36, 'La Higuera', 12, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (37, 'La Serena', 12, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (38, 'Paihuaco', 12, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (39, 'Vicuña', 12, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (40, 'Combarbalá', 13, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (41, 'Monte Patria', 13, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (42, 'Ovalle', 13, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (43, 'Punitaqui', 13, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (44, 'Río Hurtado', 13, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (45, 'Isla de Pascua', 14, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (46, 'Calle Larga', 15, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (47, 'Los Andes', 15, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (48, 'Rinconada', 15, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (49, 'San Esteban', 15, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (50, 'La Ligua', 16, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (51, 'Papudo', 16, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (52, 'Petorca', 16, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (53, 'Zapallar', 16, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (54, 'Hijuelas', 17, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (55, 'La Calera', 17, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (56, 'La Cruz', 17, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (57, 'Limache', 17, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (58, 'Nogales', 17, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (59, 'Olmué', 17, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (60, 'Quillota', 17, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (61, 'Algarrobo', 18, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (62, 'Cartagena', 18, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (63, 'El Quisco', 18, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (64, 'El Tabo', 18, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (65, 'San Antonio', 18, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (66, 'Santo Domingo', 18, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (67, 'Catemu', 19, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (68, 'Llaillay', 19, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (69, 'Panquehue', 19, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (70, 'Putaendo', 19, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (71, 'San Felipe', 19, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (72, 'Santa María', 19, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (73, 'Casablanca', 20, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (74, 'Concón', 20, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (75, 'Juan Fernández', 20, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (76, 'Puchuncaví', 20, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (77, 'Quilpué', 20, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (78, 'Quintero', 20, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (79, 'Valparaíso', 20, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (80, 'Villa Alemana', 20, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (81, 'Viña del Mar', 20, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (82, 'Colina', 21, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (83, 'Lampa', 21, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (84, 'Tiltil', 21, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (85, 'Pirque', 22, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (86, 'Puente Alto', 22, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (87, 'San José de Maipo', 22, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (88, 'Buin', 23, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (89, 'Calera de Tango', 23, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (90, 'Paine', 23, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (91, 'San Bernardo', 23, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (92, 'Alhué', 24, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (93, 'Curacaví', 24, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (94, 'María Pinto', 24, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (95, 'Melipilla', 24, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (96, 'San Pedro', 24, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (97, 'Cerrillos', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (98, 'Cerro Navia', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (99, 'Conchalí', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (100, 'El Bosque', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (101, 'Estación Central', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (102, 'Huechuraba', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (103, 'Independencia', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (104, 'La Cisterna', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (105, 'La Granja', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (106, 'La Florida', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (107, 'La Pintana', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (108, 'La Reina', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (109, 'Las Condes', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (110, 'Lo Barnechea', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (111, 'Lo Espejo', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (112, 'Lo Prado', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (113, 'Macul', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (114, 'Maipú', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (115, 'Ñuñoa', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (116, 'Pedro Aguirre Cerda', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (117, 'Peñalolén', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (118, 'Providencia', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (119, 'Pudahuel', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (120, 'Quilicura', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (121, 'Quinta Normal', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (122, 'Recoleta', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (123, 'Renca', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (124, 'San Miguel', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (125, 'San Joaquín', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (126, 'San Ramón', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (127, 'Santiago', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (128, 'Vitacura', 25, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (129, 'El Monte', 26, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (130, 'Isla de Maipo', 26, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (131, 'Padre Hurtado', 26, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (132, 'Peñaflor', 26, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (133, 'Talagante', 26, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (134, 'Codegua', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (135, 'Coínco', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (136, 'Coltauco', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (137, 'Doñihue', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (138, 'Graneros', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (139, 'Las Cabras', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (140, 'Machalí', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (141, 'Malloa', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (142, 'Mostazal', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (143, 'Olivar', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (144, 'Peumo', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (145, 'Pichidegua', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (146, 'Quinta de Tilcoco', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (147, 'Rancagua', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (148, 'Rengo', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (149, 'Requínoa', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (150, 'San Vicente de Tagua Tagua', 27, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (151, 'La Estrella', 28, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (152, 'Litueche', 28, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (153, 'Marchihue', 28, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (154, 'Navidad', 28, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (155, 'Peredones', 28, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (156, 'Pichilemu', 28, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (157, 'Chépica', 29, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (158, 'Chimbarongo', 29, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (159, 'Lolol', 29, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (160, 'Nancagua', 29, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (161, 'Palmilla', 29, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (162, 'Peralillo', 29, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (163, 'Placilla', 29, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (164, 'Pumanque', 29, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (165, 'San Fernando', 29, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (166, 'Santa Cruz', 29, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (167, 'Cauquenes', 30, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (168, 'Chanco', 30, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (169, 'Pelluhue', 30, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (170, 'Curicó', 31, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (171, 'Hualañé', 31, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (172, 'Licantén', 31, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (173, 'Molina', 31, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (174, 'Rauco', 31, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (175, 'Romeral', 31, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (176, 'Sagrada Familia', 31, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (177, 'Teno', 31, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (178, 'Vichuquén', 31, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (179, 'Colbún', 32, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (180, 'Linares', 32, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (181, 'Longaví', 32, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (182, 'Parral', 32, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (183, 'Retiro', 32, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (184, 'San Javier', 32, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (185, 'Villa Alegre', 32, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (186, 'Yerbas Buenas', 32, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (187, 'Constitución', 33, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (188, 'Curepto', 33, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (189, 'Empedrado', 33, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (190, 'Maule', 33, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (191, 'Pelarco', 33, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (192, 'Pencahue', 33, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (193, 'Río Claro', 33, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (194, 'San Clemente', 33, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (195, 'San Rafael', 33, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (196, 'Talca', 33, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (197, 'Arauco', 34, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (198, 'Cañete', 34, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (199, 'Contulmo', 34, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (200, 'Curanilahue', 34, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (201, 'Lebu', 34, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (202, 'Los Álamos', 34, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (203, 'Tirúa', 34, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (204, 'Alto Biobío', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (205, 'Antuco', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (206, 'Cabrero', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (207, 'Laja', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (208, 'Los Ángeles', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (209, 'Mulchén', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (210, 'Nacimiento', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (211, 'Negrete', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (212, 'Quilaco', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (213, 'Quilleco', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (214, 'San Rosendo', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (215, 'Santa Bárbara', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (216, 'Tucapel', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (217, 'Yumbel', 35, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (218, 'Chiguayante', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (219, 'Concepción', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (220, 'Coronel', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (221, 'Florida', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (222, 'Hualpén', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (223, 'Hualqui', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (224, 'Lota', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (225, 'Penco', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (226, 'San Pedro de La Paz', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (227, 'Santa Juana', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (228, 'Talcahuano', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (229, 'Tomé', 36, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (230, 'Bulnes', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (231, 'Chillán', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (232, 'Chillán Viejo', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (233, 'Cobquecura', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (234, 'Coelemu', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (235, 'Coihueco', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (236, 'El Carmen', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (237, 'Ninhue', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (238, 'Ñiquen', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (239, 'Pemuco', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (240, 'Pinto', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (241, 'Portezuelo', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (242, 'Quillón', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (243, 'Quirihue', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (244, 'Ránquil', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (245, 'San Carlos', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (246, 'San Fabián', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (247, 'San Ignacio', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (248, 'San Nicolás', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (249, 'Treguaco', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (250, 'Yungay', 37, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (251, 'Carahue', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (252, 'Cholchol', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (253, 'Cunco', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (254, 'Curarrehue', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (255, 'Freire', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (256, 'Galvarino', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (257, 'Gorbea', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (258, 'Lautaro', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (259, 'Loncoche', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (260, 'Melipeuco', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (261, 'Nueva Imperial', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (262, 'Padre Las Casas', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (263, 'Perquenco', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (264, 'Pitrufquén', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (265, 'Pucón', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (266, 'Saavedra', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (267, 'Temuco', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (268, 'Teodoro Schmidt', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (269, 'Toltén', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (270, 'Vilcún', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (271, 'Villarrica', 38, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (272, 'Angol', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (273, 'Collipulli', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (274, 'Curacautín', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (275, 'Ercilla', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (276, 'Lonquimay', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (277, 'Los Sauces', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (278, 'Lumaco', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (279, 'Purén', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (280, 'Renaico', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (281, 'Traiguén', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (282, 'Victoria', 39, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (283, 'Corral', 40, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (284, 'Lanco', 40, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (285, 'Los Lagos', 40, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (286, 'Máfil', 40, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (287, 'Mariquina', 40, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (288, 'Paillaco', 40, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (289, 'Panguipulli', 40, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (290, 'Valdivia', 40, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (291, 'Futrono', 41, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (292, 'La Unión', 41, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (293, 'Lago Ranco', 41, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (294, 'Río Bueno', 41, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (295, 'Ancud', 42, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (296, 'Castro', 42, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (297, 'Chonchi', 42, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (298, 'Curaco de Vélez', 42, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (299, 'Dalcahue', 42, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (300, 'Puqueldón', 42, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (301, 'Queilén', 42, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (302, 'Quemchi', 42, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (303, 'Quellón', 42, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (304, 'Quinchao', 42, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (305, 'Calbuco', 43, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (306, 'Cochamó', 43, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (307, 'Fresia', 43, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (308, 'Frutillar', 43, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (309, 'Llanquihue', 43, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (310, 'Los Muermos', 43, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (311, 'Maullín', 43, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (312, 'Puerto Montt', 43, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (313, 'Puerto Varas', 43, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (314, 'Osorno', 44, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (315, 'Puero Octay', 44, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (316, 'Purranque', 44, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (317, 'Puyehue', 44, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (318, 'Río Negro', 44, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (319, 'San Juan de la Costa', 44, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (320, 'San Pablo', 44, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (321, 'Chaitén', 45, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (322, 'Futaleufú', 45, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (323, 'Hualaihué', 45, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (324, 'Palena', 45, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (325, 'Aisén', 46, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (326, 'Cisnes', 46, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (327, 'Guaitecas', 46, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (328, 'Cochrane', 47, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (329, 'O higgins', 47, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (330, 'Tortel', 47, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (331, 'Coihaique', 48, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (332, 'Lago Verde', 48, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (333, 'Chile Chico', 49, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (334, 'Río Ibáñez', 49, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (335, 'Antártica', 50, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (336, 'Cabo de Hornos', 50, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (337, 'Laguna Blanca', 51, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (338, 'Punta Arenas', 51, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (339, 'Río Verde', 51, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (340, 'San Gregorio', 51, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (341, 'Porvenir', 52, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (342, 'Primavera', 52, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (343, 'Timaukel', 52, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (344, 'Natales', 53, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');
INSERT INTO public.comunas (id, name, "provinceId", "createdAt", "updatedAt") VALUES (345, 'Torres del Paine', 53, '2020-08-04 05:14:14.077258-04', '2020-08-04 05:14:14.077258-04');


--
-- TOC entry 3525 (class 0 OID 100695)
-- Dependencies: 243
-- Data for Name: dashboardPermissions; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (1, 1, 1, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (2, 1, 3, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (3, 2, 1, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (4, 2, 4, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (5, 3, 1, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (6, 3, 3, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (7, 4, 3, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (8, 4, 4, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (9, 4, 5, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (10, 5, 3, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (11, 5, 4, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (12, 5, 5, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (13, 6, 3, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (14, 6, 4, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (15, 6, 5, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (16, 7, 1, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (17, 7, 2, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (18, 7, 3, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (19, 8, 3, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (20, 8, 4, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (21, 8, 5, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (22, 9, 3, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (23, 9, 4, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (24, 9, 5, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (25, 10, 2, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (26, 10, 3, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (27, 12, 1, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');
INSERT INTO public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") VALUES (28, 12, 3, 1, '2020-10-27 13:02:00.003-04', '2020-10-27 13:02:00.003-04');


--
-- TOC entry 3586 (class 0 OID 174435)
-- Dependencies: 304
-- Data for Name: deliveries; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.deliveries (id, name, "createdAt", "updatedAt") VALUES (1, 'TEST1', '2020-09-06 22:31:46.095-04', '2020-09-06 22:31:46.095-04');
INSERT INTO public.deliveries (id, name, "createdAt", "updatedAt") VALUES (2, 'TEST2', '2020-09-06 22:31:46.095-04', '2020-09-06 22:31:46.095-04');


--
-- TOC entry 3570 (class 0 OID 149814)
-- Dependencies: 288
-- Data for Name: disponibilities; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.disponibilities (id, name, "createdAt", "updatedAt") VALUES (1, 'Inmediata', '2020-08-18 00:03:07.556-04', '2020-08-18 00:03:07.556-04');
INSERT INTO public.disponibilities (id, name, "createdAt", "updatedAt") VALUES (2, 'Por Pedido', '2020-08-18 00:03:07.556-04', '2020-08-18 00:03:07.556-04');


--
-- TOC entry 3550 (class 0 OID 117191)
-- Dependencies: 268
-- Data for Name: docTypes; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."docTypes" (id, name, "statusId", "createdAt", "updatedAt", "peopleTypeId") VALUES (1, 'RUT', 1, '2020-08-01 15:45:40.885-04', '2020-08-01 15:45:40.885-04', NULL);
INSERT INTO public."docTypes" (id, name, "statusId", "createdAt", "updatedAt", "peopleTypeId") VALUES (2, 'RUN', 1, '2020-08-01 15:45:40.885-04', '2020-08-01 15:45:40.885-04', NULL);
INSERT INTO public."docTypes" (id, name, "statusId", "createdAt", "updatedAt", "peopleTypeId") VALUES (3, 'DNI', 1, '2020-08-01 15:45:40.885-04', '2020-08-01 15:45:40.885-04', NULL);
INSERT INTO public."docTypes" (id, name, "statusId", "createdAt", "updatedAt", "peopleTypeId") VALUES (4, 'PASAPORTE', 1, '2020-08-01 15:45:40.885-04', '2020-08-01 15:45:40.885-04', NULL);


--
-- TOC entry 3588 (class 0 OID 174459)
-- Dependencies: 306
-- Data for Name: envoiceNotifies; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."envoiceNotifies" (id, "envoiceTypeId", "envoiceNum", "dateNotify", "deliveryId", taxes, "attachmentId", "createdAt", "updatedAt", "shopId") VALUES (5, 1, 45623, '2020-10-09 20:00:00-04', 2, '[{"tax":{"id":1,"name":"IVA"},"value":18.5}]', 31, '2020-09-06 22:31:49.67-04', '2020-09-06 22:31:49.67-04', 115);
INSERT INTO public."envoiceNotifies" (id, "envoiceTypeId", "envoiceNum", "dateNotify", "deliveryId", taxes, "attachmentId", "createdAt", "updatedAt", "shopId") VALUES (7, 1, 4562000, '2020-10-09 20:00:00-04', 2, '[{"tax":{"id":1,"name":"IVA"},"value":18.5}]', 33, '2020-09-06 22:36:44.396-04', '2020-09-06 22:36:44.396-04', 115);
INSERT INTO public."envoiceNotifies" (id, "envoiceTypeId", "envoiceNum", "dateNotify", "deliveryId", taxes, "attachmentId", "createdAt", "updatedAt", "shopId") VALUES (8, 1, 45623036, '2020-10-09 20:00:00-04', 2, '[{"tax":{"id":1,"name":"IVA"},"value":18.5}]', 35, '2020-09-06 22:41:49.101-04', '2020-09-06 22:41:49.101-04', 115);
INSERT INTO public."envoiceNotifies" (id, "envoiceTypeId", "envoiceNum", "dateNotify", "deliveryId", taxes, "attachmentId", "createdAt", "updatedAt", "shopId") VALUES (9, 1, 456230306, '2020-10-09 20:00:00-04', 2, '[{"tax":{"id":1,"name":"IVA"},"value":18.5}]', 36, '2020-09-06 22:43:15.343-04', '2020-09-06 22:43:15.343-04', 115);
INSERT INTO public."envoiceNotifies" (id, "envoiceTypeId", "envoiceNum", "dateNotify", "deliveryId", taxes, "attachmentId", "createdAt", "updatedAt", "shopId") VALUES (10, 1, 430306, '2020-10-09 20:00:00-04', 2, '[{"tax":{"id":1,"name":"IVA"},"value":18.5}]', 37, '2020-09-06 22:44:44.696-04', '2020-09-06 22:44:44.696-04', 115);
INSERT INTO public."envoiceNotifies" (id, "envoiceTypeId", "envoiceNum", "dateNotify", "deliveryId", taxes, "attachmentId", "createdAt", "updatedAt", "shopId") VALUES (11, 1, 43030456, '2020-10-09 20:00:00-04', 2, '[{"tax":{"id":1,"name":"IVA"},"value":18.5}]', 38, '2020-09-06 22:46:11.142-04', '2020-09-06 22:46:11.142-04', 115);
INSERT INTO public."envoiceNotifies" (id, "envoiceTypeId", "envoiceNum", "dateNotify", "deliveryId", taxes, "attachmentId", "createdAt", "updatedAt", "shopId") VALUES (12, 1, 430304563, '2020-10-09 20:00:00-04', 2, '[{"tax":{"id":1,"name":"IVA"},"value":18.5}]', 39, '2020-09-06 22:49:53.403-04', '2020-09-06 22:49:53.403-04', 115);
INSERT INTO public."envoiceNotifies" (id, "envoiceTypeId", "envoiceNum", "dateNotify", "deliveryId", taxes, "attachmentId", "createdAt", "updatedAt", "shopId") VALUES (14, 1, 4309563, '2020-10-09 20:00:00-04', 2, '[{"tax":{"id":1,"name":"IVA"},"value":18.5}]', 41, '2020-09-06 22:51:14.25-04', '2020-09-06 22:51:14.25-04', 115);
INSERT INTO public."envoiceNotifies" (id, "envoiceTypeId", "envoiceNum", "dateNotify", "deliveryId", taxes, "attachmentId", "createdAt", "updatedAt", "shopId") VALUES (15, 1, 430956113, '2020-10-09 20:00:00-04', 2, '[{"tax":{"id":1,"name":"IVA"},"value":18.5}]', 42, '2020-09-06 22:53:46.032-04', '2020-09-06 22:53:46.032-04', 115);


--
-- TOC entry 3584 (class 0 OID 174387)
-- Dependencies: 302
-- Data for Name: envoiceTypes; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."envoiceTypes" (id, name, "createdAt", "updatedAt") VALUES (1, 'Boelta', '2020-09-06 22:28:16.808-04', '2020-09-06 22:28:16.808-04');
INSERT INTO public."envoiceTypes" (id, name, "createdAt", "updatedAt") VALUES (2, 'Factura', '2020-09-06 22:28:16.808-04', '2020-09-06 22:28:16.808-04');


--
-- TOC entry 3527 (class 0 OID 100701)
-- Dependencies: 245
-- Data for Name: grantRoles; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (2, 1, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (3, 2, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (4, 3, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (5, 4, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (6, 5, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (7, 6, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (8, 7, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (9, 8, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (10, 9, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (11, 10, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (12, 11, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (13, 12, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (14, 13, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (15, 14, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (16, 15, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (17, 16, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (18, 17, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (19, 18, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (20, 19, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (21, 20, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (22, 21, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (23, 22, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (24, 23, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (25, 24, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (26, 25, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (27, 26, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (28, 27, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');
INSERT INTO public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") VALUES (29, 28, 7, 1, '2020-10-27 14:20:02.665-04', '2020-10-27 14:20:02.665-04');


--
-- TOC entry 3574 (class 0 OID 149834)
-- Dependencies: 292
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.materials (id, name, "createdAt", "updatedAt") VALUES (1, 'Madera', '2020-08-18 01:40:41.889-04', '2020-08-18 01:40:41.889-04');
INSERT INTO public.materials (id, name, "createdAt", "updatedAt") VALUES (2, 'Plastico', '2020-08-18 01:40:41.889-04', '2020-08-18 01:40:41.889-04');
INSERT INTO public.materials (id, name, "createdAt", "updatedAt") VALUES (3, 'Lana', '2020-08-18 01:40:41.889-04', '2020-08-18 01:40:41.889-04');


--
-- TOC entry 3598 (class 0 OID 207131)
-- Dependencies: 316
-- Data for Name: peopleTypes; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."peopleTypes" (id, name, "StatusId", "createdAt", "updatedAt") VALUES (2, 'John', 1, '2020-10-11 17:58:04.306-04', '2020-10-11 17:58:04.306-04');


--
-- TOC entry 3542 (class 0 OID 117131)
-- Dependencies: 260
-- Data for Name: phoneTypes; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."phoneTypes" (id, name, "statusId", "createdAt", "updatedAt") VALUES (1, 'Movil', 1, '2020-08-01 23:25:02.727-04', '2020-08-01 23:25:02.727-04');
INSERT INTO public."phoneTypes" (id, name, "statusId", "createdAt", "updatedAt") VALUES (2, 'Casa', 1, '2020-08-01 23:25:02.727-04', '2020-08-01 23:25:02.727-04');
INSERT INTO public."phoneTypes" (id, name, "statusId", "createdAt", "updatedAt") VALUES (3, 'Empresa', 1, '2020-08-01 23:25:02.727-04', '2020-08-01 23:25:02.727-04');


--
-- TOC entry 3529 (class 0 OID 100706)
-- Dependencies: 247
-- Data for Name: postalCodes; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3552 (class 0 OID 125151)
-- Dependencies: 270
-- Data for Name: processTypes; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3560 (class 0 OID 125292)
-- Dependencies: 278
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (1, 'Arica', 1, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (2, 'Parinacota', 1, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (3, 'Iquique', 2, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (4, 'El Tamarugal', 2, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (5, 'Antofagasta', 3, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (6, 'El Loa', 3, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (7, 'Tocopilla', 3, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (8, 'Chañaral', 4, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (9, 'Copiapó', 4, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (10, 'Huasco', 4, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (11, 'Choapa', 5, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (12, 'Elqui', 5, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (13, 'Limarí', 5, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (14, 'Isla de Pascua', 6, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (15, 'Los Andes', 6, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (16, 'Petorca', 6, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (17, 'Quillota', 6, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (18, 'San Antonio', 6, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (19, 'San Felipe de Aconcagua', 6, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (20, 'Valparaiso', 6, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (21, 'Chacabuco', 7, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (22, 'Cordillera', 7, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (23, 'Maipo', 7, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (24, 'Melipilla', 7, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (25, 'Santiago', 7, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (26, 'Talagante', 7, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (27, 'Cachapoal', 8, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (28, 'Cardenal Caro', 8, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (29, 'Colchagua', 8, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (30, 'Cauquenes', 9, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (31, 'Curicó', 9, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (32, 'Linares', 9, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (33, 'Talca', 9, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (34, 'Arauco', 10, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (35, 'Bio Bío', 10, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (36, 'Concepción', 10, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (37, 'Ñuble', 10, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (38, 'Cautín', 11, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (39, 'Malleco', 11, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (40, 'Valdivia', 12, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (41, 'Ranco', 12, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (42, 'Chiloé', 13, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (43, 'Llanquihue', 13, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (44, 'Osorno', 13, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (45, 'Palena', 13, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (46, 'Aisén', 14, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (47, 'Capitán Prat', 14, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (48, 'Coihaique', 14, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (49, 'General Carrera', 14, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (50, 'Antártica Chilena', 15, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (51, 'Magallanes', 15, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (52, 'Tierra del Fuego', 15, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');
INSERT INTO public.provinces (id, name, "regionId", "createdAt", "updatedAt") VALUES (53, 'Última Esperanza', 15, '2020-08-04 04:42:57.430892-04', '2020-08-04 04:42:57.430892-04');


--
-- TOC entry 3572 (class 0 OID 149824)
-- Dependencies: 290
-- Data for Name: reasons; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.reasons (id, name, "createdAt", "updatedAt") VALUES (1, 'Festividades', '2020-08-18 00:18:41.603-04', '2020-08-18 00:18:41.603-04');
INSERT INTO public.reasons (id, name, "createdAt", "updatedAt") VALUES (2, 'Estacional', '2020-08-18 00:18:41.603-04', '2020-08-18 00:18:41.603-04');
INSERT INTO public.reasons (id, name, "createdAt", "updatedAt") VALUES (3, 'Destacados', '2020-08-18 00:18:41.603-04', '2020-08-18 00:18:41.603-04');


--
-- TOC entry 3558 (class 0 OID 125227)
-- Dependencies: 276
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (1, 'Arica y Parinacota', 'XV', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (2, 'Tarapacá', 'I', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (3, 'Antofagasta', 'II', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (4, 'Atacama', 'III', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (5, 'Coquimbo', 'IV', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (6, 'Valparaiso', 'V', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (7, 'Metropolitana de Santiago', 'RM', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (8, 'Libertador General Bernardo O Higgins', 'VI', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (9, 'Maule', 'VII', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (10, 'Biobío', 'VIII', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (11, 'La Araucanía', 'IX', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (12, 'Los Ríos', 'XIV', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (13, 'Los Lagos', 'X', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (14, 'Aisén del General Carlos Ibáñez del Campo', 'XI', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');
INSERT INTO public.regions (id, name, ordinal, "createdAt", "updatedAt") VALUES (15, 'Magallanes y de la Antártica Chilena', 'XII', '2020-08-04 04:38:55.973979-04', '2020-08-04 04:38:55.973979-04');


--
-- TOC entry 3546 (class 0 OID 117161)
-- Dependencies: 264
-- Data for Name: salesChannels; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."salesChannels" (id, name, "statusId", "createdAt", "updatedAt") VALUES (5, 'Redes Sociales', 1, '2020-08-02 00:40:37.931-04', '2020-08-02 00:40:37.931-04');
INSERT INTO public."salesChannels" (id, name, "statusId", "createdAt", "updatedAt") VALUES (6, 'Vendo Personalmente', 1, '2020-08-02 00:40:37.931-04', '2020-08-02 00:40:37.931-04');
INSERT INTO public."salesChannels" (id, name, "statusId", "createdAt", "updatedAt") VALUES (7, 'Otro Marketplace', 1, '2020-08-02 00:40:37.931-04', '2020-08-02 00:40:37.931-04');
INSERT INTO public."salesChannels" (id, name, "statusId", "createdAt", "updatedAt") VALUES (8, 'Por medio de un aliado comercial', 1, '2020-08-02 00:40:37.931-04', '2020-08-02 00:40:37.931-04');


--
-- TOC entry 3578 (class 0 OID 166188)
-- Dependencies: 296
-- Data for Name: shopContracts; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."shopContracts" (id, "contractId", "shopId", "statusId", "createdAt", "updatedAt", "contractDesc") VALUES (9, 21, 115, 1, '2020-08-31 18:47:34.643-04', '2020-08-31 18:47:34.643-04', '[{"fin": "2021-02-01", "nota": "null", "inicio": "2020-02-01", "number": 2659, "minStock": 5, "comProduct": "15", "comService": "15"}]');


--
-- TOC entry 3540 (class 0 OID 117025)
-- Dependencies: 258
-- Data for Name: shopRequests; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."shopRequests" (id, "AccountId", status, phone, marca, "storeType", "startActivity", "isStore", "descShop", "salesChannels", affirmations, employees, "createdAt", "updatedAt", process) VALUES (39, 188, '[{"id": 1, "date": "NOW()", "name": "En Evaluación"}]', '[{"phoneType": 1, "phoneNmber": 201235656}, {"phoneType": 2, "phoneNmber": 5655656}]', 'Mis medias', '{"data": [{"id": 1, "name": "Fabrico Productos Hechos a mano"}, {"id": 1, "name": "Fabrico y vendo medias"}]}', true, false, 'Vendo medias limpias sin usar, tienen buen olor porque nadie las ha usado', '[{"id": 1, "name": "Redes Sociales"}, {"id": 2, "name": "Pagían WEB"}, {"id": 3, "name": "Personal"}]', '{"id": 1, "name": "Estoy empezando, me vendría bien ayuda para profesionalizar mi negocio y poder dedicarme tiempo completo"}', 2, '2020-08-27 15:20:11.824-04', '2020-08-31 18:47:34.556-04', NULL);
INSERT INTO public."shopRequests" (id, "AccountId", status, phone, marca, "storeType", "startActivity", "isStore", "descShop", "salesChannels", affirmations, employees, "createdAt", "updatedAt", process) VALUES (38, 188, '[{"id": 1, "date": "NOW()", "name": "En Evaluación"}, {"id": 4, "date": "2020-08-28T04:33:53.375Z", "name": "Pre-Aprobado"}, {"id": 2, "date": null, "name": "Aprobada"}]', '[{"phoneType": 1, "phoneNmber": 201235656}, {"phoneType": 2, "phoneNmber": 5655656}]', 'Mis Colores', '{"data": [{"id": 1, "name": "Fabrico Productos Hechos a mano"}, {"id": 1, "name": "Fabrico Productos con la ayuda de un socio productor"}]}', true, false, 'Tengo una tienda hermosa rosada con olor a chicle, vendo flojes y cicle (por eso el olor), además disto talleres da floristeria y jadineria ', '[{"id": 1, "name": "Redes Sociales"}, {"id": 2, "name": "Pagían WEB"}, {"id": 3, "name": "Personal"}, {"id": 4, "name": "Algún Market Place"}]', '{"id": 1, "name": "Estoy empezando, me vendría bien ayuda para profesionalizar mi negocio y poder dedicarme tiempo completo"}', 1, '2020-08-27 15:20:11.824-04', '2020-08-31 18:47:34.556-04', NULL);


--
-- TOC entry 3554 (class 0 OID 125179)
-- Dependencies: 272
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public.shops (id, name, logo, "shopDescription", "isLocal", employees, partner, address, "paymentCong", "startActivityAttachment", "createdAt", "updatedAt", "shopRequestId", "processId", "statusId", phone, "startActivity", "storeType") VALUES (115, 'Mis Colores', NULL, 'Tengo una tienda hermosa rosada con olor a chicle, vendo flojes y cicle (por eso el olor), además disto talleres da floristeria y jadineria ', false, 1, NULL, NULL, NULL, NULL, '2020-08-31 18:47:34.636-04', '2020-08-31 18:47:34.636-04', 38, NULL, 1, '[{"phoneType": 1, "phoneNmber": 201235656}, {"phoneType": 2, "phoneNmber": 5655656}]', true, '{"data": [{"id": 1, "name": "Fabrico Productos Hechos a mano"}, {"id": 1, "name": "Fabrico Productos con la ayuda de un socio productor"}]}');


--
-- TOC entry 3564 (class 0 OID 149777)
-- Dependencies: 282
-- Data for Name: statusProcesses; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."statusProcesses" (id, name, "createdAt", "updatedAt") VALUES (1, 'En Evaluación', '2020-08-17 21:56:33.296-04', '2020-08-17 21:56:33.296-04');
INSERT INTO public."statusProcesses" (id, name, "createdAt", "updatedAt") VALUES (4, 'Aprobación Condicionada', '2020-08-17 21:56:33.296-04', '2020-08-17 21:56:33.296-04');
INSERT INTO public."statusProcesses" (id, name, "createdAt", "updatedAt") VALUES (2, 'Aprobada', '2020-08-17 21:56:33.296-04', '2020-08-17 21:56:33.296-04');
INSERT INTO public."statusProcesses" (id, name, "createdAt", "updatedAt") VALUES (5, 'Pre-Aprobada', '2020-08-17 21:56:33.296-04', '2020-08-17 21:56:33.296-04');
INSERT INTO public."statusProcesses" (id, name, "createdAt", "updatedAt") VALUES (3, 'Negada', '2020-08-17 21:56:33.296-04', '2020-08-17 21:56:33.296-04');


--
-- TOC entry 3544 (class 0 OID 117146)
-- Dependencies: 262
-- Data for Name: storeTypes; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."storeTypes" (id, name, "statusId", "createdAt", "updatedAt") VALUES (1, 'Fabrico Productos Hechos a mano', 1, '2020-08-01 23:44:01.054-04', '2020-08-01 23:44:01.054-04');
INSERT INTO public."storeTypes" (id, name, "statusId", "createdAt", "updatedAt") VALUES (2, 'Fabrico Productos con la ayuda de un socio productor', 1, '2020-08-01 23:44:01.054-04', '2020-08-01 23:44:01.054-04');
INSERT INTO public."storeTypes" (id, name, "statusId", "createdAt", "updatedAt") VALUES (3, 'Soy distribuidor de una marca de Insumos o herramientas del rubro de artes, manualidades o celebraciones', 1, '2020-08-01 23:44:01.054-04', '2020-08-01 23:44:01.054-04');
INSERT INTO public."storeTypes" (id, name, "statusId", "createdAt", "updatedAt") VALUES (4, 'Presto servicios o imparto cursos para el rubro de artes, manualidades o celebraciones', 1, '2020-08-01 23:44:01.054-04', '2020-08-01 23:44:01.054-04');


--
-- TOC entry 3531 (class 0 OID 100711)
-- Dependencies: 249
-- Data for Name: subModules; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (1, 'Procesar', '/processRequest', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 1, 'Puede Pre-Aprobar o rechazar una postulación');
INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (2, 'Consulta Postulaciones', '/selectRequest', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 1, 'Encuenta las postulaciones en diferentes estatus');
INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (3, 'Aprobación ', '/aproveRequest', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 1, 'Aprubea las postulaciones procesadas');
INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (4, 'Por Tienda ', '/invetoryByShop', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 6, 'Monitor de inventario por Tienda ');
INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (5, 'Por Producto ', '/inventoryByProduct', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 6, 'Monitor de inventario por producto');
INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (6, 'Por Localidad ', '/aproveRequest', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 6, 'Monitor de inventario por unicación geográfica de la tienda');
INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (7, 'Contrato ', '/createContrat', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 2, 'Registra contrato y condiciones con tienda Pampatar');
INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (8, 'Consulta de Contratos ', '/createContrat', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 2, 'Encuentra los contratos creados en diferentes status');
INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (9, 'Monitor de Ventas', '/shopMonitor', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 4, 'Monitor de Ventas de por tienda');
INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (10, 'Actualizar politicas', '/upgradePolitics', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 3, 'Actualizar politicas de vendedor');
INSERT INTO public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId", description) VALUES (12, 'Enviar Notificaciones', '/notificationsSend', 1, '2020-10-26 20:31:23.63-04', '2020-10-26 20:31:23.63-04', 5, 'Enviar notificaciones a usuarios');


--
-- TOC entry 3582 (class 0 OID 174369)
-- Dependencies: 300
-- Data for Name: taxValues; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3580 (class 0 OID 174359)
-- Dependencies: 298
-- Data for Name: taxes; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 217
-- Name: Accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Accounts_id_seq"', 199, true);


--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 253
-- Name: Bids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Bids_id_seq"', 29, true);


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 251
-- Name: Brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Brands_id_seq"', 3, true);


--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 219
-- Name: Dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Dashboards_id_seq"', 11, true);


--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 221
-- Name: Genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Genders_id_seq"', 3, true);


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 223
-- Name: Modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Modules_id_seq"', 1, false);


--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 225
-- Name: Nationalities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Nationalities_id_seq"', 1, false);


--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 227
-- Name: People_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."People_id_seq"', 166, true);


--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 229
-- Name: Permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Permissions_id_seq"', 1, false);


--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 231
-- Name: Properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Properties_id_seq"', 1, false);


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 233
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Roles_id_seq"', 7, true);


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 236
-- Name: Status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Status_id_seq"', 1, false);


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 255
-- Name: Subscribes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Subscribes_id_seq"', 91, true);


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 238
-- Name: Warehouses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Warehouses_id_seq"', 41, true);


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 240
-- Name: accountRoles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."accountRoles_id_seq"', 104, true);


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 242
-- Name: addressTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."addressTypes_id_seq"', 1, false);


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 265
-- Name: affirmations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.affirmations_id_seq', 3, true);


--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 285
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.attachments_id_seq', 42, true);


--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 273
-- Name: banks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.banks_id_seq', 14, true);


--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 283
-- Name: bidTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."bidTypes_id_seq"', 2, true);


--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 307
-- Name: cat1s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.cat1s_id_seq', 1, false);


--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 309
-- Name: cat2s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.cat2s_id_seq', 1, false);


--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 311
-- Name: cat3s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.cat3s_id_seq', 1, false);


--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 313
-- Name: cat4s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.cat4s_id_seq', 1, true);


--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 293
-- Name: civilStatuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."civilStatuses_id_seq"', 1, false);


--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 279
-- Name: comunas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.comunas_id_seq', 1, false);


--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 244
-- Name: dashboardPermissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."dashboardPermissions_id_seq"', 1, false);


--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 303
-- Name: deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.deliveries_id_seq', 2, true);


--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 287
-- Name: disponibilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.disponibilities_id_seq', 2, true);


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 267
-- Name: docTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."docTypes_id_seq"', 4, true);


--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 305
-- Name: envoiceNotifies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."envoiceNotifies_id_seq"', 15, true);


--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 301
-- Name: envoiceTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."envoiceTypes_id_seq"', 2, true);


--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 246
-- Name: grantRoles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."grantRoles_id_seq"', 29, true);


--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 291
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.materials_id_seq', 3, true);


--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 315
-- Name: peopleTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."peopleTypes_id_seq"', 2, true);


--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 259
-- Name: phoneTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."phoneTypes_id_seq"', 3, true);


--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 248
-- Name: postalCodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."postalCodes_id_seq"', 1, false);


--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 269
-- Name: processTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."processTypes_id_seq"', 1, false);


--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 277
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.provinces_id_seq', 1, false);


--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 289
-- Name: reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.reasons_id_seq', 3, true);


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 275
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.regions_id_seq', 1, false);


--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 263
-- Name: salesChannels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."salesChannels_id_seq"', 8, true);


--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 295
-- Name: shopContracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."shopContracts_id_seq"', 9, true);


--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 257
-- Name: shopRequests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."shopRequests_id_seq"', 38, true);


--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 271
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.shops_id_seq', 115, true);


--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 281
-- Name: statusProcesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."statusProcesses_id_seq"', 4, true);


--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 261
-- Name: storeTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."storeTypes_id_seq"', 4, true);


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 250
-- Name: subModules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."subModules_id_seq"', 1, false);


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 299
-- Name: taxValues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."taxValues_id_seq"', 1, false);


--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 297
-- Name: taxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public.taxes_id_seq', 1, false);


--
-- TOC entry 3132 (class 2606 OID 100745)
-- Name: Accounts Accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_email_key" UNIQUE (email);


--
-- TOC entry 3134 (class 2606 OID 100747)
-- Name: Accounts Accounts_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_name_key" UNIQUE (name);


--
-- TOC entry 3136 (class 2606 OID 100749)
-- Name: Accounts Accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 101260)
-- Name: Bids Bids_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_pkey" PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 101196)
-- Name: Brands Brands_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Brands"
    ADD CONSTRAINT "Brands_name_key" UNIQUE (name);


--
-- TOC entry 3205 (class 2606 OID 101194)
-- Name: Brands Brands_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Brands"
    ADD CONSTRAINT "Brands_pkey" PRIMARY KEY (id);


--
-- TOC entry 3138 (class 2606 OID 100759)
-- Name: Dashboards Dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_pkey" PRIMARY KEY (id);


--
-- TOC entry 3140 (class 2606 OID 100761)
-- Name: Dashboards Dashboards_subModuleId_moduleId_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_moduleId_key" UNIQUE ("subModuleId", "ModuleId");


--
-- TOC entry 3142 (class 2606 OID 100763)
-- Name: Genders Genders_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_name_key" UNIQUE (name);


--
-- TOC entry 3144 (class 2606 OID 100765)
-- Name: Genders Genders_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_pkey" PRIMARY KEY (id);


--
-- TOC entry 3146 (class 2606 OID 100767)
-- Name: Modules Modules_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_name_key" UNIQUE (name);


--
-- TOC entry 3148 (class 2606 OID 100769)
-- Name: Modules Modules_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_pkey" PRIMARY KEY (id);


--
-- TOC entry 3150 (class 2606 OID 100771)
-- Name: Nationalities Nationalities_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_name_key" UNIQUE (name);


--
-- TOC entry 3152 (class 2606 OID 100773)
-- Name: Nationalities Nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_pkey" PRIMARY KEY (id);


--
-- TOC entry 3154 (class 2606 OID 100777)
-- Name: People People_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_pkey" PRIMARY KEY (id);


--
-- TOC entry 3156 (class 2606 OID 100779)
-- Name: Permissions Permissions_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_name_key" UNIQUE (name);


--
-- TOC entry 3158 (class 2606 OID 100781)
-- Name: Permissions Permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_pkey" PRIMARY KEY (id);


--
-- TOC entry 3160 (class 2606 OID 100787)
-- Name: Properties Properties_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_name_key" UNIQUE (name);


--
-- TOC entry 3162 (class 2606 OID 100789)
-- Name: Properties Properties_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_pkey" PRIMARY KEY (id);


--
-- TOC entry 3164 (class 2606 OID 100795)
-- Name: Roles Roles_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key" UNIQUE (name);


--
-- TOC entry 3166 (class 2606 OID 100797)
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- TOC entry 3168 (class 2606 OID 100799)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 3170 (class 2606 OID 100801)
-- Name: Status Status_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_name_key" UNIQUE (name);


--
-- TOC entry 3172 (class 2606 OID 100803)
-- Name: Status Status_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_pkey" PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 116976)
-- Name: Subscribes Subscribes_email_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Subscribes"
    ADD CONSTRAINT "Subscribes_email_key" UNIQUE (email);


--
-- TOC entry 3214 (class 2606 OID 116974)
-- Name: Subscribes Subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Subscribes"
    ADD CONSTRAINT "Subscribes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3174 (class 2606 OID 100811)
-- Name: Warehouses Warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_pkey" PRIMARY KEY (id);


--
-- TOC entry 3179 (class 2606 OID 100813)
-- Name: accountRoles accountRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_pkey" PRIMARY KEY (id);


--
-- TOC entry 3182 (class 2606 OID 141582)
-- Name: accountRoles account_roles_uq; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT account_roles_uq UNIQUE ("AccountId", "RoleId");


--
-- TOC entry 3184 (class 2606 OID 100817)
-- Name: addressTypes addressTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."addressTypes"
    ADD CONSTRAINT "addressTypes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3230 (class 2606 OID 117183)
-- Name: affirmations affirmations_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.affirmations
    ADD CONSTRAINT affirmations_name_key UNIQUE (name);


--
-- TOC entry 3232 (class 2606 OID 117181)
-- Name: affirmations affirmations_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.affirmations
    ADD CONSTRAINT affirmations_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 149805)
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 125212)
-- Name: banks banks_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_name_key UNIQUE (name);


--
-- TOC entry 3251 (class 2606 OID 125210)
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 125214)
-- Name: banks banks_sbif_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_sbif_key UNIQUE (sbif);


--
-- TOC entry 3209 (class 2606 OID 166219)
-- Name: Bids bibs_uq; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT bibs_uq UNIQUE (title, "shopId");


--
-- TOC entry 3273 (class 2606 OID 149794)
-- Name: bidTypes bidTypes_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."bidTypes"
    ADD CONSTRAINT "bidTypes_name_key" UNIQUE (name);


--
-- TOC entry 3275 (class 2606 OID 149792)
-- Name: bidTypes bidTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."bidTypes"
    ADD CONSTRAINT "bidTypes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 174537)
-- Name: cat1s cat1s_UQ; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.cat1s
    ADD CONSTRAINT "cat1s_UQ" UNIQUE (name);


--
-- TOC entry 3318 (class 2606 OID 174496)
-- Name: cat1s cat1s_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.cat1s
    ADD CONSTRAINT cat1s_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 174507)
-- Name: cat2s cat2s_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.cat2s
    ADD CONSTRAINT cat2s_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 174518)
-- Name: cat3s cat3s_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.cat3s
    ADD CONSTRAINT cat3s_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 174529)
-- Name: cat4s cat4s_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.cat4s
    ADD CONSTRAINT cat4s_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 166175)
-- Name: civilStatuses civilStatuses_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."civilStatuses"
    ADD CONSTRAINT "civilStatuses_pkey" PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 125324)
-- Name: comunas comunas_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT comunas_name_key UNIQUE (name);


--
-- TOC entry 3267 (class 2606 OID 125322)
-- Name: comunas comunas_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT comunas_pkey PRIMARY KEY (id);


--
-- TOC entry 3186 (class 2606 OID 100821)
-- Name: dashboardPermissions dashboardPermissions_permissionId_dashboardId_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_dashboardId_key" UNIQUE ("PermissionId", "DashboardId");


--
-- TOC entry 3188 (class 2606 OID 100823)
-- Name: dashboardPermissions dashboardPermissions_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_pkey" PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 174440)
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 149821)
-- Name: disponibilities disponibilities_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.disponibilities
    ADD CONSTRAINT disponibilities_name_key UNIQUE (name);


--
-- TOC entry 3281 (class 2606 OID 149819)
-- Name: disponibilities disponibilities_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.disponibilities
    ADD CONSTRAINT disponibilities_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 117198)
-- Name: docTypes docTypes_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."docTypes"
    ADD CONSTRAINT "docTypes_name_key" UNIQUE (name);


--
-- TOC entry 3236 (class 2606 OID 117196)
-- Name: docTypes docTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."docTypes"
    ADD CONSTRAINT "docTypes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 174485)
-- Name: envoiceNotifies envoiceNotifiesNumber_UQ; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifiesNumber_UQ" UNIQUE ("envoiceNum");


--
-- TOC entry 3313 (class 2606 OID 174467)
-- Name: envoiceNotifies envoiceNotifies_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_pkey" PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 174394)
-- Name: envoiceTypes envoiceTypes_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."envoiceTypes"
    ADD CONSTRAINT "envoiceTypes_name_key" UNIQUE (name);


--
-- TOC entry 3307 (class 2606 OID 174392)
-- Name: envoiceTypes envoiceTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."envoiceTypes"
    ADD CONSTRAINT "envoiceTypes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 100825)
-- Name: grantRoles grantRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_pkey" PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 100827)
-- Name: grantRoles grantRoles_roleId_dashboradPermissionId_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_dashboradPermissionId_key" UNIQUE ("RoleId", "dashboardPermissionId");


--
-- TOC entry 3287 (class 2606 OID 149841)
-- Name: materials materials_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_name_key UNIQUE (name);


--
-- TOC entry 3289 (class 2606 OID 149839)
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 207138)
-- Name: peopleTypes peopleTypes_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."peopleTypes"
    ADD CONSTRAINT "peopleTypes_name_key" UNIQUE (name);


--
-- TOC entry 3329 (class 2606 OID 207136)
-- Name: peopleTypes peopleTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."peopleTypes"
    ADD CONSTRAINT "peopleTypes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 117138)
-- Name: phoneTypes phoneTypes_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."phoneTypes"
    ADD CONSTRAINT "phoneTypes_name_key" UNIQUE (name);


--
-- TOC entry 3220 (class 2606 OID 117136)
-- Name: phoneTypes phoneTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."phoneTypes"
    ADD CONSTRAINT "phoneTypes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 100829)
-- Name: postalCodes postalCodes_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_name_key" UNIQUE (name);


--
-- TOC entry 3196 (class 2606 OID 100831)
-- Name: postalCodes postalCodes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 125158)
-- Name: processTypes processTypes_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."processTypes"
    ADD CONSTRAINT "processTypes_name_key" UNIQUE (name);


--
-- TOC entry 3241 (class 2606 OID 125156)
-- Name: processTypes processTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."processTypes"
    ADD CONSTRAINT "processTypes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 125299)
-- Name: provinces provinces_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_name_key UNIQUE (name);


--
-- TOC entry 3263 (class 2606 OID 125297)
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 149831)
-- Name: reasons reasons_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.reasons
    ADD CONSTRAINT reasons_name_key UNIQUE (name);


--
-- TOC entry 3285 (class 2606 OID 149829)
-- Name: reasons reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.reasons
    ADD CONSTRAINT reasons_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 125237)
-- Name: regions regions_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_name_key UNIQUE (name);


--
-- TOC entry 3257 (class 2606 OID 125239)
-- Name: regions regions_ordinal_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_ordinal_key UNIQUE (ordinal);


--
-- TOC entry 3259 (class 2606 OID 125235)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 117168)
-- Name: salesChannels salesChannels_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."salesChannels"
    ADD CONSTRAINT "salesChannels_name_key" UNIQUE (name);


--
-- TOC entry 3228 (class 2606 OID 117166)
-- Name: salesChannels salesChannels_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."salesChannels"
    ADD CONSTRAINT "salesChannels_pkey" PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 166195)
-- Name: shopContracts shopContracts_contractId_shopId_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_contractId_shopId_key" UNIQUE ("contractId", "shopId");


--
-- TOC entry 3295 (class 2606 OID 166193)
-- Name: shopContracts shopContracts_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_pkey" PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 117033)
-- Name: shopRequests shopRequests_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."shopRequests"
    ADD CONSTRAINT "shopRequests_pkey" PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 125189)
-- Name: shops shops_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_name_key UNIQUE (name);


--
-- TOC entry 3247 (class 2606 OID 125187)
-- Name: shops shops_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 149784)
-- Name: statusProcesses statusProcesses_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."statusProcesses"
    ADD CONSTRAINT "statusProcesses_name_key" UNIQUE (name);


--
-- TOC entry 3271 (class 2606 OID 149782)
-- Name: statusProcesses statusProcesses_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."statusProcesses"
    ADD CONSTRAINT "statusProcesses_pkey" PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 117153)
-- Name: storeTypes storeTypes_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."storeTypes"
    ADD CONSTRAINT "storeTypes_name_key" UNIQUE (name);


--
-- TOC entry 3224 (class 2606 OID 117151)
-- Name: storeTypes storeTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."storeTypes"
    ADD CONSTRAINT "storeTypes_pkey" PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 100833)
-- Name: subModules subModules_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_name_key" UNIQUE (name);


--
-- TOC entry 3201 (class 2606 OID 100835)
-- Name: subModules subModules_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_pkey" PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 174377)
-- Name: taxValues taxValues_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."taxValues"
    ADD CONSTRAINT "taxValues_pkey" PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 174379)
-- Name: taxValues taxValues_taxId_value_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."taxValues"
    ADD CONSTRAINT "taxValues_taxId_value_key" UNIQUE ("taxId", value);


--
-- TOC entry 3297 (class 2606 OID 174366)
-- Name: taxes taxes_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_name_key UNIQUE (name);


--
-- TOC entry 3299 (class 2606 OID 174364)
-- Name: taxes taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (id);


--
-- TOC entry 3177 (class 2606 OID 166217)
-- Name: Warehouses unique_name_shopId; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "unique_name_shopId" UNIQUE (name, "shopId");


--
-- TOC entry 3180 (class 1259 OID 100836)
-- Name: account_roles_account_id_role_id; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX account_roles_account_id_role_id ON public."accountRoles" USING btree ("AccountId", "RoleId");


--
-- TOC entry 3210 (class 1259 OID 149811)
-- Name: fki_Bids_shopId_fkey; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX "fki_Bids_shopId_fkey" ON public."Bids" USING btree ("shopId");


--
-- TOC entry 3175 (class 1259 OID 158149)
-- Name: fki_Warehouses_shopId; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX "fki_Warehouses_shopId" ON public."Warehouses" USING btree ("shopId");


--
-- TOC entry 3321 (class 1259 OID 174535)
-- Name: fki_cat2s_cat1Id_fkey; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX "fki_cat2s_cat1Id_fkey" ON public.cat2s USING btree ("cat1Id");


--
-- TOC entry 3237 (class 1259 OID 207149)
-- Name: fki_docTypes_peopleTypeId; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX "fki_docTypes_peopleTypeId" ON public."docTypes" USING btree ("peopleTypeId");


--
-- TOC entry 3314 (class 1259 OID 174483)
-- Name: fki_envoiceNotifies_shopId; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX "fki_envoiceNotifies_shopId" ON public."envoiceNotifies" USING btree ("shopId");


--
-- TOC entry 3242 (class 1259 OID 133562)
-- Name: fki_shops_shopRequests_fkey; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX "fki_shops_shopRequests_fkey" ON public.shops USING btree ("shopRequestId");


--
-- TOC entry 3243 (class 1259 OID 133568)
-- Name: fki_shops_status_fkey; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX fki_shops_status_fkey ON public.shops USING btree ("statusId");


--
-- TOC entry 3197 (class 1259 OID 198938)
-- Name: fki_subModule_ModuleId_fkey; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX "fki_subModule_ModuleId_fkey" ON public."subModules" USING btree ("ModuleId");


--
-- TOC entry 3330 (class 2606 OID 100838)
-- Name: Accounts Accounts_personId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_personId_fkey" FOREIGN KEY ("peopleId") REFERENCES public."People"(id);


--
-- TOC entry 3331 (class 2606 OID 100843)
-- Name: Accounts Accounts_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3354 (class 2606 OID 101261)
-- Name: Bids Bids_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public."Brands"(id);


--
-- TOC entry 3356 (class 2606 OID 149806)
-- Name: Bids Bids_shopId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES public.shops(id);


--
-- TOC entry 3355 (class 2606 OID 101271)
-- Name: Bids Bids_warehouseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_warehouseId_fkey" FOREIGN KEY ("WarehouseId") REFERENCES public."Warehouses"(id);


--
-- TOC entry 3332 (class 2606 OID 100883)
-- Name: Dashboards Dashboards_moduleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_moduleId_fkey" FOREIGN KEY ("ModuleId") REFERENCES public."Modules"(id);


--
-- TOC entry 3333 (class 2606 OID 100888)
-- Name: Dashboards Dashboards_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);


--
-- TOC entry 3334 (class 2606 OID 100893)
-- Name: Dashboards Dashboards_subModuleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_fkey" FOREIGN KEY ("subModuleId") REFERENCES public."subModules"(id);


--
-- TOC entry 3335 (class 2606 OID 100898)
-- Name: Modules Modules_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);


--
-- TOC entry 3336 (class 2606 OID 100903)
-- Name: People People_genderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_genderId_fkey" FOREIGN KEY ("genderId") REFERENCES public."Genders"(id);


--
-- TOC entry 3337 (class 2606 OID 100908)
-- Name: People People_nationalityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_nationalityId_fkey" FOREIGN KEY ("nationalityId") REFERENCES public."Nationalities"(id);


--
-- TOC entry 3338 (class 2606 OID 100913)
-- Name: People People_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3339 (class 2606 OID 100918)
-- Name: Permissions Permissions_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);


--
-- TOC entry 3340 (class 2606 OID 100928)
-- Name: Roles Roles_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);


--
-- TOC entry 3342 (class 2606 OID 158144)
-- Name: Warehouses Warehouses_shopId; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_shopId" FOREIGN KEY ("shopId") REFERENCES public.shops(id);


--
-- TOC entry 3341 (class 2606 OID 100938)
-- Name: Warehouses Warehouses_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3343 (class 2606 OID 100943)
-- Name: accountRoles accountRoles_accountId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_accountId_fkey" FOREIGN KEY ("AccountId") REFERENCES public."Accounts"(id);


--
-- TOC entry 3344 (class 2606 OID 100948)
-- Name: accountRoles accountRoles_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_roleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Roles"(id);


--
-- TOC entry 3345 (class 2606 OID 100953)
-- Name: accountRoles accountRoles_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);


--
-- TOC entry 3361 (class 2606 OID 117184)
-- Name: affirmations affirmations_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.affirmations
    ADD CONSTRAINT "affirmations_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3375 (class 2606 OID 190741)
-- Name: cat2s cat2_cat1Id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.cat2s
    ADD CONSTRAINT "cat2_cat1Id_fkey" FOREIGN KEY ("cat1Id") REFERENCES public.cat1s(id);


--
-- TOC entry 3367 (class 2606 OID 125325)
-- Name: comunas comunas_provinceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT "comunas_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES public.provinces(id);


--
-- TOC entry 3346 (class 2606 OID 100993)
-- Name: dashboardPermissions dashboardPermissions_dashboardId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_dashboardId_fkey" FOREIGN KEY ("DashboardId") REFERENCES public."Dashboards"(id);


--
-- TOC entry 3347 (class 2606 OID 100998)
-- Name: dashboardPermissions dashboardPermissions_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_fkey" FOREIGN KEY ("PermissionId") REFERENCES public."Permissions"(id);


--
-- TOC entry 3348 (class 2606 OID 101003)
-- Name: dashboardPermissions dashboardPermissions_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);


--
-- TOC entry 3363 (class 2606 OID 207144)
-- Name: docTypes docTypes_peopleTypeId; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."docTypes"
    ADD CONSTRAINT "docTypes_peopleTypeId" FOREIGN KEY ("peopleTypeId") REFERENCES public."peopleTypes"(id);


--
-- TOC entry 3362 (class 2606 OID 117199)
-- Name: docTypes docTypes_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."docTypes"
    ADD CONSTRAINT "docTypes_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3373 (class 2606 OID 174473)
-- Name: envoiceNotifies envoiceNotifies_deliveryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_deliveryId_fkey" FOREIGN KEY ("deliveryId") REFERENCES public.deliveries(id);


--
-- TOC entry 3372 (class 2606 OID 174468)
-- Name: envoiceNotifies envoiceNotifies_envoiceTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_envoiceTypeId_fkey" FOREIGN KEY ("envoiceTypeId") REFERENCES public."envoiceTypes"(id);


--
-- TOC entry 3374 (class 2606 OID 174478)
-- Name: envoiceNotifies envoiceNotifies_shopId; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_shopId" FOREIGN KEY ("shopId") REFERENCES public.shops(id);


--
-- TOC entry 3349 (class 2606 OID 101008)
-- Name: grantRoles grantRoles_dashboradPermissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_dashboradPermissionId_fkey" FOREIGN KEY ("dashboardPermissionId") REFERENCES public."dashboardPermissions"(id);


--
-- TOC entry 3350 (class 2606 OID 101013)
-- Name: grantRoles grantRoles_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Roles"(id);


--
-- TOC entry 3351 (class 2606 OID 101018)
-- Name: grantRoles grantRoles_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);


--
-- TOC entry 3376 (class 2606 OID 207139)
-- Name: peopleTypes peopleTypes_StatusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."peopleTypes"
    ADD CONSTRAINT "peopleTypes_StatusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);


--
-- TOC entry 3358 (class 2606 OID 117139)
-- Name: phoneTypes phoneTypes_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."phoneTypes"
    ADD CONSTRAINT "phoneTypes_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3366 (class 2606 OID 125300)
-- Name: provinces provinces_regionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT "provinces_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES public.regions(id);


--
-- TOC entry 3360 (class 2606 OID 117169)
-- Name: salesChannels salesChannels_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."salesChannels"
    ADD CONSTRAINT "salesChannels_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3368 (class 2606 OID 166196)
-- Name: shopContracts shopContracts_contractId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_contractId_fkey" FOREIGN KEY ("contractId") REFERENCES public.attachments(id);


--
-- TOC entry 3369 (class 2606 OID 166201)
-- Name: shopContracts shopContracts_shopId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES public.shops(id);


--
-- TOC entry 3370 (class 2606 OID 166206)
-- Name: shopContracts shopContracts_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3357 (class 2606 OID 117034)
-- Name: shopRequests shopRequests_accountId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."shopRequests"
    ADD CONSTRAINT "shopRequests_accountId_fkey" FOREIGN KEY ("AccountId") REFERENCES public."Accounts"(id);


--
-- TOC entry 3364 (class 2606 OID 133557)
-- Name: shops shops_shopRequests_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT "shops_shopRequests_fkey" FOREIGN KEY ("shopRequestId") REFERENCES public."shopRequests"(id);


--
-- TOC entry 3365 (class 2606 OID 133563)
-- Name: shops shops_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_status_fkey FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3359 (class 2606 OID 117154)
-- Name: storeTypes storeTypes_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."storeTypes"
    ADD CONSTRAINT "storeTypes_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3353 (class 2606 OID 198933)
-- Name: subModules subModule_ModuleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModule_ModuleId_fkey" FOREIGN KEY ("ModuleId") REFERENCES public."Modules"(id);


--
-- TOC entry 3352 (class 2606 OID 101023)
-- Name: subModules subModules_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);


--
-- TOC entry 3371 (class 2606 OID 174380)
-- Name: taxValues taxValues_taxId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."taxValues"
    ADD CONSTRAINT "taxValues_taxId_fkey" FOREIGN KEY ("taxId") REFERENCES public.taxes(id);


-- Completed on 2020-10-27 15:46:45 -04

--
-- PostgreSQL database dump complete
--

