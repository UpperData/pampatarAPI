PGDMP                         x            udadminsiiro-dev01-0620    11.7 (Debian 11.7-2.pgdg90+1)    11.7 (Debian 11.7-2.pgdg90+1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    91571    udadminsiiro-dev01-0620    DATABASE     �   CREATE DATABASE "udadminsiiro-dev01-0620" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';
 )   DROP DATABASE "udadminsiiro-dev01-0620";
             postgres    false            �            1259    92010    Accounts    TABLE     c  CREATE TABLE public."Accounts" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    pass character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "peopleId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Accounts";
       public         angelds    false            �            1259    92008    Accounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Accounts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Accounts_id_seq";
       public       angelds    false    212            �           0    0    Accounts_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Accounts_id_seq" OWNED BY public."Accounts".id;
            public       angelds    false    211            �            1259    92102 	   Addresses    TABLE     i  CREATE TABLE public."Addresses" (
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
       public         angelds    false            �            1259    92100    Addresses_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Addresses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Addresses_id_seq";
       public       angelds    false    220            �           0    0    Addresses_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Addresses_id_seq" OWNED BY public."Addresses".id;
            public       angelds    false    219            �            1259    92321    Bids    TABLE     j  CREATE TABLE public."Bids" (
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
    DROP TABLE public."Bids";
       public         angelds    false            �            1259    92319    Bids_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Bids_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Bids_id_seq";
       public       angelds    false    232            �           0    0    Bids_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Bids_id_seq" OWNED BY public."Bids".id;
            public       angelds    false    231            �            1259    91990 	   Countries    TABLE     �   CREATE TABLE public."Countries" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Countries";
       public         angelds    false            �            1259    91988    Countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Countries_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Countries_id_seq";
       public       angelds    false    208            �           0    0    Countries_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Countries_id_seq" OWNED BY public."Countries".id;
            public       angelds    false    207            �            1259    92663 
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
       public         angelds    false            �            1259    92661    Dashboards_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Dashboards_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Dashboards_id_seq";
       public       angelds    false    242            �           0    0    Dashboards_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Dashboards_id_seq" OWNED BY public."Dashboards".id;
            public       angelds    false    241            �            1259    91944    Genders    TABLE     �   CREATE TABLE public."Genders" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Genders";
       public         angelds    false            �            1259    91942    Genders_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Genders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Genders_id_seq";
       public       angelds    false    202            �           0    0    Genders_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Genders_id_seq" OWNED BY public."Genders".id;
            public       angelds    false    201            �            1259    92373    Modules    TABLE     �   CREATE TABLE public."Modules" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Modules";
       public         angelds    false            �            1259    92371    Modules_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Modules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Modules_id_seq";
       public       angelds    false    236            �           0    0    Modules_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Modules_id_seq" OWNED BY public."Modules".id;
            public       angelds    false    235            �            1259    91924    Nationalities    TABLE     �   CREATE TABLE public."Nationalities" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public."Nationalities";
       public         angelds    false            �            1259    91922    Nationalities_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Nationalities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Nationalities_id_seq";
       public       angelds    false    198            �           0    0    Nationalities_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Nationalities_id_seq" OWNED BY public."Nationalities".id;
            public       angelds    false    197            �            1259    91954    People    TABLE     �  CREATE TABLE public."People" (
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
    DROP TABLE public."People";
       public         angelds    false            �            1259    91952    People_id_seq    SEQUENCE     �   CREATE SEQUENCE public."People_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."People_id_seq";
       public       angelds    false    204            �           0    0    People_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."People_id_seq" OWNED BY public."People".id;
            public       angelds    false    203            �            1259    92453    Permissions    TABLE     �   CREATE TABLE public."Permissions" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public."Permissions";
       public         angelds    false            �            1259    92451    Permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Permissions_id_seq";
       public       angelds    false    240            �           0    0    Permissions_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Permissions_id_seq" OWNED BY public."Permissions".id;
            public       angelds    false    239            �            1259    92156    Products    TABLE     �   CREATE TABLE public."Products" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Products";
       public         angelds    false            �            1259    92154    Products_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Products_id_seq";
       public       angelds    false    224            �           0    0    Products_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;
            public       angelds    false    223            �            1259    92176 
   Properties    TABLE     �   CREATE TABLE public."Properties" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Properties";
       public         angelds    false            �            1259    92174    Properties_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Properties_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Properties_id_seq";
       public       angelds    false    228            �           0    0    Properties_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Properties_id_seq" OWNED BY public."Properties".id;
            public       angelds    false    227            �            1259    92064 	   Provinces    TABLE     �   CREATE TABLE public."Provinces" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "countryId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Provinces";
       public         angelds    false            �            1259    92062    Provinces_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Provinces_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Provinces_id_seq";
       public       angelds    false    216            �           0    0    Provinces_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Provinces_id_seq" OWNED BY public."Provinces".id;
            public       angelds    false    215            �            1259    92049    Roles    TABLE     �   CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Roles";
       public         angelds    false            �            1259    92047    Roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Roles_id_seq";
       public       angelds    false    214            �           0    0    Roles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;
            public       angelds    false    213            �            1259    91572    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         angelds    false            �            1259    91934    Status    TABLE     �   CREATE TABLE public."Status" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Status";
       public         angelds    false            �            1259    91932    Status_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Status_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Status_id_seq";
       public       angelds    false    200            �           0    0    Status_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Status_id_seq" OWNED BY public."Status".id;
            public       angelds    false    199            �            1259    92166    Tags    TABLE     �   CREATE TABLE public."Tags" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Tags";
       public         angelds    false            �            1259    92164    Tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Tags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Tags_id_seq";
       public       angelds    false    226            �           0    0    Tags_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Tags_id_seq" OWNED BY public."Tags".id;
            public       angelds    false    225            �            1259    92301 
   Warehouses    TABLE       CREATE TABLE public."Warehouses" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "addressId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Warehouses";
       public         angelds    false            �            1259    92299    Warehouses_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Warehouses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Warehouses_id_seq";
       public       angelds    false    230            �           0    0    Warehouses_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Warehouses_id_seq" OWNED BY public."Warehouses".id;
            public       angelds    false    229            �            1259    92079    accountRoles    TABLE       CREATE TABLE public."accountRoles" (
    id integer NOT NULL,
    "accountId" integer NOT NULL,
    "roleId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."accountRoles";
       public         angelds    false            �            1259    92077    accountRoles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."accountRoles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."accountRoles_id_seq";
       public       angelds    false    218            �           0    0    accountRoles_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."accountRoles_id_seq" OWNED BY public."accountRoles".id;
            public       angelds    false    217            �            1259    92128    addressAccounts    TABLE     4  CREATE TABLE public."addressAccounts" (
    id integer NOT NULL,
    "addressId" integer NOT NULL,
    "accountId" integer NOT NULL,
    "addressTypeId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 %   DROP TABLE public."addressAccounts";
       public         angelds    false            �            1259    92126    addressAccounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public."addressAccounts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."addressAccounts_id_seq";
       public       angelds    false    222            �           0    0    addressAccounts_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."addressAccounts_id_seq" OWNED BY public."addressAccounts".id;
            public       angelds    false    221            �            1259    91982    addressTypes    TABLE     �   CREATE TABLE public."addressTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."addressTypes";
       public         angelds    false            �            1259    91980    addressTypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."addressTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."addressTypes_id_seq";
       public       angelds    false    206            �           0    0    addressTypes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."addressTypes_id_seq" OWNED BY public."addressTypes".id;
            public       angelds    false    205            �            1259    92350    bidProperties    TABLE     	  CREATE TABLE public."bidProperties" (
    id integer NOT NULL,
    "bidId" integer NOT NULL,
    "propertyId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public."bidProperties";
       public         angelds    false            �            1259    92348    bidProperties_id_seq    SEQUENCE     �   CREATE SEQUENCE public."bidProperties_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."bidProperties_id_seq";
       public       angelds    false    234            �           0    0    bidProperties_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."bidProperties_id_seq" OWNED BY public."bidProperties".id;
            public       angelds    false    233            �            1259    92683    dashboardPermissions    TABLE     "  CREATE TABLE public."dashboardPermissions" (
    id integer NOT NULL,
    "dashboardId" integer NOT NULL,
    "permissionId" integer NOT NULL,
    "statusId" integer DEFAULT 2 NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 *   DROP TABLE public."dashboardPermissions";
       public         angelds    false            �            1259    92681    dashboardPermissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."dashboardPermissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."dashboardPermissions_id_seq";
       public       angelds    false    244            �           0    0    dashboardPermissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."dashboardPermissions_id_seq" OWNED BY public."dashboardPermissions".id;
            public       angelds    false    243            �            1259    92708 
   grantRoles    TABLE       CREATE TABLE public."grantRoles" (
    id integer NOT NULL,
    "dashboardPermissionId" integer NOT NULL,
    "roleId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."grantRoles";
       public         angelds    false            �            1259    92706    grantRoles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."grantRoles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."grantRoles_id_seq";
       public       angelds    false    246            �           0    0    grantRoles_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."grantRoles_id_seq" OWNED BY public."grantRoles".id;
            public       angelds    false    245            �            1259    92000    postalCodes    TABLE     �   CREATE TABLE public."postalCodes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public."postalCodes";
       public         angelds    false            �            1259    91998    postalCodes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."postalCodes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."postalCodes_id_seq";
       public       angelds    false    210            �           0    0    postalCodes_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."postalCodes_id_seq" OWNED BY public."postalCodes".id;
            public       angelds    false    209            �            1259    92433 
   subModules    TABLE       CREATE TABLE public."subModules" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    route character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."subModules";
       public         angelds    false            �            1259    92431    subModules_id_seq    SEQUENCE     �   CREATE SEQUENCE public."subModules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."subModules_id_seq";
       public       angelds    false    238            �           0    0    subModules_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."subModules_id_seq" OWNED BY public."subModules".id;
            public       angelds    false    237            T           2604    92013    Accounts id    DEFAULT     n   ALTER TABLE ONLY public."Accounts" ALTER COLUMN id SET DEFAULT nextval('public."Accounts_id_seq"'::regclass);
 <   ALTER TABLE public."Accounts" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    212    211    212            X           2604    92105    Addresses id    DEFAULT     p   ALTER TABLE ONLY public."Addresses" ALTER COLUMN id SET DEFAULT nextval('public."Addresses_id_seq"'::regclass);
 =   ALTER TABLE public."Addresses" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    219    220    220            ^           2604    92324    Bids id    DEFAULT     f   ALTER TABLE ONLY public."Bids" ALTER COLUMN id SET DEFAULT nextval('public."Bids_id_seq"'::regclass);
 8   ALTER TABLE public."Bids" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    231    232    232            R           2604    91993    Countries id    DEFAULT     p   ALTER TABLE ONLY public."Countries" ALTER COLUMN id SET DEFAULT nextval('public."Countries_id_seq"'::regclass);
 =   ALTER TABLE public."Countries" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    207    208    208            c           2604    92666    Dashboards id    DEFAULT     r   ALTER TABLE ONLY public."Dashboards" ALTER COLUMN id SET DEFAULT nextval('public."Dashboards_id_seq"'::regclass);
 >   ALTER TABLE public."Dashboards" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    241    242    242            O           2604    91947 
   Genders id    DEFAULT     l   ALTER TABLE ONLY public."Genders" ALTER COLUMN id SET DEFAULT nextval('public."Genders_id_seq"'::regclass);
 ;   ALTER TABLE public."Genders" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    202    201    202            `           2604    92376 
   Modules id    DEFAULT     l   ALTER TABLE ONLY public."Modules" ALTER COLUMN id SET DEFAULT nextval('public."Modules_id_seq"'::regclass);
 ;   ALTER TABLE public."Modules" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    235    236    236            M           2604    91927    Nationalities id    DEFAULT     x   ALTER TABLE ONLY public."Nationalities" ALTER COLUMN id SET DEFAULT nextval('public."Nationalities_id_seq"'::regclass);
 A   ALTER TABLE public."Nationalities" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    198    197    198            P           2604    91957 	   People id    DEFAULT     j   ALTER TABLE ONLY public."People" ALTER COLUMN id SET DEFAULT nextval('public."People_id_seq"'::regclass);
 :   ALTER TABLE public."People" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    204    203    204            b           2604    92456    Permissions id    DEFAULT     t   ALTER TABLE ONLY public."Permissions" ALTER COLUMN id SET DEFAULT nextval('public."Permissions_id_seq"'::regclass);
 ?   ALTER TABLE public."Permissions" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    239    240    240            Z           2604    92159    Products id    DEFAULT     n   ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);
 <   ALTER TABLE public."Products" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    223    224    224            \           2604    92179    Properties id    DEFAULT     r   ALTER TABLE ONLY public."Properties" ALTER COLUMN id SET DEFAULT nextval('public."Properties_id_seq"'::regclass);
 >   ALTER TABLE public."Properties" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    227    228    228            V           2604    92067    Provinces id    DEFAULT     p   ALTER TABLE ONLY public."Provinces" ALTER COLUMN id SET DEFAULT nextval('public."Provinces_id_seq"'::regclass);
 =   ALTER TABLE public."Provinces" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    216    215    216            U           2604    92052    Roles id    DEFAULT     h   ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);
 9   ALTER TABLE public."Roles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    214    213    214            N           2604    91937 	   Status id    DEFAULT     j   ALTER TABLE ONLY public."Status" ALTER COLUMN id SET DEFAULT nextval('public."Status_id_seq"'::regclass);
 :   ALTER TABLE public."Status" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    200    199    200            [           2604    92169    Tags id    DEFAULT     f   ALTER TABLE ONLY public."Tags" ALTER COLUMN id SET DEFAULT nextval('public."Tags_id_seq"'::regclass);
 8   ALTER TABLE public."Tags" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    226    225    226            ]           2604    92304    Warehouses id    DEFAULT     r   ALTER TABLE ONLY public."Warehouses" ALTER COLUMN id SET DEFAULT nextval('public."Warehouses_id_seq"'::regclass);
 >   ALTER TABLE public."Warehouses" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    230    229    230            W           2604    92082    accountRoles id    DEFAULT     v   ALTER TABLE ONLY public."accountRoles" ALTER COLUMN id SET DEFAULT nextval('public."accountRoles_id_seq"'::regclass);
 @   ALTER TABLE public."accountRoles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    218    217    218            Y           2604    92131    addressAccounts id    DEFAULT     |   ALTER TABLE ONLY public."addressAccounts" ALTER COLUMN id SET DEFAULT nextval('public."addressAccounts_id_seq"'::regclass);
 C   ALTER TABLE public."addressAccounts" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    221    222    222            Q           2604    91985    addressTypes id    DEFAULT     v   ALTER TABLE ONLY public."addressTypes" ALTER COLUMN id SET DEFAULT nextval('public."addressTypes_id_seq"'::regclass);
 @   ALTER TABLE public."addressTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    206    205    206            _           2604    92353    bidProperties id    DEFAULT     x   ALTER TABLE ONLY public."bidProperties" ALTER COLUMN id SET DEFAULT nextval('public."bidProperties_id_seq"'::regclass);
 A   ALTER TABLE public."bidProperties" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    233    234    234            e           2604    92686    dashboardPermissions id    DEFAULT     �   ALTER TABLE ONLY public."dashboardPermissions" ALTER COLUMN id SET DEFAULT nextval('public."dashboardPermissions_id_seq"'::regclass);
 H   ALTER TABLE public."dashboardPermissions" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    243    244    244            g           2604    92711    grantRoles id    DEFAULT     r   ALTER TABLE ONLY public."grantRoles" ALTER COLUMN id SET DEFAULT nextval('public."grantRoles_id_seq"'::regclass);
 >   ALTER TABLE public."grantRoles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    246    245    246            S           2604    92003    postalCodes id    DEFAULT     t   ALTER TABLE ONLY public."postalCodes" ALTER COLUMN id SET DEFAULT nextval('public."postalCodes_id_seq"'::regclass);
 ?   ALTER TABLE public."postalCodes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    210    209    210            a           2604    92436    subModules id    DEFAULT     r   ALTER TABLE ONLY public."subModules" ALTER COLUMN id SET DEFAULT nextval('public."subModules_id_seq"'::regclass);
 >   ALTER TABLE public."subModules" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    237    238    238            u          0    92010    Accounts 
   TABLE DATA               m   COPY public."Accounts" (id, name, pass, email, "peopleId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    212   M)      }          0    92102 	   Addresses 
   TABLE DATA               �   COPY public."Addresses" (id, "provinceId", "postalCodeId", street, description, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    220   �0      �          0    92321    Bids 
   TABLE DATA               �   COPY public."Bids" (id, "productId", "accountRoleId", quatity, "warehouseId", plus, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    232   �0      q          0    91990 	   Countries 
   TABLE DATA               I   COPY public."Countries" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    208   �0      �          0    92663 
   Dashboards 
   TABLE DATA               {   COPY public."Dashboards" (id, "moduleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "statusId") FROM stdin;
    public       angelds    false    242   �0      k          0    91944    Genders 
   TABLE DATA               G   COPY public."Genders" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    202   q1      �          0    92373    Modules 
   TABLE DATA               S   COPY public."Modules" (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    236   �1      g          0    91924    Nationalities 
   TABLE DATA               M   COPY public."Nationalities" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    198   22      m          0    91954    People 
   TABLE DATA               �   COPY public."People" (id, "firstName", "lastName", "documentId", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    204   �2      �          0    92453    Permissions 
   TABLE DATA               W   COPY public."Permissions" (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    240   �5      �          0    92156    Products 
   TABLE DATA               H   COPY public."Products" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    224   ^6      �          0    92176 
   Properties 
   TABLE DATA               J   COPY public."Properties" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    228   �6      y          0    92064 	   Provinces 
   TABLE DATA               V   COPY public."Provinces" (id, name, "countryId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    216   �6      w          0    92049    Roles 
   TABLE DATA               Q   COPY public."Roles" (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    214   �6      e          0    91572    SequelizeMeta 
   TABLE DATA               /   COPY public."SequelizeMeta" (name) FROM stdin;
    public       angelds    false    196   A7      i          0    91934    Status 
   TABLE DATA               F   COPY public."Status" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    200   �8      �          0    92166    Tags 
   TABLE DATA               D   COPY public."Tags" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    226   9      �          0    92301 
   Warehouses 
   TABLE DATA               c   COPY public."Warehouses" (id, name, "addressId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    230   39      {          0    92079    accountRoles 
   TABLE DATA               i   COPY public."accountRoles" (id, "accountId", "roleId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    218   P9                0    92128    addressAccounts 
   TABLE DATA               �   COPY public."addressAccounts" (id, "addressId", "accountId", "addressTypeId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    222   5:      o          0    91982    addressTypes 
   TABLE DATA               L   COPY public."addressTypes" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    206   R:      �          0    92350    bidProperties 
   TABLE DATA               j   COPY public."bidProperties" (id, "bidId", "propertyId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    234   o:      �          0    92683    dashboardPermissions 
   TABLE DATA               y   COPY public."dashboardPermissions" (id, "dashboardId", "permissionId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    244   �:      �          0    92708 
   grantRoles 
   TABLE DATA               s   COPY public."grantRoles" (id, "dashboardPermissionId", "roleId", "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    246   �;      s          0    92000    postalCodes 
   TABLE DATA               K   COPY public."postalCodes" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    210   �<      �          0    92433 
   subModules 
   TABLE DATA               ]   COPY public."subModules" (id, name, route, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    238   �<      �           0    0    Accounts_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Accounts_id_seq"', 29, true);
            public       angelds    false    211            �           0    0    Addresses_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Addresses_id_seq"', 1, false);
            public       angelds    false    219            �           0    0    Bids_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Bids_id_seq"', 3, true);
            public       angelds    false    231            �           0    0    Countries_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Countries_id_seq"', 1, false);
            public       angelds    false    207            �           0    0    Dashboards_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Dashboards_id_seq"', 11, true);
            public       angelds    false    241            �           0    0    Genders_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Genders_id_seq"', 3, true);
            public       angelds    false    201            �           0    0    Modules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Modules_id_seq"', 1, false);
            public       angelds    false    235            �           0    0    Nationalities_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Nationalities_id_seq"', 1, false);
            public       angelds    false    197            �           0    0    People_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."People_id_seq"', 60, true);
            public       angelds    false    203            �           0    0    Permissions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Permissions_id_seq"', 1, false);
            public       angelds    false    239            �           0    0    Products_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Products_id_seq"', 10, true);
            public       angelds    false    223            �           0    0    Properties_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Properties_id_seq"', 1, false);
            public       angelds    false    227            �           0    0    Provinces_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Provinces_id_seq"', 1, false);
            public       angelds    false    215            �           0    0    Roles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Roles_id_seq"', 7, true);
            public       angelds    false    213            �           0    0    Status_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Status_id_seq"', 1, false);
            public       angelds    false    199            �           0    0    Tags_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Tags_id_seq"', 1, false);
            public       angelds    false    225            �           0    0    Warehouses_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Warehouses_id_seq"', 1, false);
            public       angelds    false    229            �           0    0    accountRoles_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."accountRoles_id_seq"', 17, true);
            public       angelds    false    217            �           0    0    addressAccounts_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."addressAccounts_id_seq"', 1, false);
            public       angelds    false    221            �           0    0    addressTypes_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."addressTypes_id_seq"', 1, false);
            public       angelds    false    205            �           0    0    bidProperties_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."bidProperties_id_seq"', 1, false);
            public       angelds    false    233            �           0    0    dashboardPermissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."dashboardPermissions_id_seq"', 1, false);
            public       angelds    false    243            �           0    0    grantRoles_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."grantRoles_id_seq"', 84, true);
            public       angelds    false    245            �           0    0    postalCodes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."postalCodes_id_seq"', 1, false);
            public       angelds    false    209            �           0    0    subModules_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."subModules_id_seq"', 1, false);
            public       angelds    false    237            �           2606    92022    Accounts Accounts_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_email_key" UNIQUE (email);
 I   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_email_key";
       public         angelds    false    212            �           2606    92020    Accounts Accounts_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_name_key" UNIQUE (name);
 H   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_name_key";
       public         angelds    false    212            �           2606    92018    Accounts Accounts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_pkey";
       public         angelds    false    212            �           2606    92110    Addresses Addresses_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_pkey";
       public         angelds    false    220            �           2606    92326    Bids Bids_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_pkey";
       public         angelds    false    232            }           2606    91997    Countries Countries_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "Countries_name_key" UNIQUE (name);
 J   ALTER TABLE ONLY public."Countries" DROP CONSTRAINT "Countries_name_key";
       public         angelds    false    208                       2606    91995    Countries Countries_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "Countries_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Countries" DROP CONSTRAINT "Countries_pkey";
       public         angelds    false    208            �           2606    92668    Dashboards Dashboards_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_pkey";
       public         angelds    false    242            �           2606    92670 .   Dashboards Dashboards_subModuleId_moduleId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_moduleId_key" UNIQUE ("subModuleId", "moduleId");
 \   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_subModuleId_moduleId_key";
       public         angelds    false    242    242            s           2606    91951    Genders Genders_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_name_key" UNIQUE (name);
 F   ALTER TABLE ONLY public."Genders" DROP CONSTRAINT "Genders_name_key";
       public         angelds    false    202            u           2606    91949    Genders Genders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Genders" DROP CONSTRAINT "Genders_pkey";
       public         angelds    false    202            �           2606    92380    Modules Modules_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_name_key" UNIQUE (name);
 F   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_name_key";
       public         angelds    false    236            �           2606    92378    Modules Modules_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_pkey";
       public         angelds    false    236            k           2606    91931 $   Nationalities Nationalities_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_name_key" UNIQUE (name);
 R   ALTER TABLE ONLY public."Nationalities" DROP CONSTRAINT "Nationalities_name_key";
       public         angelds    false    198            m           2606    91929     Nationalities Nationalities_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Nationalities" DROP CONSTRAINT "Nationalities_pkey";
       public         angelds    false    198            w           2606    91964    People People_documentId_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_documentId_key" UNIQUE ("documentId");
 J   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_documentId_key";
       public         angelds    false    204            y           2606    91962    People People_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_pkey";
       public         angelds    false    204            �           2606    92460     Permissions Permissions_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_name_key" UNIQUE (name);
 N   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_name_key";
       public         angelds    false    240            �           2606    92458    Permissions Permissions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_pkey";
       public         angelds    false    240            �           2606    92163    Products Products_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_name_key" UNIQUE (name);
 H   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_name_key";
       public         angelds    false    224            �           2606    92161    Products Products_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_pkey";
       public         angelds    false    224            �           2606    92183    Properties Properties_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."Properties" DROP CONSTRAINT "Properties_name_key";
       public         angelds    false    228            �           2606    92181    Properties Properties_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Properties" DROP CONSTRAINT "Properties_pkey";
       public         angelds    false    228            �           2606    92071    Provinces Provinces_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_name_key" UNIQUE (name);
 J   ALTER TABLE ONLY public."Provinces" DROP CONSTRAINT "Provinces_name_key";
       public         angelds    false    216            �           2606    92069    Provinces Provinces_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Provinces" DROP CONSTRAINT "Provinces_pkey";
       public         angelds    false    216            �           2606    92056    Roles Roles_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key" UNIQUE (name);
 B   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key";
       public         angelds    false    214            �           2606    92054    Roles Roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_pkey";
       public         angelds    false    214            i           2606    91576     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public         angelds    false    196            o           2606    91941    Status Status_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_name_key" UNIQUE (name);
 D   ALTER TABLE ONLY public."Status" DROP CONSTRAINT "Status_name_key";
       public         angelds    false    200            q           2606    91939    Status Status_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Status" DROP CONSTRAINT "Status_pkey";
       public         angelds    false    200            �           2606    92173    Tags Tags_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_name_key" UNIQUE (name);
 @   ALTER TABLE ONLY public."Tags" DROP CONSTRAINT "Tags_name_key";
       public         angelds    false    226            �           2606    92171    Tags Tags_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Tags" DROP CONSTRAINT "Tags_pkey";
       public         angelds    false    226            �           2606    92308    Warehouses Warehouses_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_name_key";
       public         angelds    false    230            �           2606    92306    Warehouses Warehouses_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_pkey";
       public         angelds    false    230            �           2606    92084    accountRoles accountRoles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_pkey";
       public         angelds    false    218            �           2606    92133 $   addressAccounts addressAccounts_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."addressAccounts" DROP CONSTRAINT "addressAccounts_pkey";
       public         angelds    false    222            {           2606    91987    addressTypes addressTypes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."addressTypes"
    ADD CONSTRAINT "addressTypes_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."addressTypes" DROP CONSTRAINT "addressTypes_pkey";
       public         angelds    false    206            �           2606    92355     bidProperties bidProperties_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."bidProperties"
    ADD CONSTRAINT "bidProperties_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."bidProperties" DROP CONSTRAINT "bidProperties_pkey";
       public         angelds    false    234            �           2606    92690 F   dashboardPermissions dashboardPermissions_permissionId_dashboardId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_dashboardId_key" UNIQUE ("permissionId", "dashboardId");
 t   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_permissionId_dashboardId_key";
       public         angelds    false    244    244            �           2606    92688 .   dashboardPermissions dashboardPermissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_pkey";
       public         angelds    false    244            �           2606    92713    grantRoles grantRoles_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_pkey";
       public         angelds    false    246            �           2606    92715 6   grantRoles grantRoles_roleId_dashboradPermissionId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_dashboradPermissionId_key" UNIQUE ("roleId", "dashboardPermissionId");
 d   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_roleId_dashboradPermissionId_key";
       public         angelds    false    246    246            �           2606    92007     postalCodes postalCodes_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_name_key" UNIQUE (name);
 N   ALTER TABLE ONLY public."postalCodes" DROP CONSTRAINT "postalCodes_name_key";
       public         angelds    false    210            �           2606    92005    postalCodes postalCodes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."postalCodes" DROP CONSTRAINT "postalCodes_pkey";
       public         angelds    false    210            �           2606    92443    subModules subModules_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_name_key";
       public         angelds    false    238            �           2606    92441    subModules subModules_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_pkey";
       public         angelds    false    238            �           1259    92731     account_roles_account_id_role_id    INDEX     l   CREATE INDEX account_roles_account_id_role_id ON public."accountRoles" USING btree ("accountId", "roleId");
 4   DROP INDEX public.account_roles_account_id_role_id;
       public         angelds    false    218    218            �           1259    92732 &   address_accounts_address_id_account_id    INDEX     x   CREATE INDEX address_accounts_address_id_account_id ON public."addressAccounts" USING btree ("addressId", "accountId");
 :   DROP INDEX public.address_accounts_address_id_account_id;
       public         angelds    false    222    222            �           2606    92023    Accounts Accounts_personId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_personId_fkey" FOREIGN KEY ("peopleId") REFERENCES public."People"(id);
 M   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_personId_fkey";
       public       angelds    false    204    2937    212            �           2606    92028    Accounts Accounts_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 M   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_statusId_fkey";
       public       angelds    false    200    2929    212            �           2606    92116 %   Addresses Addresses_postalCodeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_postalCodeId_fkey" FOREIGN KEY ("postalCodeId") REFERENCES public."postalCodes"(id);
 S   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_postalCodeId_fkey";
       public       angelds    false    2947    220    210            �           2606    92111 #   Addresses Addresses_provinceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES public."Provinces"(id);
 Q   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_provinceId_fkey";
       public       angelds    false    2961    220    216            �           2606    92121 !   Addresses Addresses_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 O   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_statusId_fkey";
       public       angelds    false    200    220    2929            �           2606    92332    Bids Bids_accountRoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_accountRoleId_fkey" FOREIGN KEY ("accountRoleId") REFERENCES public."accountRoles"(id);
 J   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_accountRoleId_fkey";
       public       angelds    false    232    218    2963            �           2606    92327    Bids Bids_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Products"(id);
 F   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_productId_fkey";
       public       angelds    false    2973    232    224            �           2606    92342    Bids Bids_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 E   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_statusId_fkey";
       public       angelds    false    200    2929    232            �           2606    92337    Bids Bids_warehouseId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_warehouseId_fkey" FOREIGN KEY ("warehouseId") REFERENCES public."Warehouses"(id);
 H   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_warehouseId_fkey";
       public       angelds    false    230    2985    232            �           2606    92671 #   Dashboards Dashboards_moduleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_moduleId_fkey" FOREIGN KEY ("moduleId") REFERENCES public."Modules"(id);
 Q   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_moduleId_fkey";
       public       angelds    false    242    236    2993            �           2606    100566 #   Dashboards Dashboards_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_statusId_fkey";
       public       angelds    false    242    200    2929            �           2606    92676 &   Dashboards Dashboards_subModuleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_fkey" FOREIGN KEY ("subModuleId") REFERENCES public."subModules"(id);
 T   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_subModuleId_fkey";
       public       angelds    false    242    238    2997            �           2606    92381    Modules Modules_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 K   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_statusId_fkey";
       public       angelds    false    236    2929    200            �           2606    91965    People People_genderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_genderId_fkey" FOREIGN KEY ("genderId") REFERENCES public."Genders"(id);
 I   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_genderId_fkey";
       public       angelds    false    204    202    2933            �           2606    91970     People People_nationalityId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_nationalityId_fkey" FOREIGN KEY ("nationalityId") REFERENCES public."Nationalities"(id);
 N   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_nationalityId_fkey";
       public       angelds    false    198    204    2925            �           2606    91975    People People_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 I   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_statusId_fkey";
       public       angelds    false    200    2929    204            �           2606    92461 %   Permissions Permissions_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 S   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_statusId_fkey";
       public       angelds    false    2929    240    200            �           2606    92072 "   Provinces Provinces_countryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES public."Countries"(id);
 P   ALTER TABLE ONLY public."Provinces" DROP CONSTRAINT "Provinces_countryId_fkey";
       public       angelds    false    208    216    2943            �           2606    92057    Roles Roles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 G   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_statusId_fkey";
       public       angelds    false    214    200    2929            �           2606    92309 $   Warehouses Warehouses_addressId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES public."Addresses"(id);
 R   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_addressId_fkey";
       public       angelds    false    230    2966    220            �           2606    92314 #   Warehouses Warehouses_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_statusId_fkey";
       public       angelds    false    200    230    2929            �           2606    92085 (   accountRoles accountRoles_accountId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES public."Accounts"(id);
 V   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_accountId_fkey";
       public       angelds    false    212    218    2953            �           2606    92090 %   accountRoles accountRoles_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id);
 S   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_roleId_fkey";
       public       angelds    false    218    214    2957            �           2606    92095 '   accountRoles accountRoles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 U   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_statusId_fkey";
       public       angelds    false    218    2929    200            �           2606    92139 .   addressAccounts addressAccounts_accountId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES public."Accounts"(id);
 \   ALTER TABLE ONLY public."addressAccounts" DROP CONSTRAINT "addressAccounts_accountId_fkey";
       public       angelds    false    212    222    2953            �           2606    92134 .   addressAccounts addressAccounts_addressId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES public."Addresses"(id);
 \   ALTER TABLE ONLY public."addressAccounts" DROP CONSTRAINT "addressAccounts_addressId_fkey";
       public       angelds    false    220    222    2966            �           2606    92144 2   addressAccounts addressAccounts_addressTypeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_addressTypeId_fkey" FOREIGN KEY ("addressTypeId") REFERENCES public."addressTypes"(id);
 `   ALTER TABLE ONLY public."addressAccounts" DROP CONSTRAINT "addressAccounts_addressTypeId_fkey";
       public       angelds    false    206    2939    222            �           2606    92149 -   addressAccounts addressAccounts_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."addressAccounts"
    ADD CONSTRAINT "addressAccounts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 [   ALTER TABLE ONLY public."addressAccounts" DROP CONSTRAINT "addressAccounts_statusId_fkey";
       public       angelds    false    222    2929    200            �           2606    92356 &   bidProperties bidProperties_bidId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."bidProperties"
    ADD CONSTRAINT "bidProperties_bidId_fkey" FOREIGN KEY ("bidId") REFERENCES public."Bids"(id);
 T   ALTER TABLE ONLY public."bidProperties" DROP CONSTRAINT "bidProperties_bidId_fkey";
       public       angelds    false    234    232    2987            �           2606    92361 +   bidProperties bidProperties_propertyId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."bidProperties"
    ADD CONSTRAINT "bidProperties_propertyId_fkey" FOREIGN KEY ("propertyId") REFERENCES public."Properties"(id);
 Y   ALTER TABLE ONLY public."bidProperties" DROP CONSTRAINT "bidProperties_propertyId_fkey";
       public       angelds    false    228    234    2981            �           2606    92366 )   bidProperties bidProperties_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."bidProperties"
    ADD CONSTRAINT "bidProperties_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 W   ALTER TABLE ONLY public."bidProperties" DROP CONSTRAINT "bidProperties_statusId_fkey";
       public       angelds    false    200    234    2929            �           2606    92691 :   dashboardPermissions dashboardPermissions_dashboardId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_dashboardId_fkey" FOREIGN KEY ("dashboardId") REFERENCES public."Dashboards"(id);
 h   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_dashboardId_fkey";
       public       angelds    false    242    3003    244            �           2606    92696 ;   dashboardPermissions dashboardPermissions_permissionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permissions"(id);
 i   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_permissionId_fkey";
       public       angelds    false    3001    240    244            �           2606    92701 7   dashboardPermissions dashboardPermissions_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 e   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_statusId_fkey";
       public       angelds    false    200    2929    244            �           2606    92716 0   grantRoles grantRoles_dashboradPermissionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_dashboradPermissionId_fkey" FOREIGN KEY ("dashboardPermissionId") REFERENCES public."dashboardPermissions"(id);
 ^   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_dashboradPermissionId_fkey";
       public       angelds    false    246    3009    244            �           2606    92721 !   grantRoles grantRoles_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id);
 O   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_roleId_fkey";
       public       angelds    false    246    2957    214            �           2606    92726 #   grantRoles grantRoles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_statusId_fkey";
       public       angelds    false    200    246    2929            �           2606    92446 #   subModules subModules_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_statusId_fkey";
       public       angelds    false    238    200    2929            u   %  x�}�KϪLFǇ_qg�UT��*��hz"��""*��y?Z��N��y�R��^��U��&����@�Z�FF�f�� t��km�2��Z?��S��Y�wW���y,���8L�?n�^b���;�����_���/�����o�7x������o�"�������\I{%�8%\_b���Sq$ei�������%>�ʤ�ٓ`��>���Nx�C� �A$@�D�1�N��t���������r��S����==E�u�n6��ʭ-�Y���$i�>_ڟ�PE'�ӉN?�=D�p���t�)�R%^�G��PU�B�̹����ڤÎ[�����0�m���3�Ͻ�������!b�;���~1�j���\̓x#�;��9�c�Ų����&!���분�t���/t|��H<�^�#���ȝn]��LPx�.�-x�`t4��^�S."[qt�N��̿���Tt�����_�>���#rw<�7MW��ӝE�<nb�*�AUy�A��]�L!�3'v	7v�4��'Tx�Oh Z�?D��1���;����I��ͺT0Nä��'N��V_)iy���qR��;Ku '��3�X�v���ar ��1b`=T�;�m��|�'��R8��i02�>U\u]bn��q��y4I�U�l��5��'Ux�m[6�P�'����>G��x����:�۾#.�(�+�07�xk`O�]����<��Q�Ɠ�!Zζ _�
���;���<����9b`=��*��92sH�w��/�ӥ\d��ob|2L��h�Z� ���~�+�������t ���C�@R���F�x�]�����PR��N@'i �Q21��v�����֤#܌/��5��lPj����>F�3����m�V<�N��$vƱ���q�.Nc��F��Z�s]9����#b��R��Fo��l ��c��z6�Z.�K�}0�o����O4b�c�I���I���2~/��U��m![E��W��� �58�m�<G�j��)�??�Ӟ����%�溫�'�����g���$�w����˄��>��.)��>��c������Mph�����b{����?Z��`��X�@⟏t�^�:����|��_G�����q@Do��sĠ� �V�>�M7�Zh��A��9��͛�r͎�Z���������v�D_ +���!]R��Ɨ��pŏ�j��Z"�]L@�ڙL@oe����͌=e�~?"����g���M����	�N��� D� � #�]Mk�XvӐ���z;�GN�.��|pi0�Z�pR���Y�~�f����F�_gXy�z�g9�qϽ��A�G`-��j7�0[.���ѫ��{���i��/��m�NG���nK�V��X����6 )}�v�����ϵI�F���N@֬��BDc/qMzN���Z�K�Z�pޡY �b�����Qe�j�(��o'�1�6	�M"NZ����fN����z��?�.��t�H�"�f���,��2	y5	��� ѷU�9bPmT�$����r�8Y��D4�f?���L?��<��wӎ���2a���`e�jZ.��@
�j���$�L�^�8'�`����<<���$=+��I�O-;������5�����2	y5	m`����.�1�6	�MRpat��)k��$�q�i�q��7��q�캚ܺv�����Zp_ViT����q���0z5�KĠ�$��&�F�lg�����.�j�Kvi�G������y �(N$~q1_5���$���q?Ә# JO����0��p�      }      x������ � �      �      x������ � �      q      x������ � �      �   �   x���M
�0�uz
/P'Il=� ����'^@&됏G�002Z��B�ndC�s���赔w�k9����G��d����յ��xI���䆏K?z^<���(dP�8ܥQ�X�rQ����d��      k   9   x�3����M*J�4202�50"#C+c#+K=c# ����oiVj��c���� ��      �   h   x�3�K�+I,�4�4202�50�54U02�22�2�г4�50�-�e�霟[PD�~cNϼ2��2��4�1'71���<20�!/-3��(19��fr������ �G�      g   B   x�3��KL���K��4202�50"#C+s+#=3c]<R\F��%E�yY�E�d���� 'x�      m   X  x���M�1�׭S������.�cd3�!��#U3e�eҋ��u�zO��Ƿ��~�y|����
I��d�Z����b}b��>o�U������'�.������k	�D[ �\�� �$hP��s��%HqE�8<�Wz��-P'	RZ����Ze�:K�б�qWZPz�!�k�Q��K��L�(�%Hr��-��?��c� �5-��V���i��q�Dl_�5�i��AJ[(�C̋#<K���E���c	�.z�,�S���g��Z��F���[���@�j�_<���$��:Hw{�'�i�x�Y�}�Bm=�h���u��R gO�H���,Y���T�ge��b�X'	��Xi�u\�N�3p�e�N%,�Kr�U�l�Z�h���y��E��:V��9�D+��iu�c�"��� g_��-�r��MdwI���k��{���z'���Ar�=Hw���%�E��M���Q�T����jӐ�K�QZX�`mV;c����$�����Z�Y �s%ॷ���ғ��vAs2J�n>~��2GI�^�%�\����J�0t�my�~"����J�-��܊���|�괱���u�.��,��]u	ޡ��P�eq�g	x1��F��#1���q��/�d'�mմp��r��/�$mdI�I�R`���E��F�%��Z��F	�"Kn�����v��w�Q���Ȓ��_]���0J Y�Y�4�흄��Q����%&���i>�Q�H��$&h���|��r�#x?GL(��;��x_��a�_�t2G2]��@ڄ#�����K���I�C<z	r\�����Q��z=�/��  �	���      �   b   x�3�tL/JMO,�4�4202�50�54S00�26�2��356�50�#�e�雟����L�Ɯ��yť9%�a��[P���I���.��@P1z\\\ )F�      �   8   x�3��M-N�4202�50"#C+c#+K=c]�\���99�Edh����� ߭�      �      x������ � �      y      x������ � �      w   Q   x�3�t,*I-N���4�4202�50�50W04�25�24�31��50�#�e�霟[P���_D�朎)��y��%������ 'H,�      e   |  x����r� E��3�����Cd�p ����L�v�����^r�[�A���Z�^���i3���u܍v��t%��%���C�"�EW�Z�\��n��"P��3S
�x�����O�"ȷ��0��V/��=�T7�������@Q��=!\�2�Di�^D���Cl��[gS�҅p��v�bmi �$$L�P0�踁N��-�LE1=f_��Q�"ź9?Y�j��[�_�����d����.�Y/�E��I5wi}�7H�K�n���f�1F�Q�<䥷�iZ�ۛ��̌�@.���;T��_9�R�d�٨�NMؤ�#��Gs���3B����V�o����;wݱ��0��{����[���8eY��3��      i   9   x�3�tL.�,K�4202�50"#C+SC+#=Cs]<R\F��y������ `N      �      x������ � �      �      x������ � �      {   �   x�}��� ߨ�4`F'��%��p2�� ｝eNr@޸llXU���6N宗�[�'�fVX)��Ⱥ>��7����M�ɪhԤ޾":��۟MY�'"pL�Y�!#�Et��?#�|�+"Hq���UpTu�����w�\D�F����\��|�GD�ݿ��#ۗ��%�1���~I���pQ{��/?�?�G�D�&�            x������ � �      o      x������ � �      �      x������ � �      �     x���K�!Dѱ{�@G�1�����H2ΠJ��AjK��������j����#n�SW�wPuC���Vt�Qv��n^m~vM�5����j��y��ͻ�����윗��R�:b�n ��gm6_��m]�KG��e�P�q����fC��B.�u
ݰ��M�ݲ��m�<]s�][]K����l	t��tݖB7l+t�@�l+t9OWn[�+��`Wyz����t_����?�����~��߶�#�~��y���u]��4�      �   �   x�����1D�su�@�0ؘ�X&�8o {��	=��K������v[�#���o{^�����=%|)OM�wc�K�?�$�z��m�k�� ��#�[S��o5%�[�A�m���@����)H�r(H���ٟo�w�L�{�zJ|*�ߚ����Ϲ���m�~?��{c�CEx���un'�yn'���N���N�9�/���jH�W.'�����UOI�>��~
q�      s      x������ � �      �   �   x���=�@�z�\ \���ha�	����C����N�ËIie3�K����n��;��h�S]�y���3������T�"e�h'+ 
8��8/�P	�C׈>�����vɈ�a~���^^g�9��@����q��%c5p�����nzF�$��R����w     