PGDMP          :            	    x            p12052020dev01    11.7 (Debian 11.7-2.pgdg90+1)    11.7 (Debian 11.7-2.pgdg90+1) �              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    100573    p12052020dev01    DATABASE     �   CREATE DATABASE p12052020dev01 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';
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
       public       angelds    false    216                       0    0    Accounts_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Accounts_id_seq" OWNED BY public."Accounts".id;
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
       public         angelds    false                       0    0    COLUMN "Bids".weight    COMMENT     ?   COMMENT ON COLUMN public."Bids".weight IS 'Peso del producto';
            public       angelds    false    254                       0    0    COLUMN "Bids".materials    COMMENT     X   COMMENT ON COLUMN public."Bids".materials IS 'Materiales de Fabricación del Producto';
            public       angelds    false    254                       0    0    COLUMN "Bids".reasons    COMMENT     H   COMMENT ON COLUMN public."Bids".reasons IS 'Motivos de la publicaión';
            public       angelds    false    254                       0    0    COLUMN "Bids".customizable    COMMENT     _   COMMENT ON COLUMN public."Bids".customizable IS 'para saber su un producto es personalizable';
            public       angelds    false    254                       0    0    COLUMN "Bids".dimesion    COMMENT     P   COMMENT ON COLUMN public."Bids".dimesion IS 'Dimesion Alto x Largo x Profundo';
            public       angelds    false    254            �            1259    101250    Bids_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Bids_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Bids_id_seq";
       public       angelds    false    254                       0    0    Bids_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Bids_id_seq" OWNED BY public."Bids".id;
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
       public       angelds    false    252                       0    0    Brands_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Brands_id_seq" OWNED BY public."Brands".id;
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
       public       angelds    false    218                       0    0    Dashboards_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Dashboards_id_seq" OWNED BY public."Dashboards".id;
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
       public       angelds    false    220                       0    0    Genders_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Genders_id_seq" OWNED BY public."Genders".id;
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
       public       angelds    false    222                       0    0    Modules_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Modules_id_seq" OWNED BY public."Modules".id;
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
       public       angelds    false    224                       0    0    Nationalities_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Nationalities_id_seq" OWNED BY public."Nationalities".id;
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
       public       angelds    false    226                       0    0    People_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."People_id_seq" OWNED BY public."People".id;
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
       public       angelds    false    228                       0    0    Permissions_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Permissions_id_seq" OWNED BY public."Permissions".id;
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
       public       angelds    false    230                        0    0    Properties_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Properties_id_seq" OWNED BY public."Properties".id;
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
       public       angelds    false    232            !           0    0    Roles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;
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
       public       angelds    false    235            "           0    0    Status_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Status_id_seq" OWNED BY public."Status".id;
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
       public       angelds    false    256            #           0    0    Subscribes_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Subscribes_id_seq" OWNED BY public."Subscribes".id;
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
       public       angelds    false    237            $           0    0    Warehouses_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Warehouses_id_seq" OWNED BY public."Warehouses".id;
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
       public       angelds    false    239            %           0    0    accountRoles_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."accountRoles_id_seq" OWNED BY public."accountRoles".id;
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
       public       angelds    false    241            &           0    0    addressTypes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."addressTypes_id_seq" OWNED BY public."addressTypes".id;
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
       public       angelds    false    266            '           0    0    affirmations_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.affirmations_id_seq OWNED BY public.affirmations.id;
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
       public       angelds    false    286            (           0    0    attachments_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;
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
       public       angelds    false    274            )           0    0    banks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;
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
       public       angelds    false    284            *           0    0    bidTypes_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."bidTypes_id_seq" OWNED BY public."bidTypes".id;
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
       public       angelds    false    308            +           0    0    cat1s_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cat1s_id_seq OWNED BY public.cat1s.id;
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
       public       angelds    false    310            ,           0    0    cat2s_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cat2s_id_seq OWNED BY public.cat2s.id;
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
       public       angelds    false    312            -           0    0    cat3s_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cat3s_id_seq OWNED BY public.cat3s.id;
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
       public       angelds    false    314            .           0    0    cat4s_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cat4s_id_seq OWNED BY public.cat4s.id;
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
       public       angelds    false    294            /           0    0    civilStatuses_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."civilStatuses_id_seq" OWNED BY public."civilStatuses".id;
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
       public       angelds    false    280            0           0    0    comunas_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.comunas_id_seq OWNED BY public.comunas.id;
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
       public       angelds    false    243            1           0    0    dashboardPermissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."dashboardPermissions_id_seq" OWNED BY public."dashboardPermissions".id;
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
       public       angelds    false    304            2           0    0    deliveries_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.deliveries_id_seq OWNED BY public.deliveries.id;
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
       public       angelds    false    288            3           0    0    disponibilities_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.disponibilities_id_seq OWNED BY public.disponibilities.id;
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
       public       angelds    false    268            4           0    0    docTypes_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."docTypes_id_seq" OWNED BY public."docTypes".id;
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
       public       angelds    false    306            5           0    0    envoiceNotifies_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."envoiceNotifies_id_seq" OWNED BY public."envoiceNotifies".id;
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
       public       angelds    false    302            6           0    0    envoiceTypes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."envoiceTypes_id_seq" OWNED BY public."envoiceTypes".id;
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
       public       angelds    false    245            7           0    0    grantRoles_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."grantRoles_id_seq" OWNED BY public."grantRoles".id;
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
       public       angelds    false    292            8           0    0    materials_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;
            public       angelds    false    291            <           1259    207131    peopleTypes    TABLE     �   CREATE TABLE public."peopleTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "StatusId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public."peopleTypes";
       public         angelds    false            ;           1259    207129    peopleTypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."peopleTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."peopleTypes_id_seq";
       public       angelds    false    316            9           0    0    peopleTypes_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."peopleTypes_id_seq" OWNED BY public."peopleTypes".id;
            public       angelds    false    315                       1259    117131 
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
       public       angelds    false    260            :           0    0    phoneTypes_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."phoneTypes_id_seq" OWNED BY public."phoneTypes".id;
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
       public       angelds    false    247            ;           0    0    postalCodes_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."postalCodes_id_seq" OWNED BY public."postalCodes".id;
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
       public       angelds    false    270            <           0    0    processTypes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."processTypes_id_seq" OWNED BY public."processTypes".id;
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
       public       angelds    false    278            =           0    0    provinces_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;
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
       public       angelds    false    290            >           0    0    reasons_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reasons_id_seq OWNED BY public.reasons.id;
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
       public       angelds    false    276            ?           0    0    regions_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;
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
       public       angelds    false    264            @           0    0    salesChannels_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."salesChannels_id_seq" OWNED BY public."salesChannels".id;
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
       public       angelds    false    296            A           0    0    shopContracts_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."shopContracts_id_seq" OWNED BY public."shopContracts".id;
            public       angelds    false    295                       1259    117025    shopRequests    TABLE     6  CREATE TABLE public."shopRequests" (
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
 "   DROP TABLE public."shopRequests";
       public         angelds    false                       1259    117023    shopRequests_id_seq    SEQUENCE     �   CREATE SEQUENCE public."shopRequests_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."shopRequests_id_seq";
       public       angelds    false    258            B           0    0    shopRequests_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."shopRequests_id_seq" OWNED BY public."shopRequests".id;
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
       public       angelds    false    272            C           0    0    shops_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.shops_id_seq OWNED BY public.shops.id;
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
       public       angelds    false    282            D           0    0    statusProcesses_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."statusProcesses_id_seq" OWNED BY public."statusProcesses".id;
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
       public       angelds    false    262            E           0    0    storeTypes_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."storeTypes_id_seq" OWNED BY public."storeTypes".id;
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
       public       angelds    false    249            F           0    0    subModules_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."subModules_id_seq" OWNED BY public."subModules".id;
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
       public       angelds    false    300            G           0    0    taxValues_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."taxValues_id_seq" OWNED BY public."taxValues".id;
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
       public       angelds    false    298            H           0    0    taxes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.taxes_id_seq OWNED BY public.taxes.id;
            public       angelds    false    297                       2604    100719    Accounts id    DEFAULT     n   ALTER TABLE ONLY public."Accounts" ALTER COLUMN id SET DEFAULT nextval('public."Accounts_id_seq"'::regclass);
 <   ALTER TABLE public."Accounts" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    217    216                       2604    101255    Bids id    DEFAULT     f   ALTER TABLE ONLY public."Bids" ALTER COLUMN id SET DEFAULT nextval('public."Bids_id_seq"'::regclass);
 8   ALTER TABLE public."Bids" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    254    253    254                       2604    101192 	   Brands id    DEFAULT     j   ALTER TABLE ONLY public."Brands" ALTER COLUMN id SET DEFAULT nextval('public."Brands_id_seq"'::regclass);
 :   ALTER TABLE public."Brands" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    252    251    252                       2604    100723    Dashboards id    DEFAULT     r   ALTER TABLE ONLY public."Dashboards" ALTER COLUMN id SET DEFAULT nextval('public."Dashboards_id_seq"'::regclass);
 >   ALTER TABLE public."Dashboards" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    219    218            	           2604    100724 
   Genders id    DEFAULT     l   ALTER TABLE ONLY public."Genders" ALTER COLUMN id SET DEFAULT nextval('public."Genders_id_seq"'::regclass);
 ;   ALTER TABLE public."Genders" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    221    220            
           2604    100725 
   Modules id    DEFAULT     l   ALTER TABLE ONLY public."Modules" ALTER COLUMN id SET DEFAULT nextval('public."Modules_id_seq"'::regclass);
 ;   ALTER TABLE public."Modules" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    223    222                       2604    100726    Nationalities id    DEFAULT     x   ALTER TABLE ONLY public."Nationalities" ALTER COLUMN id SET DEFAULT nextval('public."Nationalities_id_seq"'::regclass);
 A   ALTER TABLE public."Nationalities" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    225    224                       2604    100727 	   People id    DEFAULT     j   ALTER TABLE ONLY public."People" ALTER COLUMN id SET DEFAULT nextval('public."People_id_seq"'::regclass);
 :   ALTER TABLE public."People" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    227    226                       2604    100728    Permissions id    DEFAULT     t   ALTER TABLE ONLY public."Permissions" ALTER COLUMN id SET DEFAULT nextval('public."Permissions_id_seq"'::regclass);
 ?   ALTER TABLE public."Permissions" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    229    228                       2604    100730    Properties id    DEFAULT     r   ALTER TABLE ONLY public."Properties" ALTER COLUMN id SET DEFAULT nextval('public."Properties_id_seq"'::regclass);
 >   ALTER TABLE public."Properties" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    231    230                       2604    100732    Roles id    DEFAULT     h   ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);
 9   ALTER TABLE public."Roles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    233    232                       2604    100733 	   Status id    DEFAULT     j   ALTER TABLE ONLY public."Status" ALTER COLUMN id SET DEFAULT nextval('public."Status_id_seq"'::regclass);
 :   ALTER TABLE public."Status" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    236    235                       2604    116972    Subscribes id    DEFAULT     r   ALTER TABLE ONLY public."Subscribes" ALTER COLUMN id SET DEFAULT nextval('public."Subscribes_id_seq"'::regclass);
 >   ALTER TABLE public."Subscribes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    256    255    256                       2604    100735    Warehouses id    DEFAULT     r   ALTER TABLE ONLY public."Warehouses" ALTER COLUMN id SET DEFAULT nextval('public."Warehouses_id_seq"'::regclass);
 >   ALTER TABLE public."Warehouses" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    238    237                       2604    100736    accountRoles id    DEFAULT     v   ALTER TABLE ONLY public."accountRoles" ALTER COLUMN id SET DEFAULT nextval('public."accountRoles_id_seq"'::regclass);
 @   ALTER TABLE public."accountRoles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    240    239                       2604    100738    addressTypes id    DEFAULT     v   ALTER TABLE ONLY public."addressTypes" ALTER COLUMN id SET DEFAULT nextval('public."addressTypes_id_seq"'::regclass);
 @   ALTER TABLE public."addressTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    242    241                        2604    117179    affirmations id    DEFAULT     r   ALTER TABLE ONLY public.affirmations ALTER COLUMN id SET DEFAULT nextval('public.affirmations_id_seq'::regclass);
 >   ALTER TABLE public.affirmations ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    266    265    266            *           2604    149800    attachments id    DEFAULT     p   ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);
 =   ALTER TABLE public.attachments ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    286    285    286            $           2604    125205    banks id    DEFAULT     d   ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);
 7   ALTER TABLE public.banks ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    273    274    274            )           2604    149790    bidTypes id    DEFAULT     n   ALTER TABLE ONLY public."bidTypes" ALTER COLUMN id SET DEFAULT nextval('public."bidTypes_id_seq"'::regclass);
 <   ALTER TABLE public."bidTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    283    284    284            5           2604    174491    cat1s id    DEFAULT     d   ALTER TABLE ONLY public.cat1s ALTER COLUMN id SET DEFAULT nextval('public.cat1s_id_seq'::regclass);
 7   ALTER TABLE public.cat1s ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    308    307    308            6           2604    174502    cat2s id    DEFAULT     d   ALTER TABLE ONLY public.cat2s ALTER COLUMN id SET DEFAULT nextval('public.cat2s_id_seq'::regclass);
 7   ALTER TABLE public.cat2s ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    310    309    310            7           2604    174513    cat3s id    DEFAULT     d   ALTER TABLE ONLY public.cat3s ALTER COLUMN id SET DEFAULT nextval('public.cat3s_id_seq'::regclass);
 7   ALTER TABLE public.cat3s ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    312    311    312            8           2604    174524    cat4s id    DEFAULT     d   ALTER TABLE ONLY public.cat4s ALTER COLUMN id SET DEFAULT nextval('public.cat4s_id_seq'::regclass);
 7   ALTER TABLE public.cat4s ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    314    313    314            .           2604    166173    civilStatuses id    DEFAULT     x   ALTER TABLE ONLY public."civilStatuses" ALTER COLUMN id SET DEFAULT nextval('public."civilStatuses_id_seq"'::regclass);
 A   ALTER TABLE public."civilStatuses" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    294    293    294            '           2604    125320 
   comunas id    DEFAULT     h   ALTER TABLE ONLY public.comunas ALTER COLUMN id SET DEFAULT nextval('public.comunas_id_seq'::regclass);
 9   ALTER TABLE public.comunas ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    280    279    280                       2604    100740    dashboardPermissions id    DEFAULT     �   ALTER TABLE ONLY public."dashboardPermissions" ALTER COLUMN id SET DEFAULT nextval('public."dashboardPermissions_id_seq"'::regclass);
 H   ALTER TABLE public."dashboardPermissions" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    244    243            3           2604    174438    deliveries id    DEFAULT     n   ALTER TABLE ONLY public.deliveries ALTER COLUMN id SET DEFAULT nextval('public.deliveries_id_seq'::regclass);
 <   ALTER TABLE public.deliveries ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    304    303    304            +           2604    149817    disponibilities id    DEFAULT     x   ALTER TABLE ONLY public.disponibilities ALTER COLUMN id SET DEFAULT nextval('public.disponibilities_id_seq'::regclass);
 A   ALTER TABLE public.disponibilities ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    288    287    288            !           2604    117194    docTypes id    DEFAULT     n   ALTER TABLE ONLY public."docTypes" ALTER COLUMN id SET DEFAULT nextval('public."docTypes_id_seq"'::regclass);
 <   ALTER TABLE public."docTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    268    267    268            4           2604    174462    envoiceNotifies id    DEFAULT     |   ALTER TABLE ONLY public."envoiceNotifies" ALTER COLUMN id SET DEFAULT nextval('public."envoiceNotifies_id_seq"'::regclass);
 C   ALTER TABLE public."envoiceNotifies" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    305    306    306            2           2604    174390    envoiceTypes id    DEFAULT     v   ALTER TABLE ONLY public."envoiceTypes" ALTER COLUMN id SET DEFAULT nextval('public."envoiceTypes_id_seq"'::regclass);
 @   ALTER TABLE public."envoiceTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    302    301    302                       2604    100741    grantRoles id    DEFAULT     r   ALTER TABLE ONLY public."grantRoles" ALTER COLUMN id SET DEFAULT nextval('public."grantRoles_id_seq"'::regclass);
 >   ALTER TABLE public."grantRoles" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    246    245            -           2604    149837    materials id    DEFAULT     l   ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);
 ;   ALTER TABLE public.materials ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    292    291    292            9           2604    207134    peopleTypes id    DEFAULT     t   ALTER TABLE ONLY public."peopleTypes" ALTER COLUMN id SET DEFAULT nextval('public."peopleTypes_id_seq"'::regclass);
 ?   ALTER TABLE public."peopleTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    315    316    316                       2604    117134    phoneTypes id    DEFAULT     r   ALTER TABLE ONLY public."phoneTypes" ALTER COLUMN id SET DEFAULT nextval('public."phoneTypes_id_seq"'::regclass);
 >   ALTER TABLE public."phoneTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    260    259    260                       2604    100742    postalCodes id    DEFAULT     t   ALTER TABLE ONLY public."postalCodes" ALTER COLUMN id SET DEFAULT nextval('public."postalCodes_id_seq"'::regclass);
 ?   ALTER TABLE public."postalCodes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    248    247            "           2604    125154    processTypes id    DEFAULT     v   ALTER TABLE ONLY public."processTypes" ALTER COLUMN id SET DEFAULT nextval('public."processTypes_id_seq"'::regclass);
 @   ALTER TABLE public."processTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    270    269    270            &           2604    125295    provinces id    DEFAULT     l   ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);
 ;   ALTER TABLE public.provinces ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    277    278    278            ,           2604    149827 
   reasons id    DEFAULT     h   ALTER TABLE ONLY public.reasons ALTER COLUMN id SET DEFAULT nextval('public.reasons_id_seq'::regclass);
 9   ALTER TABLE public.reasons ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    289    290    290            %           2604    125230 
   regions id    DEFAULT     h   ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);
 9   ALTER TABLE public.regions ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    275    276    276                       2604    117164    salesChannels id    DEFAULT     x   ALTER TABLE ONLY public."salesChannels" ALTER COLUMN id SET DEFAULT nextval('public."salesChannels_id_seq"'::regclass);
 A   ALTER TABLE public."salesChannels" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    264    263    264            /           2604    166191    shopContracts id    DEFAULT     x   ALTER TABLE ONLY public."shopContracts" ALTER COLUMN id SET DEFAULT nextval('public."shopContracts_id_seq"'::regclass);
 A   ALTER TABLE public."shopContracts" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    296    295    296                       2604    117028    shopRequests id    DEFAULT     v   ALTER TABLE ONLY public."shopRequests" ALTER COLUMN id SET DEFAULT nextval('public."shopRequests_id_seq"'::regclass);
 @   ALTER TABLE public."shopRequests" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    257    258    258            #           2604    125182    shops id    DEFAULT     d   ALTER TABLE ONLY public.shops ALTER COLUMN id SET DEFAULT nextval('public.shops_id_seq'::regclass);
 7   ALTER TABLE public.shops ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    271    272    272            (           2604    149780    statusProcesses id    DEFAULT     |   ALTER TABLE ONLY public."statusProcesses" ALTER COLUMN id SET DEFAULT nextval('public."statusProcesses_id_seq"'::regclass);
 C   ALTER TABLE public."statusProcesses" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    281    282    282                       2604    117149    storeTypes id    DEFAULT     r   ALTER TABLE ONLY public."storeTypes" ALTER COLUMN id SET DEFAULT nextval('public."storeTypes_id_seq"'::regclass);
 >   ALTER TABLE public."storeTypes" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    261    262    262                       2604    100743    subModules id    DEFAULT     r   ALTER TABLE ONLY public."subModules" ALTER COLUMN id SET DEFAULT nextval('public."subModules_id_seq"'::regclass);
 >   ALTER TABLE public."subModules" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    250    249            1           2604    174372    taxValues id    DEFAULT     p   ALTER TABLE ONLY public."taxValues" ALTER COLUMN id SET DEFAULT nextval('public."taxValues_id_seq"'::regclass);
 =   ALTER TABLE public."taxValues" ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    300    299    300            0           2604    174362    taxes id    DEFAULT     d   ALTER TABLE ONLY public.taxes ALTER COLUMN id SET DEFAULT nextval('public.taxes_id_seq'::regclass);
 7   ALTER TABLE public.taxes ALTER COLUMN id DROP DEFAULT;
       public       angelds    false    297    298    298            �          0    100574    Accounts 
   TABLE DATA               �   COPY public."Accounts" (id, name, pass, email, "peopleId", "statusId", "createdAt", "updatedAt", "confirmStatus", "hashConfirm", preference) FROM stdin;
    public       angelds    false    216   '      �          0    101252    Bids 
   TABLE DATA               :  COPY public."Bids" (id, "bidType", title, "brandId", "longDesc", "smallDesc", disponibility, "time", devolution, include, customize, garanty, tags, photos, category, variation, "shopId", "WarehouseId", "StatusId", "createdAt", "updatedAt", schedule, weight, materials, reasons, customizable, dimesion) FROM stdin;
    public       angelds    false    254   =,      �          0    101189    Brands 
   TABLE DATA               F   COPY public."Brands" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    252   �-      �          0    100600 
   Dashboards 
   TABLE DATA               {   COPY public."Dashboards" (id, "ModuleId", "subModuleId", "createdAt", "updatedAt", path, icontype, "StatusId") FROM stdin;
    public       angelds    false    218   ;.      �          0    100609    Genders 
   TABLE DATA               G   COPY public."Genders" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    220   �.      �          0    100614    Modules 
   TABLE DATA               S   COPY public."Modules" (id, name, "StatusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    222   /      �          0    100619    Nationalities 
   TABLE DATA               M   COPY public."Nationalities" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    224   �/      �          0    100624    People 
   TABLE DATA               �   COPY public."People" (id, "firstName", "lastName", "genderId", "nationalityId", "birthDate", "statusId", "createdAt", "updatedAt", document) FROM stdin;
    public       angelds    false    226   �/      �          0    100632    Permissions 
   TABLE DATA               W   COPY public."Permissions" (id, name, "StatusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    228   w1      �          0    100642 
   Properties 
   TABLE DATA               J   COPY public."Properties" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    230   �1      �          0    100652    Roles 
   TABLE DATA               Q   COPY public."Roles" (id, name, "StatusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    232   2      �          0    100657    SequelizeMeta 
   TABLE DATA               /   COPY public."SequelizeMeta" (name) FROM stdin;
    public       angelds    false    234   d2      �          0    100660    Status 
   TABLE DATA               F   COPY public."Status" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    235   V5      �          0    116969 
   Subscribes 
   TABLE DATA               Z   COPY public."Subscribes" (id, email, "createdAt", "updatedAt", "hashConfirm") FROM stdin;
    public       angelds    false    256   �5      �          0    100670 
   Warehouses 
   TABLE DATA               p   COPY public."Warehouses" (id, name, "statusId", "createdAt", "updatedAt", address, phone, "shopId") FROM stdin;
    public       angelds    false    237   6<      �          0    100675    accountRoles 
   TABLE DATA               i   COPY public."accountRoles" (id, "AccountId", "RoleId", "StatusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    239   �>      �          0    100685    addressTypes 
   TABLE DATA               L   COPY public."addressTypes" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    241   !?      �          0    117176    affirmations 
   TABLE DATA               V   COPY public.affirmations (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    266   >?      �          0    149797    attachments 
   TABLE DATA               O   COPY public.attachments (id, data, tabs, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    286   R@      �          0    125202    banks 
   TABLE DATA               I   COPY public.banks (id, name, sbif, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    274   �A      �          0    149787    bidTypes 
   TABLE DATA               H   COPY public."bidTypes" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    284   �B                0    174488    cat1s 
   TABLE DATA               N   COPY public.cat1s (id, name, icon, url, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    308   %C                0    174499    cat2s 
   TABLE DATA               X   COPY public.cat2s (id, name, icon, url, "cat1Id", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    310   �C                0    174510    cat3s 
   TABLE DATA               X   COPY public.cat3s (id, name, icon, url, "cat2Id", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    312   �D      	          0    174521    cat4s 
   TABLE DATA               X   COPY public.cat4s (id, name, icon, url, "cat3Id", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    314   �G      �          0    166170    civilStatuses 
   TABLE DATA               M   COPY public."civilStatuses" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    294   OI      �          0    125317    comunas 
   TABLE DATA               S   COPY public.comunas (id, name, "provinceId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    280   lI      �          0    100695    dashboardPermissions 
   TABLE DATA               y   COPY public."dashboardPermissions" (id, "DashboardId", "PermissionId", "StatusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    243   _V      �          0    174435 
   deliveries 
   TABLE DATA               H   COPY public.deliveries (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    304   tW      �          0    149814    disponibilities 
   TABLE DATA               M   COPY public.disponibilities (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    288   �W      �          0    117191    docTypes 
   TABLE DATA               T   COPY public."docTypes" (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    268   X                0    174459    envoiceNotifies 
   TABLE DATA               �   COPY public."envoiceNotifies" (id, "envoiceTypeId", "envoiceNum", "dateNotify", "deliveryId", taxes, "attachmentId", "createdAt", "updatedAt", "shopId") FROM stdin;
    public       angelds    false    306   kX      �          0    174387    envoiceTypes 
   TABLE DATA               L   COPY public."envoiceTypes" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    302   �Y      �          0    100701 
   grantRoles 
   TABLE DATA               s   COPY public."grantRoles" (id, "dashboardPermissionId", "RoleId", "StatusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    245   �Y      �          0    149834 	   materials 
   TABLE DATA               G   COPY public.materials (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    292   �Z                0    207131    peopleTypes 
   TABLE DATA               W   COPY public."peopleTypes" (id, name, "StatusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    316   [      �          0    117131 
   phoneTypes 
   TABLE DATA               V   COPY public."phoneTypes" (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    260   \[      �          0    100706    postalCodes 
   TABLE DATA               K   COPY public."postalCodes" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    247   �[      �          0    125151    processTypes 
   TABLE DATA               L   COPY public."processTypes" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    270   �[      �          0    125292 	   provinces 
   TABLE DATA               S   COPY public.provinces (id, name, "regionId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    278   �[      �          0    149824    reasons 
   TABLE DATA               E   COPY public.reasons (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    290   a^      �          0    125227    regions 
   TABLE DATA               N   COPY public.regions (id, name, ordinal, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    276   �^      �          0    117161    salesChannels 
   TABLE DATA               Y   COPY public."salesChannels" (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    264   `      �          0    166188    shopContracts 
   TABLE DATA               {   COPY public."shopContracts" (id, "contractId", "shopId", "statusId", "createdAt", "updatedAt", "contractDesc") FROM stdin;
    public       angelds    false    296   �`      �          0    117025    shopRequests 
   TABLE DATA               �   COPY public."shopRequests" (id, "AccountId", status, phone, marca, "storeType", "startActivity", "isStore", "descShop", "salesChannels", affirmations, employees, "createdAt", "updatedAt", process) FROM stdin;
    public       angelds    false    258   Ma      �          0    125179    shops 
   TABLE DATA               �   COPY public.shops (id, name, logo, "shopDescription", "isLocal", employees, partner, address, "paymentCong", "startActivityAttachment", "createdAt", "updatedAt", "shopRequestId", "processId", "statusId", phone, "startActivity", "storeType") FROM stdin;
    public       angelds    false    272   Qc      �          0    149777    statusProcesses 
   TABLE DATA               O   COPY public."statusProcesses" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    282   �d      �          0    117146 
   storeTypes 
   TABLE DATA               V   COPY public."storeTypes" (id, name, "statusId", "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    262    e      �          0    100711 
   subModules 
   TABLE DATA               i   COPY public."subModules" (id, name, route, "StatusId", "createdAt", "updatedAt", "ModuleId") FROM stdin;
    public       angelds    false    249   �e      �          0    174369 	   taxValues 
   TABLE DATA               S   COPY public."taxValues" (id, "taxId", value, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    300   �f      �          0    174359    taxes 
   TABLE DATA               C   COPY public.taxes (id, name, "createdAt", "updatedAt") FROM stdin;
    public       angelds    false    298   �f      I           0    0    Accounts_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Accounts_id_seq"', 199, true);
            public       angelds    false    217            J           0    0    Bids_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Bids_id_seq"', 29, true);
            public       angelds    false    253            K           0    0    Brands_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Brands_id_seq"', 3, true);
            public       angelds    false    251            L           0    0    Dashboards_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Dashboards_id_seq"', 11, true);
            public       angelds    false    219            M           0    0    Genders_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Genders_id_seq"', 3, true);
            public       angelds    false    221            N           0    0    Modules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Modules_id_seq"', 1, false);
            public       angelds    false    223            O           0    0    Nationalities_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Nationalities_id_seq"', 1, false);
            public       angelds    false    225            P           0    0    People_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."People_id_seq"', 166, true);
            public       angelds    false    227            Q           0    0    Permissions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Permissions_id_seq"', 1, false);
            public       angelds    false    229            R           0    0    Properties_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Properties_id_seq"', 1, false);
            public       angelds    false    231            S           0    0    Roles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Roles_id_seq"', 7, true);
            public       angelds    false    233            T           0    0    Status_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Status_id_seq"', 1, false);
            public       angelds    false    236            U           0    0    Subscribes_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Subscribes_id_seq"', 91, true);
            public       angelds    false    255            V           0    0    Warehouses_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Warehouses_id_seq"', 41, true);
            public       angelds    false    238            W           0    0    accountRoles_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."accountRoles_id_seq"', 104, true);
            public       angelds    false    240            X           0    0    addressTypes_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."addressTypes_id_seq"', 1, false);
            public       angelds    false    242            Y           0    0    affirmations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.affirmations_id_seq', 3, true);
            public       angelds    false    265            Z           0    0    attachments_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.attachments_id_seq', 42, true);
            public       angelds    false    285            [           0    0    banks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.banks_id_seq', 14, true);
            public       angelds    false    273            \           0    0    bidTypes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."bidTypes_id_seq"', 2, true);
            public       angelds    false    283            ]           0    0    cat1s_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cat1s_id_seq', 1, false);
            public       angelds    false    307            ^           0    0    cat2s_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cat2s_id_seq', 1, false);
            public       angelds    false    309            _           0    0    cat3s_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cat3s_id_seq', 1, false);
            public       angelds    false    311            `           0    0    cat4s_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cat4s_id_seq', 1, true);
            public       angelds    false    313            a           0    0    civilStatuses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."civilStatuses_id_seq"', 1, false);
            public       angelds    false    293            b           0    0    comunas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.comunas_id_seq', 1, false);
            public       angelds    false    279            c           0    0    dashboardPermissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."dashboardPermissions_id_seq"', 1, false);
            public       angelds    false    244            d           0    0    deliveries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.deliveries_id_seq', 2, true);
            public       angelds    false    303            e           0    0    disponibilities_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.disponibilities_id_seq', 2, true);
            public       angelds    false    287            f           0    0    docTypes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."docTypes_id_seq"', 4, true);
            public       angelds    false    267            g           0    0    envoiceNotifies_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."envoiceNotifies_id_seq"', 15, true);
            public       angelds    false    305            h           0    0    envoiceTypes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."envoiceTypes_id_seq"', 2, true);
            public       angelds    false    301            i           0    0    grantRoles_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."grantRoles_id_seq"', 84, true);
            public       angelds    false    246            j           0    0    materials_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.materials_id_seq', 3, true);
            public       angelds    false    291            k           0    0    peopleTypes_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."peopleTypes_id_seq"', 2, true);
            public       angelds    false    315            l           0    0    phoneTypes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."phoneTypes_id_seq"', 3, true);
            public       angelds    false    259            m           0    0    postalCodes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."postalCodes_id_seq"', 1, false);
            public       angelds    false    248            n           0    0    processTypes_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."processTypes_id_seq"', 1, false);
            public       angelds    false    269            o           0    0    provinces_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.provinces_id_seq', 1, false);
            public       angelds    false    277            p           0    0    reasons_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.reasons_id_seq', 3, true);
            public       angelds    false    289            q           0    0    regions_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.regions_id_seq', 1, false);
            public       angelds    false    275            r           0    0    salesChannels_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."salesChannels_id_seq"', 8, true);
            public       angelds    false    263            s           0    0    shopContracts_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."shopContracts_id_seq"', 9, true);
            public       angelds    false    295            t           0    0    shopRequests_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."shopRequests_id_seq"', 38, true);
            public       angelds    false    257            u           0    0    shops_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.shops_id_seq', 115, true);
            public       angelds    false    271            v           0    0    statusProcesses_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."statusProcesses_id_seq"', 4, true);
            public       angelds    false    281            w           0    0    storeTypes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."storeTypes_id_seq"', 4, true);
            public       angelds    false    261            x           0    0    subModules_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."subModules_id_seq"', 1, false);
            public       angelds    false    250            y           0    0    taxValues_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."taxValues_id_seq"', 1, false);
            public       angelds    false    299            z           0    0    taxes_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.taxes_id_seq', 1, false);
            public       angelds    false    297            ;           2606    100745    Accounts Accounts_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_email_key" UNIQUE (email);
 I   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_email_key";
       public         angelds    false    216            =           2606    100747    Accounts Accounts_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_name_key" UNIQUE (name);
 H   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_name_key";
       public         angelds    false    216            ?           2606    100749    Accounts Accounts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_pkey";
       public         angelds    false    216            �           2606    101260    Bids Bids_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_pkey";
       public         angelds    false    254            �           2606    101196    Brands Brands_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Brands"
    ADD CONSTRAINT "Brands_name_key" UNIQUE (name);
 D   ALTER TABLE ONLY public."Brands" DROP CONSTRAINT "Brands_name_key";
       public         angelds    false    252            �           2606    101194    Brands Brands_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Brands"
    ADD CONSTRAINT "Brands_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Brands" DROP CONSTRAINT "Brands_pkey";
       public         angelds    false    252            A           2606    100759    Dashboards Dashboards_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_pkey";
       public         angelds    false    218            C           2606    100761 .   Dashboards Dashboards_subModuleId_moduleId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_moduleId_key" UNIQUE ("subModuleId", "ModuleId");
 \   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_subModuleId_moduleId_key";
       public         angelds    false    218    218            E           2606    100763    Genders Genders_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_name_key" UNIQUE (name);
 F   ALTER TABLE ONLY public."Genders" DROP CONSTRAINT "Genders_name_key";
       public         angelds    false    220            G           2606    100765    Genders Genders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Genders"
    ADD CONSTRAINT "Genders_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Genders" DROP CONSTRAINT "Genders_pkey";
       public         angelds    false    220            I           2606    100767    Modules Modules_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_name_key" UNIQUE (name);
 F   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_name_key";
       public         angelds    false    222            K           2606    100769    Modules Modules_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_pkey";
       public         angelds    false    222            M           2606    100771 $   Nationalities Nationalities_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_name_key" UNIQUE (name);
 R   ALTER TABLE ONLY public."Nationalities" DROP CONSTRAINT "Nationalities_name_key";
       public         angelds    false    224            O           2606    100773     Nationalities Nationalities_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Nationalities"
    ADD CONSTRAINT "Nationalities_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Nationalities" DROP CONSTRAINT "Nationalities_pkey";
       public         angelds    false    224            Q           2606    100777    People People_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_pkey";
       public         angelds    false    226            S           2606    100779     Permissions Permissions_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_name_key" UNIQUE (name);
 N   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_name_key";
       public         angelds    false    228            U           2606    100781    Permissions Permissions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_pkey";
       public         angelds    false    228            W           2606    100787    Properties Properties_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."Properties" DROP CONSTRAINT "Properties_name_key";
       public         angelds    false    230            Y           2606    100789    Properties Properties_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "Properties_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Properties" DROP CONSTRAINT "Properties_pkey";
       public         angelds    false    230            [           2606    100795    Roles Roles_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key" UNIQUE (name);
 B   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key";
       public         angelds    false    232            ]           2606    100797    Roles Roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_pkey";
       public         angelds    false    232            _           2606    100799     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public         angelds    false    234            a           2606    100801    Status Status_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Status"
    ADD CONSTRAINT "Status_name_key" UNIQUE (name);
 D   ALTER TABLE ONLY public."Status" DROP CONSTRAINT "Status_name_key";
       public         angelds    false    235            c           2606    100803    Status Status_pkey 
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
       public         angelds    false    256            e           2606    100811    Warehouses Warehouses_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_pkey";
       public         angelds    false    237            j           2606    100813    accountRoles accountRoles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_pkey";
       public         angelds    false    239            m           2606    141582    accountRoles account_roles_uq 
   CONSTRAINT     k   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT account_roles_uq UNIQUE ("AccountId", "RoleId");
 I   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT account_roles_uq;
       public         angelds    false    239    239            o           2606    100817    addressTypes addressTypes_pkey 
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
       public         angelds    false    280            q           2606    100821 F   dashboardPermissions dashboardPermissions_permissionId_dashboardId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_dashboardId_key" UNIQUE ("PermissionId", "DashboardId");
 t   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_permissionId_dashboardId_key";
       public         angelds    false    243    243            s           2606    100823 .   dashboardPermissions dashboardPermissions_pkey 
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
       public         angelds    false    302            u           2606    100825    grantRoles grantRoles_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_pkey";
       public         angelds    false    245            w           2606    100827 6   grantRoles grantRoles_roleId_dashboradPermissionId_key 
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
       public         angelds    false    292            �           2606    207138     peopleTypes peopleTypes_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."peopleTypes"
    ADD CONSTRAINT "peopleTypes_name_key" UNIQUE (name);
 N   ALTER TABLE ONLY public."peopleTypes" DROP CONSTRAINT "peopleTypes_name_key";
       public         angelds    false    316            �           2606    207136    peopleTypes peopleTypes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."peopleTypes"
    ADD CONSTRAINT "peopleTypes_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."peopleTypes" DROP CONSTRAINT "peopleTypes_pkey";
       public         angelds    false    316            �           2606    117138    phoneTypes phoneTypes_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."phoneTypes"
    ADD CONSTRAINT "phoneTypes_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."phoneTypes" DROP CONSTRAINT "phoneTypes_name_key";
       public         angelds    false    260            �           2606    117136    phoneTypes phoneTypes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."phoneTypes"
    ADD CONSTRAINT "phoneTypes_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."phoneTypes" DROP CONSTRAINT "phoneTypes_pkey";
       public         angelds    false    260            y           2606    100829     postalCodes postalCodes_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."postalCodes"
    ADD CONSTRAINT "postalCodes_name_key" UNIQUE (name);
 N   ALTER TABLE ONLY public."postalCodes" DROP CONSTRAINT "postalCodes_name_key";
       public         angelds    false    247            {           2606    100831    postalCodes postalCodes_pkey 
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
       public         angelds    false    262            ~           2606    100833    subModules subModules_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_name_key";
       public         angelds    false    249            �           2606    100835    subModules subModules_pkey 
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
       public         angelds    false    298            h           2606    166217    Warehouses unique_name_shopId 
   CONSTRAINT     f   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "unique_name_shopId" UNIQUE (name, "shopId");
 K   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "unique_name_shopId";
       public         angelds    false    237    237            k           1259    100836     account_roles_account_id_role_id    INDEX     l   CREATE INDEX account_roles_account_id_role_id ON public."accountRoles" USING btree ("AccountId", "RoleId");
 4   DROP INDEX public.account_roles_account_id_role_id;
       public         angelds    false    239    239            �           1259    149811    fki_Bids_shopId_fkey    INDEX     M   CREATE INDEX "fki_Bids_shopId_fkey" ON public."Bids" USING btree ("shopId");
 *   DROP INDEX public."fki_Bids_shopId_fkey";
       public         angelds    false    254            f           1259    158149    fki_Warehouses_shopId    INDEX     T   CREATE INDEX "fki_Warehouses_shopId" ON public."Warehouses" USING btree ("shopId");
 +   DROP INDEX public."fki_Warehouses_shopId";
       public         angelds    false    237            �           1259    174535    fki_cat2s_cat1Id_fkey    INDEX     M   CREATE INDEX "fki_cat2s_cat1Id_fkey" ON public.cat2s USING btree ("cat1Id");
 +   DROP INDEX public."fki_cat2s_cat1Id_fkey";
       public         angelds    false    310            �           1259    174483    fki_envoiceNotifies_shopId    INDEX     ^   CREATE INDEX "fki_envoiceNotifies_shopId" ON public."envoiceNotifies" USING btree ("shopId");
 0   DROP INDEX public."fki_envoiceNotifies_shopId";
       public         angelds    false    306            �           1259    133562    fki_shops_shopRequests_fkey    INDEX     Z   CREATE INDEX "fki_shops_shopRequests_fkey" ON public.shops USING btree ("shopRequestId");
 1   DROP INDEX public."fki_shops_shopRequests_fkey";
       public         angelds    false    272            �           1259    133568    fki_shops_status_fkey    INDEX     M   CREATE INDEX fki_shops_status_fkey ON public.shops USING btree ("statusId");
 )   DROP INDEX public.fki_shops_status_fkey;
       public         angelds    false    272            |           1259    198938    fki_subModule_ModuleId_fkey    INDEX     \   CREATE INDEX "fki_subModule_ModuleId_fkey" ON public."subModules" USING btree ("ModuleId");
 1   DROP INDEX public."fki_subModule_ModuleId_fkey";
       public         angelds    false    249                        2606    100838    Accounts Accounts_personId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_personId_fkey" FOREIGN KEY ("peopleId") REFERENCES public."People"(id);
 M   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_personId_fkey";
       public       angelds    false    226    3153    216                       2606    100843    Accounts Accounts_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 M   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_statusId_fkey";
       public       angelds    false    216    3171    235                       2606    101261    Bids Bids_brandId_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public."Brands"(id);
 D   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_brandId_fkey";
       public       angelds    false    252    3204    254                       2606    149806    Bids Bids_shopId_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES public.shops(id);
 C   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_shopId_fkey";
       public       angelds    false    272    254    3245                       2606    101271    Bids Bids_warehouseId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bids"
    ADD CONSTRAINT "Bids_warehouseId_fkey" FOREIGN KEY ("WarehouseId") REFERENCES public."Warehouses"(id);
 H   ALTER TABLE ONLY public."Bids" DROP CONSTRAINT "Bids_warehouseId_fkey";
       public       angelds    false    254    3173    237                       2606    100883 #   Dashboards Dashboards_moduleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_moduleId_fkey" FOREIGN KEY ("ModuleId") REFERENCES public."Modules"(id);
 Q   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_moduleId_fkey";
       public       angelds    false    222    218    3147                       2606    100888 #   Dashboards Dashboards_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_statusId_fkey";
       public       angelds    false    3171    235    218                       2606    100893 &   Dashboards Dashboards_subModuleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dashboards"
    ADD CONSTRAINT "Dashboards_subModuleId_fkey" FOREIGN KEY ("subModuleId") REFERENCES public."subModules"(id);
 T   ALTER TABLE ONLY public."Dashboards" DROP CONSTRAINT "Dashboards_subModuleId_fkey";
       public       angelds    false    249    3200    218                       2606    100898    Modules Modules_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 K   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_statusId_fkey";
       public       angelds    false    235    3171    222                       2606    100903    People People_genderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_genderId_fkey" FOREIGN KEY ("genderId") REFERENCES public."Genders"(id);
 I   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_genderId_fkey";
       public       angelds    false    226    220    3143                       2606    100908     People People_nationalityId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_nationalityId_fkey" FOREIGN KEY ("nationalityId") REFERENCES public."Nationalities"(id);
 N   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_nationalityId_fkey";
       public       angelds    false    226    224    3151                       2606    100913    People People_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 I   ALTER TABLE ONLY public."People" DROP CONSTRAINT "People_statusId_fkey";
       public       angelds    false    3171    226    235            	           2606    100918 %   Permissions Permissions_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 S   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_statusId_fkey";
       public       angelds    false    235    228    3171            
           2606    100928    Roles Roles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 G   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_statusId_fkey";
       public       angelds    false    232    3171    235                       2606    158144    Warehouses Warehouses_shopId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_shopId" FOREIGN KEY ("shopId") REFERENCES public.shops(id);
 J   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_shopId";
       public       angelds    false    272    3245    237                       2606    100938 #   Warehouses Warehouses_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_statusId_fkey";
       public       angelds    false    237    235    3171                       2606    100943 (   accountRoles accountRoles_accountId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_accountId_fkey" FOREIGN KEY ("AccountId") REFERENCES public."Accounts"(id);
 V   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_accountId_fkey";
       public       angelds    false    216    239    3135                       2606    100948 %   accountRoles accountRoles_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_roleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Roles"(id);
 S   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_roleId_fkey";
       public       angelds    false    3165    239    232                       2606    100953 '   accountRoles accountRoles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."accountRoles"
    ADD CONSTRAINT "accountRoles_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 U   ALTER TABLE ONLY public."accountRoles" DROP CONSTRAINT "accountRoles_statusId_fkey";
       public       angelds    false    3171    235    239                       2606    117184 '   affirmations affirmations_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.affirmations
    ADD CONSTRAINT "affirmations_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 S   ALTER TABLE ONLY public.affirmations DROP CONSTRAINT "affirmations_statusId_fkey";
       public       angelds    false    3171    266    235            ,           2606    190741    cat2s cat2_cat1Id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.cat2s
    ADD CONSTRAINT "cat2_cat1Id_fkey" FOREIGN KEY ("cat1Id") REFERENCES public.cat1s(id);
 B   ALTER TABLE ONLY public.cat2s DROP CONSTRAINT "cat2_cat1Id_fkey";
       public       angelds    false    308    310    3316            $           2606    125325    comunas comunas_provinceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT "comunas_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES public.provinces(id);
 K   ALTER TABLE ONLY public.comunas DROP CONSTRAINT "comunas_provinceId_fkey";
       public       angelds    false    3261    278    280                       2606    100993 :   dashboardPermissions dashboardPermissions_dashboardId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_dashboardId_fkey" FOREIGN KEY ("DashboardId") REFERENCES public."Dashboards"(id);
 h   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_dashboardId_fkey";
       public       angelds    false    218    243    3137                       2606    100998 ;   dashboardPermissions dashboardPermissions_permissionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_permissionId_fkey" FOREIGN KEY ("PermissionId") REFERENCES public."Permissions"(id);
 i   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_permissionId_fkey";
       public       angelds    false    228    3157    243                       2606    101003 7   dashboardPermissions dashboardPermissions_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."dashboardPermissions"
    ADD CONSTRAINT "dashboardPermissions_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 e   ALTER TABLE ONLY public."dashboardPermissions" DROP CONSTRAINT "dashboardPermissions_statusId_fkey";
       public       angelds    false    243    3171    235                        2606    117199    docTypes docTypes_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."docTypes"
    ADD CONSTRAINT "docTypes_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 M   ALTER TABLE ONLY public."docTypes" DROP CONSTRAINT "docTypes_statusId_fkey";
       public       angelds    false    268    235    3171            *           2606    174473 /   envoiceNotifies envoiceNotifies_deliveryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_deliveryId_fkey" FOREIGN KEY ("deliveryId") REFERENCES public.deliveries(id);
 ]   ALTER TABLE ONLY public."envoiceNotifies" DROP CONSTRAINT "envoiceNotifies_deliveryId_fkey";
       public       angelds    false    306    304    3307            )           2606    174468 2   envoiceNotifies envoiceNotifies_envoiceTypeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_envoiceTypeId_fkey" FOREIGN KEY ("envoiceTypeId") REFERENCES public."envoiceTypes"(id);
 `   ALTER TABLE ONLY public."envoiceNotifies" DROP CONSTRAINT "envoiceNotifies_envoiceTypeId_fkey";
       public       angelds    false    306    3305    302            +           2606    174478 &   envoiceNotifies envoiceNotifies_shopId    FK CONSTRAINT     �   ALTER TABLE ONLY public."envoiceNotifies"
    ADD CONSTRAINT "envoiceNotifies_shopId" FOREIGN KEY ("shopId") REFERENCES public.shops(id);
 T   ALTER TABLE ONLY public."envoiceNotifies" DROP CONSTRAINT "envoiceNotifies_shopId";
       public       angelds    false    306    272    3245                       2606    101008 0   grantRoles grantRoles_dashboradPermissionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_dashboradPermissionId_fkey" FOREIGN KEY ("dashboardPermissionId") REFERENCES public."dashboardPermissions"(id);
 ^   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_dashboradPermissionId_fkey";
       public       angelds    false    243    245    3187                       2606    101013 !   grantRoles grantRoles_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_roleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Roles"(id);
 O   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_roleId_fkey";
       public       angelds    false    245    232    3165                       2606    101018 #   grantRoles grantRoles_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."grantRoles"
    ADD CONSTRAINT "grantRoles_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."grantRoles" DROP CONSTRAINT "grantRoles_statusId_fkey";
       public       angelds    false    3171    245    235            -           2606    207139 %   peopleTypes peopleTypes_StatusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."peopleTypes"
    ADD CONSTRAINT "peopleTypes_StatusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 S   ALTER TABLE ONLY public."peopleTypes" DROP CONSTRAINT "peopleTypes_StatusId_fkey";
       public       angelds    false    316    3171    235                       2606    117139 #   phoneTypes phoneTypes_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."phoneTypes"
    ADD CONSTRAINT "phoneTypes_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."phoneTypes" DROP CONSTRAINT "phoneTypes_statusId_fkey";
       public       angelds    false    235    3171    260            #           2606    125300 !   provinces provinces_regionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT "provinces_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES public.regions(id);
 M   ALTER TABLE ONLY public.provinces DROP CONSTRAINT "provinces_regionId_fkey";
       public       angelds    false    278    276    3257                       2606    117169 )   salesChannels salesChannels_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."salesChannels"
    ADD CONSTRAINT "salesChannels_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 W   ALTER TABLE ONLY public."salesChannels" DROP CONSTRAINT "salesChannels_statusId_fkey";
       public       angelds    false    3171    264    235            %           2606    166196 +   shopContracts shopContracts_contractId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_contractId_fkey" FOREIGN KEY ("contractId") REFERENCES public.attachments(id);
 Y   ALTER TABLE ONLY public."shopContracts" DROP CONSTRAINT "shopContracts_contractId_fkey";
       public       angelds    false    286    296    3275            &           2606    166201 '   shopContracts shopContracts_shopId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES public.shops(id);
 U   ALTER TABLE ONLY public."shopContracts" DROP CONSTRAINT "shopContracts_shopId_fkey";
       public       angelds    false    272    296    3245            '           2606    166206 )   shopContracts shopContracts_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."shopContracts"
    ADD CONSTRAINT "shopContracts_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 W   ALTER TABLE ONLY public."shopContracts" DROP CONSTRAINT "shopContracts_statusId_fkey";
       public       angelds    false    296    3171    235                       2606    117034 (   shopRequests shopRequests_accountId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."shopRequests"
    ADD CONSTRAINT "shopRequests_accountId_fkey" FOREIGN KEY ("AccountId") REFERENCES public."Accounts"(id);
 V   ALTER TABLE ONLY public."shopRequests" DROP CONSTRAINT "shopRequests_accountId_fkey";
       public       angelds    false    216    3135    258            !           2606    133557    shops shops_shopRequests_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT "shops_shopRequests_fkey" FOREIGN KEY ("shopRequestId") REFERENCES public."shopRequests"(id);
 I   ALTER TABLE ONLY public.shops DROP CONSTRAINT "shops_shopRequests_fkey";
       public       angelds    false    258    272    3215            "           2606    133563    shops shops_status_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_status_fkey FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 A   ALTER TABLE ONLY public.shops DROP CONSTRAINT shops_status_fkey;
       public       angelds    false    3171    235    272                       2606    117154 #   storeTypes storeTypes_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."storeTypes"
    ADD CONSTRAINT "storeTypes_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."storeTypes" DROP CONSTRAINT "storeTypes_statusId_fkey";
       public       angelds    false    235    3171    262                       2606    198933 "   subModules subModule_ModuleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModule_ModuleId_fkey" FOREIGN KEY ("ModuleId") REFERENCES public."Modules"(id);
 P   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModule_ModuleId_fkey";
       public       angelds    false    3147    249    222                       2606    101023 #   subModules subModules_statusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."subModules"
    ADD CONSTRAINT "subModules_statusId_fkey" FOREIGN KEY ("StatusId") REFERENCES public."Status"(id);
 Q   ALTER TABLE ONLY public."subModules" DROP CONSTRAINT "subModules_statusId_fkey";
       public       angelds    false    3171    249    235            (           2606    174380    taxValues taxValues_taxId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."taxValues"
    ADD CONSTRAINT "taxValues_taxId_fkey" FOREIGN KEY ("taxId") REFERENCES public.taxes(id);
 L   ALTER TABLE ONLY public."taxValues" DROP CONSTRAINT "taxValues_taxId_fkey";
       public       angelds    false    3297    300    298            �   "  x����n"G���OaY{��g�bccsX��������3���)�B�Y!��TW�����Up�K��3�ϔ|Ξ��WU4w�y��2̟��$�*�GrQ�n;/��9k�B���8���SQ{;��Q,~�v\d~V��� @Ή>8��JM�ӌ�>'�{�t��*A� ���1g��:h���{�"5,
�rL)``<Q\%�X��Q�D�5T-0e5�r�+c)%�RKO�v�{B��A�H%0cA;�U`�:���X
����NYg��V1�D
\Y#�b\yD{��)A ,���UV5:y��nŁhK8J��i)����Ԡ �D�F��pGpJ�QҤD'FQL"���Q���\�RB+�3�䀳��Q:�$"(��$��i�9�ť:���Z'B��Li�)��G�5��"pH��Y4�s�<$�?C�2Ebk�ч�x�	���T`!.�@:�#Z��J�U�>%���
v�*S����i�3��Ee4e@�T�R���A�a�1�JH��@��Q��qD
�e>H-8��im���N:��%,���JN�h��x��	#����A#q��ԑ#V�J�B��ܣh#����P�,j��K�O�2���(O~;���)���ljˈ�g�Y9���OT�U��鬝-��y��+7�6�:[����z���������vX��c��5ho˯q6=hU*�zUW��r�I���9}JEU�*��ۇ�'qwG��Ÿ3���чq�v�����7���=�3�Ǡˢ�:K��!��f<�_�B�![��䝃�~ܶ�z�i�OX�{���a�l\�y_8we(\M����u .�@s�߬`��ھ�-��^�����������.o�������FY��6���h�O�-��䛿8�W#�z�ޥ������>�i��]�'y>���mM��ﹼ����ju�{��{j؁�l�����d��_M�ۓ�NU|z���T�\]����6�֢42R���v����ϯ�`?�l>�eqqx���OWA��f��C?���>���� �6���h'����E�Pf6~)sl��`GRt���R]�C��n�����������^�W�$��>�lu�]{�3��P_��Qo�&�'��G�Ee6݉�7*u�w�W9��,ե<�}D�op(�����7��ީ��2����{~Q���:�����v���(+V���_t��tZw�/a$���z��M;��Fjv�W����{D����m������Çee=6�j�}����z��nU|^���ٹ�ˆT��1���-��T������hƅ�!��>}��&��      �   �  x��R]K�0}NE���H�f]�O"��i\]R�T�d�ʟ��sL_���{ι_=rL���ki����Q���X�u��I)-����w��� �\��c�O����k���L1�jݼ�L��3�0�,g�5���mJŽvU/C�}���T�R�	�:� ���o8��]�@q�ڮ���Ėvַ�G@n��z��u����Cα�Yb�_�
k�Y׋����"E���g)+u����X�aq�j�;�G�����xl�%�ɀK*�9>�E���;������S��2P��y�tj��#�(��b#+�gu���`U?������L"'D~�����_�j�[��V�Ά�8U�|���x8rϩ��o:��M�6�'S�q��J�Yz���a�$o���      �   H   x�3�.I��I��4202�50�5�T0��25�22�37�50�-�e�RTZP�J�fcN��Ĕ�D�4��qqq ܗ&u      �   �   x���M
�0�uz
/P'Il=� ����'^@&됏G�002Z��B�ndC�s���赔w�k9����G��d����յ��xI���䆏K?z^<���(dP�8ܥQ�X�rQ����d��      �   9   x�3����M*J�4202�50"#C+c#+K=c# ����oiVj��c���� ��      �   q   x�3�t��+)J,�/�4�4202�50�54U02�22�2�г4�50�-�e�阓�����J�	���I9�ɉə��b��Z\���Y\4�\C�A����^Zt���yd���� �K�      �   @   x�3�t�()J��J-J�4202�50"#C+s+#=3c]<R\����9�y������ �V      �   z  x�͖=o�0@g���`����*E��!S��mP[)!	C��&�D�V	K؏?�9�BtW���h:˾#�5*�6 ���L�� 9�+�pE8:%���z������k�SG`BBk^�^�ҷ)
%�!� �����U^�)��&�����T��R����8š��q��=�M4E1HQ;�NIۊ-4E9T1uB1���&���h�@�ގb�@QU���0�G��n�ZDUVd�}��e^�/���6q2e�C�4t�J&���,ZZ[�=�$�����4�*���|F�g3|{��KÃ$�>����3��}��Ɛ��+
���E�8S�,�=h�8����:YV�ל.���:)� &Z? ]t{�g����u      �   b   x�3�tL/JMO,�4�4202�50�54S00�26�2��356�50�#�e�雟����L�Ɯ��yť9%�a��[P���I���.��@P1z\\\ )F�      �      x������ � �      �   N   x�3�t��-(JL�/�4�4202�50�50W04�25�24�31��50�#�e�阒���Y\B�9��a�y)������ z?,�      �   �  x����r� ���.��+�˾A�3��M+�
ȉ߾+'���}O؏e���Fy-�n���Y9�x{�v��e��2�ס�����Y�&��Q߇A�E,�X�r��������Rn���j��e�37ܳД^ݧ������
x7�P�͛�����6�^�Y"ܑ��g�c}}u� B�xQ�0�*��eѓ��芡�����볛��2���1�a�&�	���ʹ@��6Q��4�2q�e�/&�7�N�2�N�!#�W�/;!_��	�	�4u���^�1 ��/B�]"��e��xۧJ�0eo���h�8�'3�`b���a^��᧌��&M/�kz���bE��l"��[� �S%=��">��l�gLCGƸC��]P�r�EH�6�N8�����C|��c"�زb7��Y���O��4۪�O�.�]���F���zWz��h��n�5EI2���z=h=^`(���W�-�amth�i�TQ�I��+��Ƭ��J`�d��T��g\��=�N�T��le ����<2��P�}��E�O9ƅ@��,CY�2F��]���P�
[3ar���H'�a�u
�F p��j@)�Y*�`��'D����k��MG,���u�p̌��rsl���`s��7�'D۫3�j�����U?VB�y�����Jy~a��ބ�!�]&u87��u8�6K��a�xU�E��勤�_o�������      �   9   x�3�tL.�,K�4202�50"#C+SC+#=Cs]<R\F��y������ `N      �   �  x�}�Ɏ^7���0j��AR�Z��dCQ�c���I�w�s�(��j��AW"�s}�����xۏ�O?���~|�O��zy��@�A�=��ab73�@��n�~�����ÅE����������v�FR���ٝT��gS��ec����PԐ�^-f_꧒��ϵ"2��.�kk4j�)N�dXZ�=���f�6��9T*��>+ݕ��u�
w%q�C��STX��^��-g�ɄU���me_�ї���Ϣ�7��vt��G�g��9Mp0<@�=����~�2=�F{���R2�J��];�����G��Z���څŹ���Q��ɧ�&�8PA�9��r۫�rY{1��q���#�����w�wO��~̏�� }`F�o$��7���~����m�:��e�3�/"�����<s�i����NA!�`��#t�N��9f /|'[6�6J�q���:Y	�ZzFj�Z�X���Y ����:�nN=������@_k:c�
 8*�1O�4�e;\����"�f��:��%g�%-��v�ў:3��[ o8B�����(V8s����M�U5� !�BKq~ ����1P۹٫�m�Pԁ#��vb����O �ـ����o~y�T��ǟ��oS Mn.������!�m����k�G����u�ܣ* i��yɂ�Ǝ*4�T�$�}N�U0�H�Ψf/�m��c5�0�!�:z�Y�P�y���c�l>�p!�Ey?mÎ*��6���ܪV��;=��~ЊIt����1h��>�#O�-�)�����t<����J[I
�8gG���р?_;�:7�R4-X�N�%T�f�I`#������e�kĵ�$xu9i�X��yǆ���V�ἳ�ا�88����?)�����??e���+���>�ެ�on���\_a0��EqG=��d��vdnP
�I��9�I�a,�ۢ5z+�"�j�Qs�%�B/�նpp�2١�	�n�)�y�)*hx!FȲ�[B)�����}"�P��#ul	 h7]��n��~�f�#� �ךs���&LKmm��>\�`	���\t�Q֘`�;̋�&d�mI��O ;����GOz��X(ڔ]�-vSs �Z1��:2i��#R��0h��0��/�����~f�&����_3�ŭ/�B���k���Ԁd��cE��:�l-�[��^�N�Ĩ��!��BU��(�������H�¿!+��S|�O��	��Z0�2A�?�h�rih}ju�冢!c!*��8�Mȶa6��hNuċ����4[��h7�;Q�IM�3�hr�Y�Ԇ�vLc�rm��Q���&;u��ބ/��qf�A���+�j�A�Z�o��&�q�3��ȺȦpXM���|��h@�#m���{�D\��W ��� �����U��W���_�)���#AWS�G��bnC�ή�H�����(���b��GC-��B���Ed'#�� ɴ�a�q͠�sl̉(sCP�a�;��`K���o8�JLd�1d�5��3j�؀1'XE ��'����"�o��H qἲ/�a>{fF��T����v u�(s�6�����Ng�W^!>�A�d��q�%3
}n(_���6�J��A�`z�|�0PMA�1R.
�6/������� ��޽{��N9�      �   A  x���Mo�0�3���b��+��iם�]�Xb�H�D�t��|��͢���J˔n����c?�q ��������~�6��QF��ZR�Sj�6T)Ւ��]����&/�h��M^��+��ۥ���m��UvE�v?����u���}��R{_�vv|Q�C���5Cj����~�ͧ�u��������:Y���f�~�%d��}v�+6�Co}�������}E*w�R�o3 � �PY�*���P�b�'ѼU�	9���i�����}���� $��� ;CXc��0��R�q]���eL��'��p��at5N3�0���ED�(�"'�E4���#7L.$"��+ >C8ZO@����8����b�����0����GWߤ/z�Q���a�TU�7H�͛����À���@����7'��I=v�x���`�!��7.7�2@�*�:G�?�>\�9�_���)���S���~]��y����^n���,��Q4��/7�҃��@��%e��C���r��w4�����)� ���/f}�Hrʊ�_x�����1��^h >��b����      �   �   x�����0��=E��t�9�ri�X=4�_������q�}g��1R����T�
̞ ~ �o ̇0�_�G�7�@Qj�g�Rh)�J�!����pJ)H
s%�JX��)����^C8ԇ}�T_Tk}�_�      �      x������ � �      �     x���Aj�@E��)t�8����,�tٍj)f`fd4��s� ���ܖ�B�"�A ����V�\d�#�0�� 2�q"�����t$���g/	�?�B��x��L0
�1��(�U��8.R�U�:׸��u��n��9�~h���gUw�3�A��"j�`R�U%�僴�+x�.oC@8?��,_��{��칹x^J1�,��R�o e��ᕾ���`G�����)&�ֺ7��=�eq�߳aL�ۿ����a�      �   [  x���=O�0��+"�ĺ/��G���)C��J#��P�;��!fH��Y�u$?��M�l�x��?�f�V�X��f��.��9��*#c�\"��t����]q׬�m�3O�R� ��B��w��!%X%�;������I#`�jHuE��ߐn2�n��Y��ew��:��q�:��	���^������� _p;D5X��	��@dr"�#�C�VgHI���e�c/���)�@�%L8%���*�@�Ӣ�!ү��>צ$���C��j��G"K"S�|M�dw�i�Nڋ�gPI:�=.ƒER˚�S��HD#Q��E�<Oi ����      �   	  x���An� E��,�EFB&��C�*��H�z�^��gD�v�,؂��l�K6�7�/���:dBH։N�blE��t��E�����O��6]Z�1z06xpD����%�b����� ���<�bs�H�7���1Q����.fkȶ�`������O�<3��Nu.�	|�`l�fչ�;2������{ b�����m~g��JQ�/�`F��Q�mSʂ�vuH�Z���$��S�$B�:����>*:B�1��+_���P]w��S�4?��      �   ?   x�3�N-*�L���4202�5��52T00�22"=c3]<R\F�E�)��%����� ��         a   x�3��HM��WHT�M����!##]K]s##+K+s=3sC#]��\F�!�99�E��T0̘3��$�(31�*ƙp�&��R͸=... �D�           x����N�0���SXbN�8I��J!�H����ȕ�E�#Qީϐ�!��ϧ���qW��(�\A���e�k&��+��e��\�?�l�S)H%ܠ1��؉mFݩ�R`%��	�tN"����>hH������l���W��j5YL"���~%��x^��ydhY�z4��K���|�)y&����Ll�'șHOx���>��=��2`߼N��G�i�_A�/�V�4�V���܎��P�S�V��U�p��,�>b�Z         +  x����n�@�g�)tN�[����Z$�Q�����{�3N���2t(�~�R�-;K3g�?PG��?�=օm�����"��8<�0��"�/��<��Q������:�ajeP���Wr�E`C�Se��Lp��J�R����/�+�*9^S��X�a�,
�(�E�C�.�޾.U��0�����M���	����:x
֊w�r�}��a�0�:CSC2@N��u��j%��9�Fimeh|!m�bK�S�l�/8���
�� Cd����E�´�֚�^�G̺l�%����O����"'B��LI.p�!M�dW�r5e���ò�BYC2��Djc7}�c?n3\�S���T]�?��!�m�!��oSrTY�P��r��.��Ո 3�܆�Q�7�;jr����S���za�O)�.���VdG�����j�T]Yb
U�ͮ�e�c�)Ӵ��4�1|�k�	Ü+�>�uOS½��7b���sƭ��u��%�ކ��c�δ��pq�\_l«��f���Ԣ's�rOWۗ=����T8�����2�XW������2��w��Z5'�ILC�����Ե�2Ĉ?y�J`P��y�4�y�Ъ���E)onu����lO �{[�Ȭ'.��f�Tdz��-i�2�ҽ�%���;S_q�R�����DhY�ۊܛ��[Y����P�E$C�JK�7UOܘ'W#�g�Co�\�N���*Hn-놞9\8dn&<UpAZ���0�h�
Oý�Me�Ҁ�4�J��H<�z�]�
�a0�YţީB�><��|�.      	   \  x��ԱN�0�����[�N�4ݠ��P���咚6��'��x���h)B*���O>���pCƪ���gB�a��p	�Xă��9�8�c.��L�T���j$`b���\3�Nv��3T
��(����]����W�ҋ���
/��	�H��iCx<���ֵ�;��
m���]͋�p�E,LS�c�`s����KEd°�cw�Hn U�7E�gfp�٢eVU��]3�U�dK�n��ɺ_�y��	č`��f1W�uS��֫��~;1�{��>�d� ����8��s�#�����ی�<	sC�q����_����q�Sr�;U��p�i;�~=!-ø��(�� +��?      �      x������ � �      �   �  x����n�H���S�v���e�����9Y'`��pڜ�5��R���#�#(T����)_쪊�]\r�	
l�&Y]���.g�"��Lf�4OJ��2I��e%��9]��J������\QG1���
���6�O�RN&�h�َC� �2~��p:��S@��y�yt�Gr������_��_pjs|s�ނ��y=RD���f+	R2�!��]��ɲ�\�C�H-�2+̵�����J���)y�^Yen��QΊMӳC0+��6ｧ��
��ꓭ�ǐ�mr1P���6�������d֘M�mhFe��@�؍�C�湳���|Gm(��س�7T��:::N��$��y]�!� ��co}rE���a���e�.:�3U��>5m�y1����������3P>d����0)7o�)�s�U�*���C��	K>���>@L�	���-�b��ᨕyK�k�Κw6
[샍�VQVm��#5�3���f��J����(��O�&Ô`��kQ9ɖ�������llT����@lb0�47�W�ch`\eޜ<ɱ�e_8�K�$b���[[b�4LA�ku>��%�Y��q}z���ڨ�zq�z�V���߲���aZ�b�O�Q�fk�|I��'�&�xQ�y�>�|>�5`ڰ�䝳���Y���� ���]G��¤ڼ-?��6}t��V���(�� ��U�²���ؘ_I҆�i��,�*���S��Y��ni�'��[I��;�����s}��$�3�n4m�j�֓�-_`Ԇ�h�y���A�:���^�2���C����u��)��w'��v^�}��Ak�i�f���I��e�w��u�L\��l#?������)ſ��ZP�c�Q�)������ޖɅ����Qg���C�
l�0/�ԯ�r,&�������yT����cϱ@���[IB��Տ�Nӓ���8�6�l�&�"�zcfU(�%9�@�&�Ȼ�0g�����(��e嬡�w�z{�1�����G.y˞,���\�a��L���3y�X��()V)�a��VVH�ѽ#��ѓ�@^>&X�HS�����e��mj���}�d�ahn^��O�H;��eiaް�8�ֳ}���C"Kwd��8z_E�?- Ө�����i�S6=-��n�[��a�)�]!I(����mH.)�lu_]�	���h?&��d%��
��͈o�L�w����L��ӷ��kg=�Uԋvt1ZvHq�]�����?=�8�6���Bވ#���'����� װ��a��P�.�n�c���m����+��11
*U�\Kmi�G���>��W���Y�P�Q;J�ap��(�9\dᰈ�mD�h���`�D��Q{9@(P��{vF?�C00���G>�qX!]5��"�ND{+�K%gZ�����D�@���y�oN2�0�6"�l�he���"�2�p�6PV�,��p�(ss8�x��e�w���BI%�Ʊ�M���Psp��r��𕄉�MX��˵��D�"�� nXԆAzZ.`cU���k4���&~��'N�$ �x9ZM}`%�����([�%�Ad�Sφ�J#i�=�q�
�^�Qa�j�b^�Z0lm���Qځs�J�U5�����(�O���
Z��!lx�%:�ws�e���%U��
���,�0���H���s]1�$eJ��:��'�I�x�甍Y`��l%�O"�`G��\Gqc(k�J
�5���*>�:��VOӷ�	���o�SJ6����l0�du "U�&t��q��|iO�Kb��x̵���O)ps�-��g�
��M��U�:e��)ʾFQ��[�A�,���(P��~N��?��ر�UV��hq���j���KvӴ��\K�4��Ԃ�)�bgV��a�q8jc^tG��49
�H <z��29�XX/�&�<���dCY�ܯ|�K[`e�.�bY-QΫ�Iˏd=N[I��E:Z��8pX�9��0K+�
Eiex}/+OU�P��ld(���ݍ8g��2��SN8�0�.N�	'��E�Kv��L���󴒋�j`(I��wQz�`���?Ω�_�o��?ü��}sP��2	s�9+�-0-3����ݍ�r���&�s��]�5;��p��YW�����Jč-c�?6z�F�ͯc�[��I�v�/Zl)�bK��=A�x�b .�K_2#����h@�Q���G��(�P�\��Q%;�a�ǫT����;�ҵC8v}ޙҭ���ֳ;0m�gޘ��I>��������mg';=�8+����9i$��o����j��I��j*FI�W*���^��v�6�\�b%�f�M�,�(Iqv�杖i&*yP�4��}�_�6����R���Po�>�|�x�5Ǹl��l�f���vn	�S�7޴=�D!78y���l��e��J���R�w}K_pR&7��BR�뗱G��,������.��<2d�ʼ"O��<�ڼ
qg	'I��8h~EI9�?���Q�*��^�q�Xq�;�{J�tG��*�]m����N��F��Ԋ��]�K>1�8~<WmP\%���CIrн�q�T��E��{�+�͡s�G����o�7 ����l.�DW�d�[+���$����>��V������&øʼ�s��Z���YAr���y��		Q�c�R%I�T�Iu*�w�XT��#׎��+���dL���rq�N$��^rx��Jk
�V�zz��x����ql*M 0LZyMY�,��Ўg���6�\��;��	�2�rb`�Y��i7�4����,.���mHnf�Ei�V�>� M�[͸7%ֆ�o��u⷏���S.�:Uχ��_�'op��<��e�<a��jg(M�vY���`��{l��G(R���9s�J��o�Y�V2�`'��ĺ
)�r$(�p���<�?DI5��A%0��� �sj� M������Fi�q��yQ�0+��qzwm�y���= �W�����c�EV��B�X��8|��N��aؚa_4��������/m�g����P�\��'��ϗ\����"�q�N���y.���?N�q�\���N+���L��I���I�V�,r>�I
�0im^��mC�j=���ǲ�E�1k[ן`X!S��`=NʴbI�?%�X���a�"��l�/@+�nl�)z������M��7�(P�ܦ�8H��Gs�馢���T'�(o��Sr9Oͫ��ڵ(��څ�6������a�*�6Dp����m@�̲{]G�2�I�gG�y��,��8��
�X|��Ob�s��d �_??{�쿋��      �     x���K�!Dѱ{�@G�1�����H2ΠJ��AjK��������j����#n�SW�wPuC���Vt�Qv��n^m~vM�5����j��y��ͻ�����윗��R�:b�n ��gm6_��m]�KG��e�P�q����fC��B.�u
ݰ��M�ݲ��m�<]s�][]K����l	t��tݖB7l+t�@�l+t9OWn[�+��`Wyz����t_����?�����~��߶�#�~��y���u]��4�      �   8   x�3�q1�4202�5��50S02�26�21�3�4�50�#�e�mD��=... Z�y      �   C   x�3����MM�L,I�4202�5��5�P00�20�20�355�50�#�e��_� 4#%�L#b���� ?��      �   L   x�3�
�4�4202�5��50T04�2"=S]<R\F@�~d�6�t��$[�	g�c�c�P�+�f��qqq ��0�           x��ӽJ1�:�K�p�������Q�-�ZEX�ݝd]�dcH�|�K�A#>�a��#PHg1d���|Y=ڗ'�����۳U{{wcO{���~�W��?=��CG;"eT�.L��D?L? ��2����2J��2����R�#@�k�&J���n�P���w,� �Q!$QW�TwJZJh�ke^8�z��5(�C���2�
P���ڨ��@kce�Er�~���GEq�9e�5�W���Cu+��q���m�$zp�0|H�&      �   =   x�3�t�O�)I�4202�5��50S02�2��24ӳ0��50�#�e�閘\RZD��=... @��      �   �   x�����1D�su�@�0ؘ�X&�8o {��	=��K������v[�#���o{^�����=%|)OM�wc�K�?�$�z��m�k�� ��#�[S��o5%�[�A�m���@����)H�r(H���ٟo�w�L�{�zJ|*�ߚ����Ϲ���m�~?��{c�CEx���un'�yn'���N���N�9�/���jH�W.'�����UOI�>��~
q�      �   G   x�3��MLI-J�4202�5��5�P00�21�21Գ���50�#�e���X\���O�Ɯ>�y������ wF'1         1   x�3������4�4202�5"CCs+S+=c3]<R\1z\\\ �w�      �   F   x�3���/���4�4202�5��50T02�22�20�372�50�#�e��X�H�vcN�܂�T
L����� ae&�      �      x������ � �      �      x������ � �      �   e  x���=n1���)�6�W?�d�NȈ��ҌW�D�!����E�t.]�|��X�>.^'H!�͛�B�Ѷ*��y�_�ˋ�����.���e]��U����묔�F�����q�������r㲽~�8Ց�F�~���=XQ�y*lX�B���u�%-es��F\��}���*�nz%AE.�G���r
�-h��p�M�,YL%[EN/,����iv0��4��9^#��gk0=����!�tM�8B��RH�R>���{X���5�v&5`����A��u���l�eҽ��0b���P�a���J��vtI�ܧ�?{�jR7�G�����aC�����l�=i��Ks�x0^]���%�w(-ɝCU9*��=,gš��)k���g����Jb����L�c!R�F�mȮ�5�|k��N���-d�5>8C����azAId ]���v��9R}v��a��4[�'��$�7?Y�g)��X#�8�E'duVˇ>DhP�����Ѡ��m?=CN\���wv��|��:�<=ؓ��H,k%����r�i���&O/��)xTfIj�^pi�)0�x�AnpfV�ޚSxv��h��Yd%�o7 �g7}�[�?�3���foAH�      �   S   x�3�tK-.�,�LILI-�4202�5��5�P00�2��21�330�50�#�e��Z\�������C�Ɯ.� 3S��uE� 3�,�      �   E  x���=n�0�g��@��M����p�"-�]h[u(�++C{��2��X��h���{O/�ҪŧxB�v�{H�4�ūY��b���y>/�Y�,���i��Z��g��H���8�Yul���WP)��>N���aR����j�� ���t�F�ʡA�K��)v� �
�J�'+��Hk��$Ńe&؇�Z�OZ2&��İQ��]Q����S��_8;�0^
Mb��MpLO��`[̰0�5�où�Wh5/�[�?��6��8��.g�����|8��e6Ο���Q���4\E���Σ(�U .      �   �   x���A� ���p�� ͔V[{c��+7fA� �_���/���\�sś�`#W��!M�&�D�L۴�i�4����ΥJ�1qnܭ-piE�l˓�+Z�O��K��>z�wF��>u������Ǡ�� ihI�      �   �   x�}��� Eg�
�fiޣP�~�IGuP�	�@B���߅����{��1"È)T(��-	�G�[�t����M��]�Q@�H��H��z�6�e�삳.n�t�_�T���Pػ0��>�1m�oٮ�J�n����ys�3?5���Y0U      �   �  x�}RMo�0=;�����_i߶!�.͂-@��=0���%C��E~�~@O��?6��2#(v�%����i�y|	���J��������u��eXX<�nP��/�p��UI�D�(�$�:ʊ4-f�4�Ͼ�V�&�*g7(�&�Gc�'0���Nj����mE'��}Yn�u,Q�����MO<�&�PF����Vy�`�u䃗Nrzh�_%q㔰�rV6��>����D3���U���6A4��Bu�8����6X��Y Ԋ���J���Qu�Y��+�iO������<� �(\U�!o�t��J*�?=H�k5jM� 0)�:�S��(����[�|!�U_Y?j�=w�W4p�x?@�C9o��:/���E��jXi���z�MTV�l�J�-q, 6l���
v�oɫ�a��J�v�,Z��$��J�c�@YY���4�<� �?�xV$Q��<�&QvN�1�y�͋4���u����~:�� ?0�      �   &  x����j�0���S��6HK��Y�u0vY١��5V�
v:(��gًM��`;������/Y�z���q��6+�&��p��%o
-G� ��5{h�����ބc�;>P�ԃ
7�0ȍ�mh��x�`l�zt��)HQ�)X�4֏��+=<�{y�O�ŤԠ��ݲ�M���䳿�������v{Z�:J��3��W펂E��r^ͫK?��7*�nU�Ω�E���\{lc���`k����X���F�=�c����;<e^�� rm�+����l�I�|�>��      �   i   x�3�t�Sp-K�)ML�<�9�����@��B��\��������X���L����	�cAQ~����������ĔD24�H���E��b�闚N��=... ��N�      �   �   x���Aj1EמS� ����Pr����v��1�XA��}�ːE]	�����;.�#�Q8�XY������f?�ѿ�~�y�ঢ়��a������זA+�3���"O����V�Kˉ�п��C�,�6k�p"�2��j�
���A��/��kN���#��Z�B�t���BZ��-�G��lLC4Q;؂�_��w�0� $.�T      �   �   x���;�0D��)|�����C�� Ȣ�1��V
1�1w�����HAAE��+=����3>܂�pL���	/�����J�2OX��ĉ�=��ܣV�`|/���Z��rAJ��͡�|���g��������h�=.PV�+��JO�!�X�~�X��!���rz�cz��	rJ	!'���      �      x������ � �      �      x������ � �     