PGDMP         3            	    x            p12052020dev01    11.7 (Debian 11.7-2.pgdg90+1)    11.7 (Debian 11.7-2.pgdg90+1) �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    100573    p12052020dev01    DATABASE     �   CREATE DATABASE p12052020dev01 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';
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
    preference jsonb
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
       public       angelds    false    216                       0    0    Accounts_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Accounts_id_seq" OWNED BY public."Accounts".id;
            public       angelds    false    217            �            1259    101252    Bids    TABLE     �  CREATE TABLE public."Bids" (
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
    DROP TABLE public."Bids";
       public         angelds    false                       0    0    COLUMN "Bids".weight    COMMENT     ?   COMMENT ON COLUMN public."Bids".weight IS 'Peso del producto';
            public       angelds    false    254                       0    0    COLUMN "Bids".materials    COMMENT     X   COMMENT ON COLUMN public."Bids".materials IS 'Materiales de Fabricación del Producto';
            public       angelds    false    254                       0    0    COLUMN "Bids".reasons    COMMENT     H   COMMENT ON COLUMN public."Bids".reasons IS 'Motivos de la publicaión';
            public       angelds    false    254                       0    0    COLUMN "Bids".customizable    COMMENT     _   COMMENT ON COLUMN public."Bids".customizable IS 'para saber su un producto es personalizable';
            public       angelds    false    254            	           0    0    COLUMN "Bids".dimesion    COMMENT     P   COMMENT ON COLUMN public."Bids".dimesion IS 'Dimesion Alto x Largo x Profundo';
            public       angelds    false    254            �            1259    101250    Bids_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Bids_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Bids_id_seq";
       public       angelds    false    254            
           0    0    Bids_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Bids_id_seq" OWNED BY public."Bids".id;
            public       angelds    false    253            �            1259    101189    Brands    TABLE     �   CREATE TABLE public."Brands" (
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
       public       angelds    false    252                       0    0    Brands_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Brands_id_seq" OWNED BY public."Brands".id;
            public       angelds    false    251            �            1259    100600 
   Dashboards    TABLE     Z  CREATE TABLE public."Dashboards" (
    id integer NOT NULL,
    "ModuleId" integer NOT NULL,
    "subModuleId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    path character varying(255),
    icontype character varying(255),
    "StatusId" integer DEFAULT 1 NOT NULL
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
       public       angelds    false    218                       0    0    Dashboards_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Dashboards_id_seq" OWNED BY public."Dashboards".id;
            public       angelds    false    219            �            1259    100609    Genders    TABLE     �   CREATE TABLE public."Genders" (
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
       public       angelds    false    220                       0    0    Genders_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Genders_id_seq" OWNED BY public."Genders".id;
            public       angelds    false    221            �            1259    100614    Modules    TABLE     �   CREATE TABLE public."Modules" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "StatusId" integer NOT NULL,
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
       public       angelds    false    222                       0    0    Modules_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Modules_id_seq" OWNED BY public."Modules".id;
            public       angelds    false    223            �            1259    100619    Nationalities    TABLE     �   CREATE TABLE public."Nationalities" (
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
       public       angelds    false    224                       0    0    Nationalities_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Nationalities_id_seq" OWNED BY public."Nationalities".id;
            public       angelds    false    225            �            1259    100624    People    TABLE     �  CREATE TABLE public."People" (
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
    DROP TABLE public."People";
       public         angelds    false            �            1259    100630    People_id_seq    SEQUENCE     �   CREATE SEQUENCE public."People_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."People_id_seq";
       public       angelds    false    226                       0    0    People_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."People_id_seq" OWNED BY public."People".id;
            public       angelds    false    227            �            1259    100632    Permissions    TABLE     �   CREATE TABLE public."Permissions" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "StatusId" integer NOT NULL,
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
       public       angelds    false    228                       0    0    Permissions_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Permissions_id_seq" OWNED BY public."Permissions".id;
            public       angelds    false    229            �            1259    100642 
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
       public       angelds    false    230                       0    0    Properties_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Properties_id_seq" OWNED BY public."Properties".id;
            public       angelds    false    231            �            1259    100652    Roles    TABLE     �   CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "StatusId" integer NOT NULL,
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
       public       angelds    false    232                       0    0    Roles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;
            public       angelds    false    233            �            1259    100657    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
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
       public       angelds    false    235                       0    0    Status_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Status_id_seq" OWNED BY public."Status".id;
            public       angelds    false    236                        1259    116969 
   Subscribes    TABLE     �   CREATE TABLE public."Subscribes" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "hashConfirm" jsonb
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
       public       angelds    false    256                       0    0    Subscribes_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Subscribes_id_seq" OWNED BY public."Subscribes".id;
            public       angelds    false    255            �            1259    100670 
   Warehouses    TABLE     )  CREATE TABLE public."Warehouses" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    address jsonb,
    phone jsonb,
    "shopId" integer
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
       public       angelds    false    237                       0    0    Warehouses_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Warehouses_id_seq" OWNED BY public."Warehouses".id;
            public       angelds    false    238            �            1259    100675    accountRoles    TABLE       CREATE TABLE public."accountRoles" (
    id integer NOT NULL,
    "AccountId" integer NOT NULL,
    "RoleId" integer NOT NULL,
    "StatusId" integer NOT NULL,
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
       public       angelds    false    239                       0    0    accountRoles_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."accountRoles_id_seq" OWNED BY public."accountRoles".id;
            public       angelds    false    240            �            1259    100685    addressTypes    TABLE     �   CREATE TABLE public."addressTypes" (
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
       public       angelds    false    241                       0    0    addressTypes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."addressTypes_id_seq" OWNED BY public."addressTypes".id;
            public       angelds    false    242            
           1259    117176    affirmations    TABLE     �   CREATE TABLE public.affirmations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public.affirmations;
       public         angelds    false            	           1259    117174    affirmations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.affirmations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.affirmations_id_seq;
       public       angelds    false    266                       0    0    affirmations_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.affirmations_id_seq OWNED BY public.affirmations.id;
            public       angelds    false    265                       1259    149797    attachments    TABLE     �   CREATE TABLE public.attachments (
    id integer NOT NULL,
    data bytea NOT NULL,
    tabs jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.attachments;
       public         angelds    false                       1259    149795    attachments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.attachments_id_seq;
       public       angelds    false    286                       0    0    attachments_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;
            public       angelds    false    285                       1259    125202    banks    TABLE     �   CREATE TABLE public.banks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sbif character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.banks;
       public         angelds    false                       1259    125200    banks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.banks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.banks_id_seq;
       public       angelds    false    274                       0    0    banks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;
            public       angelds    false    273                       1259    149787    bidTypes    TABLE     �   CREATE TABLE public."bidTypes" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."bidTypes";
       public         angelds    false                       1259    149785    bidTypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."bidTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."bidTypes_id_seq";
       public       angelds    false    284                       0    0    bidTypes_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."bidTypes_id_seq" OWNED BY public."bidTypes".id;
            public       angelds    false    283            4           1259    174488    cat1s    TABLE       CREATE TABLE public.cat1s (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    url character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.cat1s;
       public         angelds    false            3           1259    174486    cat1s_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cat1s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cat1s_id_seq;
       public       angelds    false    308                       0    0    cat1s_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cat1s_id_seq OWNED BY public.cat1s.id;
            public       angelds    false    307            6           1259    174499    cat2s    TABLE     '  CREATE TABLE public.cat2s (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    url character varying(255),
    "cat1Id" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.cat2s;
       public         angelds    false            5           1259    174497    cat2s_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cat2s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cat2s_id_seq;
       public       angelds    false    310                       0    0    cat2s_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cat2s_id_seq OWNED BY public.cat2s.id;
            public       angelds    false    309            8           1259    174510    cat3s    TABLE     '  CREATE TABLE public.cat3s (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    url character varying(255),
    "cat2Id" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.cat3s;
       public         angelds    false            7           1259    174508    cat3s_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cat3s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cat3s_id_seq;
       public       angelds    false    312                       0    0    cat3s_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cat3s_id_seq OWNED BY public.cat3s.id;
            public       angelds    false    311            :           1259    174521    cat4s    TABLE     0  CREATE TABLE public.cat4s (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    url character varying(255) NOT NULL,
    "cat3Id" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.cat4s;
       public         angelds    false            9           1259    174519    cat4s_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cat4s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cat4s_id_seq;
       public       angelds    false    314                        0    0    cat4s_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cat4s_id_seq OWNED BY public.cat4s.id;
            public       angelds    false    313            &           1259    166170    civilStatuses    TABLE     �   CREATE TABLE public."civilStatuses" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public."civilStatuses";
       public         angelds    false            %           1259    166168    civilStatuses_id_seq    SEQUENCE     �   CREATE SEQUENCE public."civilStatuses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."civilStatuses_id_seq";
       public       angelds    false    294            !           0    0    civilStatuses_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."civilStatuses_id_seq" OWNED BY public."civilStatuses".id;
            public       angelds    false    293                       1259    125317    comunas    TABLE     �   CREATE TABLE public.comunas (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "provinceId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.comunas;
       public         angelds    false                       1259    125315    comunas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comunas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.comunas_id_seq;
       public       angelds    false    280            "           0    0    comunas_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.comunas_id_seq OWNED BY public.comunas.id;
            public       angelds    false    279            �            1259    100695    dashboardPermissions    TABLE     "  CREATE TABLE public."dashboardPermissions" (
    id integer NOT NULL,
    "DashboardId" integer NOT NULL,
    "PermissionId" integer NOT NULL,
    "StatusId" integer DEFAULT 2 NOT NULL,
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
       public       angelds    false    243            #           0    0    dashboardPermissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."dashboardPermissions_id_seq" OWNED BY public."dashboardPermissions".id;
            public       angelds    false    244            0           1259    174435 
   deliveries    TABLE     �   CREATE TABLE public.deliveries (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.deliveries;
       public         angelds    false            /           1259    174433    deliveries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.deliveries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.deliveries_id_seq;
       public       angelds    false    304            $           0    0    deliveries_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.deliveries_id_seq OWNED BY public.deliveries.id;
            public       angelds    false    303                        1259    149814    disponibilities    TABLE     �   CREATE TABLE public.disponibilities (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public.disponibilities;
       public         angelds    false                       1259    149812    disponibilities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.disponibilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.disponibilities_id_seq;
       public       angelds    false    288            %           0    0    disponibilities_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.disponibilities_id_seq OWNED BY public.disponibilities.id;
            public       angelds    false    287                       1259    117191    docTypes    TABLE     �   CREATE TABLE public."docTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."docTypes";
       public         angelds    false                       1259    117189    docTypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."docTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."docTypes_id_seq";
       public       angelds    false    268            &           0    0    docTypes_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."docTypes_id_seq" OWNED BY public."docTypes".id;
            public       angelds    false    267            2           1259    174459    envoiceNotifies    TABLE     �  CREATE TABLE public."envoiceNotifies" (
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
 %   DROP TABLE public."envoiceNotifies";
       public         angelds    false            1           1259    174457    envoiceNotifies_id_seq    SEQUENCE     �   CREATE SEQUENCE public."envoiceNotifies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."envoiceNotifies_id_seq";
       public       angelds    false    306            '           0    0    envoiceNotifies_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."envoiceNotifies_id_seq" OWNED BY public."envoiceNotifies".id;
            public       angelds    false    305            .           1259    174387    envoiceTypes    TABLE     �   CREATE TABLE public."envoiceTypes" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."envoiceTypes";
       public         angelds    false            -           1259    174385    envoiceTypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."envoiceTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."envoiceTypes_id_seq";
       public       angelds    false    302            (           0    0    envoiceTypes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."envoiceTypes_id_seq" OWNED BY public."envoiceTypes".id;
            public       angelds    false    301            �            1259    100701 
   grantRoles    TABLE       CREATE TABLE public."grantRoles" (
    id integer NOT NULL,
    "dashboardPermissionId" integer NOT NULL,
    "RoleId" integer NOT NULL,
    "StatusId" integer NOT NULL,
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
       public       angelds    false    245            )           0    0    grantRoles_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."grantRoles_id_seq" OWNED BY public."grantRoles".id;
            public       angelds    false    246            $           1259    149834 	   materials    TABLE     �   CREATE TABLE public.materials (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.materials;
       public         angelds    false            #           1259    149832    materials_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.materials_id_seq;
       public       angelds    false    292            *           0    0    materials_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;
            public       angelds    false    291                       1259    117131 
   phoneTypes    TABLE     �   CREATE TABLE public."phoneTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."phoneTypes";
       public         angelds    false                       1259    117129    phoneTypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."phoneTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."phoneTypes_id_seq";
       public       angelds    false    260            +           0    0    phoneTypes_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."phoneTypes_id_seq" OWNED BY public."phoneTypes".id;
            public       angelds    false    259            �            1259    100706    postalCodes    TABLE     �   CREATE TABLE public."postalCodes" (
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
       public       angelds    false    247            ,           0    0    postalCodes_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."postalCodes_id_seq" OWNED BY public."postalCodes".id;
            public       angelds    false    248                       1259    125151    processTypes    TABLE     �   CREATE TABLE public."processTypes" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."processTypes";
       public         angelds    false                       1259    125149    processTypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."processTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."processTypes_id_seq";
       public       angelds    false    270            -           0    0    processTypes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."processTypes_id_seq" OWNED BY public."processTypes".id;
            public       angelds    false    269                       1259    125292 	   provinces    TABLE     �   CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "regionId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.provinces;
       public         angelds    false                       1259    125290    provinces_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.provinces_id_seq;
       public       angelds    false    278            .           0    0    provinces_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;
            public       angelds    false    277            "           1259    149824    reasons    TABLE     �   CREATE TABLE public.reasons (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.reasons;
       public         angelds    false            !           1259    149822    reasons_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reasons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reasons_id_seq;
       public       angelds    false    290            /           0    0    reasons_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reasons_id_seq OWNED BY public.reasons.id;
            public       angelds    false    289                       1259    125227    regions    TABLE     �   CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ordinal character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.regions;
       public         angelds    false                       1259    125225    regions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.regions_id_seq;
       public       angelds    false    276            0           0    0    regions_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;
            public       angelds    false    275                       1259    117161    salesChannels    TABLE     �   CREATE TABLE public."salesChannels" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public."salesChannels";
       public         angelds    false                       1259    117159    salesChannels_id_seq    SEQUENCE     �   CREATE SEQUENCE public."salesChannels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."salesChannels_id_seq";
       public       angelds    false    264            1           0    0    salesChannels_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."salesChannels_id_seq" OWNED BY public."salesChannels".id;
            public       angelds    false    263            (           1259    166188    shopContracts    TABLE     $  CREATE TABLE public."shopContracts" (
    id integer NOT NULL,
    "contractId" integer NOT NULL,
    "shopId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "contractDesc" jsonb
);
 #   DROP TABLE public."shopContracts";
       public         angelds    false            '           1259    166186    shopContracts_id_seq    SEQUENCE     �   CREATE SEQUENCE public."shopContracts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."shopContracts_id_seq";
       public       angelds    false    296            2           0    0    shopContracts_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."shopContracts_id_seq" OWNED BY public."shopContracts".id;
            public       angelds    false    295                       1259    117025    shopRequests    TABLE     5  CREATE TABLE public."shopRequests" (
    id integer NOT NULL,
    "AccountId" integer NOT NULL,
    status jsonb NOT NULL,
    phone jsonb NOT NULL,
    name character varying(255) NOT NULL,
    "storeType" jsonb NOT NULL,
    "startActivity" boolean NOT NULL,
    "isStore" boolean NOT NULL,
    "descShop" character varying(255) NOT NULL,
    "salesChannels" jsonb NOT NULL,
    affirmations jsonb NOT NULL,
    employees integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    process jsonb
);
 "   DROP TABLE public."shopRequests";
       public         angelds    false                       1259    117023    shopRequests_id_seq    SEQUENCE     �   CREATE SEQUENCE public."shopRequests_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."shopRequests_id_seq";
       public       angelds    false    258            3           0    0    shopRequests_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."shopRequests_id_seq" OWNED BY public."shopRequests".id;
            public       angelds    false    257                       1259    125179    shops    TABLE     e  CREATE TABLE public.shops (
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
    DROP TABLE public.shops;
       public         angelds    false                       1259    125177    shops_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.shops_id_seq;
       public       angelds    false    272            4           0    0    shops_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.shops_id_seq OWNED BY public.shops.id;
            public       angelds    false    271                       1259    149777    statusProcesses    TABLE     �   CREATE TABLE public."statusProcesses" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 %   DROP TABLE public."statusProcesses";
       public         angelds    false                       1259    149775    statusProcesses_id_seq    SEQUENCE     �   CREATE SEQUENCE public."statusProcesses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."statusProcesses_id_seq";
       public       angelds    false    282            5           0    0    statusProcesses_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."statusProcesses_id_seq" OWNED BY public."statusProcesses".id;
            public       angelds    false    281                       1259    117146 
   storeTypes    TABLE     �   CREATE TABLE public."storeTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."storeTypes";
       public         angelds    false                       1259    117144    storeTypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."storeTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."storeTypes_id_seq";
       public       angelds    false    262            6           0    0    storeTypes_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."storeTypes_id_seq" OWNED BY public."storeTypes".id;
            public       angelds    false    261            �            1259    100711 
   subModules    TABLE     ;  CREATE TABLE public."subModules" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    route character varying(255) NOT NULL,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ModuleId" integer NOT NULL
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
       public       angelds    false    249            7           0    0    subModules_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."subModules_id_seq" OWNED BY public."subModules".id;
            public       angelds    false    250            ,           1259    174369 	   taxValues    TABLE     �   CREATE TABLE public."taxValues" (
    id integer NOT NULL,
    "taxId" integer,
    value numeric,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."taxValues";
       public         angelds    false            +           1259    174367    taxValues_id_seq    SEQUENCE     �   CREATE SEQUENCE public."taxValues_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."taxValues_id_seq";
       public       angelds    false    300            8           0    0    taxValues_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."taxValues_id_seq" OWNED BY public."taxValues".id;
            public       angelds    false    299            *           1259    174359    taxes    TABLE     �   CREATE TABLE public.taxes (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.taxes;
       public         angelds    false            )           1259    174357    taxes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.taxes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.taxes_id_seq;
       public       angelds    false    298            9           0    0    taxes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.taxes_id_seq OWNED BY public.taxes.id;
            public       angelds    false    297            �           2604    100719    Accounts id    DEFAULT     n   ALTER TABLE ONLY public."Accounts" ALTER COLUMN id SET DEFAULT nextval('public."Accounts_id_seq"'::regclass);
 <   ALTER TABLE public."Accounts" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    217    216                       2604    101255    Bids id    DEFAULT     f   ALTER TABLE ONLY public."Bids" ALTER COLUMN id SET DEFAULT nextval('public."Bids_id_seq"'::regclass);
 8   ALTER TABLE public."Bids" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    254    253    254                       2604    101192 	   Brands id    DEFAULT     j   ALTER TABLE ONLY public."Brands" ALTER COLUMN id SET DEFAULT nextval('public."Brands_id_seq"'::regclass);
 :   ALTER TABLE public."Brands" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    251    252    252                       2604    100723    Dashboards id    DEFAULT     r   ALTER TABLE ONLY public."Dashboards" ALTER COLUMN id SET DEFAULT nextval('public."Dashboards_id_seq"'::regclass);
 >   ALTER TABLE public."Dashboards" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    219    218                       2604    100724 
   Genders id    DEFAULT     l   ALTER TABLE ONLY public."Genders" ALTER COLUMN id SET DEFAULT nextval('public."Genders_id_seq"'::regclass);
 ;   ALTER TABLE public."Genders" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    221    220                       2604    100725 
   Modules id    DEFAULT     l   ALTER TABLE ONLY public."Modules" ALTER COLUMN id SET DEFAULT nextval('public."Modules_id_seq"'::regclass);
 ;   ALTER TABLE public."Modules" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    223    222                       2604    100726    Nationalities id    DEFAULT     x   ALTER TABLE ONLY public."Nationalities" ALTER COLUMN id SET DEFAULT nextval('public."Nationalities_id_seq"'::regclass);
 A   ALTER TABLE public."Nationalities" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    225    224                       2604    100727 	   People id    DEFAULT     j   ALTER TABLE ONLY public."People" ALTER COLUMN id SET DEFAULT nextval('public."People_id_seq"'::regclass);
 :   ALTER TABLE public."People" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    227    226                       2604    100728    Permissions id    DEFAULT     t   ALTER TABLE ONLY public."Permissions" ALTER COLUMN id SET DEFAULT nextval('public."Permissions_id_seq"'::regclass);
 ?   ALTER TABLE public."Permissions" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    229    228                       2604    100730    Properties id    DEFAULT     r   ALTER TABLE ONLY public."Properties" ALTER COLUMN id SET DEFAULT nextval('public."Properties_id_seq"'::regclass);
 >   ALTER TABLE public."Properties" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    231    230            	           2604    100732    Roles id    DEFAULT     h   ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);
 9   ALTER TABLE public."Roles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    233    232            
           2604    100733 	   Status id    DEFAULT     j   ALTER TABLE ONLY public."Status" ALTER COLUMN id SET DEFAULT nextval('public."Status_id_seq"'::regclass);
 :   ALTER TABLE public."Status" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    236    235                       2604    116972    Subscribes id    DEFAULT     r   ALTER TABLE ONLY public."Subscribes" ALTER COLUMN id SET DEFAULT nextval('public."Subscribes_id_seq"'::regclass);
 >   ALTER TABLE public."Subscribes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    255    256    256                       2604    100735    Warehouses id    DEFAULT     r   ALTER TABLE ONLY public."Warehouses" ALTER COLUMN id SET DEFAULT nextval('public."Warehouses_id_seq"'::regclass);
 >   ALTER TABLE public."Warehouses" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    238    237                       2604    100736    accountRoles id    DEFAULT     v   ALTER TABLE ONLY public."accountRoles" ALTER COLUMN id SET DEFAULT nextval('public."accountRoles_id_seq"'::regclass);
 @   ALTER TABLE public."accountRoles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    240    239                       2604    100738    addressTypes id    DEFAULT     v   ALTER TABLE ONLY public."addressTypes" ALTER COLUMN id SET DEFAULT nextval('public."addressTypes_id_seq"'::regclass);
 @   ALTER TABLE public."addressTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    242    241                       2604    117179    affirmations id    DEFAULT     r   ALTER TABLE ONLY public.affirmations ALTER COLUMN id SET DEFAULT nextval('public.affirmations_id_seq'::regclass);
 >   ALTER TABLE public.affirmations ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    265    266    266            $           2604    149800    attachments id    DEFAULT     p   ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);
 =   ALTER TABLE public.attachments ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    286    285    286                       2604    125205    banks id    DEFAULT     d   ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);
 7   ALTER TABLE public.banks ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    273    274    274            #           2604    149790    bidTypes id    DEFAULT     n   ALTER TABLE ONLY public."bidTypes" ALTER COLUMN id SET DEFAULT nextval('public."bidTypes_id_seq"'::regclass);
 <   ALTER TABLE public."bidTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    284    283    284            /           2604    174491    cat1s id    DEFAULT     d   ALTER TABLE ONLY public.cat1s ALTER COLUMN id SET DEFAULT nextval('public.cat1s_id_seq'::regclass);
 7   ALTER TABLE public.cat1s ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    307    308    308            0           2604    174502    cat2s id    DEFAULT     d   ALTER TABLE ONLY public.cat2s ALTER COLUMN id SET DEFAULT nextval('public.cat2s_id_seq'::regclass);
 7   ALTER TABLE public.cat2s ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    310    309    310            1           2604    174513    cat3s id    DEFAULT     d   ALTER TABLE ONLY public.cat3s ALTER COLUMN id SET DEFAULT nextval('public.cat3s_id_seq'::regclass);
 7   ALTER TABLE public.cat3s ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    311    312    312            2           2604    174524    cat4s id    DEFAULT     d   ALTER TABLE ONLY public.cat4s ALTER COLUMN id SET DEFAULT nextval('public.cat4s_id_seq'::regclass);
 7   ALTER TABLE public.cat4s ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    314    313    314            (           2604    166173    civilStatuses id    DEFAULT     x   ALTER TABLE ONLY public."civilStatuses" ALTER COLUMN id SET DEFAULT nextval('public."civilStatuses_id_seq"'::regclass);
 A   ALTER TABLE public."civilStatuses" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    294    293    294            !           2604    125320 
   comunas id    DEFAULT     h   ALTER TABLE ONLY public.comunas ALTER COLUMN id SET DEFAULT nextval('public.comunas_id_seq'::regclass);
 9   ALTER TABLE public.comunas ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    279    280    280                       2604    100740    dashboardPermissions id    DEFAULT     �   ALTER TABLE ONLY public."dashboardPermissions" ALTER COLUMN id SET DEFAULT nextval('public."dashboardPermissions_id_seq"'::regclass);
 H   ALTER TABLE public."dashboardPermissions" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    244    243            -           2604    174438    deliveries id    DEFAULT     n   ALTER TABLE ONLY public.deliveries ALTER COLUMN id SET DEFAULT nextval('public.deliveries_id_seq'::regclass);
 <   ALTER TABLE public.deliveries ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    303    304    304            %           2604    149817    disponibilities id    DEFAULT     x   ALTER TABLE ONLY public.disponibilities ALTER COLUMN id SET DEFAULT nextval('public.disponibilities_id_seq'::regclass);
 A   ALTER TABLE public.disponibilities ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    288    287    288                       2604    117194    docTypes id    DEFAULT     n   ALTER TABLE ONLY public."docTypes" ALTER COLUMN id SET DEFAULT nextval('public."docTypes_id_seq"'::regclass);
 <   ALTER TABLE public."docTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    268    267    268            .           2604    174462    envoiceNotifies id    DEFAULT     |   ALTER TABLE ONLY public."envoiceNotifies" ALTER COLUMN id SET DEFAULT nextval('public."envoiceNotifies_id_seq"'::regclass);
 C   ALTER TABLE public."envoiceNotifies" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    305    306    306            ,           2604    174390    envoiceTypes id    DEFAULT     v   ALTER TABLE ONLY public."envoiceTypes" ALTER COLUMN id SET DEFAULT nextval('public."envoiceTypes_id_seq"'::regclass);
 @   ALTER TABLE public."envoiceTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    302    301    302                       2604    100741    grantRoles id    DEFAULT     r   ALTER TABLE ONLY public."grantRoles" ALTER COLUMN id SET DEFAULT nextval('public."grantRoles_id_seq"'::regclass);
 >   ALTER TABLE public."grantRoles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    246    245            '           2604    149837    materials id    DEFAULT     l   ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);
 ;   ALTER TABLE public.materials ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    292    291    292                       2604    117134    phoneTypes id    DEFAULT     r   ALTER TABLE ONLY public."phoneTypes" ALTER COLUMN id SET DEFAULT nextval('public."phoneTypes_id_seq"'::regclass);
 >   ALTER TABLE public."phoneTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    260    259    260                       2604    100742    postalCodes id    DEFAULT     t   ALTER TABLE ONLY public."postalCodes" ALTER COLUMN id SET DEFAULT nextval('public."postalCodes_id_seq"'::regclass);
 ?   ALTER TABLE public."postalCodes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    248    247                       2604    125154    processTypes id    DEFAULT     v   ALTER TABLE ONLY public."processTypes" ALTER COLUMN id SET DEFAULT nextval('public."processTypes_id_seq"'::regclass);
 @   ALTER TABLE public."processTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    269    270    270                        2604    125295    provinces id    DEFAULT     l   ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);
 ;   ALTER TABLE public.provinces ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    277    278    278            &           2604    149827 
   reasons id    DEFAULT     h   ALTER TABLE ONLY public.reasons ALTER COLUMN id SET DEFAULT nextval('public.reasons_id_seq'::regclass);
 9   ALTER TABLE public.reasons ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    290    289    290                       2604    125230 
   regions id    DEFAULT     h   ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);
 9   ALTER TABLE public.regions ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    275    276    276                       2604    117164    salesChannels id    DEFAULT     x   ALTER TABLE ONLY public."salesChannels" ALTER COLUMN id SET DEFAULT nextval('public."salesChannels_id_seq"'::regclass);
 A   ALTER TABLE public."salesChannels" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    263    264    264            )           2604    166191    shopContracts id    DEFAULT     x   ALTER TABLE ONLY public."shopContracts" ALTER COLUMN id SET DEFAULT nextval('public."shopContracts_id_seq"'::regclass);
 A   ALTER TABLE public."shopContracts" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    295    296    296                       2604    117028    shopRequests id    DEFAULT     v   ALTER TABLE ONLY public."shopRequests" ALTER COLUMN id SET DEFAULT nextval('public."shopRequests_id_seq"'::regclass);
 @   ALTER TABLE public."shopRequests" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    258    257    258                       2604    125182    shops id    DEFAULT     d   ALTER TABLE ONLY public.shops ALTER COLUMN id SET DEFAULT nextval('public.shops_id_seq'::regclass);
 7   ALTER TABLE public.shops ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    272    271    272            "           2604    149780    statusProcesses id    DEFAULT     |   ALTER TABLE ONLY public."statusProcesses" ALTER COLUMN id SET DEFAULT nextval('public."statusProcesses_id_seq"'::regclass);
 C   ALTER TABLE public."statusProcesses" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    281    282    282                       2604    117149    storeTypes id    DEFAULT     r   ALTER TABLE ONLY public."storeTypes" ALTER COLUMN id SET DEFAULT nextval('public."storeTypes_id_seq"'::regclass);
 >   ALTER TABLE public."storeTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    261    262    262                       2604    100743    subModules id    DEFAULT     r   ALTER TABLE ONLY public."subModules" ALTER COLUMN id SET DEFAULT nextval('public."subModules_id_seq"'::regclass);
 >   ALTER TABLE public."subModules" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    250    249            +           2604    174372    taxValues id    DEFAULT     p   ALTER TABLE ONLY public."taxValues" ALTER COLUMN id SET DEFAULT nextval('public."taxValues_id_seq"'::regclass);
 =   ALTER TABLE public."taxValues" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    299    300    300            *           2604    174362    taxes id    DEFAULT     d   ALTER TABLE ONLY public.taxes ALTER COLUMN id SET DEFAULT nextval('public.taxes_id_seq'::regclass);
 7   ALTER TABLE public.taxes ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    297    298    298            �          0    100574    Accounts 
   TABLE DATA                     public       angelds    false    216   �      �          0    101252    Bids 
   TABLE DATA                     public       angelds    false    254   H      �          0    101189    Brands 
   TABLE DATA                     public       angelds    false    252   )      �          0    100600 
   Dashboards 
   TABLE DATA                     public       angelds    false    218   �      �          0    100609    Genders 
   TABLE DATA                     public       angelds    false    220   �      �          0    100614    Modules 
   TABLE DATA                     public       angelds    false    222   �      �          0    100619    Nationalities 
   TABLE DATA                     public       angelds    false    224   �      �          0    100624    People 
   TABLE DATA                     public       angelds    false    226   &      �          0    100632    Permissions 
   TABLE DATA                     public       angelds    false    228   �      �          0    100642 
   Properties 
   TABLE DATA                     public       angelds    false    230   �      �          0    100652    Roles 
   TABLE DATA                     public       angelds    false    232   �      �          0    100657    SequelizeMeta 
   TABLE DATA                     public       angelds    false    234   1      �          0    100660    Status 
   TABLE DATA                     public       angelds    false    235   �      �          0    116969 
   Subscribes 
   TABLE DATA                     public       angelds    false    256         �          0    100670 
   Warehouses 
   TABLE DATA                     public       angelds    false    237   �       �          0    100675    accountRoles 
   TABLE DATA                     public       angelds    false    239   {#      �          0    100685    addressTypes 
   TABLE DATA                     public       angelds    false    241   U$      �          0    117176    affirmations 
   TABLE DATA                     public       angelds    false    266   o$      �          0    149797    attachments 
   TABLE DATA                     public       angelds    false    286   �%      �          0    125202    banks 
   TABLE DATA                     public       angelds    false    274   b'      �          0    149787    bidTypes 
   TABLE DATA                     public       angelds    false    284   �(      �          0    174488    cat1s 
   TABLE DATA                     public       angelds    false    308   2)      �          0    174499    cat2s 
   TABLE DATA                     public       angelds    false    310   �)      �          0    174510    cat3s 
   TABLE DATA                     public       angelds    false    312   +      �          0    174521    cat4s 
   TABLE DATA                     public       angelds    false    314   �.      �          0    166170    civilStatuses 
   TABLE DATA                     public       angelds    false    294   @0      �          0    125317    comunas 
   TABLE DATA                     public       angelds    false    280   Z0      �          0    100695    dashboardPermissions 
   TABLE DATA                     public       angelds    false    243   i>      �          0    174435 
   deliveries 
   TABLE DATA                     public       angelds    false    304   �?      �          0    149814    disponibilities 
   TABLE DATA                     public       angelds    false    288   P@      �          0    117191    docTypes 
   TABLE DATA                     public       angelds    false    268   �@      �          0    174459    envoiceNotifies 
   TABLE DATA                     public       angelds    false    306   bA      �          0    174387    envoiceTypes 
   TABLE DATA                     public       angelds    false    302   �B      �          0    100701 
   grantRoles 
   TABLE DATA                     public       angelds    false    245   BC      �          0    149834 	   materials 
   TABLE DATA                     public       angelds    false    292   �D      �          0    117131 
   phoneTypes 
   TABLE DATA                     public       angelds    false    260   E      �          0    100706    postalCodes 
   TABLE DATA                     public       angelds    false    247   �E      �          0    125151    processTypes 
   TABLE DATA                     public       angelds    false    270   �E      �          0    125292 	   provinces 
   TABLE DATA                     public       angelds    false    278   �E      �          0    149824    reasons 
   TABLE DATA                     public       angelds    false    290   �H      �          0    125227    regions 
   TABLE DATA                     public       angelds    false    276   +I      �          0    117161    salesChannels 
   TABLE DATA                     public       angelds    false    264   �J      �          0    166188    shopContracts 
   TABLE DATA                     public       angelds    false    296   �K      �          0    117025    shopRequests 
   TABLE DATA                     public       angelds    false    258   SL      �          0    125179    shops 
   TABLE DATA                     public       angelds    false    272   �N      �          0    149777    statusProcesses 
   TABLE DATA                     public       angelds    false    282   �O      �          0    117146 
   storeTypes 
   TABLE DATA                     public       angelds    false    262   �P      �          0    100711 
   subModules 
   TABLE DATA                     public       angelds    false    249   �Q      �          0    174369 	   taxValues 
   TABLE DATA                     public       angelds    false    300   �R      �          0    174359    taxes 
   TABLE DATA                     public       angelds    false    298   �R      :           0    0    Accounts_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Accounts_id_seq"', 199, true);
            public       angelds    false    217            ;           0    0    Bids_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Bids_id_seq"', 29, true);
            public       angelds    false    253            <           0    0    Brands_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Brands_id_seq"', 3, true);
            public       angelds    false    251            =           0    0    Dashboards_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Dashboards_id_seq"', 11, true);
            public       angelds    false    219            >           0    0    Genders_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Genders_id_seq"', 3, true);
            public       angelds    false    221            ?           0    0    Modules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Modules_id_seq"', 1, false);
            public       angelds    false    223            @           0    0    Nationalities_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Nationalities_id_seq"', 1, false);
            public       angelds    false    225            A           0    0    People_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."People_id_seq"', 166, true);
            public       angelds    false    227            B           0    0    Permissions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Permissions_id_seq"', 1, false);
            public       angelds    false    229            C           0    0    Properties_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Properties_id_seq"', 1, false);
            public       angelds    false    231            D           0    0    Roles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Roles_id_seq"', 7, true);
            public       angelds    false    233            E           0    0    Status_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Status_id_seq"', 1, false);
            public       angelds    false    236            F           0    0    Subscribes_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Subscribes_id_seq"', 91, true);
            public       angelds    false    255            G           0    0    Warehouses_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Warehouses_id_seq"', 41, true);
            public       angelds    false    238            H           0    0    accountRoles_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."accountRoles_id_seq"', 104, true);
            public       angelds    false    240            I           0    0    addressTypes_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."addressTypes_id_seq"', 1, false);
            public       angelds    false    242            J           0    0    affirmations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.affirmations_id_seq', 3, true);
            public       angelds    false    265            K           0    0    attachments_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.attachments_id_seq', 42, true);
            public       angelds    false    285            L           0    0    banks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.banks_id_seq', 14, true);
            public       angelds    false    273            M           0    0    bidTypes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."bidTypes_id_seq"', 2, true);
            public       angelds    false    283            N           0    0    cat1s_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cat1s_id_seq', 1, false);
            public       angelds    false    307            O           0    0    cat2s_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cat2s_id_seq', 1, false);
            public       angelds    false    309            P           0    0    cat3s_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cat3s_id_seq', 1, false);
            public       angelds    false    311            Q           0    0    cat4s_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cat4s_id_seq', 1, false);
            public       angelds    false    313            R           0    0    civilStatuses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."civilStatuses_id_seq"', 1, false);
            public       angelds    false    293            S           0    0    comunas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.comunas_id_seq', 1, false);
            public       angelds    false    279            T           0    0    dashboardPermissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."dashboardPermissions_id_seq"', 1, false);
            public       angelds    false    244            U           0    0    deliveries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.deliveries_id_seq', 2, true);
            public       angelds    false    303            V           0    0    disponibilities_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.disponibilities_id_seq', 2, true);
            public       angelds    false    287            W           0    0    docTypes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."docTypes_id_seq"', 4, true);
            public       angelds    false    267            X           0    0    envoiceNotifies_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."envoiceNotifies_id_seq"', 15, true);
            public       angelds    false    305            Y           0    0    envoiceTypes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."envoiceTypes_id_seq"', 2, true);
            public       angelds    false    301            Z           0    0    grantRoles_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."grantRoles_id_seq"', 84, true);
            public       angelds    false    246            [           0    0    materials_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.materials_id_seq', 3, true);
            public       angelds    false    291            \           0    0    phoneTypes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."phoneTypes_id_seq"', 3, true);
            public       angelds    false    259            ]           0    0    postalCodes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."postalCodes_id_seq"', 1, false);
            public       angelds    false    248            ^           0    0    processTypes_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."processTypes_id_seq"', 1, false);
            public       angelds    false    269            _           0    0    provinces_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.provinces_id_seq', 1, false);
            public       angelds    false    277            `           0    0    reasons_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.reasons_id_seq', 3, true);
            public       angelds    false    289            a           0    0    regions_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.regions_id_seq', 1, false);
            public       angelds    false    275            b           0    0    salesChannels_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."salesChannels_id_seq"', 8, true);
            public       angelds    false    263            c           0    0    shopContracts_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."shopContracts_id_seq"', 9, true);
            public       angelds    false    295            d           0    0    shopRequests_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."shopRequests_id_seq"', 38, true);
            public       angelds    false    257            e           0    0    shops_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.shops_id_seq', 115, true);
            public       angelds    false    271            f           0    0    statusProcesses_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."statusProcesses_id_seq"', 4, true);
            public       angelds    false    281            g           0    0    storeTypes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."storeTypes_id_seq"', 4, true);
            public       angelds    false    261            h           0    0    subModules_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."subModules_id_seq"', 1, false);
            public       angelds    false    250            i           0    0    taxValues_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."taxValues_id_seq"', 1, false);
            public       angelds    false    299            j           0    0    taxes_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.taxes_id_seq', 1, false);
            public       angelds    false    297            4           2606    100745    Accounts Accounts_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_email_key" UNIQUE (email);
 I   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_email_key";
       public         angelds    false    216            6           2606    100747    Accounts Accounts_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_name_key" UNIQUE (name);
 H   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_name_key";
       public         angelds    false    216            8           2606    100749    Accounts Accounts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_pkey";
       public         angelds    false    216                       2606    101260    Bids Bids_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_pkey";
       public         angelds    false    254            {           2606    101196    Brands Brands_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Brands"
    ADD CONSTRAINT "Brands_name_key" UNIQUE (name);
 D   ALTER TABLE ONLY public."Brands" DROP CONSTRAINT "Brands_name_key";
       public         angelds    false    252            }           2606    101194    Brands Brands_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Brands"
    ADD CONSTRAINT "Brands_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Brands" DROP CONSTRAINT "Brands_pkey";
       public         angelds    false    252            :           2606    100759    Dashboards Dashboards_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_pkey";
       public         angelds    false    218            <           2606    100761 .   Dashboards Dashboards_subModuleId_moduleId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_moduleId_key" UNIQUE ("subModuleId", "ModuleId");
 \   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_subModuleId_moduleId_key";
       public         angelds    false    218    218            >           2606    100763    Genders Genders_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_name_key" UNIQUE (name);
 F   ALTER TABLE ONLY public."Genders" DROP CONSTRAINT "Genders_name_key";
       public         angelds    false    220            @           2606    100765    Genders Genders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Genders" DROP CONSTRAINT "Genders_pkey";
       public         angelds    false    220            B           2606    100767    Modules Modules_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_name_key" UNIQUE (name);
 F   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_name_key";
       public         angelds    false    222            D           2606    100769    Modules Modules_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_pkey";
       public         angelds    false    222            F           2606    100771 $   Nationalities Nationalities_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_name_key" UNIQUE (name);
 R   ALTER TABLE ONLY public."Nationalities" DROP CONSTRAINT "Nationalities_name_key";
       public         angelds    false    224            H           2606    100773     Nationalities Nationalities_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Nationalities" DROP CONSTRAINT "Nationalities_pkey";
       public         angelds    false    224            J           2606    100777    People People_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_pkey";
       public         angelds    false    226            L           2606    100779     Permissions Permissions_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_name_key" UNIQUE (name);
 N   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_name_key";
       public         angelds    false    228            N           2606    100781    Permissions Permissions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_pkey";
       public         angelds    false    228            P           2606    100787    Properties Properties_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."Properties" DROP CONSTRAINT "Properties_name_key";
       public         angelds    false    230            R           2606    100789    Properties Properties_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Properties" DROP CONSTRAINT "Properties_pkey";
       public         angelds    false    230            T           2606    100795    Roles Roles_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key" UNIQUE (name);
 B   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key";
       public         angelds    false    232            V           2606    100797    Roles Roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_pkey";
       public         angelds    false    232            X           2606    100799     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public         angelds    false    234            Z           2606    100801    Status Status_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_name_key" UNIQUE (name);
 D   ALTER TABLE ONLY public."Status" DROP CONSTRAINT "Status_name_key";
       public         angelds    false    235            \           2606    100803    Status Status_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Status" DROP CONSTRAINT "Status_pkey";
       public         angelds    false    235            �           2606    116976    Subscribes Subscribes_email_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Subscribes"
    ADD CONSTRAINT "Subscribes_email_key" UNIQUE (email);
 M   ALTER TABLE ONLY public."Subscribes" DROP CONSTRAINT "Subscribes_email_key";
       public         angelds    false    256            �           2606    116974    Subscribes Subscribes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Subscribes"
    ADD CONSTRAINT "Subscribes_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Subscribes" DROP CONSTRAINT "Subscribes_pkey";
       public         angelds    false    256            ^           2606    100811    Warehouses Warehouses_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_pkey";
       public         angelds    false    237            c           2606    100813    accountRoles accountRoles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_pkey";
       public         angelds    false    239            f           2606    141582    accountRoles account_roles_uq 
   CONSTRAINT     k   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT account_roles_uq UNIQUE ("AccountId", "RoleId");
 I   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT account_roles_uq;
       public         angelds    false    239    239            h           2606    100817    addressTypes addressTypes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."addressTypes"
    ADD CONSTRAINT "addressTypes_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."addressTypes" DROP CONSTRAINT "addressTypes_pkey";
       public         angelds    false    241            �           2606    117183 "   affirmations affirmations_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.affirmations
    ADD CONSTRAINT affirmations_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.affirmations DROP CONSTRAINT affirmations_name_key;
       public         angelds    false    266            �           2606    117181    affirmations affirmations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.affirmations
    ADD CONSTRAINT affirmations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.affirmations DROP CONSTRAINT affirmations_pkey;
       public         angelds    false    266            �           2606    149805    attachments attachments_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.attachments DROP CONSTRAINT attachments_pkey;
       public         angelds    false    286            �           2606    125212    banks banks_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.banks DROP CONSTRAINT banks_name_key;
       public         angelds    false    274            �           2606    125210    banks banks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.banks DROP CONSTRAINT banks_pkey;
       public         angelds    false    274            �           2606    125214    banks banks_sbif_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_sbif_key UNIQUE (sbif);
 >   ALTER TABLE ONLY public.banks DROP CONSTRAINT banks_sbif_key;
       public         angelds    false    274            �           2606    166219    Bids bibs_uq 
   CONSTRAINT     T   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT bibs_uq UNIQUE (title, "shopId");
 8   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT bibs_uq;
       public         angelds    false    254    254            �           2606    149794    bidTypes bidTypes_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."bidTypes"
    ADD CONSTRAINT "bidTypes_name_key" UNIQUE (name);
 H   ALTER TABLE ONLY public."bidTypes" DROP CONSTRAINT "bidTypes_name_key";
       public         angelds    false    284            �           2606    149792    bidTypes bidTypes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."bidTypes"
    ADD CONSTRAINT "bidTypes_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."bidTypes" DROP CONSTRAINT "bidTypes_pkey";
       public         angelds    false    284            �           2606    174537    cat1s cat1s_UQ 
   CONSTRAINT     K   ALTER TABLE ONLY public.cat1s
    ADD CONSTRAINT "cat1s_UQ" UNIQUE (name);
 :   ALTER TABLE ONLY public.cat1s DROP CONSTRAINT "cat1s_UQ";
       public         angelds    false    308            �           2606    174496    cat1s cat1s_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.cat1s
    ADD CONSTRAINT cat1s_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cat1s DROP CONSTRAINT cat1s_pkey;
       public         angelds    false    308            �           2606    174507    cat2s cat2s_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.cat2s
    ADD CONSTRAINT cat2s_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cat2s DROP CONSTRAINT cat2s_pkey;
       public         angelds    false    310            �           2606    174518    cat3s cat3s_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.cat3s
    ADD CONSTRAINT cat3s_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cat3s DROP CONSTRAINT cat3s_pkey;
       public         angelds    false    312            �           2606    174529    cat4s cat4s_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.cat4s
    ADD CONSTRAINT cat4s_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cat4s DROP CONSTRAINT cat4s_pkey;
       public         angelds    false    314            �           2606    166175     civilStatuses civilStatuses_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."civilStatuses"
    ADD CONSTRAINT "civilStatuses_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."civilStatuses" DROP CONSTRAINT "civilStatuses_pkey";
       public         angelds    false    294            �           2606    125324    comunas comunas_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT comunas_name_key UNIQUE (name);
 B   ALTER TABLE ONLY public.comunas DROP CONSTRAINT comunas_name_key;
       public         angelds    false    280            �           2606    125322    comunas comunas_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT comunas_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comunas DROP CONSTRAINT comunas_pkey;
       public         angelds    false    280            j           2606    100821 F   dashboardPermissions dashboardPermissions_permissionId_dashboardId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_dashboardId_key" UNIQUE ("PermissionId", "DashboardId");
 t   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_permissionId_dashboardId_key";
       public         angelds    false    243    243            l           2606    100823 .   dashboardPermissions dashboardPermissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_pkey";
       public         angelds    false    243            �           2606    174440    deliveries deliveries_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.deliveries DROP CONSTRAINT deliveries_pkey;
       public         angelds    false    304            �           2606    149821 (   disponibilities disponibilities_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.disponibilities
    ADD CONSTRAINT disponibilities_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.disponibilities DROP CONSTRAINT disponibilities_name_key;
       public         angelds    false    288            �           2606    149819 $   disponibilities disponibilities_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.disponibilities
    ADD CONSTRAINT disponibilities_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.disponibilities DROP CONSTRAINT disponibilities_pkey;
       public         angelds    false    288            �           2606    117198    docTypes docTypes_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."docTypes"
    ADD CONSTRAINT "docTypes_name_key" UNIQUE (name);
 H   ALTER TABLE ONLY public."docTypes" DROP CONSTRAINT "docTypes_name_key";
       public         angelds    false    268            �           2606    117196    docTypes docTypes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."docTypes"
    ADD CONSTRAINT "docTypes_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."docTypes" DROP CONSTRAINT "docTypes_pkey";
       public         angelds    false    268            �           2606    174485 (   envoiceNotifies envoiceNotifiesNumber_UQ 
   CONSTRAINT     o   ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifiesNumber_UQ" UNIQUE ("envoiceNum");
 V   ALTER TABLE ONLY public."envoiceNotifies" DROP CONSTRAINT "envoiceNotifiesNumber_UQ";
       public         angelds    false    306            �           2606    174467 $   envoiceNotifies envoiceNotifies_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."envoiceNotifies" DROP CONSTRAINT "envoiceNotifies_pkey";
       public         angelds    false    306            �           2606    174394 "   envoiceTypes envoiceTypes_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."envoiceTypes"
    ADD CONSTRAINT "envoiceTypes_name_key" UNIQUE (name);
 P   ALTER TABLE ONLY public."envoiceTypes" DROP CONSTRAINT "envoiceTypes_name_key";
       public         angelds    false    302            �           2606    174392    envoiceTypes envoiceTypes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."envoiceTypes"
    ADD CONSTRAINT "envoiceTypes_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."envoiceTypes" DROP CONSTRAINT "envoiceTypes_pkey";
       public         angelds    false    302            n           2606    100825    grantRoles grantRoles_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_pkey";
       public         angelds    false    245            p           2606    100827 6   grantRoles grantRoles_roleId_dashboradPermissionId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_dashboradPermissionId_key" UNIQUE ("RoleId", "dashboardPermissionId");
 d   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_roleId_dashboradPermissionId_key";
       public         angelds    false    245    245            �           2606    149841    materials materials_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_name_key;
       public         angelds    false    292            �           2606    149839    materials materials_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_pkey;
       public         angelds    false    292            �           2606    117138    phoneTypes phoneTypes_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."phoneTypes"
    ADD CONSTRAINT "phoneTypes_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."phoneTypes" DROP CONSTRAINT "phoneTypes_name_key";
       public         angelds    false    260            �           2606    117136    phoneTypes phoneTypes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."phoneTypes"
    ADD CONSTRAINT "phoneTypes_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."phoneTypes" DROP CONSTRAINT "phoneTypes_pkey";
       public         angelds    false    260            r           2606    100829     postalCodes postalCodes_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_name_key" UNIQUE (name);
 N   ALTER TABLE ONLY public."postalCodes" DROP CONSTRAINT "postalCodes_name_key";
       public         angelds    false    247            t           2606    100831    postalCodes postalCodes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."postalCodes" DROP CONSTRAINT "postalCodes_pkey";
       public         angelds    false    247            �           2606    125158 "   processTypes processTypes_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."processTypes"
    ADD CONSTRAINT "processTypes_name_key" UNIQUE (name);
 P   ALTER TABLE ONLY public."processTypes" DROP CONSTRAINT "processTypes_name_key";
       public         angelds    false    270            �           2606    125156    processTypes processTypes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."processTypes"
    ADD CONSTRAINT "processTypes_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."processTypes" DROP CONSTRAINT "processTypes_pkey";
       public         angelds    false    270            �           2606    125299    provinces provinces_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.provinces DROP CONSTRAINT provinces_name_key;
       public         angelds    false    278            �           2606    125297    provinces provinces_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provinces DROP CONSTRAINT provinces_pkey;
       public         angelds    false    278            �           2606    149831    reasons reasons_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.reasons
    ADD CONSTRAINT reasons_name_key UNIQUE (name);
 B   ALTER TABLE ONLY public.reasons DROP CONSTRAINT reasons_name_key;
       public         angelds    false    290            �           2606    149829    reasons reasons_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reasons
    ADD CONSTRAINT reasons_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reasons DROP CONSTRAINT reasons_pkey;
       public         angelds    false    290            �           2606    125237    regions regions_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_name_key UNIQUE (name);
 B   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_name_key;
       public         angelds    false    276            �           2606    125239    regions regions_ordinal_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_ordinal_key UNIQUE (ordinal);
 E   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_ordinal_key;
       public         angelds    false    276            �           2606    125235    regions regions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_pkey;
       public         angelds    false    276            �           2606    117168 $   salesChannels salesChannels_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."salesChannels"
    ADD CONSTRAINT "salesChannels_name_key" UNIQUE (name);
 R   ALTER TABLE ONLY public."salesChannels" DROP CONSTRAINT "salesChannels_name_key";
       public         angelds    false    264            �           2606    117166     salesChannels salesChannels_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."salesChannels"
    ADD CONSTRAINT "salesChannels_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."salesChannels" DROP CONSTRAINT "salesChannels_pkey";
       public         angelds    false    264            �           2606    166195 1   shopContracts shopContracts_contractId_shopId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_contractId_shopId_key" UNIQUE ("contractId", "shopId");
 _   ALTER TABLE ONLY public."shopContracts" DROP CONSTRAINT "shopContracts_contractId_shopId_key";
       public         angelds    false    296    296            �           2606    166193     shopContracts shopContracts_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."shopContracts" DROP CONSTRAINT "shopContracts_pkey";
       public         angelds    false    296            �           2606    117033    shopRequests shopRequests_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."shopRequests"
    ADD CONSTRAINT "shopRequests_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."shopRequests" DROP CONSTRAINT "shopRequests_pkey";
       public         angelds    false    258            �           2606    125189    shops shops_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.shops DROP CONSTRAINT shops_name_key;
       public         angelds    false    272            �           2606    125187    shops shops_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.shops DROP CONSTRAINT shops_pkey;
       public         angelds    false    272            �           2606    149784 (   statusProcesses statusProcesses_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public."statusProcesses"
    ADD CONSTRAINT "statusProcesses_name_key" UNIQUE (name);
 V   ALTER TABLE ONLY public."statusProcesses" DROP CONSTRAINT "statusProcesses_name_key";
       public         angelds    false    282            �           2606    149782 $   statusProcesses statusProcesses_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."statusProcesses"
    ADD CONSTRAINT "statusProcesses_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."statusProcesses" DROP CONSTRAINT "statusProcesses_pkey";
       public         angelds    false    282            �           2606    117153    storeTypes storeTypes_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."storeTypes"
    ADD CONSTRAINT "storeTypes_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."storeTypes" DROP CONSTRAINT "storeTypes_name_key";
       public         angelds    false    262            �           2606    117151    storeTypes storeTypes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."storeTypes"
    ADD CONSTRAINT "storeTypes_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."storeTypes" DROP CONSTRAINT "storeTypes_pkey";
       public         angelds    false    262            w           2606    100833    subModules subModules_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_name_key";
       public         angelds    false    249            y           2606    100835    subModules subModules_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_pkey";
       public         angelds    false    249            �           2606    174377    taxValues taxValues_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."taxValues"
    ADD CONSTRAINT "taxValues_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."taxValues" DROP CONSTRAINT "taxValues_pkey";
       public         angelds    false    300            �           2606    174379 #   taxValues taxValues_taxId_value_key 
   CONSTRAINT     l   ALTER TABLE ONLY public."taxValues"
    ADD CONSTRAINT "taxValues_taxId_value_key" UNIQUE ("taxId", value);
 Q   ALTER TABLE ONLY public."taxValues" DROP CONSTRAINT "taxValues_taxId_value_key";
       public         angelds    false    300    300            �           2606    174366    taxes taxes_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.taxes DROP CONSTRAINT taxes_name_key;
       public         angelds    false    298            �           2606    174364    taxes taxes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.taxes DROP CONSTRAINT taxes_pkey;
       public         angelds    false    298            a           2606    166217    Warehouses unique_name_shopId 
   CONSTRAINT     f   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "unique_name_shopId" UNIQUE (name, "shopId");
 K   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "unique_name_shopId";
       public         angelds    false    237    237            d           1259    100836     account_roles_account_id_role_id    INDEX     l   CREATE INDEX account_roles_account_id_role_id ON public."accountRoles" USING btree ("AccountId", "RoleId");
 4   DROP INDEX public.account_roles_account_id_role_id;
       public         angelds    false    239    239            �           1259    149811    fki_Bids_shopId_fkey    INDEX     M   CREATE INDEX "fki_Bids_shopId_fkey" ON public."Bids" USING btree ("shopId");
 *   DROP INDEX public."fki_Bids_shopId_fkey";
       public         angelds    false    254            _           1259    158149    fki_Warehouses_shopId    INDEX     T   CREATE INDEX "fki_Warehouses_shopId" ON public."Warehouses" USING btree ("shopId");
 +   DROP INDEX public."fki_Warehouses_shopId";
       public         angelds    false    237            �           1259    174535    fki_cat2s_cat1Id_fkey    INDEX     M   CREATE INDEX "fki_cat2s_cat1Id_fkey" ON public.cat2s USING btree ("cat1Id");
 +   DROP INDEX public."fki_cat2s_cat1Id_fkey";
       public         angelds    false    310            �           1259    174483    fki_envoiceNotifies_shopId    INDEX     ^   CREATE INDEX "fki_envoiceNotifies_shopId" ON public."envoiceNotifies" USING btree ("shopId");
 0   DROP INDEX public."fki_envoiceNotifies_shopId";
       public         angelds    false    306            �           1259    133562    fki_shops_shopRequests_fkey    INDEX     Z   CREATE INDEX "fki_shops_shopRequests_fkey" ON public.shops USING btree ("shopRequestId");
 1   DROP INDEX public."fki_shops_shopRequests_fkey";
       public         angelds    false    272            �           1259    133568    fki_shops_status_fkey    INDEX     M   CREATE INDEX fki_shops_status_fkey ON public.shops USING btree ("statusId");
 )   DROP INDEX public.fki_shops_status_fkey;
       public         angelds    false    272            u           1259    198938    fki_subModule_ModuleId_fkey    INDEX     \   CREATE INDEX "fki_subModule_ModuleId_fkey" ON public."subModules" USING btree ("ModuleId");
 1   DROP INDEX public."fki_subModule_ModuleId_fkey";
       public         angelds    false    249            �           2606    100838    Accounts Accounts_personId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_personId_fkey" FOREIGN KEY ("peopleId") REFERENCES public."People"(id);
 M   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_personId_fkey";
       public       angelds    false    226    216    3146            �           2606    100843    Accounts Accounts_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 M   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_statusId_fkey";
       public       angelds    false    235    216    3164                       2606    101261    Bids Bids_brandId_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public."Brands"(id);
 D   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_brandId_fkey";
       public       angelds    false    254    3197    252                       2606    149806    Bids Bids_shopId_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES public.shops(id);
 C   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_shopId_fkey";
       public       angelds    false    272    3238    254                       2606    101271    Bids Bids_warehouseId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_warehouseId_fkey" FOREIGN KEY ("WarehouseId") REFERENCES public."Warehouses"(id);
 H   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_warehouseId_fkey";
       public       angelds    false    237    254    3166            �           2606    100883 #   Dashboards Dashboards_moduleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_moduleId_fkey" FOREIGN KEY ("ModuleId") REFERENCES public."Modules"(id);
 Q   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_moduleId_fkey";
       public       angelds    false    222    218    3140            �           2606    100888 #   Dashboards Dashboards_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_statusId_fkey";
       public       angelds    false    235    218    3164            �           2606    100893 &   Dashboards Dashboards_subModuleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_fkey" FOREIGN KEY ("subModuleId") REFERENCES public."subModules"(id);
 T   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_subModuleId_fkey";
       public       angelds    false    249    218    3193            �           2606    100898    Modules Modules_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 K   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_statusId_fkey";
       public       angelds    false    3164    235    222            �           2606    100903    People People_genderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_genderId_fkey" FOREIGN KEY ("genderId") REFERENCES public."Genders"(id);
 I   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_genderId_fkey";
       public       angelds    false    226    220    3136            �           2606    100908     People People_nationalityId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_nationalityId_fkey" FOREIGN KEY ("nationalityId") REFERENCES public."Nationalities"(id);
 N   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_nationalityId_fkey";
       public       angelds    false    3144    226    224            �           2606    100913    People People_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 I   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_statusId_fkey";
       public       angelds    false    235    226    3164            �           2606    100918 %   Permissions Permissions_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 S   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_statusId_fkey";
       public       angelds    false    235    228    3164            �           2606    100928    Roles Roles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 G   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_statusId_fkey";
       public       angelds    false    235    232    3164                       2606    158144    Warehouses Warehouses_shopId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_shopId" FOREIGN KEY ("shopId") REFERENCES public.shops(id);
 J   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_shopId";
       public       angelds    false    272    3238    237                        2606    100938 #   Warehouses Warehouses_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_statusId_fkey";
       public       angelds    false    235    237    3164                       2606    100943 (   accountRoles accountRoles_accountId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_accountId_fkey" FOREIGN KEY ("AccountId") REFERENCES public."Accounts"(id);
 V   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_accountId_fkey";
       public       angelds    false    216    239    3128                       2606    100948 %   accountRoles accountRoles_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_roleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Roles"(id);
 S   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_roleId_fkey";
       public       angelds    false    232    239    3158                       2606    100953 '   accountRoles accountRoles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 U   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_statusId_fkey";
       public       angelds    false    3164    235    239                       2606    117184 '   affirmations affirmations_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.affirmations
    ADD CONSTRAINT "affirmations_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 S   ALTER TABLE ONLY public.affirmations DROP CONSTRAINT "affirmations_statusId_fkey";
       public       angelds    false    3164    235    266            !           2606    190741    cat2s cat2_cat1Id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.cat2s
    ADD CONSTRAINT "cat2_cat1Id_fkey" FOREIGN KEY ("cat1Id") REFERENCES public.cat1s(id);
 B   ALTER TABLE ONLY public.cat2s DROP CONSTRAINT "cat2_cat1Id_fkey";
       public       angelds    false    3309    308    310                       2606    125325    comunas comunas_provinceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT "comunas_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES public.provinces(id);
 K   ALTER TABLE ONLY public.comunas DROP CONSTRAINT "comunas_provinceId_fkey";
       public       angelds    false    278    3254    280                       2606    100993 :   dashboardPermissions dashboardPermissions_dashboardId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_dashboardId_fkey" FOREIGN KEY ("DashboardId") REFERENCES public."Dashboards"(id);
 h   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_dashboardId_fkey";
       public       angelds    false    3130    243    218                       2606    100998 ;   dashboardPermissions dashboardPermissions_permissionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_fkey" FOREIGN KEY ("PermissionId") REFERENCES public."Permissions"(id);
 i   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_permissionId_fkey";
       public       angelds    false    228    3150    243                       2606    101003 7   dashboardPermissions dashboardPermissions_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 e   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_statusId_fkey";
       public       angelds    false    243    235    3164                       2606    117199    docTypes docTypes_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."docTypes"
    ADD CONSTRAINT "docTypes_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 M   ALTER TABLE ONLY public."docTypes" DROP CONSTRAINT "docTypes_statusId_fkey";
       public       angelds    false    3164    235    268                       2606    174473 /   envoiceNotifies envoiceNotifies_deliveryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_deliveryId_fkey" FOREIGN KEY ("deliveryId") REFERENCES public.deliveries(id);
 ]   ALTER TABLE ONLY public."envoiceNotifies" DROP CONSTRAINT "envoiceNotifies_deliveryId_fkey";
       public       angelds    false    304    306    3300                       2606    174468 2   envoiceNotifies envoiceNotifies_envoiceTypeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_envoiceTypeId_fkey" FOREIGN KEY ("envoiceTypeId") REFERENCES public."envoiceTypes"(id);
 `   ALTER TABLE ONLY public."envoiceNotifies" DROP CONSTRAINT "envoiceNotifies_envoiceTypeId_fkey";
       public       angelds    false    3298    306    302                        2606    174478 &   envoiceNotifies envoiceNotifies_shopId    FK CONSTRAINT     �   ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_shopId" FOREIGN KEY ("shopId") REFERENCES public.shops(id);
 T   ALTER TABLE ONLY public."envoiceNotifies" DROP CONSTRAINT "envoiceNotifies_shopId";
       public       angelds    false    272    306    3238                       2606    101008 0   grantRoles grantRoles_dashboradPermissionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_dashboradPermissionId_fkey" FOREIGN KEY ("dashboardPermissionId") REFERENCES public."dashboardPermissions"(id);
 ^   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_dashboradPermissionId_fkey";
       public       angelds    false    3180    245    243            	           2606    101013 !   grantRoles grantRoles_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Roles"(id);
 O   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_roleId_fkey";
       public       angelds    false    245    3158    232            
           2606    101018 #   grantRoles grantRoles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_statusId_fkey";
       public       angelds    false    245    3164    235                       2606    117139 #   phoneTypes phoneTypes_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."phoneTypes"
    ADD CONSTRAINT "phoneTypes_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."phoneTypes" DROP CONSTRAINT "phoneTypes_statusId_fkey";
       public       angelds    false    3164    260    235                       2606    125300 !   provinces provinces_regionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT "provinces_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES public.regions(id);
 M   ALTER TABLE ONLY public.provinces DROP CONSTRAINT "provinces_regionId_fkey";
       public       angelds    false    3250    276    278                       2606    117169 )   salesChannels salesChannels_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."salesChannels"
    ADD CONSTRAINT "salesChannels_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 W   ALTER TABLE ONLY public."salesChannels" DROP CONSTRAINT "salesChannels_statusId_fkey";
       public       angelds    false    264    235    3164                       2606    166196 +   shopContracts shopContracts_contractId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_contractId_fkey" FOREIGN KEY ("contractId") REFERENCES public.attachments(id);
 Y   ALTER TABLE ONLY public."shopContracts" DROP CONSTRAINT "shopContracts_contractId_fkey";
       public       angelds    false    286    296    3268                       2606    166201 '   shopContracts shopContracts_shopId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES public.shops(id);
 U   ALTER TABLE ONLY public."shopContracts" DROP CONSTRAINT "shopContracts_shopId_fkey";
       public       angelds    false    272    296    3238                       2606    166206 )   shopContracts shopContracts_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 W   ALTER TABLE ONLY public."shopContracts" DROP CONSTRAINT "shopContracts_statusId_fkey";
       public       angelds    false    296    235    3164                       2606    117034 (   shopRequests shopRequests_accountId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."shopRequests"
    ADD CONSTRAINT "shopRequests_accountId_fkey" FOREIGN KEY ("AccountId") REFERENCES public."Accounts"(id);
 V   ALTER TABLE ONLY public."shopRequests" DROP CONSTRAINT "shopRequests_accountId_fkey";
       public       angelds    false    3128    258    216                       2606    133557    shops shops_shopRequests_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT "shops_shopRequests_fkey" FOREIGN KEY ("shopRequestId") REFERENCES public."shopRequests"(id);
 I   ALTER TABLE ONLY public.shops DROP CONSTRAINT "shops_shopRequests_fkey";
       public       angelds    false    3208    258    272                       2606    133563    shops shops_status_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_status_fkey FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 A   ALTER TABLE ONLY public.shops DROP CONSTRAINT shops_status_fkey;
       public       angelds    false    3164    272    235                       2606    117154 #   storeTypes storeTypes_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."storeTypes"
    ADD CONSTRAINT "storeTypes_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."storeTypes" DROP CONSTRAINT "storeTypes_statusId_fkey";
       public       angelds    false    262    235    3164                       2606    198933 "   subModules subModule_ModuleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModule_ModuleId_fkey" FOREIGN KEY ("ModuleId") REFERENCES public."Modules"(id);
 P   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModule_ModuleId_fkey";
       public       angelds    false    222    3140    249                       2606    101023 #   subModules subModules_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_statusId_fkey";
       public       angelds    false    3164    235    249                       2606    174380    taxValues taxValues_taxId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."taxValues"
    ADD CONSTRAINT "taxValues_taxId_fkey" FOREIGN KEY ("taxId") REFERENCES public.taxes(id);
 L   ALTER TABLE ONLY public."taxValues" DROP CONSTRAINT "taxValues_taxId_fkey";
       public       angelds    false    300    298    3290            �   e  x��VYo"�~�_����H���y�1.���/�])L���(�=��I��'�ԣ�(�����s+�zͧ~%�����-f.��;��.6�ʰ�4{��`I~�d�v����Gb>b�1�/�h�`�:�{M:O���	Ջ�]�9�[����|	�dթ����%؛�4?OK3+�,/s�AFAWH]R���u��u����FS�(I�%Ǟ�1!hk�r�+m%�9�4pg��TJB�vH2��h�G�����`�F�/���3"�eF(�PT�3�P��+� T��V�Sg,�@i�k���Xi��Iq��3i���2�,A�ٓj VrD�!�Sk��HE���(�5���"8��{&�UBX�0��&�	��{���«H�ER:���1b��(:"��PA�=�� )��"�h	�\C�!�	Q���R�}0 �}�A����J�F����H�ǀ8W4h꘰�D7���Fx-��w�C�,�H�`�0G��q�j V'#s1RFx0'V��u�L/���a�2
S���c��sa���R,�$)����jK<pc��ZyL��3�a���|G�\x��!�:���BNC�$`!�"J�� ���� -���!��У@#s��J��5P3�l�N;�`
�C7��l�r1���],L��EcYμ����_��!���\��1���2K�3ز���"�N%�x��x�J�k��j��äh��x��k̓P8S~��7����yW5�j�&��o�]_U���Y����E�YmO���(<�g����?�ڍ�ܶ��9��8�����u��,g�R'D�t���Gً�ío��ӟ20>Zr8������6��~����������8��/l�����Z���s3�o�DoN�]9ܜ�ٖ��rx��������>o���1�=�{�:-��K��s��������s��-��f�:o�c|Ln��>b�	��u6���j�Lg>���U�noٰ>�qm��y[�m|(�O��~u3��=ӟ?��{��B��4��yzdg]���6��mo�_���|4�r���;�������縆p�5>k�w�_���� �������?NV��z���,M�T����>
����Y�!:��Ű}<�;�x�O=��@��ߕ�)��9��c��nW�֮SN�;;��pw�������ȇ��V[8�/n�b�p]<�k�>��S��+X���j������~,x~~Uo|�Lղ����Ac���i�c���!Y,Z���Oy�a�Jغ������:�#�FE�2�3���Oa^����5�M7��j�������fٜ���$w2֯�ͣhw�ƭ22�}��?�]�(��ӗ���S
	�����Ç<�       �   �  x��S�j�0}�W��(AR����X d�I���Y�b�#��HJ�j��ە�.)+������9�ܫk��j=�ܠ�j�u�9�F�}~�����k>!�}��\��F�Z{��7[cE�˨e\䂠�DVo��W�Z���������h{��h۝A��R���4,׷؊��	>�i���G2\��A�$��5
'��ԅ�G�����=N:ژܫ\�B��e�Ύi��}h�5��{`ֶu��*�� �Q
�� ��dp�;xN��"��� ��t	C���I�����j<+ގ���Rx�8�tH�C��$�q:bq<���)tu�\����-A]��M�?@�Ϳ�����a[b�0n����!AX���Y�.��Z[��y7X<�)	�O����������!L)]m�����$N��h���N�g���E�u	ߍj���6۬j���a0�L?¿      �   t   x���v
Q���W((M��L�Sr*J�K)VRs�	uV�0�QP.I��I�T2��t�t�,-�L����MtL�KjZsya�А��҂�T��e4�191%3�2��� |JL�      �   �   x����
�0�{�bxc��67�v�i��t��P�ׯ��c^�͏�|'I�x��$ͷ�r-��t�5�Ořw�7�a����y6@6�6�0�Ё��(�^�aD�2�@b��.J��V��9>�c��J>&4_ɇ���cbn����)	��0	�C��	�!
�M����P���&�~�o�A���*������R�      �   f   x���v
Q���W((M��L�SrO�KI-*VRs�	uV�0�QP���M*JU���t̀H��������R���7! �i��I�uF@c|K�R�(��� V4      �   �   x���v
Q���W((M��L�S��O)�I-VRs�	uV�0�QPw��+)J,�/V�Q0��t�tM�����L-�,�uL��JjZsyc�	�ǜ���ԼT:Y	�" ,����O7kM����$�d� ����Ɛ(M�L/-z���<���� ����      �   q   x���v
Q���W((M��L�S�K,���K��,�L-VRs�	uV�0�QP�KLK��FF�f@�`dhebned�gf`�k`B@VӚ˓xk����V�%�e�%Rj1 rh;�      �   �  x�Ֆ�k�0���!�n0C��Mv��1ܘn��Cղ	���M�ߗ��fL��m���G�^��h�<F�p���|�̧?��,�1z�=�F��g7��q�ٛ~}�++��t �TwC���u���l/�R�(�0����A߶x������b��7��xe��ʾ[m6��s����y���:�zx&�%������]�v�S�@3v�������h{���(Ä��0;Ǵ=vD3v|�%��w۩��ؑ��	�.;5�;�;ڦ^"Y�S����T�x��(������*^-�U�Qi���j��B(�p8H>i��:�W�ݯ}�糽�4ZOp�]��0|]=5�?���S��0Q�ਨ;i��ϥ�8n���H]�:n�=pq�
PQ�����Qjv��	��!g��:����� �0j      �   �   x���v
Q���W((M��L�S
H-��,.���+VRs�	uV�0�QPwL/JMO,R�Q ��t�t�����,�L��uL���jZsyk��(���̴�d�Zl4�(R�SB_�M�Fy�e�f��^S�Q.���`�Nsq ��2      �   
   x���          �   {   x���v
Q���W((M��L�S
��I-VRs�	uV�0�QPw��-(JL�/R�Q0��t�t���L���L,uL���jZsy��h�cJnf^fq	�5����J�� b�R�      �   L  x���MO�0���
ą��|�'�ZZ����x7n�q�8��w�l�4���EH��x�wr{w��������y7�%�.��A6��$-�8�~�������K�#��I˭�-o�}���_��pv�?��-�C��a+�J� ���]#C� �!�.p1�xU���}�⠌Pzh�	�����3k�|�*$F��*�����SD�r��Ȑj��Wg�^�"��т-�{�0qN�E����rY���\�2E�,�� lL� ,��~:i���%�i��=���Z}L��Qrbd�0�2�XBi�R����Ѱ� �yY֧@2�^e�N�04b���e��}���T�D��W�����F�;�Y���n?JG z:Q0螢5hF:�N@!Rq<V��<�\W��U+W%�*���d����n�&���������<�{+�<d?��_{��+���'cS�X�����������(�1����`���&'c��b&��0j|=9E�����}��Č_��u�jB�?c�{�j��(����R�
mN�̽W�9(m"j޶�	.���Ln6��{T$���*-"3;�����mf�f󂊁e��kH����QL�?���!li�c���V%��p'/��lW: 	��^����p\B����`�Va��^'Ɖu
,�q�g�!�G C~Dpk��w2ܟ�HJ��媾ӭZ���7��0�C>�%^J3�IPFi�\���d��ګ&���Zp*��5G�e������qo���X��Xɞ7CpM��f�#�v������os�{��k�([ma+	ǂp��o�����`����F"i~�4I��HcG���1g�a      �   d   x���v
Q���W((M��L�S
.I,)-VRs�	uV�0�QPwL.�,KU���t̀H��������B���\������5�'�M��K��}\\ ��4�      �   �  x���K�\������(�A�H�c�I^ v��*���I�� ��\�	$YV��l���KV}u��g�~����y����y�.^���w��m�y����͟��?}��ͯl~}�$^>�w�����~������]�z|�E&��dO�oڼ�z�z��Oi������ǒ7��_���o�{�~t���0i��<��R��U�2g�C^�]Fuϱ�NE۬�k�Gp�]���ٛS�P6��SC���f�(��Ƀ��C%�u��L�T�LnC����<y�
{Q�%b[#{F#�����W���c���,�^-|@�l�y�Y�6�#S�h��fQ�g/��>j��ӌ���V�?>d�R�1���L
�U�P����\(�a��@'*H;f�L��\�^���y����CU��_O~�������Z�����_�F�[w��	l~��!6}�������XGP�v���Qj_������h?�F99�+.>�Z���LrVx�4O�}m.k��։
��!��i�j��Xɺ���	MA��H98���3؀�X+����Wxo-ۦ\x�n7Q6W0sO��u|���4p)�@���J;%#0&�o��i4	��i�� ;��もqH|UT��U�U �7`�|�1�>'j��Y����#�:qe��ǧo�~�F[S�b�n>��~����o�o^|���|gl�f�Տٙ��䐍C����0�0|����=���ꌶxa���*��T� |��`-o�(0Y=(m����:J̫�cxVW�,ᴹ�w;P<�Eq/uC�*�:�g��W���s��	㠁It݉��70��O<Xf��%��@G|��H:zE[V��^����}��wM�N����C�KAn$1d.�w�r9��q	��~!�D�O(C��l6p`̕[��q߬�j��u\^�?�L�/f�����̼|�z�+>�ܳ����_�|�#x�R���3i�51]hgG��sc"��*΁Sq�DSa�/Zɘ�j��#��t�(�V'���/���͠%	A�\k�|	��ё��	D0�5{m݅���U��"�Ro8�c��z�`��Mׁ�嵧���1�kמ췞ik,���t^�pZ5�!
�C]�����	���A(��t�/.jc��p7 �8B�����D4���K����P�a��܊3��TN�'x�	��e�8����qW��q�l�9r������Ir>^������#'�"���b�8j��|`��v-�a��0(��G�Pӫ�pw�#���G���]�ɣ�� ЅS�
�j��ʵ ٥f}:��)u�0!5��)J���da�'��Dtd.<�2�`�����ն�!� E�MI��5���L��i�2��fb6�_sou�$ʵC�5G�vIV\�;Cz*k㕯  ����9�/6��	��pc�.Ps��f�`[;4�o� ~ ��t��8�!9�cr�S� ��#���fwF:�/����C���}ǂf|�c$��]eM�bQ׳k�K���{��J�3A��gGGR!��ě���i�~l!�#�)�̍Ԍ�t W��s=b���~ �xm_�|�ɯ��8Ϭ�}�H������h�[b�s�HX�$o�}�Y�(>"�4p�-LN�dE1$0Q5�
������08�	RG��{qz������M�熅v�,@����UpD�QM��6���4���^��Z���������7ⴔ7      �     x����o�0 �;�������x�m�41ieݡ�!�D
	
�iB���P��h+��Q� ���??��]u��I���L&�,��[R�Q1��i@���ڹ"o��H�C1��	�h�Y�d�䌳6�یƌ�T)�f����"$YfC[�2h� +\�\���x�'.�ҡ�.\4OƏ�:�Q,}h>�e�R����>-�[=����7��<L����ݘf�����F��xH��F+�����n�dT��~z?���w����]*���k	���F�O=TŃ� �R�8
��={wMn��K��	��&�57߇FWi �Fj
 ��N�u�|?2NXũӑ�����^t�a:5��ME(p���� <��<��@S�O5{�9��DNd��[axH�TU$�:t���Tl��Ș�
�:H�U���S)�N#�db�dC��C�T��l~����1N��<{��z�=�����������f�~�y���scб�2s>�M maDl�Q!�o���eH��i:+��m�ZN��:}Hm>L�����v�+ ��r��f��N�,V܉:=FETFX�]͞���8a���:(n@�:����t*�۸Z	S^O����K�/�����5?\��j      �   �   x��ѿ�@��ݿ�p�@���w��� ��Z{IC ��'8�i��tp���{/͊$/I��G�l����������Λ����y8%٘8$hxH�{C0`��@�o+�R:��۝���j�i��jz5^SE�����]V~�AiQX�(�j�Nԅ,�X5�ƖK���f�u!�;6�c�&řaq!*:�L��r�����NT�z�j��      �   
   x���          �   0  x����J1��}��Ua[�m�'=�[�O��%�d�$ڷ�z��ŜUQE<��00�7��/V��5��%4ۍ�z�Ue��l9$x��}���lT@�2�|C{��OLlKp�5Fy"W�����1���fmvа�������P4��Q�~ݾR�j�.�����T����b�&����׽�/�J!�)�ۀ�1j1�0Fv��T�,3��NK�jJٶ/���M��Fwd��n�on�����4]_ґ�#O��.ÕQ����e,}�%caaj��ɝo��#`�ƽ�+���<      �   �  x�Ֆ�K�0���+B/*��}��fM<�x�]�C��U�
�����Úe�òC/y����m�����Ս��\����x4�YYf���|R������ɵ��t_�<��?;����h�=�Ѡ��Ӭ,��}�U� ~��xt6���b\L�Y�8�׺4&����&��tzkF7���%#ٛݡ�W��YYH%k�wh@x܆��%���z¯���Sh���G�8/37V=���ɜhE@g�e>������k�BU�F�Fj�8�4@�" k��Β��k�� I;] �M=�b�!E��x�my��"�b"I�_D�������Y�y���u`!�R�!U'{�Q"��C�x�!m�C�ろM��j��:]_�pf�?hH�"K��>84@�jIbsT�_���Dt:�ehS�      �   D  x���AN�0E�9�wm%Z9I�&e5qjaّ�T*;�
��2\����RRش��+K�d�˟�ʢqD(�������yuzz�$�-Z2OoȬ�5���8�7��ݑь.i��kB���R�be�����m".�g���A���@�2D�X�� ��pfCz��$�?c0X_����Ax6�x��S	�ȊH��eo+N�a��i,z�<�Vn�߷���r܊|	��]���oµi:  �F9���5�{�u,�� w �B)�,�&�c@�H�<����\+����@�b�Gxl�tf�LC0�c��Iܵ �R�M��I�p/�      �   l   x���v
Q���W((M��L�SJ�L	�,H-VRs�	uV�0�QPN-*�L��W���t,t���L�H���L������5�'Q6�	(�O)M.��F.. ��7      �   �   x���v
Q���W((M��L�KN,1,Vs�	uV�0�QP�HM��WHT�M��W�Q����FF����
FFV&�V�zf&�F�&�hZsyr�Д�Ĝ�Ԣ����d}iI~Qfb΀8�h�obI*��� ��{1      �   8  x�Ŕ�N�0��<����V�I�T�"�B*�)��\���#Ǒ(�ԁgȋa�b�J���VtΧ{νi�[o���5]�h5���[�������&�}�D�����k�}��)�Oq��`��Ƴ�a�Lq�^����I/��Z�I�Ď{�U�1�$�V�I-전Z�Q@�GKÈ�JN�/���1U 
$71�a���
��TTp�4��4
I����k��T����4�~a��`xX�l����r�E����0��?�����h-��*�<s��B	�Em��l���a.��(�Ր�/���h��H��)���OY��%��      �   �  x�Ś�n1��}
�
E�毁S[RJJER��8x핽h߈�#���p`w%.h|�%��e��<gy�Y�ߊ�������V�z�Ň���b#����5xik�����j��/}����`~6��l�b��Ȇ��t2�Ƨ����/O��"��(WV*i��Q��<$�QV�L�f�I��?l��a���N�֩D�0�+�ʔ�a��ɛMN�7c�C1�l� y;L �A�BJ��m'qAК���5�&1�7]|�h�S'���@z4R�NC�\H��?%�ۓ�ly�� �E�H�3��� H��zq/*�.��EēB޼��[c7O� �6����b��}*�,��(�;��" y�Gm�� k��¨Pߴi&L4��o���ٟ\�W(m�@�Jw�o� �7���=a�1Q��C��I�	�{��d��KDA�|�&G'Pc��oi�y�);�0Ȝ��H�S{rad����C7$�L,$�[���p��@���G�hȣ��(���dy�����sK�b�F�I��:�4� f��C�����Ya]���o�L4������Ȝ�cL݂ۇ:'�jLT0��M7�A���s���M��k�y']�H��rg}�(�6g�S���-2煆r�/;m>.
r���c���x��� �Wߛ�y�Lݸd�x������;���z�v��h������Vis��0	�C �Nʾ�	ˆB�\C��$���k
q��.�I�D8M��6SW~������S!�6/��{҃�����jL�@ڼv�`��;wv.�)��1�W�yHE1�˱W� J0���4�#�h�ݧ|.��>)��f8dz��Ƨ"_CY�$*D��[�W�p!�1��p��=ψC�����yW��Jw[Il�qA��K�8H�k4�﨓�`F�� ן�L��Y��z9��
C¦"��E����B89����,      �   T  x�ŕ�n�@�w����$�P�D��H�S��a�A&A2�oԱ����f#Tb�ݔH9��"������JM櫅:�	����j3��Ǳ����B��B}�Av���P��t�_���������kz]��a���V'jwè����j�["W�{܊��̰��h�.�8%r��p��y�,��?Zٱ̬ܡ��?ڡw��k�O:�f{�����3����ߓ���#�!�4�`�h��p>e�F��]JH*��+y�k��K0���'	�L³�����Fб�!���������t�u�#�9*I_e����%77Ȼ�zE�Ht�@���ǠV��+<      �   
   x���          �   �  x�ŝ�nG��y��ep�CJ��I�eK�>�# {+����L�=��[!���>��:/�]U=�����`a,��������˛��Mqy��-q�l�c��RW<�\�t~_�m����$؊�U���Mf�&�&�b���t������x��?}���������Cg�wΨ��[�!�e����5�\qE�g����Y�>$t���������V֧.Q��;���{���ϼ��(쒱�U{j��J�s)@;��nV�����X�Ͼ8q�o{�k��=i{��j�z^���sm>X��ġ��[o}�a�ͤ��{$�%�~��e�u��"/q\�\��k��ؙ⤧
�xc���T�;�2�f��4����	ÒY���)� �|	#�<{mM�_�5T}�RO�Έ�Z��sQ�K��7(X���ғd�潆����θ�BcZ��'��c�&��o y�FRWy,�?�9hJ.'r�Z#{l�s��t�v��8,��ٕO�N; ���B[�_�\��U>ن�����B�h��-�̂슊�,%Q@����MP#�f!�&��T�_��1[Eu�q�H1�l)l�O���|����,��KX:���G�Xn)q�����6���n�ꋋz�y,���e���u2�|pX�a��Ng�+
��a.��8kϤK4&�C�X��m�[ځW�ʞ�yכ-�P�b���*i1Y6��^H�QO��"mmz*��Y����p��#����b���X�"��n�$Q���Cg��,��X�H1�P�7X0˰_�w��+�6q�����W�t��\G��t5����E��4q�L�:��84K�sW�W�c8�\�B��E�Μui-~����}c���$fo��\X���Wx�c����%��h������%�{2�ZD8�4o�7��xճ�éм������.�f���f �j��łY����C;<%_�3��d�W������?�6�A� y��7���s�@�����H�.���ę�Z�1[N?<�$������Z�NsM3XH~Y����Xj�z�\�ik��k/U��rR?�z���/0�&{ ?��$Ԙ
��.W��9���ސZƸX��FV����R;M����h)>s��8q��b��@/�ͤ\�N��c�,ծ�(�U@t�<����.M��hX4|��h_�У�ڀ�Uv��t��j'���.�P ���y�Se�+T�%e�Uh�g`�vM�Im��}:a�v�ܰCr�M[���t2��r���W���"x���f���ݡṈ��
���R�w���+AwE�u��¥�����t�x�R������|�`�֦�EH��P�b}��=����~�óG�0�H�����6�4j@�6�ĭ��Lλ�K�K�Z����P��^�����٘�U�eK�GT��РM8�yܙ�;ӣ�^
:g��yvҮ������;O��|�g��zGMΠ �9��[���T�l��'|�N�u�z������`,�|�r�Z��K��P$6����U�Y�m�QM��Iҝ�����g��\�J$YJp��)�ьz�g��H4�5���A? ��!�m 0\��k���������%]׾��Z�@4�[g5���kf��ۿ@�J7A�	8Og]��2M�
����5z�+�U�>��P�v���$-.�����_��H����"��B�UON������V0`��B:�Y��,�8}���,����J��Q�:-�E�%c��t�V@9�������H��.��w�a��xp�N��u�X D��Ym�F��!�Q�,[g�5RF�16��%�G�����.*$\�bz�*�KX���H���K� �*Q�6-�g1�JҔ��ͩ�\Dr4<Ki��6Z�6����l1���`$XZ�sx	�eqv���=H�J�:Ў�7���E�sgӢ_���}����mn;�.dXU�T����
�:�d��h�\��D�}F!�. X󟽕JQ$xL��K�	`���7�-���E�Y��l�6��4�H���b����m�t���b��t${��*I�<hs0�\Id�4]e�;UÔB�^�z����&1-r�G�����=ʶ3g��W$~t=��=Im	βmCN�YH.˴�0ZƸ���x����H�]}tvѳI�8��n<�@�jf��qB����FR�H��r�0�N`���䱯��o�He<�ti&M'i�Wh��S���F���@Z*�����nk����x��]���.=դ@ek�S	giv�^�* ���lIW��2p�h���.�kAҳm�Sq:<%0��4lb��+#�,�~��Ή�:ҧ\Y�� gӱ7�^\m}�p��$&�X��;I֎Pr��H��2�u�-�,��:L�]d߃����ΕJ܎I��O16P�S���~9���G k�h�Ǖ��it9���h�ԛV��2<�`��t�`��� 2��o?F�{W�pm$0�8I�F�ë�o�O��7�� ٌ��m�� �,І_��?���x����<�{��	��Ux�7��qh��w�l�������Om�=f�8��<H�h��������8i��n)�_
��W����'�~�b��A6i&�9���F��N�0�%p��-�L�+\����9k�r�6K&a��Y��uph0K���)����$��a+�o�`;��N��U mnm���[@����>[�.p�#���K`��M�9�-��*�@Zφ��6��}��_�/�t���<a	Vk��D
��:��$�f��_�W���z�h4����v�g|W��H���|�R��7$\oc��P�]���x�4JL��ᣵV%5�c�ti�alC��Ԁ�F��ǋ��)V���f�M���`��8Á�{�δd�K��M [G��g"J���-�H�
�ܹ0�ȭ�o�.Dr�@_Q-�4$�����ޢ_6K����&*iN$;_[�r��㋺ҥa�����<s$Z�7b��7�Ƴ��\Q�S��e�l�y����(W��ˋ�%�"�*�؏9�i��ۮ���s7xd����.e+�'�x!���k-1Pt9ѫ�>F�v�|�:���<��֔�i����h�ӌ�V$z�Jg�U{�R���m5�4�5"��6�Ӓ�ƀD�P{L���p�m� ɖ��/9���;	��:��-AH�N�L��s�h��E�^�
�`|���t�'ς���A�4X/V9]�u���%����y����l�� ~�if$y9�ܤ���,�dL����EG��_�>�l������ޒ�ɑ9�s��N���3�\D����d�}H�d?Ӻ5��'j���a��t��Nˑ`��i����e6Vyz7�auZ�4�{[׶��li"���KS,���$Ͳ��<�r6F�Lء�&�	�E�W}2X��,_bk���ixր��{؇��k�{��e�c�p�۬����N-N���/ �,��`�K�$�iKH�j�|�����6���F�s���i-������6�h��	��Y����A�u�7����qN��I��%I�����#|�� X�?      �   b  x���MK�@��}~��M�r��w]�� Ul뾵�����7=C]
����x�ɛ���r5\��r}o>�vo��t��������x9�w}�>��y����W��N�N�����[����L�4Dۊ�~���Y��V�u]�v@��@=�@���۔���A_~���Y�K��
lJg�bhJh��&�]6%5�asZ�9�E����yh��6���Қ
lJk:$Y�i
�Қ:ؔ����`sZ��j-�洖asZ+�)�9�Mi��eRkNas6�6�5�asZ�9�ߵ�j-�洖asZ+�)�y�Mi͟*Rl^+N�ͻ�s�|�9���s�;�,+�TqNp���J�9�R��i�.[�      �   e   x���v
Q���W((M��L�KI��,K-�L-Vs�	uV�0�QPq1T2��t,u������L��,MuL�jZsye��:#J��� �^4�      �   v   x���v
Q���W((M��L�K�,.���L���,�L-Vs�	uV�0�QP���MM�L,ITr��t,t-�����LM�tL�jZsyo�а��"� ��)��Z�� ��=P      �   |   x���v
Q���W((M��L�SJ�O�,H-VRs�	uV�0�QP
Q�Q ���t,tM�L��@���T��D���5�'Q����}�@s\�<�f�	М �`� ��W*��� ��h�      �   Q  x���Ak�0�"��mx/yIMv��0L�e��\����ﾺ⴦2��I���G��hp?f�p|�����r&x��,�Y1\��ײ��lҿ}�ؕN&���*a]	R�,��`��@݄�*|������-/_�Ä/�ow<���.��|]�bO��S�D�aC�)&�S��
��{�"��N�J�C����5�H(k�5�4��;�(ۣ���}���9K<���AƯ�j�H���i ��'��~�̅y;KC8x�T���+�(�d;����d�}�~g�&����� ��=�������C4�D��#�ʪ+�}���Z��|ϴ��      �   o   x���v
Q���W((M��L�SJ�+��LN�,H-VRs�	uV�0�QPw�O�)IT���t,u�����,���,,tL�jZsym��,����"�-�� Ma9M      �   >  x���OK�@�{>��K�2�ݝL��C��V�*�E�?�߷Y��A�%�~<2�2m���!L��mx�z<??�������������7w�}�H�}��\��tb]oAdu-�*�u������j�����aE�hmH\q�9���H9���Ҹ$���I#���{2�R<��ɘ֞[=�X��ɘ֞���ړ���)�>����>��>(r�ǰ���>VvR�di��D<%���H&a%2�u|��X�-"9H=��$ �:sL��\1�S���b�VO-&9�S�Iz=��$�G�)ͣܔH���X�v�cA�[>^���O�4�7��U�      �   u   x���v
Q���W((M��L��M,I-�L�)Vs�	uV�0�QP�MLI-JT���t,t-�L�L�,,,uL�jZsyc�И������|�Xh4�'1�b�qq ��P�      �   x   x���v
Q���W((M��L�S*���K�,H-VRs�	uV�0�QP��/��Q�Q ���t,t����L���̍�uL���jZsyi��$���D:Zi4�5��(�*�rq �SG      �   
   x���          �   
   x���          �   �  x����R�@�{��:�`dY�T�1�g8ء_dž��N�$��E�t�A/��=�I��;���O{��߿;�Y���f~��5u��lyR��l}Y5�~��6[��#s8����##�y�g���8+LV�����f�Iί���������9Ғ��T��r��Sg�����8p��fά�b�%���d�}�Ӗ]�!~�R_0��#�Cj�=�H�;�Sԭ.p艠9g��w,y�q�/5e ��܁j���ki����R��Rҿ�ɲ��Ƒ�Tf�[�ɒ�?@�]��L��j�la-�6���h�׎�,ݘH�hي����� �O����ٺ�������E^.�vO�fI�x�pT�C��zd�z��W_	��&[������ۛ${�j���E�-5�&�6ѷ�-�K*wT5Mc [�M��~`~rm��O�d3ͽ���:�U�:�Aլ"ɹZ(O��0�1�Hn��>�D�:�,�va������S=Y��.m���x��'�\��IҺ�Ӥ�C��^�lR���ޥm���r�#yޑOI#���vօ�U��AG���#�=�NgjP�H�m�h�Hڒ�4Ymj��U�5p�R$�V۶�f�E�JZ�;��o�p��l�br�1�B�O��q޿�֖d���8Tݷ��#�.Z��U�2�r檫�I�~����k�#�YSs%��q� �3C�      �      x���v
Q���W((M��L�+JM,��+Vs�	uV�0�QPwK-.�,�LILI-V��t,t-�-�L���uL�jZsy��h�kqIbrf~^b,4�
�11%�brq `�S�      �   �  x����n�0�w��6Z�E��B�j#��"�KpSK�Ngh߆�C�!/�s���T^28����9^n��-���
�*<�i�s%K�M���n�wНj�!|�j.1S�t�����x�����7���I��B:�~���_b@:[�X`V��h�����Qo�c�&��-�`���: �H}T���������CQP�y��ݱG��`F�B	nP"lP�y�z�,�1�$<e��Aixb�i0cZ�>(X�3�s.˦D�F#�5�J�����Hh�UZ�Յ�nWa�0�Xe(�skɽ� �LT	kJ���ޡ)�����Z�;v�yYK���sB�ZPDqZ�������X��8��G�(JV�SIKCШHS����g������_C���-&��      �   �   x���M�@������*�Giv�� ����M��]������Cx�wx��,�Ӫ�,o
��':�T����(�Ȕ	���Hk�l�*�QA-�aݱl���'>qH�IB��{
<����t6���5�E�(Q*�)�ϸ�D�a�,ܩ|�<1�mlkX)$��z��eսtbD���F������      �   �   x���=�0E����[�Д$���I�� U����Ɗ�6�6u��):��\x�w��z�|��{w�����L+��iv��6+`0��3�lx�r�)�		�$Gi�q���'^���z�PN(CPis�ꪪ���B�G��>���<��.��*�7K�:�^5��	�WY�V��C���^w8q��@�      �   '  x�}S�n�@��W�  ��]���FJ�H�����t<��ؑH�����[~�׎C-Tu3�sΜ����2^��j����\K������~�d�����x	�`: o�C��#R'o N��ҙ����(��XA����D)�0���X��Cw:��+7�� �`2���^�F�1�-���*�l0:�o�W��N+Z�sjL��Y�&S	���/��v�CUk�aზڐ��ϕdP;;o�>�ڈD���L
m�%;�2T����J����2EH	JV'BC�@}`;�)i �����V3����#�i�`x�m%[E�v��H$s�a#�Y�CR�B/gY$k| �Rv|��
[h(PJ� �2��!�,���P��{�Ao�.(e��AI��ҧf���'*��߷AA�j���N�!���
n�|��j���b�i��􄜎dT'ưXs*�J�h�*�����Oh �h[Wg�N�p�R��a�C�kN|�K*����=}�	x��w#�M�p���m��O��I�#�������u�]����+�      �   T  x��Q�N�0��+V����*�6T�P�J@4�zpm��r��� U�÷�clB{ pY�gv��E��?���{���V|�
�<]-����h��\�F+�@�^.	̥yAh�ZI#Җ�X
Tr4�j��Bq-x%�N�^:8 oQ�WđA�?�	Y~�;��5�Z�5PS�Z�U��P��i�ӎ<�󀿣�q8��$�h:_̒�(M�a8���M��.d�?�yU�F�Jz����r+-q��$��� �S�Tbu��Զ��o�`5�;�Q��߰��{7lkGx�(^��[�:�̠�9�CծG3`���UHZ$8�
�:Q�w���e�����      �   �   x���v
Q���W((M��L�S*.I,)-(�ON-.N-VRs�	uV�0�QPw�Sp-K�)ML�<�9O(bd`d�k`�kh�`dhejfel�gdi�k`B@VӚ˓�M��9�'A�Vp��K�L���KLI��C����Ŧ@��Ru�rc�q~��T��� �ܢ�      �   �   x���AK�@���C/Qh�&� ��b@j1����@��0����U�"�rf�c��kN���Խ�������,�-�\_ޏ-ܔ[ȟ����&�=<��Ɓ0��|�U�J�P%T�C]T�Swu���o��!k�IS�J�����K0� 8�-��c���S��g�}���*�%���q>����J"8Zr3�� �N���65p�%���z��Α_1V?������F��c�)rF� >₰~�,��h�      �   �   x��S�n�0��O,i%�IR�R�	B��I�ГҘƸ�Թ[��/�TB�b˲uw�Ηf��zi�]���**=cwK]�
M�g����>�y��,����8�%�]
)�ar4�b��$
D�_����F���d ?�Q��#{AS�f��;���'�J�AC�r0�S����@��cI�vĄ���iɐ��_�1�>T�~���l�F�5���,~)��߿��?�2��� �&|      �   
   x���          �   
   x���         