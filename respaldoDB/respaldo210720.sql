PGDMP     4                    x            p12052020dev01    11.7 (Debian 11.7-2.pgdg90+1)    11.7 (Debian 11.7-2.pgdg90+1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    100573    p12052020dev01    DATABASE     �   CREATE DATABASE p12052020dev01 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';
    DROP DATABASE p12052020dev01;
             postgres    false            �            1259    100574    Accounts    TABLE     �  CREATE TABLE public."Accounts" (
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
    preference character varying
);
    DROP TABLE public."Accounts";
       public         angelds    false            �            1259    100580    Accounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Accounts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Accounts_id_seq";
       public       angelds    false    196            �           0    0    Accounts_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Accounts_id_seq" OWNED BY public."Accounts".id;
            public       angelds    false    197            �            1259    100582 	   Addresses    TABLE     i  CREATE TABLE public."Addresses" (
    id integer NOT NULL,
    "provinceId" integer NOT NULL,
    "postalCodeId" integer NOT NULL,
    street character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Addresses";
       public         angelds    false            �            1259    100588    Addresses_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Addresses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Addresses_id_seq";
       public       angelds    false    198            �           0    0    Addresses_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Addresses_id_seq" OWNED BY public."Addresses".id;
            public       angelds    false    199            �            1259    101252    Bids    TABLE       CREATE TABLE public."Bids" (
    id integer NOT NULL,
    "bidType" integer NOT NULL,
    title character varying(255) NOT NULL,
    "brandId" integer NOT NULL,
    "longDesc" character varying(255) NOT NULL,
    "smallDesc" character varying(255) NOT NULL,
    disponibility integer NOT NULL,
    "time" integer NOT NULL,
    devolution boolean,
    include character varying(255) NOT NULL,
    customize character varying(255) NOT NULL,
    garanty character varying(255),
    tags json,
    photos json NOT NULL,
    category json NOT NULL,
    variation json NOT NULL,
    "accountRoleId" integer NOT NULL,
    "WarehouseId" integer,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Bids";
       public         angelds    false            �            1259    101250    Bids_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Bids_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Bids_id_seq";
       public       angelds    false    242            �           0    0    Bids_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Bids_id_seq" OWNED BY public."Bids".id;
            public       angelds    false    241            �            1259    101189    Brands    TABLE     �   CREATE TABLE public."Brands" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Brands";
       public         angelds    false            �            1259    101187    Brands_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Brands_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Brands_id_seq";
       public       angelds    false    240            �           0    0    Brands_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Brands_id_seq" OWNED BY public."Brands".id;
            public       angelds    false    239            �            1259    100595 	   Countries    TABLE     �   CREATE TABLE public."Countries" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Countries";
       public         angelds    false            �            1259    100598    Countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Countries_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Countries_id_seq";
       public       angelds    false    200            �           0    0    Countries_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Countries_id_seq" OWNED BY public."Countries".id;
            public       angelds    false    201            �            1259    100600 
   Dashboards    TABLE     Z  CREATE TABLE public."Dashboards" (
    id integer NOT NULL,
    "moduleId" integer NOT NULL,
    "subModuleId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    path character varying(255),
    icontype character varying(255),
    "statusId" integer DEFAULT 1 NOT NULL
);
     DROP TABLE public."Dashboards";
       public         angelds    false            �            1259    100607    Dashboards_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Dashboards_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Dashboards_id_seq";
       public       angelds    false    202            �           0    0    Dashboards_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Dashboards_id_seq" OWNED BY public."Dashboards".id;
            public       angelds    false    203            �            1259    100609    Genders    TABLE     �   CREATE TABLE public."Genders" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Genders";
       public         angelds    false            �            1259    100612    Genders_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Genders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Genders_id_seq";
       public       angelds    false    204            �           0    0    Genders_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Genders_id_seq" OWNED BY public."Genders".id;
            public       angelds    false    205            �            1259    100614    Modules    TABLE     �   CREATE TABLE public."Modules" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Modules";
       public         angelds    false            �            1259    100617    Modules_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Modules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Modules_id_seq";
       public       angelds    false    206            �           0    0    Modules_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Modules_id_seq" OWNED BY public."Modules".id;
            public       angelds    false    207            �            1259    100619    Nationalities    TABLE     �   CREATE TABLE public."Nationalities" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public."Nationalities";
       public         angelds    false            �            1259    100622    Nationalities_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Nationalities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Nationalities_id_seq";
       public       angelds    false    208            �           0    0    Nationalities_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Nationalities_id_seq" OWNED BY public."Nationalities".id;
            public       angelds    false    209            �            1259    100624    People    TABLE     �  CREATE TABLE public."People" (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    "documentId" character varying(255) NOT NULL,
    "genderId" integer NOT NULL,
    "nationalityId" integer NOT NULL,
    "birthDate" timestamp with time zone NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "documentType" integer
);
    DROP TABLE public."People";
       public         angelds    false            �            1259    100630    People_id_seq    SEQUENCE     �   CREATE SEQUENCE public."People_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."People_id_seq";
       public       angelds    false    210            �           0    0    People_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."People_id_seq" OWNED BY public."People".id;
            public       angelds    false    211            �            1259    100632    Permissions    TABLE     �   CREATE TABLE public."Permissions" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public."Permissions";
       public         angelds    false            �            1259    100635    Permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Permissions_id_seq";
       public       angelds    false    212            �           0    0    Permissions_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Permissions_id_seq" OWNED BY public."Permissions".id;
            public       angelds    false    213            �            1259    100642 
   Properties    TABLE     �   CREATE TABLE public."Properties" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Properties";
       public         angelds    false            �            1259    100645    Properties_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Properties_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Properties_id_seq";
       public       angelds    false    214            �           0    0    Properties_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Properties_id_seq" OWNED BY public."Properties".id;
            public       angelds    false    215            �            1259    100647 	   Provinces    TABLE     �   CREATE TABLE public."Provinces" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "countryId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Provinces";
       public         angelds    false            �            1259    100650    Provinces_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Provinces_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Provinces_id_seq";
       public       angelds    false    216            �           0    0    Provinces_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Provinces_id_seq" OWNED BY public."Provinces".id;
            public       angelds    false    217            �            1259    100652    Roles    TABLE     �   CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Roles";
       public         angelds    false            �            1259    100655    Roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Roles_id_seq";
       public       angelds    false    218            �           0    0    Roles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;
            public       angelds    false    219            �            1259    100657    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         angelds    false            �            1259    100660    Status    TABLE     �   CREATE TABLE public."Status" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Status";
       public         angelds    false            �            1259    100663    Status_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Status_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Status_id_seq";
       public       angelds    false    221            �           0    0    Status_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Status_id_seq" OWNED BY public."Status".id;
            public       angelds    false    222            �            1259    116969 
   Subscribes    TABLE     �   CREATE TABLE public."Subscribes" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Subscribes";
       public         angelds    false            �            1259    116967    Subscribes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Subscribes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Subscribes_id_seq";
       public       angelds    false    244            �           0    0    Subscribes_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Subscribes_id_seq" OWNED BY public."Subscribes".id;
            public       angelds    false    243            �            1259    100670 
   Warehouses    TABLE       CREATE TABLE public."Warehouses" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    address character varying NOT NULL
);
     DROP TABLE public."Warehouses";
       public         angelds    false            �            1259    100673    Warehouses_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Warehouses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Warehouses_id_seq";
       public       angelds    false    223            �           0    0    Warehouses_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Warehouses_id_seq" OWNED BY public."Warehouses".id;
            public       angelds    false    224            �            1259    100675    accountRoles    TABLE       CREATE TABLE public."accountRoles" (
    id integer NOT NULL,
    "accountId" integer NOT NULL,
    "roleId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."accountRoles";
       public         angelds    false            �            1259    100678    accountRoles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."accountRoles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."accountRoles_id_seq";
       public       angelds    false    225            �           0    0    accountRoles_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."accountRoles_id_seq" OWNED BY public."accountRoles".id;
            public       angelds    false    226            �            1259    100680    addressAccounts    TABLE     4  CREATE TABLE public."addressAccounts" (
    id integer NOT NULL,
    "addressId" integer NOT NULL,
    "accountId" integer NOT NULL,
    "addressTypeId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 %   DROP TABLE public."addressAccounts";
       public         angelds    false            �            1259    100683    addressAccounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public."addressAccounts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."addressAccounts_id_seq";
       public       angelds    false    227            �           0    0    addressAccounts_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."addressAccounts_id_seq" OWNED BY public."addressAccounts".id;
            public       angelds    false    228            �            1259    100685    addressTypes    TABLE     �   CREATE TABLE public."addressTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."addressTypes";
       public         angelds    false            �            1259    100688    addressTypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."addressTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."addressTypes_id_seq";
       public       angelds    false    229            �           0    0    addressTypes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."addressTypes_id_seq" OWNED BY public."addressTypes".id;
            public       angelds    false    230            �            1259    100695    dashboardPermissions    TABLE     "  CREATE TABLE public."dashboardPermissions" (
    id integer NOT NULL,
    "dashboardId" integer NOT NULL,
    "permissionId" integer NOT NULL,
    "statusId" integer DEFAULT 2 NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 *   DROP TABLE public."dashboardPermissions";
       public         angelds    false            �            1259    100699    dashboardPermissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."dashboardPermissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."dashboardPermissions_id_seq";
       public       angelds    false    231            �           0    0    dashboardPermissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."dashboardPermissions_id_seq" OWNED BY public."dashboardPermissions".id;
            public       angelds    false    232            �            1259    100701 
   grantRoles    TABLE       CREATE TABLE public."grantRoles" (
    id integer NOT NULL,
    "dashboardPermissionId" integer NOT NULL,
    "roleId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."grantRoles";
       public         angelds    false            �            1259    100704    grantRoles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."grantRoles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."grantRoles_id_seq";
       public       angelds    false    233            �           0    0    grantRoles_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."grantRoles_id_seq" OWNED BY public."grantRoles".id;
            public       angelds    false    234            �            1259    100706    postalCodes    TABLE     �   CREATE TABLE public."postalCodes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public."postalCodes";
       public         angelds    false            �            1259    100709    postalCodes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."postalCodes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."postalCodes_id_seq";
       public       angelds    false    235            �           0    0    postalCodes_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."postalCodes_id_seq" OWNED BY public."postalCodes".id;
            public       angelds    false    236            �            1259    100711 
   subModules    TABLE       CREATE TABLE public."subModules" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    route character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."subModules";
       public         angelds    false            �            1259    100717    subModules_id_seq    SEQUENCE     �   CREATE SEQUENCE public."subModules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."subModules_id_seq";
       public       angelds    false    237            �           0    0    subModules_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."subModules_id_seq" OWNED BY public."subModules".id;
            public       angelds    false    238            I           2604    100719    Accounts id    DEFAULT     n   ALTER TABLE ONLY public."Accounts" ALTER COLUMN id SET DEFAULT nextval('public."Accounts_id_seq"'::regclass);
 <   ALTER TABLE public."Accounts" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    197    196            K           2604    100720    Addresses id    DEFAULT     p   ALTER TABLE ONLY public."Addresses" ALTER COLUMN id SET DEFAULT nextval('public."Addresses_id_seq"'::regclass);
 =   ALTER TABLE public."Addresses" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    199    198            b           2604    101255    Bids id    DEFAULT     f   ALTER TABLE ONLY public."Bids" ALTER COLUMN id SET DEFAULT nextval('public."Bids_id_seq"'::regclass);
 8   ALTER TABLE public."Bids" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    241    242    242            a           2604    101192 	   Brands id    DEFAULT     j   ALTER TABLE ONLY public."Brands" ALTER COLUMN id SET DEFAULT nextval('public."Brands_id_seq"'::regclass);
 :   ALTER TABLE public."Brands" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    240    239    240            L           2604    100722    Countries id    DEFAULT     p   ALTER TABLE ONLY public."Countries" ALTER COLUMN id SET DEFAULT nextval('public."Countries_id_seq"'::regclass);
 =   ALTER TABLE public."Countries" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    201    200            N           2604    100723    Dashboards id    DEFAULT     r   ALTER TABLE ONLY public."Dashboards" ALTER COLUMN id SET DEFAULT nextval('public."Dashboards_id_seq"'::regclass);
 >   ALTER TABLE public."Dashboards" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    203    202            O           2604    100724 
   Genders id    DEFAULT     l   ALTER TABLE ONLY public."Genders" ALTER COLUMN id SET DEFAULT nextval('public."Genders_id_seq"'::regclass);
 ;   ALTER TABLE public."Genders" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    205    204            P           2604    100725 
   Modules id    DEFAULT     l   ALTER TABLE ONLY public."Modules" ALTER COLUMN id SET DEFAULT nextval('public."Modules_id_seq"'::regclass);
 ;   ALTER TABLE public."Modules" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    207    206            Q           2604    100726    Nationalities id    DEFAULT     x   ALTER TABLE ONLY public."Nationalities" ALTER COLUMN id SET DEFAULT nextval('public."Nationalities_id_seq"'::regclass);
 A   ALTER TABLE public."Nationalities" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    209    208            R           2604    100727 	   People id    DEFAULT     j   ALTER TABLE ONLY public."People" ALTER COLUMN id SET DEFAULT nextval('public."People_id_seq"'::regclass);
 :   ALTER TABLE public."People" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    211    210            S           2604    100728    Permissions id    DEFAULT     t   ALTER TABLE ONLY public."Permissions" ALTER COLUMN id SET DEFAULT nextval('public."Permissions_id_seq"'::regclass);
 ?   ALTER TABLE public."Permissions" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    213    212            T           2604    100730    Properties id    DEFAULT     r   ALTER TABLE ONLY public."Properties" ALTER COLUMN id SET DEFAULT nextval('public."Properties_id_seq"'::regclass);
 >   ALTER TABLE public."Properties" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    215    214            U           2604    100731    Provinces id    DEFAULT     p   ALTER TABLE ONLY public."Provinces" ALTER COLUMN id SET DEFAULT nextval('public."Provinces_id_seq"'::regclass);
 =   ALTER TABLE public."Provinces" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    217    216            V           2604    100732    Roles id    DEFAULT     h   ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);
 9   ALTER TABLE public."Roles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    219    218            W           2604    100733 	   Status id    DEFAULT     j   ALTER TABLE ONLY public."Status" ALTER COLUMN id SET DEFAULT nextval('public."Status_id_seq"'::regclass);
 :   ALTER TABLE public."Status" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    222    221            c           2604    116972    Subscribes id    DEFAULT     r   ALTER TABLE ONLY public."Subscribes" ALTER COLUMN id SET DEFAULT nextval('public."Subscribes_id_seq"'::regclass);
 >   ALTER TABLE public."Subscribes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    243    244    244            X           2604    100735    Warehouses id    DEFAULT     r   ALTER TABLE ONLY public."Warehouses" ALTER COLUMN id SET DEFAULT nextval('public."Warehouses_id_seq"'::regclass);
 >   ALTER TABLE public."Warehouses" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    224    223            Y           2604    100736    accountRoles id    DEFAULT     v   ALTER TABLE ONLY public."accountRoles" ALTER COLUMN id SET DEFAULT nextval('public."accountRoles_id_seq"'::regclass);
 @   ALTER TABLE public."accountRoles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    226    225            Z           2604    100737    addressAccounts id    DEFAULT     |   ALTER TABLE ONLY public."addressAccounts" ALTER COLUMN id SET DEFAULT nextval('public."addressAccounts_id_seq"'::regclass);
 C   ALTER TABLE public."addressAccounts" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    228    227            [           2604    100738    addressTypes id    DEFAULT     v   ALTER TABLE ONLY public."addressTypes" ALTER COLUMN id SET DEFAULT nextval('public."addressTypes_id_seq"'::regclass);
 @   ALTER TABLE public."addressTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    230    229            ]           2604    100740    dashboardPermissions id    DEFAULT     �   ALTER TABLE ONLY public."dashboardPermissions" ALTER COLUMN id SET DEFAULT nextval('public."dashboardPermissions_id_seq"'::regclass);
 H   ALTER TABLE public."dashboardPermissions" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    232    231            ^           2604    100741    grantRoles id    DEFAULT     r   ALTER TABLE ONLY public."grantRoles" ALTER COLUMN id SET DEFAULT nextval('public."grantRoles_id_seq"'::regclass);
 >   ALTER TABLE public."grantRoles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    234    233            _           2604    100742    postalCodes id    DEFAULT     t   ALTER TABLE ONLY public."postalCodes" ALTER COLUMN id SET DEFAULT nextval('public."postalCodes_id_seq"'::regclass);
 ?   ALTER TABLE public."postalCodes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    236    235            `           2604    100743    subModules id    DEFAULT     r   ALTER TABLE ONLY public."subModules" ALTER COLUMN id SET DEFAULT nextval('public."subModules_id_seq"'::regclass);
 >   ALTER TABLE public."subModules" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    238    237            [          0    100574    Accounts 
   TABLE DATA               �   COPY public."Accounts" (id, name, pass, email, "peopleId", "statusId", "createdAt", "updatedAt", "confirmStatus", "hashConfirm", preference) FROM stdin;
    public       angelds    false    196   �      ]          0    100582 	   Addresses 
   TABLE DATA               �   COPY public."Addresses" (id, "provinceId", "postalCodeId", street, description, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    198   M      �          0    101252    Bids 
   TABLE DATA                 COPY public."Bids" (id, "bidType", title, "brandId", "longDesc", "smallDesc", disponibility, "time", devolution, include, customize, garanty, tags, photos, category, variation, "accountRoleId", "WarehouseId", "StatusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    242   j      �          0    101189    Brands 
   TABLE DATA               F   COPY public."Brands" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    240   �      _          0    100595 	   Countries 
   TABLE DATA               I   COPY public."Countries" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    200   �      a          0    100600 
   Dashboards 
   TABLE DATA               {   COPY public."Dashboards" (id, "moduleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "statusId") FROM stdin;
    public       angelds    false    202   �      c          0    100609    Genders 
   TABLE DATA               G   COPY public."Genders" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    204   �       e          0    100614    Modules 
   TABLE DATA               S   COPY public."Modules" (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    206   �       g          0    100619    Nationalities 
   TABLE DATA               M   COPY public."Nationalities" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    208   U!      i          0    100624    People 
   TABLE DATA               �   COPY public."People" (id, "firstName", "lastName", "documentId", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", "documentType") FROM stdin;
    public       angelds    false    210   �!      k          0    100632    Permissions 
   TABLE DATA               W   COPY public."Permissions" (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    212   �%      m          0    100642 
   Properties 
   TABLE DATA               J   COPY public."Properties" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    214   &      o          0    100647 	   Provinces 
   TABLE DATA               V   COPY public."Provinces" (id, name, "countryId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    216   &      q          0    100652    Roles 
   TABLE DATA               Q   COPY public."Roles" (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    218   <&      s          0    100657    SequelizeMeta 
   TABLE DATA               /   COPY public."SequelizeMeta" (name) FROM stdin;
    public       angelds    false    220   �&      t          0    100660    Status 
   TABLE DATA               F   COPY public."Status" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    221   9(      �          0    116969 
   Subscribes 
   TABLE DATA               K   COPY public."Subscribes" (id, email, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    244   �(      v          0    100670 
   Warehouses 
   TABLE DATA               _   COPY public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address) FROM stdin;
    public       angelds    false    223   �(      x          0    100675    accountRoles 
   TABLE DATA               i   COPY public."accountRoles" (id, "accountId", "roleId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    225   �)      z          0    100680    addressAccounts 
   TABLE DATA               �   COPY public."addressAccounts" (id, "addressId", "accountId", "addressTypeId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    227   4*      |          0    100685    addressTypes 
   TABLE DATA               L   COPY public."addressTypes" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    229   Q*      ~          0    100695    dashboardPermissions 
   TABLE DATA               y   COPY public."dashboardPermissions" (id, "dashboardId", "permissionId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    231   n*      �          0    100701 
   grantRoles 
   TABLE DATA               s   COPY public."grantRoles" (id, "dashboardPermissionId", "roleId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    233   �+      �          0    100706    postalCodes 
   TABLE DATA               K   COPY public."postalCodes" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    235   q,      �          0    100711 
   subModules 
   TABLE DATA               ]   COPY public."subModules" (id, name, route, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    237   �,      �           0    0    Accounts_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Accounts_id_seq"', 131, true);
            public       angelds    false    197            �           0    0    Addresses_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Addresses_id_seq"', 1, false);
            public       angelds    false    199            �           0    0    Bids_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Bids_id_seq"', 4, true);
            public       angelds    false    241            �           0    0    Brands_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Brands_id_seq"', 3, true);
            public       angelds    false    239            �           0    0    Countries_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Countries_id_seq"', 1, false);
            public       angelds    false    201            �           0    0    Dashboards_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Dashboards_id_seq"', 11, true);
            public       angelds    false    203            �           0    0    Genders_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Genders_id_seq"', 3, true);
            public       angelds    false    205            �           0    0    Modules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Modules_id_seq"', 1, false);
            public       angelds    false    207            �           0    0    Nationalities_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Nationalities_id_seq"', 1, false);
            public       angelds    false    209            �           0    0    People_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."People_id_seq"', 68, true);
            public       angelds    false    211            �           0    0    Permissions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Permissions_id_seq"', 1, false);
            public       angelds    false    213            �           0    0    Properties_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Properties_id_seq"', 1, false);
            public       angelds    false    215            �           0    0    Provinces_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Provinces_id_seq"', 1, false);
            public       angelds    false    217            �           0    0    Roles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Roles_id_seq"', 7, true);
            public       angelds    false    219            �           0    0    Status_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Status_id_seq"', 1, false);
            public       angelds    false    222            �           0    0    Subscribes_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Subscribes_id_seq"', 16, true);
            public       angelds    false    243            �           0    0    Warehouses_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Warehouses_id_seq"', 6, true);
            public       angelds    false    224            �           0    0    accountRoles_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."accountRoles_id_seq"', 49, true);
            public       angelds    false    226            �           0    0    addressAccounts_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."addressAccounts_id_seq"', 1, false);
            public       angelds    false    228            �           0    0    addressTypes_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."addressTypes_id_seq"', 1, false);
            public       angelds    false    230            �           0    0    dashboardPermissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."dashboardPermissions_id_seq"', 1, false);
            public       angelds    false    232            �           0    0    grantRoles_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."grantRoles_id_seq"', 84, true);
            public       angelds    false    234            �           0    0    postalCodes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."postalCodes_id_seq"', 1, false);
            public       angelds    false    236            �           0    0    subModules_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."subModules_id_seq"', 1, false);
            public       angelds    false    238            e           2606    100745    Accounts Accounts_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_email_key" UNIQUE (email);
 I   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_email_key";
       public         angelds    false    196            g           2606    100747    Accounts Accounts_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_name_key" UNIQUE (name);
 H   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_name_key";
       public         angelds    false    196            i           2606    100749    Accounts Accounts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_pkey";
       public         angelds    false    196            k           2606    100751    Addresses Addresses_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_pkey";
       public         angelds    false    198            �           2606    101260    Bids Bids_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_pkey";
       public         angelds    false    242            �           2606    101196    Brands Brands_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Brands"
    ADD CONSTRAINT "Brands_name_key" UNIQUE (name);
 D   ALTER TABLE ONLY public."Brands" DROP CONSTRAINT "Brands_name_key";
       public         angelds    false    240            �           2606    101194    Brands Brands_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Brands"
    ADD CONSTRAINT "Brands_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Brands" DROP CONSTRAINT "Brands_pkey";
       public         angelds    false    240            m           2606    100755    Countries Countries_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "Countries_name_key" UNIQUE (name);
 J   ALTER TABLE ONLY public."Countries" DROP CONSTRAINT "Countries_name_key";
       public         angelds    false    200            o           2606    100757    Countries Countries_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "Countries_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Countries" DROP CONSTRAINT "Countries_pkey";
       public         angelds    false    200            q           2606    100759    Dashboards Dashboards_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_pkey";
       public         angelds    false    202            s           2606    100761 .   Dashboards Dashboards_subModuleId_moduleId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_moduleId_key" UNIQUE ("subModuleId", "moduleId");
 \   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_subModuleId_moduleId_key";
       public         angelds    false    202    202            u           2606    100763    Genders Genders_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_name_key" UNIQUE (name);
 F   ALTER TABLE ONLY public."Genders" DROP CONSTRAINT "Genders_name_key";
       public         angelds    false    204            w           2606    100765    Genders Genders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Genders" DROP CONSTRAINT "Genders_pkey";
       public         angelds    false    204            y           2606    100767    Modules Modules_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_name_key" UNIQUE (name);
 F   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_name_key";
       public         angelds    false    206            {           2606    100769    Modules Modules_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_pkey";
       public         angelds    false    206            }           2606    100771 $   Nationalities Nationalities_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_name_key" UNIQUE (name);
 R   ALTER TABLE ONLY public."Nationalities" DROP CONSTRAINT "Nationalities_name_key";
       public         angelds    false    208                       2606    100773     Nationalities Nationalities_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Nationalities" DROP CONSTRAINT "Nationalities_pkey";
       public         angelds    false    208            �           2606    100775    People People_documentId_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_documentId_key" UNIQUE ("documentId");
 J   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_documentId_key";
       public         angelds    false    210            �           2606    100777    People People_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_pkey";
       public         angelds    false    210            �           2606    100779     Permissions Permissions_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_name_key" UNIQUE (name);
 N   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_name_key";
       public         angelds    false    212            �           2606    100781    Permissions Permissions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_pkey";
       public         angelds    false    212            �           2606    100787    Properties Properties_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."Properties" DROP CONSTRAINT "Properties_name_key";
       public         angelds    false    214            �           2606    100789    Properties Properties_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Properties" DROP CONSTRAINT "Properties_pkey";
       public         angelds    false    214            �           2606    100791    Provinces Provinces_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_name_key" UNIQUE (name);
 J   ALTER TABLE ONLY public."Provinces" DROP CONSTRAINT "Provinces_name_key";
       public         angelds    false    216            �           2606    100793    Provinces Provinces_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Provinces" DROP CONSTRAINT "Provinces_pkey";
       public         angelds    false    216            �           2606    100795    Roles Roles_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key" UNIQUE (name);
 B   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key";
       public         angelds    false    218            �           2606    100797    Roles Roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_pkey";
       public         angelds    false    218            �           2606    100799     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public         angelds    false    220            �           2606    100801    Status Status_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_name_key" UNIQUE (name);
 D   ALTER TABLE ONLY public."Status" DROP CONSTRAINT "Status_name_key";
       public         angelds    false    221            �           2606    100803    Status Status_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Status" DROP CONSTRAINT "Status_pkey";
       public         angelds    false    221            �           2606    116976    Subscribes Subscribes_email_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Subscribes"
    ADD CONSTRAINT "Subscribes_email_key" UNIQUE (email);
 M   ALTER TABLE ONLY public."Subscribes" DROP CONSTRAINT "Subscribes_email_key";
       public         angelds    false    244            �           2606    116974    Subscribes Subscribes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Subscribes"
    ADD CONSTRAINT "Subscribes_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Subscribes" DROP CONSTRAINT "Subscribes_pkey";
       public         angelds    false    244            �           2606    100809    Warehouses Warehouses_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_name_key";
       public         angelds    false    223            �           2606    100811    Warehouses Warehouses_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_pkey";
       public         angelds    false    223            �           2606    100813    accountRoles accountRoles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_pkey";
       public         angelds    false    225            �           2606    100815 $   addressAccounts addressAccounts_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."addressAccounts" DROP CONSTRAINT "addressAccounts_pkey";
       public         angelds    false    227            �           2606    100817    addressTypes addressTypes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."addressTypes"
    ADD CONSTRAINT "addressTypes_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."addressTypes" DROP CONSTRAINT "addressTypes_pkey";
       public         angelds    false    229            �           2606    100821 F   dashboardPermissions dashboardPermissions_permissionId_dashboardId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_dashboardId_key" UNIQUE ("permissionId", "dashboardId");
 t   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_permissionId_dashboardId_key";
       public         angelds    false    231    231            �           2606    100823 .   dashboardPermissions dashboardPermissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_pkey";
       public         angelds    false    231            �           2606    100825    grantRoles grantRoles_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_pkey";
       public         angelds    false    233            �           2606    100827 6   grantRoles grantRoles_roleId_dashboradPermissionId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_dashboradPermissionId_key" UNIQUE ("roleId", "dashboardPermissionId");
 d   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_roleId_dashboradPermissionId_key";
       public         angelds    false    233    233            �           2606    100829     postalCodes postalCodes_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_name_key" UNIQUE (name);
 N   ALTER TABLE ONLY public."postalCodes" DROP CONSTRAINT "postalCodes_name_key";
       public         angelds    false    235            �           2606    100831    postalCodes postalCodes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."postalCodes" DROP CONSTRAINT "postalCodes_pkey";
       public         angelds    false    235            �           2606    100833    subModules subModules_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_name_key";
       public         angelds    false    237            �           2606    100835    subModules subModules_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_pkey";
       public         angelds    false    237            �           1259    100836     account_roles_account_id_role_id    INDEX     l   CREATE INDEX account_roles_account_id_role_id ON public."accountRoles" USING btree ("accountId", "roleId");
 4   DROP INDEX public.account_roles_account_id_role_id;
       public         angelds    false    225    225            �           1259    100837 &   address_accounts_address_id_account_id    INDEX     x   CREATE INDEX address_accounts_address_id_account_id ON public."addressAccounts" USING btree ("addressId", "accountId");
 :   DROP INDEX public.address_accounts_address_id_account_id;
       public         angelds    false    227    227            �           2606    100838    Accounts Accounts_personId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_personId_fkey" FOREIGN KEY ("peopleId") REFERENCES public."People"(id);
 M   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_personId_fkey";
       public       angelds    false    196    210    2947            �           2606    100843    Accounts Accounts_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 M   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_statusId_fkey";
       public       angelds    false    2969    196    221            �           2606    100848 %   Addresses Addresses_postalCodeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_postalCodeId_fkey" FOREIGN KEY ("postalCodeId") REFERENCES public."postalCodes"(id);
 S   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_postalCodeId_fkey";
       public       angelds    false    2993    235    198            �           2606    100853 #   Addresses Addresses_provinceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES public."Provinces"(id);
 Q   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_provinceId_fkey";
       public       angelds    false    2959    216    198            �           2606    100858 !   Addresses Addresses_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 O   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_statusId_fkey";
       public       angelds    false    198    221    2969            �           2606    101266    Bids Bids_accountRoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_accountRoleId_fkey" FOREIGN KEY ("accountRoleId") REFERENCES public."accountRoles"(id);
 J   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_accountRoleId_fkey";
       public       angelds    false    242    2975    225            �           2606    101261    Bids Bids_brandId_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public."Brands"(id);
 D   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_brandId_fkey";
       public       angelds    false    242    3001    240            �           2606    101276    Bids Bids_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 E   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_statusId_fkey";
       public       angelds    false    2969    221    242            �           2606    101271    Bids Bids_warehouseId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_warehouseId_fkey" FOREIGN KEY ("WarehouseId") REFERENCES public."Warehouses"(id);
 H   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_warehouseId_fkey";
       public       angelds    false    2973    242    223            �           2606    100883 #   Dashboards Dashboards_moduleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_moduleId_fkey" FOREIGN KEY ("moduleId") REFERENCES public."Modules"(id);
 Q   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_moduleId_fkey";
       public       angelds    false    202    206    2939            �           2606    100888 #   Dashboards Dashboards_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_statusId_fkey";
       public       angelds    false    2969    202    221            �           2606    100893 &   Dashboards Dashboards_subModuleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_fkey" FOREIGN KEY ("subModuleId") REFERENCES public."subModules"(id);
 T   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_subModuleId_fkey";
       public       angelds    false    2997    237    202            �           2606    100898    Modules Modules_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 K   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_statusId_fkey";
       public       angelds    false    2969    206    221            �           2606    100903    People People_genderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_genderId_fkey" FOREIGN KEY ("genderId") REFERENCES public."Genders"(id);
 I   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_genderId_fkey";
       public       angelds    false    210    204    2935            �           2606    100908     People People_nationalityId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_nationalityId_fkey" FOREIGN KEY ("nationalityId") REFERENCES public."Nationalities"(id);
 N   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_nationalityId_fkey";
       public       angelds    false    210    2943    208            �           2606    100913    People People_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 I   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_statusId_fkey";
       public       angelds    false    2969    210    221            �           2606    100918 %   Permissions Permissions_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 S   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_statusId_fkey";
       public       angelds    false    221    212    2969            �           2606    100923 "   Provinces Provinces_countryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES public."Countries"(id);
 P   ALTER TABLE ONLY public."Provinces" DROP CONSTRAINT "Provinces_countryId_fkey";
       public       angelds    false    2927    200    216            �           2606    100928    Roles Roles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 G   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_statusId_fkey";
       public       angelds    false    221    2969    218            �           2606    100938 #   Warehouses Warehouses_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_statusId_fkey";
       public       angelds    false    223    2969    221            �           2606    100943 (   accountRoles accountRoles_accountId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES public."Accounts"(id);
 V   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_accountId_fkey";
       public       angelds    false    2921    196    225            �           2606    100948 %   accountRoles accountRoles_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id);
 S   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_roleId_fkey";
       public       angelds    false    225    2963    218            �           2606    100953 '   accountRoles accountRoles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 U   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_statusId_fkey";
       public       angelds    false    225    221    2969            �           2606    100958 .   addressAccounts addressAccounts_accountId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES public."Accounts"(id);
 \   ALTER TABLE ONLY public."addressAccounts" DROP CONSTRAINT "addressAccounts_accountId_fkey";
       public       angelds    false    227    2921    196            �           2606    100963 .   addressAccounts addressAccounts_addressId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES public."Addresses"(id);
 \   ALTER TABLE ONLY public."addressAccounts" DROP CONSTRAINT "addressAccounts_addressId_fkey";
       public       angelds    false    2923    227    198            �           2606    100968 2   addressAccounts addressAccounts_addressTypeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_addressTypeId_fkey" FOREIGN KEY ("addressTypeId") REFERENCES public."addressTypes"(id);
 `   ALTER TABLE ONLY public."addressAccounts" DROP CONSTRAINT "addressAccounts_addressTypeId_fkey";
       public       angelds    false    2981    229    227            �           2606    100973 -   addressAccounts addressAccounts_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 [   ALTER TABLE ONLY public."addressAccounts" DROP CONSTRAINT "addressAccounts_statusId_fkey";
       public       angelds    false    2969    221    227            �           2606    100993 :   dashboardPermissions dashboardPermissions_dashboardId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_dashboardId_fkey" FOREIGN KEY ("dashboardId") REFERENCES public."Dashboards"(id);
 h   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_dashboardId_fkey";
       public       angelds    false    2929    202    231            �           2606    100998 ;   dashboardPermissions dashboardPermissions_permissionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permissions"(id);
 i   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_permissionId_fkey";
       public       angelds    false    212    2951    231            �           2606    101003 7   dashboardPermissions dashboardPermissions_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 e   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_statusId_fkey";
       public       angelds    false    231    221    2969            �           2606    101008 0   grantRoles grantRoles_dashboradPermissionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_dashboradPermissionId_fkey" FOREIGN KEY ("dashboardPermissionId") REFERENCES public."dashboardPermissions"(id);
 ^   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_dashboradPermissionId_fkey";
       public       angelds    false    233    2985    231            �           2606    101013 !   grantRoles grantRoles_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id);
 O   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_roleId_fkey";
       public       angelds    false    2963    218    233            �           2606    101018 #   grantRoles grantRoles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_statusId_fkey";
       public       angelds    false    233    2969    221            �           2606    101023 #   subModules subModules_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_statusId_fkey";
       public       angelds    false    221    237    2969            [   �  x�m��n�P���)�`Ng��ܼJ���F���tqn6Q&�!��}��FU�bf�K�>}3�1�'m�m�v���V�]o������t�L��?~��Oה׻.�F;=�d9;$vS���
�˃]�5��D�������ӊw =��2̀9FߏHK�pA����ƫ�^��}	�Eԫ�*v]�O�*��O��M�gqrϋ�HQ|ed��v���~n.˵�������SP��Ɉ3.�9�YT$�(	��,�r��sU��&`���A 7�W��V{�Et\X�B��\HQA\qɹ��r�\U�Y�
oT��5+�|&��{Qb��u>_���]y�����x>������TE��w�w"d*#Ɍ��;��$�
A�;��4��<��&Z	*�s���@Q Z�1��uj�#S�'K���f���k�Z���      ]      x������ � �      �      x������ � �      �   H   x�3�.I��I��4202�50�5�T0��25�22�37�50�-�e�RTZP�J�fcN��Ĕ�D�4��qqq ܗ&u      _      x������ � �      a   �   x���M
�0�uz
/P'Il=� ����'^@&됏G�002Z��B�ndC�s���赔w�k9����G��d����յ��xI���䆏K?z^<���(dP�8ܥQ�X�rQ����d��      c   9   x�3����M*J�4202�50"#C+c#+K=c# ����oiVj��c���� ��      e   h   x�3�K�+I,�4�4202�50�54U02�22�2�г4�50�-�e�霟[PD�~cNϼ2��2��4�1'71���<20�!/-3��(19��fr������ �G�      g   B   x�3��KL���K��4202�50"#C+s+#=3c]<R\F��%E�yY�E�d���� 'x�      i   �  x���=nI���)���f7�/`��/֑�b����	��ٝ�^ �$~����^~�������ן[j�3׾%����)=���8#>ϱ�@��*���if�����~zj+/��,=���Q�pX�>�f*���s�,%	+E���R�����Ўhɥ���F�X�I���s��<S��Qp�ŭ�2�2B�Y�_�.�T�U�P�eQ���U`�@�8AI j�Qm�V`�`	c���$���vXZ��bu��$	���i}�bw��IMOh|���f��9�Ǎ��Hw��V������:J�i�����q/���[�IM�퍶�8�K�B��� ���˫4�Β���-�g�6�qM��w���.����R��Q�x{0����-��;(����Eؘ���~@_. ��<�KR�R`ك��n{�9t#g,�l���%{E�p*���@3���$5�!�
��Y�8{�����9�wQ2��$��am�3Uqp�ݤ���s��X��Y(t�xGIx�qx+m@���fC���9.���$�!�b���$ MK}ޝ���$WC�l�RI �F������x�}\I �n`Yf�㣙�$ /����̊QZ�siN��黌�+@9�bs��$�����3mJ
-�U�9�ژZ�^�M�P�A��f�$�);")I�|�4��4{Un�w�C%x�4�ުv���ΜJ�"ih!i�bp��J�"ih!i��<��a.�� �H��4�e�;��.r������ ��S)�]��Os���Y �m�>��^v���~)�:<+�81S��K�7(��O�H�����}��^�a^WMɑ�;��������ךq��gJP�>�'�(��i�f�̴�,xa*c ���J�n���i��Ǘ��_�$������#='����>���XH���g%��ۏ�.N��WrpGIp_����/��u.      k   b   x�3�tL/JMO,�4�4202�50�54S00�26�2��356�50�#�e�雟����L�Ɯ��yť9%�a��[P���I���.��@P1z\\\ )F�      m      x������ � �      o      x������ � �      q   N   x�3�t��-(JL�/�4�4202�50�50W04�25�24�31��50�#�e�阒���Y\B�9��a�y)������ z?,�      s   �  x����r� ��}3�F���:㠐Hǈ�Է/:�کW��~{8�'yc$w2�S��r���f ���\�k�.{!�\Bki�z��R�+  ��k�a������"��c�̔4����sbQ�A�YF� ER�([�;iS�x���/�7r/�K��p$T$�LN"���:��ס�n,��q6!ޚ�qJ&� �~���V�V���LI �� a��
v�o���.�A�C� Z����>�;�'�۶�܈�@�?X\v@^z{��&%	���������������7����������6U�I�G�^>�����R(�����s�~��;w����4���t'�o�OdvB�8~�t����oH$Ӕ� �*��@ BX�r;�U/�?.Y�� �      t   9   x�3�tL.�,K�4202�50"#C+SC+#=Cs]<R\F��y������ `N      �   f   x�}�1
�0 ��y�hH���ɇ�	"��:�zWu>8v�Uw<��uh���p޲��[�F(8	�b��R�C��ĲhBMs�U��]v��z~)�!*)b      v   �   x��λ�0��ڞ�@,;$@�PP𒐨h�� ��FvB�,��� �	��h��H}����9m��cA	y��	�D�q��c�0	x�ocUK4��D,Z0GSi\[�y.k��i��?-��T���= �f��R�\��zȬQ����8� ��"������pC,Kt~��_���e���������KF)}��^G      x   T   x�}���0�3L�%JKa��C���/y��4I�`h�f80ʲ��X��?ľH;�`�,؂7���G�Q�X{�$>��/O#�      z      x������ � �      |      x������ � �      ~     x���K�!Dѱ{�@G�1�����H2ΠJ��AjK��������j����#n�SW�wPuC���Vt�Qv��n^m~vM�5����j��y��ͻ�����윗��R�:b�n ��gm6_��m]�KG��e�P�q����fC��B.�u
ݰ��M�ݲ��m�<]s�][]K����l	t��tݖB7l+t�@�l+t9OWn[�+��`Wyz����t_����?�����~��߶�#�~��y���u]��4�      �   �   x�����1D�su�@�0ؘ�X&�8o {��	=��K������v[�#���o{^�����=%|)OM�wc�K�?�$�z��m�k�� ��#�[S��o5%�[�A�m���@����)H�r(H���ٟo�w�L�{�zJ|*�ߚ����Ϲ���m�~?��{c�CEx���un'�yn'���N���N�9�/���jH�W.'�����UOI�>��~
q�      �      x������ � �      �   �   x���=�@�z�\ \���ha�	����C����N�ËIie3�K����n��;��h�S]�y���3������T�"e�h'+ 
8��8/�P	�C׈>�����vɈ�a~���^^g�9��@����q��%c5p�����nzF�$��R����w     