--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-2.pgdg90+1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-2.pgdg90+1)

-- Started on 2020-06-15 22:29:53 -04

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

--
-- TOC entry 3228 (class 1262 OID 91571)
-- Name: udadminsiiro-dev01-0620; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "udadminsiiro-dev01-0620" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';


ALTER DATABASE "udadminsiiro-dev01-0620" OWNER TO postgres;

\connect -reuse-previous=on "dbname='udadminsiiro-dev01-0620'"

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
-- TOC entry 212 (class 1259 OID 92010)
-- Name: Accounts; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Accounts" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    pass character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "peopleId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Accounts" OWNER TO angelds;

--
-- TOC entry 211 (class 1259 OID 92008)
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
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 211
-- Name: Accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Accounts_id_seq" OWNED BY public."Accounts".id;


--
-- TOC entry 220 (class 1259 OID 92102)
-- Name: Addresses; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Addresses" (
    id integer NOT NULL,
    "provinceId" integer NOT NULL,
    "postalCodeId" integer NOT NULL,
    street character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Addresses" OWNER TO angelds;

--
-- TOC entry 219 (class 1259 OID 92100)
-- Name: Addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Addresses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Addresses_id_seq" OWNER TO angelds;

--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 219
-- Name: Addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Addresses_id_seq" OWNED BY public."Addresses".id;


--
-- TOC entry 232 (class 1259 OID 92321)
-- Name: Bids; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Bids" (
    id integer NOT NULL,
    "productId" integer NOT NULL,
    "accountRoleId" integer NOT NULL,
    quatity integer,
    "warehouseId" integer NOT NULL,
    plus character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Bids" OWNER TO angelds;

--
-- TOC entry 231 (class 1259 OID 92319)
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
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 231
-- Name: Bids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Bids_id_seq" OWNED BY public."Bids".id;


--
-- TOC entry 208 (class 1259 OID 91990)
-- Name: Countries; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Countries" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Countries" OWNER TO angelds;

--
-- TOC entry 207 (class 1259 OID 91988)
-- Name: Countries_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Countries_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Countries_id_seq" OWNER TO angelds;

--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 207
-- Name: Countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Countries_id_seq" OWNED BY public."Countries".id;


--
-- TOC entry 242 (class 1259 OID 92663)
-- Name: Dashboards; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Dashboards" (
    id integer NOT NULL,
    "moduleId" integer NOT NULL,
    "subModuleId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    path character varying(255),
    icontype character varying(255)
);


ALTER TABLE public."Dashboards" OWNER TO angelds;

--
-- TOC entry 241 (class 1259 OID 92661)
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
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 241
-- Name: Dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Dashboards_id_seq" OWNED BY public."Dashboards".id;


--
-- TOC entry 202 (class 1259 OID 91944)
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
-- TOC entry 201 (class 1259 OID 91942)
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
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 201
-- Name: Genders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Genders_id_seq" OWNED BY public."Genders".id;


--
-- TOC entry 236 (class 1259 OID 92373)
-- Name: Modules; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Modules" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Modules" OWNER TO angelds;

--
-- TOC entry 235 (class 1259 OID 92371)
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
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 235
-- Name: Modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Modules_id_seq" OWNED BY public."Modules".id;


--
-- TOC entry 198 (class 1259 OID 91924)
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
-- TOC entry 197 (class 1259 OID 91922)
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
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 197
-- Name: Nationalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Nationalities_id_seq" OWNED BY public."Nationalities".id;


--
-- TOC entry 204 (class 1259 OID 91954)
-- Name: People; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."People" (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    "documentId" character varying(255) NOT NULL,
    "genderId" integer NOT NULL,
    "nationalityId" integer NOT NULL,
    "birthDate" timestamp with time zone NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."People" OWNER TO angelds;

--
-- TOC entry 203 (class 1259 OID 91952)
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
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 203
-- Name: People_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."People_id_seq" OWNED BY public."People".id;


--
-- TOC entry 240 (class 1259 OID 92453)
-- Name: Permissions; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Permissions" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Permissions" OWNER TO angelds;

--
-- TOC entry 239 (class 1259 OID 92451)
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
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 239
-- Name: Permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Permissions_id_seq" OWNED BY public."Permissions".id;


--
-- TOC entry 224 (class 1259 OID 92156)
-- Name: Products; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Products" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Products" OWNER TO angelds;

--
-- TOC entry 223 (class 1259 OID 92154)
-- Name: Products_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Products_id_seq" OWNER TO angelds;

--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 223
-- Name: Products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;


--
-- TOC entry 228 (class 1259 OID 92176)
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
-- TOC entry 227 (class 1259 OID 92174)
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
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 227
-- Name: Properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Properties_id_seq" OWNED BY public."Properties".id;


--
-- TOC entry 216 (class 1259 OID 92064)
-- Name: Provinces; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Provinces" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "countryId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Provinces" OWNER TO angelds;

--
-- TOC entry 215 (class 1259 OID 92062)
-- Name: Provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Provinces_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Provinces_id_seq" OWNER TO angelds;

--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 215
-- Name: Provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Provinces_id_seq" OWNED BY public."Provinces".id;


--
-- TOC entry 214 (class 1259 OID 92049)
-- Name: Roles; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Roles" OWNER TO angelds;

--
-- TOC entry 213 (class 1259 OID 92047)
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
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 213
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;


--
-- TOC entry 196 (class 1259 OID 91572)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO angelds;

--
-- TOC entry 200 (class 1259 OID 91934)
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
-- TOC entry 199 (class 1259 OID 91932)
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
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 199
-- Name: Status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Status_id_seq" OWNED BY public."Status".id;


--
-- TOC entry 226 (class 1259 OID 92166)
-- Name: Tags; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Tags" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Tags" OWNER TO angelds;

--
-- TOC entry 225 (class 1259 OID 92164)
-- Name: Tags_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."Tags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tags_id_seq" OWNER TO angelds;

--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 225
-- Name: Tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Tags_id_seq" OWNED BY public."Tags".id;


--
-- TOC entry 230 (class 1259 OID 92301)
-- Name: Warehouses; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."Warehouses" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "addressId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Warehouses" OWNER TO angelds;

--
-- TOC entry 229 (class 1259 OID 92299)
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
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 229
-- Name: Warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."Warehouses_id_seq" OWNED BY public."Warehouses".id;


--
-- TOC entry 218 (class 1259 OID 92079)
-- Name: accountRoles; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."accountRoles" (
    id integer NOT NULL,
    "accountId" integer NOT NULL,
    "roleId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."accountRoles" OWNER TO angelds;

--
-- TOC entry 217 (class 1259 OID 92077)
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
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 217
-- Name: accountRoles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."accountRoles_id_seq" OWNED BY public."accountRoles".id;


--
-- TOC entry 222 (class 1259 OID 92128)
-- Name: addressAccounts; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."addressAccounts" (
    id integer NOT NULL,
    "addressId" integer NOT NULL,
    "accountId" integer NOT NULL,
    "addressTypeId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."addressAccounts" OWNER TO angelds;

--
-- TOC entry 221 (class 1259 OID 92126)
-- Name: addressAccounts_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."addressAccounts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."addressAccounts_id_seq" OWNER TO angelds;

--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 221
-- Name: addressAccounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."addressAccounts_id_seq" OWNED BY public."addressAccounts".id;


--
-- TOC entry 206 (class 1259 OID 91982)
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
-- TOC entry 205 (class 1259 OID 91980)
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
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 205
-- Name: addressTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."addressTypes_id_seq" OWNED BY public."addressTypes".id;


--
-- TOC entry 234 (class 1259 OID 92350)
-- Name: bidProperties; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."bidProperties" (
    id integer NOT NULL,
    "bidId" integer NOT NULL,
    "propertyId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."bidProperties" OWNER TO angelds;

--
-- TOC entry 233 (class 1259 OID 92348)
-- Name: bidProperties_id_seq; Type: SEQUENCE; Schema: public; Owner: angelds
--

CREATE SEQUENCE public."bidProperties_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."bidProperties_id_seq" OWNER TO angelds;

--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 233
-- Name: bidProperties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."bidProperties_id_seq" OWNED BY public."bidProperties".id;


--
-- TOC entry 244 (class 1259 OID 92683)
-- Name: dashboardPermissions; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."dashboardPermissions" (
    id integer NOT NULL,
    "dashboardId" integer NOT NULL,
    "permissionId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."dashboardPermissions" OWNER TO angelds;

--
-- TOC entry 243 (class 1259 OID 92681)
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
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 243
-- Name: dashboardPermissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."dashboardPermissions_id_seq" OWNED BY public."dashboardPermissions".id;


--
-- TOC entry 246 (class 1259 OID 92708)
-- Name: grantRoles; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."grantRoles" (
    id integer NOT NULL,
    "dashboradPermissionId" integer NOT NULL,
    "roleId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."grantRoles" OWNER TO angelds;

--
-- TOC entry 245 (class 1259 OID 92706)
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
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 245
-- Name: grantRoles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."grantRoles_id_seq" OWNED BY public."grantRoles".id;


--
-- TOC entry 210 (class 1259 OID 92000)
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
-- TOC entry 209 (class 1259 OID 91998)
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
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 209
-- Name: postalCodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."postalCodes_id_seq" OWNED BY public."postalCodes".id;


--
-- TOC entry 238 (class 1259 OID 92433)
-- Name: subModules; Type: TABLE; Schema: public; Owner: angelds
--

CREATE TABLE public."subModules" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    route character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."subModules" OWNER TO angelds;

--
-- TOC entry 237 (class 1259 OID 92431)
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
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 237
-- Name: subModules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: angelds
--

ALTER SEQUENCE public."subModules_id_seq" OWNED BY public."subModules".id;


--
-- TOC entry 2900 (class 2604 OID 92013)
-- Name: Accounts id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts" ALTER COLUMN id SET DEFAULT nextval('public."Accounts_id_seq"'::regclass);


--
-- TOC entry 2904 (class 2604 OID 92105)
-- Name: Addresses id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Addresses" ALTER COLUMN id SET DEFAULT nextval('public."Addresses_id_seq"'::regclass);


--
-- TOC entry 2910 (class 2604 OID 92324)
-- Name: Bids id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids" ALTER COLUMN id SET DEFAULT nextval('public."Bids_id_seq"'::regclass);


--
-- TOC entry 2898 (class 2604 OID 91993)
-- Name: Countries id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Countries" ALTER COLUMN id SET DEFAULT nextval('public."Countries_id_seq"'::regclass);


--
-- TOC entry 2915 (class 2604 OID 92666)
-- Name: Dashboards id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards" ALTER COLUMN id SET DEFAULT nextval('public."Dashboards_id_seq"'::regclass);


--
-- TOC entry 2895 (class 2604 OID 91947)
-- Name: Genders id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Genders" ALTER COLUMN id SET DEFAULT nextval('public."Genders_id_seq"'::regclass);


--
-- TOC entry 2912 (class 2604 OID 92376)
-- Name: Modules id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Modules" ALTER COLUMN id SET DEFAULT nextval('public."Modules_id_seq"'::regclass);


--
-- TOC entry 2893 (class 2604 OID 91927)
-- Name: Nationalities id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Nationalities" ALTER COLUMN id SET DEFAULT nextval('public."Nationalities_id_seq"'::regclass);


--
-- TOC entry 2896 (class 2604 OID 91957)
-- Name: People id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People" ALTER COLUMN id SET DEFAULT nextval('public."People_id_seq"'::regclass);


--
-- TOC entry 2914 (class 2604 OID 92456)
-- Name: Permissions id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Permissions" ALTER COLUMN id SET DEFAULT nextval('public."Permissions_id_seq"'::regclass);


--
-- TOC entry 2906 (class 2604 OID 92159)
-- Name: Products id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);


--
-- TOC entry 2908 (class 2604 OID 92179)
-- Name: Properties id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Properties" ALTER COLUMN id SET DEFAULT nextval('public."Properties_id_seq"'::regclass);


--
-- TOC entry 2902 (class 2604 OID 92067)
-- Name: Provinces id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Provinces" ALTER COLUMN id SET DEFAULT nextval('public."Provinces_id_seq"'::regclass);


--
-- TOC entry 2901 (class 2604 OID 92052)
-- Name: Roles id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);


--
-- TOC entry 2894 (class 2604 OID 91937)
-- Name: Status id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Status" ALTER COLUMN id SET DEFAULT nextval('public."Status_id_seq"'::regclass);


--
-- TOC entry 2907 (class 2604 OID 92169)
-- Name: Tags id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Tags" ALTER COLUMN id SET DEFAULT nextval('public."Tags_id_seq"'::regclass);


--
-- TOC entry 2909 (class 2604 OID 92304)
-- Name: Warehouses id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Warehouses" ALTER COLUMN id SET DEFAULT nextval('public."Warehouses_id_seq"'::regclass);


--
-- TOC entry 2903 (class 2604 OID 92082)
-- Name: accountRoles id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles" ALTER COLUMN id SET DEFAULT nextval('public."accountRoles_id_seq"'::regclass);


--
-- TOC entry 2905 (class 2604 OID 92131)
-- Name: addressAccounts id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."addressAccounts" ALTER COLUMN id SET DEFAULT nextval('public."addressAccounts_id_seq"'::regclass);


--
-- TOC entry 2897 (class 2604 OID 91985)
-- Name: addressTypes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."addressTypes" ALTER COLUMN id SET DEFAULT nextval('public."addressTypes_id_seq"'::regclass);


--
-- TOC entry 2911 (class 2604 OID 92353)
-- Name: bidProperties id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."bidProperties" ALTER COLUMN id SET DEFAULT nextval('public."bidProperties_id_seq"'::regclass);


--
-- TOC entry 2916 (class 2604 OID 92686)
-- Name: dashboardPermissions id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions" ALTER COLUMN id SET DEFAULT nextval('public."dashboardPermissions_id_seq"'::regclass);


--
-- TOC entry 2917 (class 2604 OID 92711)
-- Name: grantRoles id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles" ALTER COLUMN id SET DEFAULT nextval('public."grantRoles_id_seq"'::regclass);


--
-- TOC entry 2899 (class 2604 OID 92003)
-- Name: postalCodes id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."postalCodes" ALTER COLUMN id SET DEFAULT nextval('public."postalCodes_id_seq"'::regclass);


--
-- TOC entry 2913 (class 2604 OID 92436)
-- Name: subModules id; Type: DEFAULT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."subModules" ALTER COLUMN id SET DEFAULT nextval('public."subModules_id_seq"'::regclass);


--
-- TOC entry 3188 (class 0 OID 92010)
-- Dependencies: 212
-- Data for Name: Accounts; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Accounts" VALUES (1, 'angelds', '$2a$10$2ZqPOLR6UkIMlb.hhFGgVOzIcKmk6eHzlwUrvIaxyN4Bvp7t8pzmS', 'angel.elcampeon@gmail.com', 20, 1, '2020-06-06 23:38:07.396-04', '2020-06-06 23:38:07.396-04');
INSERT INTO public."Accounts" VALUES (2, 'angelds1', '$2a$10$Rg9XZa8kCnF0Clcwp5sDwO0D4n8usvsDGLDcIMKZ4oKCSJdk5iQby', 'angel.elcampeon@gmail1.com', 26, 1, '2020-06-07 12:54:58.561-04', '2020-06-07 12:54:58.561-04');
INSERT INTO public."Accounts" VALUES (4, 'angelds2', '$2a$10$lgLHL8aotvXsZUF/Te3hfeXTqnmOEwfdd/gEvVf2JVKdmbrszGtwG', 'angel.elcampeon@gmail2.com', 28, 1, '2020-06-07 12:57:08.617-04', '2020-06-07 12:57:08.617-04');
INSERT INTO public."Accounts" VALUES (6, 'angelds3', '$2a$10$aT9PEsCpaGPNLNDDKzK6KubxjRAj4KFSH/QEDhmukJNYzRm.GO/lm', 'angel.elcampeon@gmail3.com', 30, 1, '2020-06-07 12:59:04.491-04', '2020-06-07 12:59:04.491-04');
INSERT INTO public."Accounts" VALUES (7, 'angelds4', '$2a$10$KBKwRLDlC6QfWDvipd7i7eMKva5tKyoEE//6g.5tgHmSl54CTgIE6', 'angel.elcampeon@gmail4.com', 31, 1, '2020-06-07 13:03:28.328-04', '2020-06-07 13:03:28.328-04');
INSERT INTO public."Accounts" VALUES (9, 'angelds5', '$2a$10$czRRB52lq.b//Y8s2Y3e4O.mVi9PQH3gnjCw7/zzpnyxTxBUhyE9C', 'angel.elcampeon@gmail5.com', 34, 1, '2020-06-07 13:53:37.353-04', '2020-06-07 13:53:37.353-04');
INSERT INTO public."Accounts" VALUES (10, 'angelds6', '$2a$10$Tsaxr.BTjV59BQA43VzY6O9DBkg1BGfYaR6vIOUbpe50P4V7.j/Ti', 'angel.elcampeon@gmail6.com', 35, 1, '2020-06-07 16:29:54.672-04', '2020-06-07 16:29:54.672-04');
INSERT INTO public."Accounts" VALUES (11, 'angelds7', '$2a$10$3kVny/dsLQp/uI96OqNrAu7q0CI3VLBPCs5tKbobbs7zXHZDM1SvW', 'angel.elcampeon@gmail7.com', 36, 1, '2020-06-07 16:31:10.464-04', '2020-06-07 16:31:10.464-04');
INSERT INTO public."Accounts" VALUES (12, 'angelds8', '$2a$10$XOc1WS4SC7hD8lUPRvqMPOGh9CeDcu7qdsPoUveHBPSruaH5dXwxu', 'angel.elcampeon@gmail8.com', 38, 1, '2020-06-07 17:06:57.043-04', '2020-06-07 17:06:57.043-04');
INSERT INTO public."Accounts" VALUES (13, 'angelds9', '$2a$10$gJoK.BGhb7ZrnrBMabmWOupfOM1J6ywuyZmAmXWPvspSaO7Vbfz5G', 'angel.elcampeon@gmail9.com', 39, 1, '2020-06-07 17:08:43.091-04', '2020-06-07 17:08:43.091-04');
INSERT INTO public."Accounts" VALUES (14, 'angelds10', '$2a$10$5h05Ub5iKIk9RQZ65K9ZX.Y0nR4kOLA44qOR5uy9LVcU1106OyYfG', 'angel.elcampeon@gmail10.com', 40, 1, '2020-06-07 17:09:37.499-04', '2020-06-07 17:09:37.499-04');
INSERT INTO public."Accounts" VALUES (15, 'angelds11', '$2a$10$uPnW2i4Tg.jzcpkkyN8CRuXiq.7QrsiBRnrSRCnyop8LD2ZVSH6yO', 'angel.elcampeon@gmail11.com', 41, 1, '2020-06-07 17:18:34.715-04', '2020-06-07 17:18:34.715-04');
INSERT INTO public."Accounts" VALUES (16, 'angelds12', '$2a$10$2ufnFiVpQISgW87HQp7CBeodDYqQ8zxnQxcFpvKCt2GOuLn5RR09u', 'angel.elcampeon@gmail12.com', 42, 1, '2020-06-07 17:26:36.285-04', '2020-06-07 17:26:36.285-04');
INSERT INTO public."Accounts" VALUES (17, 'angelds13', '$2a$10$e2W8IkiPByPWQ3WSF5OXQebrmiPXj8YxfVOC3kBhrxDUzffzBVzJG', 'angel.elcampeon@gmail13.com', 43, 1, '2020-06-07 17:30:20.082-04', '2020-06-07 17:30:20.082-04');
INSERT INTO public."Accounts" VALUES (18, 'angelds14', '$2a$10$S8v..LWtBTJ60K.XyruFeeapJBokhtqfhUPSY.p5nhj9q.O9dhigW', 'angel.elcampeon@gmail14.com', 44, 1, '2020-06-07 17:33:17.209-04', '2020-06-07 17:33:17.209-04');
INSERT INTO public."Accounts" VALUES (19, 'angelds15', '$2a$10$Vfr4lRDFKI.Kes4XQZJmxehNNVmfMWbp4CF.rhto9dDwTK4pWGjt.', 'angel.elcampeon@gmail15.com', 45, 1, '2020-06-07 17:45:00.727-04', '2020-06-07 17:45:00.727-04');
INSERT INTO public."Accounts" VALUES (20, 'angelds16', '$2a$10$htt1dzpAZFlVLbMIxlq6BuPtQAy7D0AHCviFvrDHrxnJije4ZXvZ2', 'angel.elcampeon@gmail16.com', 46, 1, '2020-06-07 17:47:23.322-04', '2020-06-07 17:47:23.322-04');
INSERT INTO public."Accounts" VALUES (21, 'angelds17', '$2a$10$Jjp5.LxHSS.JaRG23JkhAu/quFkkP5u2X5gE3UFhKjbdpjVXnEg6.', 'angel.elcampeon@gmail17.com', 47, 1, '2020-06-07 17:53:32.992-04', '2020-06-07 17:53:32.992-04');
INSERT INTO public."Accounts" VALUES (22, 'angelds18', '$2a$10$VXAOBTEoDyo/o0F8wTltme9iU8E/6qD2B2RU5cphiDupk2J0PdF4S', 'angel.elcampeon@gmail18.com', 48, 1, '2020-06-07 18:07:10.301-04', '2020-06-07 18:07:10.301-04');
INSERT INTO public."Accounts" VALUES (23, 'angelds19', '$2a$10$TaQ1duNuZZbaXF9x8gcmgetn3jRR5iL7vRRgfxbHB6fwYKX8HEvES', 'angel.elcampeon@gmail19.com', 49, 1, '2020-06-07 19:15:31.642-04', '2020-06-07 19:15:31.642-04');
INSERT INTO public."Accounts" VALUES (24, 'angelds20', '$2a$10$xOHmsJBHi5c/FZgl29pgreR9tsFcREcQXwxVIlWH9ui1CzdLFYlX2', 'angel.elcampeon@gmail20.com', 50, 1, '2020-06-07 19:15:58.131-04', '2020-06-07 19:15:58.131-04');
INSERT INTO public."Accounts" VALUES (25, 'angelds21', '$2a$10$7SEjJ9nAAAG1So9ylsCcc.fY83o9I58NO0iHun8475TzRpdx///X2', 'angel.elcampeon@gmail21.com', 51, 1, '2020-06-07 19:18:59.293-04', '2020-06-07 19:18:59.293-04');
INSERT INTO public."Accounts" VALUES (26, 'angelds22', '$2a$10$ng7pts03U.buu2ur7ObALu.uFpWRuKq4Q8nPg5DLjTH8DL9CS/N0a', 'angel.elcampeon@gmail22.com', 52, 1, '2020-06-07 19:28:30.916-04', '2020-06-07 19:28:30.916-04');
INSERT INTO public."Accounts" VALUES (27, 'angelds23', '$2a$10$vB9tgubbqeO/.hsXNvlol.JCrJVuWprv3TVXrpgVOk/gntVTWipjq', 'angel.elcampeon@gmail23.com', 53, 1, '2020-06-07 19:42:07.624-04', '2020-06-07 19:42:07.624-04');
INSERT INTO public."Accounts" VALUES (28, 'angelds24', '$2a$10$z0lnxNaQs/ReiSvH7pl1Y.bAt4GwLRICodCjIFBExIzc6uEoY9z0i', 'angel.elcampeon@gmail24.com', 54, 1, '2020-06-07 20:02:08.429-04', '2020-06-07 20:02:08.429-04');
INSERT INTO public."Accounts" VALUES (29, 'angelds30', '$2a$10$xInlUjOErMhh3m0iMiRw0.DljrjsihnwH9Uy5fyi5Wi6MFnpr8K1G', 'angel.elcampeon@gmail30.com', 60, 1, '2020-06-10 00:47:05.189-04', '2020-06-10 00:47:05.189-04');


--
-- TOC entry 3196 (class 0 OID 92102)
-- Dependencies: 220
-- Data for Name: Addresses; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3208 (class 0 OID 92321)
-- Dependencies: 232
-- Data for Name: Bids; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3184 (class 0 OID 91990)
-- Dependencies: 208
-- Data for Name: Countries; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3218 (class 0 OID 92663)
-- Dependencies: 242
-- Data for Name: Dashboards; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3178 (class 0 OID 91944)
-- Dependencies: 202
-- Data for Name: Genders; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Genders" VALUES (1, 'Hombre', '2020-06-06 21:32:49.326-04', '2020-06-06 21:32:49.326-04');
INSERT INTO public."Genders" VALUES (2, 'Mujer', '2020-06-06 21:32:49.326-04', '2020-06-06 21:32:49.326-04');


--
-- TOC entry 3212 (class 0 OID 92373)
-- Dependencies: 236
-- Data for Name: Modules; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3174 (class 0 OID 91924)
-- Dependencies: 198
-- Data for Name: Nationalities; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Nationalities" VALUES (1, 'Nacional', '2020-06-06 21:47:28.603-04', '2020-06-06 21:47:28.603-04');
INSERT INTO public."Nationalities" VALUES (2, 'Extranjera', '2020-06-06 21:47:28.603-04', '2020-06-06 21:47:28.603-04');


--
-- TOC entry 3180 (class 0 OID 91954)
-- Dependencies: 204
-- Data for Name: People; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."People" VALUES (5, 'Angel', 'Diaz', '17453568', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 21:51:35.727-04', '2020-06-06 21:51:35.727-04');
INSERT INTO public."People" VALUES (7, 'Angel', 'Diaz', '17453563', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 21:53:48.378-04', '2020-06-06 21:53:48.378-04');
INSERT INTO public."People" VALUES (9, 'Angel', 'Diaz', '17453560', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 22:14:46.836-04', '2020-06-06 22:14:46.836-04');
INSERT INTO public."People" VALUES (10, 'Angel', 'Diaz', '174535608', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 22:17:08.249-04', '2020-06-06 22:17:08.249-04');
INSERT INTO public."People" VALUES (11, 'Angel', 'Diaz', '1745356087', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 22:24:19.984-04', '2020-06-06 22:24:19.984-04');
INSERT INTO public."People" VALUES (12, 'Angel', 'Diaz', '1745335603', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 22:25:16.657-04', '2020-06-06 22:25:16.657-04');
INSERT INTO public."People" VALUES (14, 'Angel', 'Diaz', '17453356003', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 23:00:49.363-04', '2020-06-06 23:00:49.363-04');
INSERT INTO public."People" VALUES (15, 'Angel', 'Diaz', '174533560030', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 23:05:10.636-04', '2020-06-06 23:05:10.636-04');
INSERT INTO public."People" VALUES (16, 'Angel', 'Diaz', '174533560000', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 23:05:32.288-04', '2020-06-06 23:05:32.288-04');
INSERT INTO public."People" VALUES (17, 'Angel', 'Diaz', '17426702', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 23:34:10.995-04', '2020-06-06 23:34:10.995-04');
INSERT INTO public."People" VALUES (19, 'Angel', 'Diaz', '174267021', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 23:35:26.066-04', '2020-06-06 23:35:26.066-04');
INSERT INTO public."People" VALUES (20, 'Angel', 'Diaz', '174267321', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-06 23:38:07.083-04', '2020-06-06 23:38:07.083-04');
INSERT INTO public."People" VALUES (21, 'Angel', 'Diaz', '1742675', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 12:43:33.39-04', '2020-06-07 12:43:33.39-04');
INSERT INTO public."People" VALUES (22, 'Angel', 'Diaz', '17426751', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 12:44:38.456-04', '2020-06-07 12:44:38.456-04');
INSERT INTO public."People" VALUES (24, 'Angel', 'Diaz', '174267510', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 12:52:59.275-04', '2020-06-07 12:52:59.275-04');
INSERT INTO public."People" VALUES (25, 'Angel', 'Diaz', '1742675101', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 12:54:17.48-04', '2020-06-07 12:54:17.48-04');
INSERT INTO public."People" VALUES (26, 'Angel', 'Diaz', '17426751031', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 12:54:58.317-04', '2020-06-07 12:54:58.317-04');
INSERT INTO public."People" VALUES (27, 'Angel', 'Diaz', '1742951031', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 12:56:35.511-04', '2020-06-07 12:56:35.511-04');
INSERT INTO public."People" VALUES (28, 'Angel', 'Diaz', '1742951011', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 12:57:08.452-04', '2020-06-07 12:57:08.452-04');
INSERT INTO public."People" VALUES (29, 'Angel', 'Diaz', '1742952011', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 12:58:37.11-04', '2020-06-07 12:58:37.11-04');
INSERT INTO public."People" VALUES (30, 'Angel', 'Diaz', '1742952511', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 12:59:04.3-04', '2020-06-07 12:59:04.3-04');
INSERT INTO public."People" VALUES (31, 'Angel', 'Diaz', '17429541', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 13:03:28.084-04', '2020-06-07 13:03:28.084-04');
INSERT INTO public."People" VALUES (33, 'Angel', 'Diaz', '174295413', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 13:45:55.89-04', '2020-06-07 13:45:55.89-04');
INSERT INTO public."People" VALUES (34, 'Angel', 'Diaz', '174295418', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 13:53:37.161-04', '2020-06-07 13:53:37.161-04');
INSERT INTO public."People" VALUES (35, 'Angel', 'Diaz', '1742954108', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 16:29:54.43-04', '2020-06-07 16:29:54.43-04');
INSERT INTO public."People" VALUES (36, 'Angel', 'Diaz', '1742954107', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 16:31:10.214-04', '2020-06-07 16:31:10.214-04');
INSERT INTO public."People" VALUES (38, 'Angel', 'Diaz', '17429541088', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 17:06:56.685-04', '2020-06-07 17:06:56.685-04');
INSERT INTO public."People" VALUES (39, 'Angel', 'Diaz', '17429541089', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 17:08:42.855-04', '2020-06-07 17:08:42.855-04');
INSERT INTO public."People" VALUES (40, 'Angel', 'Diaz', '174295410810', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 17:09:37.234-04', '2020-06-07 17:09:37.234-04');
INSERT INTO public."People" VALUES (41, 'Angel', 'Diaz', '174295410811', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 17:18:34.493-04', '2020-06-07 17:18:34.493-04');
INSERT INTO public."People" VALUES (42, 'Angel', 'Diaz', '174295410812', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 17:26:36.032-04', '2020-06-07 17:26:36.032-04');
INSERT INTO public."People" VALUES (43, 'Angel', 'Diaz', '174295410813', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 17:30:19.856-04', '2020-06-07 17:30:19.856-04');
INSERT INTO public."People" VALUES (44, 'Angel', 'Diaz', '174295410814', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 17:33:16.978-04', '2020-06-07 17:33:16.978-04');
INSERT INTO public."People" VALUES (45, 'Angel', 'Diaz', '174295410815', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 17:45:00.484-04', '2020-06-07 17:45:00.484-04');
INSERT INTO public."People" VALUES (46, 'Angel', 'Diaz', '174295410816', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 17:47:23.076-04', '2020-06-07 17:47:23.076-04');
INSERT INTO public."People" VALUES (47, 'Angel', 'Diaz', '174295410817', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 17:53:32.701-04', '2020-06-07 17:53:32.701-04');
INSERT INTO public."People" VALUES (48, 'Angel', 'Diaz', '174295410818', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 18:07:10.059-04', '2020-06-07 18:07:10.059-04');
INSERT INTO public."People" VALUES (49, 'Angel', 'Diaz', '174295410819', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 19:15:31.417-04', '2020-06-07 19:15:31.417-04');
INSERT INTO public."People" VALUES (50, 'Angel', 'Diaz', '174295410820', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 19:15:57.882-04', '2020-06-07 19:15:57.882-04');
INSERT INTO public."People" VALUES (51, 'Angel', 'Diaz', '174295410821', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 19:18:59.048-04', '2020-06-07 19:18:59.048-04');
INSERT INTO public."People" VALUES (52, 'Angel', 'Diaz', '174295410822', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 19:28:30.704-04', '2020-06-07 19:28:30.704-04');
INSERT INTO public."People" VALUES (53, 'Angel', 'Diaz', '174295410823', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 19:42:07.399-04', '2020-06-07 19:42:07.399-04');
INSERT INTO public."People" VALUES (54, 'Angel', 'Diaz', '174295410824', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 20:02:08.18-04', '2020-06-07 20:02:08.18-04');
INSERT INTO public."People" VALUES (55, 'Angel', 'Diaz', '174295410825', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 20:05:39.24-04', '2020-06-07 20:05:39.24-04');
INSERT INTO public."People" VALUES (56, 'Angel', 'Diaz', '174295410826', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-07 20:07:28.1-04', '2020-06-07 20:07:28.1-04');
INSERT INTO public."People" VALUES (57, 'angel', 'Diaz', '1742954108264', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-08 21:08:02.599-04', '2020-06-08 21:08:02.599-04');
INSERT INTO public."People" VALUES (59, 'angel', 'Diaz', '1743252364', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-10 00:45:58.906-04', '2020-06-10 00:45:58.906-04');
INSERT INTO public."People" VALUES (60, 'angel', 'Diaz', '17432523630', 1, 1, '1985-11-08 20:00:00-04', 1, '2020-06-10 00:47:04.978-04', '2020-06-10 00:47:04.978-04');


--
-- TOC entry 3216 (class 0 OID 92453)
-- Dependencies: 240
-- Data for Name: Permissions; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3200 (class 0 OID 92156)
-- Dependencies: 224
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Products" VALUES (7, 'Mesa', '2020-06-06 21:32:49.3-04', '2020-06-06 21:32:49.3-04');
INSERT INTO public."Products" VALUES (8, 'Collar', '2020-06-06 21:32:49.3-04', '2020-06-06 21:32:49.3-04');


--
-- TOC entry 3204 (class 0 OID 92176)
-- Dependencies: 228
-- Data for Name: Properties; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3192 (class 0 OID 92064)
-- Dependencies: 216
-- Data for Name: Provinces; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3190 (class 0 OID 92049)
-- Dependencies: 214
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Roles" VALUES (5, 'Artesano', 1, '2020-06-07 13:53:11.409-04', '2020-06-07 13:53:11.409-04');
INSERT INTO public."Roles" VALUES (6, 'Comprador', 1, '2020-06-07 13:53:11.409-04', '2020-06-07 13:53:11.409-04');
INSERT INTO public."Roles" VALUES (7, 'Administrador', 1, '2020-06-07 13:53:11.409-04', '2020-06-07 13:53:11.409-04');


--
-- TOC entry 3172 (class 0 OID 91572)
-- Dependencies: 196
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."SequelizeMeta" VALUES ('0-create-nationality.js');
INSERT INTO public."SequelizeMeta" VALUES ('00-create-status.js');
INSERT INTO public."SequelizeMeta" VALUES ('1-create-gender.js');
INSERT INTO public."SequelizeMeta" VALUES ('2-create-people.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604021818-create-address-type.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604024238-create-country.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604024252-create-postal-code.js');
INSERT INTO public."SequelizeMeta" VALUES ('3-create-account.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200522150259-create-roles.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604024200-create-province.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200522153843-create-account-roles.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604021727-create-address.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604024449-create-address-account.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604172505-create-products.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604172544-create-tags.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604172930-create-properties.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604173503-create-wharehouse.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604174323-create-wharehouse.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604184146-create-warehouse.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604175923-create-bid.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200604202057-create-bid-properties.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200609215220-create-module.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200609222040-create-sub-module.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200609224058-create-permision.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200609231716-create-dashboard.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200610020959-create-dashboard-permission.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200610024842-create-grant-role.js');
INSERT INTO public."SequelizeMeta" VALUES ('add-index-account-roles.js');
INSERT INTO public."SequelizeMeta" VALUES ('add-index-address-account.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200615230251-modify_dashboard_add_new_fields.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200615230251-edit_dashboard_add_icontype.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200615230251-edit_dashboard_add_icontypeAndPath.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200615230251-edit_dashboard_add_path.js');
INSERT INTO public."SequelizeMeta" VALUES ('20200615230251-edit_dashboard_add_icontype_file.js');


--
-- TOC entry 3176 (class 0 OID 91934)
-- Dependencies: 200
-- Data for Name: Status; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."Status" VALUES (1, 'Active', '2020-06-06 21:51:28.107-04', '2020-06-06 21:51:28.107-04');
INSERT INTO public."Status" VALUES (2, 'Inactive', '2020-06-06 21:51:28.107-04', '2020-06-06 21:51:28.107-04');


--
-- TOC entry 3202 (class 0 OID 92166)
-- Dependencies: 226
-- Data for Name: Tags; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3206 (class 0 OID 92301)
-- Dependencies: 230
-- Data for Name: Warehouses; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3194 (class 0 OID 92079)
-- Dependencies: 218
-- Data for Name: accountRoles; Type: TABLE DATA; Schema: public; Owner: angelds
--

INSERT INTO public."accountRoles" VALUES (4, 17, 5, 1, '2020-06-07 17:30:20.104-04', '2020-06-07 17:30:20.104-04');
INSERT INTO public."accountRoles" VALUES (5, 17, 6, 1, '2020-06-07 17:30:20.117-04', '2020-06-07 17:30:20.117-04');
INSERT INTO public."accountRoles" VALUES (6, 18, 5, 1, '2020-06-07 17:33:17.226-04', '2020-06-07 17:33:17.226-04');
INSERT INTO public."accountRoles" VALUES (7, 18, 6, 1, '2020-06-07 17:33:17.24-04', '2020-06-07 17:33:17.24-04');
INSERT INTO public."accountRoles" VALUES (8, 20, 5, 1, '2020-06-07 17:47:23.343-04', '2020-06-07 17:47:23.343-04');
INSERT INTO public."accountRoles" VALUES (9, 20, 6, 1, '2020-06-07 17:47:23.363-04', '2020-06-07 17:47:23.363-04');
INSERT INTO public."accountRoles" VALUES (10, 21, 5, 1, '2020-06-07 17:53:33.021-04', '2020-06-07 17:53:33.021-04');
INSERT INTO public."accountRoles" VALUES (11, 21, 6, 1, '2020-06-07 17:53:33.037-04', '2020-06-07 17:53:33.037-04');
INSERT INTO public."accountRoles" VALUES (12, 22, 5, 1, '2020-06-07 18:07:10.331-04', '2020-06-07 18:07:10.331-04');
INSERT INTO public."accountRoles" VALUES (13, 22, 6, 1, '2020-06-07 18:07:10.347-04', '2020-06-07 18:07:10.347-04');
INSERT INTO public."accountRoles" VALUES (14, 23, 5, 1, '2020-06-07 19:15:31.665-04', '2020-06-07 19:15:31.665-04');
INSERT INTO public."accountRoles" VALUES (15, 23, 6, 1, '2020-06-07 19:15:31.678-04', '2020-06-07 19:15:31.678-04');
INSERT INTO public."accountRoles" VALUES (16, 29, 5, 1, '2020-06-10 00:47:05.303-04', '2020-06-10 00:47:05.303-04');
INSERT INTO public."accountRoles" VALUES (17, 29, 6, 1, '2020-06-10 00:47:05.404-04', '2020-06-10 00:47:05.404-04');


--
-- TOC entry 3198 (class 0 OID 92128)
-- Dependencies: 222
-- Data for Name: addressAccounts; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3182 (class 0 OID 91982)
-- Dependencies: 206
-- Data for Name: addressTypes; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3210 (class 0 OID 92350)
-- Dependencies: 234
-- Data for Name: bidProperties; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3220 (class 0 OID 92683)
-- Dependencies: 244
-- Data for Name: dashboardPermissions; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3222 (class 0 OID 92708)
-- Dependencies: 246
-- Data for Name: grantRoles; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3186 (class 0 OID 92000)
-- Dependencies: 210
-- Data for Name: postalCodes; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3214 (class 0 OID 92433)
-- Dependencies: 238
-- Data for Name: subModules; Type: TABLE DATA; Schema: public; Owner: angelds
--



--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 211
-- Name: Accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Accounts_id_seq"', 29, true);


--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 219
-- Name: Addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Addresses_id_seq"', 1, false);


--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 231
-- Name: Bids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Bids_id_seq"', 3, true);


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 207
-- Name: Countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Countries_id_seq"', 1, false);


--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 241
-- Name: Dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Dashboards_id_seq"', 1, false);


--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 201
-- Name: Genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Genders_id_seq"', 3, true);


--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 235
-- Name: Modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Modules_id_seq"', 1, false);


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 197
-- Name: Nationalities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Nationalities_id_seq"', 1, false);


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 203
-- Name: People_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."People_id_seq"', 60, true);


--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 239
-- Name: Permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Permissions_id_seq"', 1, false);


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 223
-- Name: Products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Products_id_seq"', 10, true);


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 227
-- Name: Properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Properties_id_seq"', 1, false);


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 215
-- Name: Provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Provinces_id_seq"', 1, false);


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 213
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Roles_id_seq"', 7, true);


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 199
-- Name: Status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Status_id_seq"', 1, false);


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 225
-- Name: Tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Tags_id_seq"', 1, false);


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 229
-- Name: Warehouses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."Warehouses_id_seq"', 1, false);


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 217
-- Name: accountRoles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."accountRoles_id_seq"', 17, true);


--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 221
-- Name: addressAccounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."addressAccounts_id_seq"', 1, false);


--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 205
-- Name: addressTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."addressTypes_id_seq"', 1, false);


--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 233
-- Name: bidProperties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."bidProperties_id_seq"', 1, false);


--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 243
-- Name: dashboardPermissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."dashboardPermissions_id_seq"', 1, false);


--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 245
-- Name: grantRoles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."grantRoles_id_seq"', 1, false);


--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 209
-- Name: postalCodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."postalCodes_id_seq"', 1, false);


--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 237
-- Name: subModules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: angelds
--

SELECT pg_catalog.setval('public."subModules_id_seq"', 1, false);


--
-- TOC entry 2947 (class 2606 OID 92022)
-- Name: Accounts Accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_email_key" UNIQUE (email);


--
-- TOC entry 2949 (class 2606 OID 92020)
-- Name: Accounts Accounts_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_name_key" UNIQUE (name);


--
-- TOC entry 2951 (class 2606 OID 92018)
-- Name: Accounts Accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (id);


--
-- TOC entry 2964 (class 2606 OID 92110)
-- Name: Addresses Addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_pkey" PRIMARY KEY (id);


--
-- TOC entry 2985 (class 2606 OID 92326)
-- Name: Bids Bids_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_pkey" PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 91997)
-- Name: Countries Countries_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "Countries_name_key" UNIQUE (name);


--
-- TOC entry 2941 (class 2606 OID 91995)
-- Name: Countries Countries_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "Countries_pkey" PRIMARY KEY (id);


--
-- TOC entry 3003 (class 2606 OID 92668)
-- Name: Dashboards Dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_pkey" PRIMARY KEY (id);


--
-- TOC entry 3005 (class 2606 OID 92670)
-- Name: Dashboards Dashboards_subModuleId_moduleId_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_moduleId_key" UNIQUE ("subModuleId", "moduleId");


--
-- TOC entry 2929 (class 2606 OID 91951)
-- Name: Genders Genders_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_name_key" UNIQUE (name);


--
-- TOC entry 2931 (class 2606 OID 91949)
-- Name: Genders Genders_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_pkey" PRIMARY KEY (id);


--
-- TOC entry 2989 (class 2606 OID 92380)
-- Name: Modules Modules_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_name_key" UNIQUE (name);


--
-- TOC entry 2991 (class 2606 OID 92378)
-- Name: Modules Modules_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_pkey" PRIMARY KEY (id);


--
-- TOC entry 2921 (class 2606 OID 91931)
-- Name: Nationalities Nationalities_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_name_key" UNIQUE (name);


--
-- TOC entry 2923 (class 2606 OID 91929)
-- Name: Nationalities Nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_pkey" PRIMARY KEY (id);


--
-- TOC entry 2933 (class 2606 OID 91964)
-- Name: People People_documentId_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_documentId_key" UNIQUE ("documentId");


--
-- TOC entry 2935 (class 2606 OID 91962)
-- Name: People People_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_pkey" PRIMARY KEY (id);


--
-- TOC entry 2999 (class 2606 OID 92460)
-- Name: Permissions Permissions_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_name_key" UNIQUE (name);


--
-- TOC entry 3001 (class 2606 OID 92458)
-- Name: Permissions Permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_pkey" PRIMARY KEY (id);


--
-- TOC entry 2969 (class 2606 OID 92163)
-- Name: Products Products_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_name_key" UNIQUE (name);


--
-- TOC entry 2971 (class 2606 OID 92161)
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- TOC entry 2977 (class 2606 OID 92183)
-- Name: Properties Properties_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_name_key" UNIQUE (name);


--
-- TOC entry 2979 (class 2606 OID 92181)
-- Name: Properties Properties_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_pkey" PRIMARY KEY (id);


--
-- TOC entry 2957 (class 2606 OID 92071)
-- Name: Provinces Provinces_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_name_key" UNIQUE (name);


--
-- TOC entry 2959 (class 2606 OID 92069)
-- Name: Provinces Provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_pkey" PRIMARY KEY (id);


--
-- TOC entry 2953 (class 2606 OID 92056)
-- Name: Roles Roles_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key" UNIQUE (name);


--
-- TOC entry 2955 (class 2606 OID 92054)
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 91576)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 2925 (class 2606 OID 91941)
-- Name: Status Status_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_name_key" UNIQUE (name);


--
-- TOC entry 2927 (class 2606 OID 91939)
-- Name: Status Status_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_pkey" PRIMARY KEY (id);


--
-- TOC entry 2973 (class 2606 OID 92173)
-- Name: Tags Tags_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_name_key" UNIQUE (name);


--
-- TOC entry 2975 (class 2606 OID 92171)
-- Name: Tags Tags_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (id);


--
-- TOC entry 2981 (class 2606 OID 92308)
-- Name: Warehouses Warehouses_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_name_key" UNIQUE (name);


--
-- TOC entry 2983 (class 2606 OID 92306)
-- Name: Warehouses Warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_pkey" PRIMARY KEY (id);


--
-- TOC entry 2961 (class 2606 OID 92084)
-- Name: accountRoles accountRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_pkey" PRIMARY KEY (id);


--
-- TOC entry 2966 (class 2606 OID 92133)
-- Name: addressAccounts addressAccounts_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_pkey" PRIMARY KEY (id);


--
-- TOC entry 2937 (class 2606 OID 91987)
-- Name: addressTypes addressTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."addressTypes"
    ADD CONSTRAINT "addressTypes_pkey" PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 92355)
-- Name: bidProperties bidProperties_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."bidProperties"
    ADD CONSTRAINT "bidProperties_pkey" PRIMARY KEY (id);


--
-- TOC entry 3007 (class 2606 OID 92690)
-- Name: dashboardPermissions dashboardPermissions_permissionId_dashboardId_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_dashboardId_key" UNIQUE ("permissionId", "dashboardId");


--
-- TOC entry 3009 (class 2606 OID 92688)
-- Name: dashboardPermissions dashboardPermissions_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_pkey" PRIMARY KEY (id);


--
-- TOC entry 3011 (class 2606 OID 92713)
-- Name: grantRoles grantRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_pkey" PRIMARY KEY (id);


--
-- TOC entry 3013 (class 2606 OID 92715)
-- Name: grantRoles grantRoles_roleId_dashboradPermissionId_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_dashboradPermissionId_key" UNIQUE ("roleId", "dashboradPermissionId");


--
-- TOC entry 2943 (class 2606 OID 92007)
-- Name: postalCodes postalCodes_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_name_key" UNIQUE (name);


--
-- TOC entry 2945 (class 2606 OID 92005)
-- Name: postalCodes postalCodes_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_pkey" PRIMARY KEY (id);


--
-- TOC entry 2993 (class 2606 OID 92443)
-- Name: subModules subModules_name_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_name_key" UNIQUE (name);


--
-- TOC entry 2995 (class 2606 OID 92441)
-- Name: subModules subModules_pkey; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_pkey" PRIMARY KEY (id);


--
-- TOC entry 2997 (class 2606 OID 92445)
-- Name: subModules subModules_route_key; Type: CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_route_key" UNIQUE (route);


--
-- TOC entry 2962 (class 1259 OID 92731)
-- Name: account_roles_account_id_role_id; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX account_roles_account_id_role_id ON public."accountRoles" USING btree ("accountId", "roleId");


--
-- TOC entry 2967 (class 1259 OID 92732)
-- Name: address_accounts_address_id_account_id; Type: INDEX; Schema: public; Owner: angelds
--

CREATE INDEX address_accounts_address_id_account_id ON public."addressAccounts" USING btree ("addressId", "accountId");


--
-- TOC entry 3017 (class 2606 OID 92023)
-- Name: Accounts Accounts_personId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_personId_fkey" FOREIGN KEY ("peopleId") REFERENCES public."People"(id);


--
-- TOC entry 3018 (class 2606 OID 92028)
-- Name: Accounts Accounts_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3025 (class 2606 OID 92116)
-- Name: Addresses Addresses_postalCodeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_postalCodeId_fkey" FOREIGN KEY ("postalCodeId") REFERENCES public."postalCodes"(id);


--
-- TOC entry 3024 (class 2606 OID 92111)
-- Name: Addresses Addresses_provinceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES public."Provinces"(id);


--
-- TOC entry 3026 (class 2606 OID 92121)
-- Name: Addresses Addresses_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3034 (class 2606 OID 92332)
-- Name: Bids Bids_accountRoleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_accountRoleId_fkey" FOREIGN KEY ("accountRoleId") REFERENCES public."accountRoles"(id);


--
-- TOC entry 3033 (class 2606 OID 92327)
-- Name: Bids Bids_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Products"(id);


--
-- TOC entry 3036 (class 2606 OID 92342)
-- Name: Bids Bids_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3035 (class 2606 OID 92337)
-- Name: Bids Bids_warehouseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_warehouseId_fkey" FOREIGN KEY ("warehouseId") REFERENCES public."Warehouses"(id);


--
-- TOC entry 3043 (class 2606 OID 92671)
-- Name: Dashboards Dashboards_moduleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_moduleId_fkey" FOREIGN KEY ("moduleId") REFERENCES public."Modules"(id);


--
-- TOC entry 3044 (class 2606 OID 92676)
-- Name: Dashboards Dashboards_subModuleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_fkey" FOREIGN KEY ("subModuleId") REFERENCES public."subModules"(id);


--
-- TOC entry 3040 (class 2606 OID 92381)
-- Name: Modules Modules_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3014 (class 2606 OID 91965)
-- Name: People People_genderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_genderId_fkey" FOREIGN KEY ("genderId") REFERENCES public."Genders"(id);


--
-- TOC entry 3015 (class 2606 OID 91970)
-- Name: People People_nationalityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_nationalityId_fkey" FOREIGN KEY ("nationalityId") REFERENCES public."Nationalities"(id);


--
-- TOC entry 3016 (class 2606 OID 91975)
-- Name: People People_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3042 (class 2606 OID 92461)
-- Name: Permissions Permissions_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3020 (class 2606 OID 92072)
-- Name: Provinces Provinces_countryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES public."Countries"(id);


--
-- TOC entry 3019 (class 2606 OID 92057)
-- Name: Roles Roles_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3031 (class 2606 OID 92309)
-- Name: Warehouses Warehouses_addressId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES public."Addresses"(id);


--
-- TOC entry 3032 (class 2606 OID 92314)
-- Name: Warehouses Warehouses_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3021 (class 2606 OID 92085)
-- Name: accountRoles accountRoles_accountId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES public."Accounts"(id);


--
-- TOC entry 3022 (class 2606 OID 92090)
-- Name: accountRoles accountRoles_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id);


--
-- TOC entry 3023 (class 2606 OID 92095)
-- Name: accountRoles accountRoles_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3028 (class 2606 OID 92139)
-- Name: addressAccounts addressAccounts_accountId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES public."Accounts"(id);


--
-- TOC entry 3027 (class 2606 OID 92134)
-- Name: addressAccounts addressAccounts_addressId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES public."Addresses"(id);


--
-- TOC entry 3029 (class 2606 OID 92144)
-- Name: addressAccounts addressAccounts_addressTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_addressTypeId_fkey" FOREIGN KEY ("addressTypeId") REFERENCES public."addressTypes"(id);


--
-- TOC entry 3030 (class 2606 OID 92149)
-- Name: addressAccounts addressAccounts_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3037 (class 2606 OID 92356)
-- Name: bidProperties bidProperties_bidId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."bidProperties"
    ADD CONSTRAINT "bidProperties_bidId_fkey" FOREIGN KEY ("bidId") REFERENCES public."Bids"(id);


--
-- TOC entry 3038 (class 2606 OID 92361)
-- Name: bidProperties bidProperties_propertyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."bidProperties"
    ADD CONSTRAINT "bidProperties_propertyId_fkey" FOREIGN KEY ("propertyId") REFERENCES public."Properties"(id);


--
-- TOC entry 3039 (class 2606 OID 92366)
-- Name: bidProperties bidProperties_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."bidProperties"
    ADD CONSTRAINT "bidProperties_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3045 (class 2606 OID 92691)
-- Name: dashboardPermissions dashboardPermissions_dashboardId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_dashboardId_fkey" FOREIGN KEY ("dashboardId") REFERENCES public."Dashboards"(id);


--
-- TOC entry 3046 (class 2606 OID 92696)
-- Name: dashboardPermissions dashboardPermissions_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permissions"(id);


--
-- TOC entry 3047 (class 2606 OID 92701)
-- Name: dashboardPermissions dashboardPermissions_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3048 (class 2606 OID 92716)
-- Name: grantRoles grantRoles_dashboradPermissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_dashboradPermissionId_fkey" FOREIGN KEY ("dashboradPermissionId") REFERENCES public."dashboardPermissions"(id);


--
-- TOC entry 3049 (class 2606 OID 92721)
-- Name: grantRoles grantRoles_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id);


--
-- TOC entry 3050 (class 2606 OID 92726)
-- Name: grantRoles grantRoles_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


--
-- TOC entry 3041 (class 2606 OID 92446)
-- Name: subModules subModules_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: angelds
--

ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);


-- Completed on 2020-06-15 22:29:55 -04

--
-- PostgreSQL database dump complete
--

