PGDMP     	    4    
            v            EmpRewardSystem    9.6.4    9.6.4 ^    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    41619    EmpRewardSystem    DATABASE     �   CREATE DATABASE "EmpRewardSystem" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 !   DROP DATABASE "EmpRewardSystem";
             postgres    false                        2615    41620 
   department    SCHEMA        CREATE SCHEMA department;
    DROP SCHEMA department;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1255    41793 D   updateemployeebyadmin(integer, integer, bit, bit, bit, bit, integer)    FUNCTION     �  CREATE FUNCTION updateemployeebyadmin(department integer, roleid integer, pinsert bit, pupdate bit, pdalete bit, active bit, eid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

DECLARE
	DId int;
BEGIN
	select departmentxroleid as DId from department.tbldepartmentxrole where departmentid=department and departmentroleid=roleid;    
	UPDATE public.tblemployee SET departmentxroleid=DID, isinsert=Pinsert, isupdate=Pupdate, isdelete=Pdalete, isactive=active WHERE empid=eid;
END;

$$;
 �   DROP FUNCTION public.updateemployeebyadmin(department integer, roleid integer, pinsert bit, pupdate bit, pdalete bit, active bit, eid integer);
       public       postgres    false    1    3            �            1255    41795 �   updateemployeebyown(character varying, character varying, character varying, character varying, character varying, integer, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION updateemployeebyown(fname character varying, lname character varying, userid character varying, pwd character varying, email character varying, gen integer, cno character varying, addr character varying, eid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

DECLARE
	DId int;
BEGIN
	UPDATE public.tblemployee SET firstname=fname, lastname=lname, euserid=userid, password=pwd, emailid=email, gender=gen, contactno=Cno, address=addr WHERE empid=eid;
END;

$$;
 �   DROP FUNCTION public.updateemployeebyown(fname character varying, lname character varying, userid character varying, pwd character varying, email character varying, gen integer, cno character varying, addr character varying, eid integer);
       public       postgres    false    1    3            �            1259    41621    tbldepartment    TABLE     �   CREATE TABLE tbldepartment (
    departmentid integer NOT NULL,
    departmentname character varying(100) NOT NULL,
    createdby integer NOT NULL,
    createdon date NOT NULL
);
 %   DROP TABLE department.tbldepartment;
    
   department         postgres    false    5            �            1259    41624    tbldepartment_departmentid_seq    SEQUENCE     �   CREATE SEQUENCE tbldepartment_departmentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE department.tbldepartment_departmentid_seq;
    
   department       postgres    false    5    186            �           0    0    tbldepartment_departmentid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE tbldepartment_departmentid_seq OWNED BY tbldepartment.departmentid;
         
   department       postgres    false    187            �            1259    41626    tbldepartmentrole    TABLE     �   CREATE TABLE tbldepartmentrole (
    departmentroleid integer NOT NULL,
    roletype character varying(100) NOT NULL,
    createdby integer NOT NULL,
    createdon date NOT NULL,
    priority integer NOT NULL
);
 )   DROP TABLE department.tbldepartmentrole;
    
   department         postgres    false    5            �            1259    41629 &   tbldepartmentrole_departmentroleid_seq    SEQUENCE     �   CREATE SEQUENCE tbldepartmentrole_departmentroleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE department.tbldepartmentrole_departmentroleid_seq;
    
   department       postgres    false    188    5            �           0    0 &   tbldepartmentrole_departmentroleid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE tbldepartmentrole_departmentroleid_seq OWNED BY tbldepartmentrole.departmentroleid;
         
   department       postgres    false    189            �            1259    41631    tbldepartmentxrole    TABLE     �   CREATE TABLE tbldepartmentxrole (
    departmentxroleid integer NOT NULL,
    departmentroleid integer NOT NULL,
    departmentid integer NOT NULL,
    createdby integer NOT NULL,
    createdon date NOT NULL
);
 *   DROP TABLE department.tbldepartmentxrole;
    
   department         postgres    false    5            �            1259    41634 (   tbldepartmentxrole_departmentxroleid_seq    SEQUENCE     �   CREATE SEQUENCE tbldepartmentxrole_departmentxroleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE department.tbldepartmentxrole_departmentxroleid_seq;
    
   department       postgres    false    5    190            �           0    0 (   tbldepartmentxrole_departmentxroleid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE tbldepartmentxrole_departmentxroleid_seq OWNED BY tbldepartmentxrole.departmentxroleid;
         
   department       postgres    false    191            �            1259    41636 
   citymaster    TABLE     j   CREATE TABLE citymaster (
    id integer NOT NULL,
    name character varying(50),
    stateid integer
);
    DROP TABLE public.citymaster;
       public         postgres    false    3            �            1259    41639    citymaster_id_seq    SEQUENCE     s   CREATE SEQUENCE citymaster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.citymaster_id_seq;
       public       postgres    false    192    3            �           0    0    citymaster_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE citymaster_id_seq OWNED BY citymaster.id;
            public       postgres    false    193            �            1259    41641    countrymaster    TABLE     ~   CREATE TABLE countrymaster (
    id integer NOT NULL,
    name character varying(50),
    countrycode character varying(5)
);
 !   DROP TABLE public.countrymaster;
       public         postgres    false    3            �            1259    41644    countrymaster_id_seq    SEQUENCE     v   CREATE SEQUENCE countrymaster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.countrymaster_id_seq;
       public       postgres    false    3    194            �           0    0    countrymaster_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE countrymaster_id_seq OWNED BY countrymaster.id;
            public       postgres    false    195            �            1259    41646    statemaster    TABLE     m   CREATE TABLE statemaster (
    id integer NOT NULL,
    name character varying(50),
    countryid integer
);
    DROP TABLE public.statemaster;
       public         postgres    false    3            �            1259    41649    statemaster_id_seq    SEQUENCE     t   CREATE SEQUENCE statemaster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.statemaster_id_seq;
       public       postgres    false    196    3            �           0    0    statemaster_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE statemaster_id_seq OWNED BY statemaster.id;
            public       postgres    false    197            �            1259    41651    tbladmin    TABLE     �  CREATE TABLE tbladmin (
    adminid integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    userid character varying(50) NOT NULL,
    passsword character varying(14) NOT NULL,
    contactno character varying(14) NOT NULL,
    isactive bit(1) NOT NULL,
    issuper bit(1) NOT NULL,
    createdby integer,
    createdon date NOT NULL,
    CONSTRAINT tbladmin_contactno_check CHECK ((char_length((contactno)::text) <= 10))
);
    DROP TABLE public.tbladmin;
       public         postgres    false    3            �            1259    41655    tbladmin_adminid_seq    SEQUENCE     v   CREATE SEQUENCE tbladmin_adminid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tbladmin_adminid_seq;
       public       postgres    false    198    3            �           0    0    tbladmin_adminid_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE tbladmin_adminid_seq OWNED BY tbladmin.adminid;
            public       postgres    false    199            �            1259    41657    tblemployee    TABLE     �  CREATE TABLE tblemployee (
    empid integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    euserid character varying(50) NOT NULL,
    password character varying(250) NOT NULL,
    emailid character varying(250) NOT NULL,
    gender integer NOT NULL,
    contactno character varying(50) NOT NULL,
    address character varying(150) NOT NULL,
    departmentxroleid integer NOT NULL,
    isinsert bit(1) NOT NULL,
    isupdate bit(1) NOT NULL,
    isdelete bit(1) NOT NULL,
    isactive bit(1) NOT NULL,
    createdby integer NOT NULL,
    createdon date NOT NULL,
    CONSTRAINT proper_email CHECK (((emailid)::text ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text)),
    CONSTRAINT tblemployee_contactno_check CHECK ((char_length((contactno)::text) <= 10)),
    CONSTRAINT tblemployee_gender_check CHECK (((gender = 0) OR (gender = 1) OR (gender = 2)))
);
    DROP TABLE public.tblemployee;
       public         postgres    false    3            �            1259    41666    tblemployee_empid_seq    SEQUENCE     w   CREATE SEQUENCE tblemployee_empid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tblemployee_empid_seq;
       public       postgres    false    200    3            �           0    0    tblemployee_empid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE tblemployee_empid_seq OWNED BY tblemployee.empid;
            public       postgres    false    201            �            1259    41668    tblperformance    TABLE     �   CREATE TABLE tblperformance (
    performanceid integer NOT NULL,
    empid integer NOT NULL,
    skills numeric NOT NULL,
    quality numeric NOT NULL,
    clientfeedback numeric NOT NULL,
    createdby integer NOT NULL,
    createdon date NOT NULL
);
 "   DROP TABLE public.tblperformance;
       public         postgres    false    3            �            1259    41674     tblperformance_performanceid_seq    SEQUENCE     �   CREATE SEQUENCE tblperformance_performanceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.tblperformance_performanceid_seq;
       public       postgres    false    202    3            �           0    0     tblperformance_performanceid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE tblperformance_performanceid_seq OWNED BY tblperformance.performanceid;
            public       postgres    false    203            �            1259    41676 	   tblreward    TABLE     �   CREATE TABLE tblreward (
    emprewardid integer NOT NULL,
    empid integer NOT NULL,
    rewardpoint numeric NOT NULL,
    createdby integer NOT NULL,
    createdon date NOT NULL,
    rewardtype character varying(100) NOT NULL
);
    DROP TABLE public.tblreward;
       public         postgres    false    3            �            1259    41682    tblreward_emprewardid_seq    SEQUENCE     {   CREATE SEQUENCE tblreward_emprewardid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tblreward_emprewardid_seq;
       public       postgres    false    3    204            �           0    0    tblreward_emprewardid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE tblreward_emprewardid_seq OWNED BY tblreward.emprewardid;
            public       postgres    false    205                       2604    41684    tbldepartment departmentid    DEFAULT     z   ALTER TABLE ONLY tbldepartment ALTER COLUMN departmentid SET DEFAULT nextval('tbldepartment_departmentid_seq'::regclass);
 M   ALTER TABLE department.tbldepartment ALTER COLUMN departmentid DROP DEFAULT;
    
   department       postgres    false    187    186                       2604    41685 "   tbldepartmentrole departmentroleid    DEFAULT     �   ALTER TABLE ONLY tbldepartmentrole ALTER COLUMN departmentroleid SET DEFAULT nextval('tbldepartmentrole_departmentroleid_seq'::regclass);
 U   ALTER TABLE department.tbldepartmentrole ALTER COLUMN departmentroleid DROP DEFAULT;
    
   department       postgres    false    189    188                       2604    41686 $   tbldepartmentxrole departmentxroleid    DEFAULT     �   ALTER TABLE ONLY tbldepartmentxrole ALTER COLUMN departmentxroleid SET DEFAULT nextval('tbldepartmentxrole_departmentxroleid_seq'::regclass);
 W   ALTER TABLE department.tbldepartmentxrole ALTER COLUMN departmentxroleid DROP DEFAULT;
    
   department       postgres    false    191    190                       2604    41687    citymaster id    DEFAULT     `   ALTER TABLE ONLY citymaster ALTER COLUMN id SET DEFAULT nextval('citymaster_id_seq'::regclass);
 <   ALTER TABLE public.citymaster ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    192                       2604    41688    countrymaster id    DEFAULT     f   ALTER TABLE ONLY countrymaster ALTER COLUMN id SET DEFAULT nextval('countrymaster_id_seq'::regclass);
 ?   ALTER TABLE public.countrymaster ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194                       2604    41689    statemaster id    DEFAULT     b   ALTER TABLE ONLY statemaster ALTER COLUMN id SET DEFAULT nextval('statemaster_id_seq'::regclass);
 =   ALTER TABLE public.statemaster ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196                       2604    41690    tbladmin adminid    DEFAULT     f   ALTER TABLE ONLY tbladmin ALTER COLUMN adminid SET DEFAULT nextval('tbladmin_adminid_seq'::regclass);
 ?   ALTER TABLE public.tbladmin ALTER COLUMN adminid DROP DEFAULT;
       public       postgres    false    199    198                       2604    41691    tblemployee empid    DEFAULT     h   ALTER TABLE ONLY tblemployee ALTER COLUMN empid SET DEFAULT nextval('tblemployee_empid_seq'::regclass);
 @   ALTER TABLE public.tblemployee ALTER COLUMN empid DROP DEFAULT;
       public       postgres    false    201    200                       2604    41692    tblperformance performanceid    DEFAULT     ~   ALTER TABLE ONLY tblperformance ALTER COLUMN performanceid SET DEFAULT nextval('tblperformance_performanceid_seq'::regclass);
 K   ALTER TABLE public.tblperformance ALTER COLUMN performanceid DROP DEFAULT;
       public       postgres    false    203    202                       2604    41693    tblreward emprewardid    DEFAULT     p   ALTER TABLE ONLY tblreward ALTER COLUMN emprewardid SET DEFAULT nextval('tblreward_emprewardid_seq'::regclass);
 D   ALTER TABLE public.tblreward ALTER COLUMN emprewardid DROP DEFAULT;
       public       postgres    false    205    204            �          0    41621    tbldepartment 
   TABLE DATA               T   COPY tbldepartment (departmentid, departmentname, createdby, createdon) FROM stdin;
 
   department       postgres    false    186   �x       �           0    0    tbldepartment_departmentid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('tbldepartment_departmentid_seq', 16, true);
         
   department       postgres    false    187            �          0    41626    tbldepartmentrole 
   TABLE DATA               `   COPY tbldepartmentrole (departmentroleid, roletype, createdby, createdon, priority) FROM stdin;
 
   department       postgres    false    188   ry       �           0    0 &   tbldepartmentrole_departmentroleid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('tbldepartmentrole_departmentroleid_seq', 5, true);
         
   department       postgres    false    189            �          0    41631    tbldepartmentxrole 
   TABLE DATA               n   COPY tbldepartmentxrole (departmentxroleid, departmentroleid, departmentid, createdby, createdon) FROM stdin;
 
   department       postgres    false    190   �y       �           0    0 (   tbldepartmentxrole_departmentxroleid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('tbldepartmentxrole_departmentxroleid_seq', 62, true);
         
   department       postgres    false    191            �          0    41636 
   citymaster 
   TABLE DATA               0   COPY citymaster (id, name, stateid) FROM stdin;
    public       postgres    false    192   Rz       �           0    0    citymaster_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('citymaster_id_seq', 1, false);
            public       postgres    false    193            �          0    41641    countrymaster 
   TABLE DATA               7   COPY countrymaster (id, name, countrycode) FROM stdin;
    public       postgres    false    194   x      �           0    0    countrymaster_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('countrymaster_id_seq', 1, false);
            public       postgres    false    195            �          0    41646    statemaster 
   TABLE DATA               3   COPY statemaster (id, name, countryid) FROM stdin;
    public       postgres    false    196   �      �           0    0    statemaster_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('statemaster_id_seq', 1, false);
            public       postgres    false    197            �          0    41651    tbladmin 
   TABLE DATA               �   COPY tbladmin (adminid, firstname, lastname, userid, passsword, contactno, isactive, issuper, createdby, createdon) FROM stdin;
    public       postgres    false    198   P      �           0    0    tbladmin_adminid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('tbladmin_adminid_seq', 1, false);
            public       postgres    false    199            �          0    41657    tblemployee 
   TABLE DATA               �   COPY tblemployee (empid, firstname, lastname, euserid, password, emailid, gender, contactno, address, departmentxroleid, isinsert, isupdate, isdelete, isactive, createdby, createdon) FROM stdin;
    public       postgres    false    200   �      �           0    0    tblemployee_empid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('tblemployee_empid_seq', 21, true);
            public       postgres    false    201            �          0    41668    tblperformance 
   TABLE DATA               n   COPY tblperformance (performanceid, empid, skills, quality, clientfeedback, createdby, createdon) FROM stdin;
    public       postgres    false    202   �       �           0    0     tblperformance_performanceid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('tblperformance_performanceid_seq', 18, true);
            public       postgres    false    203            �          0    41676 	   tblreward 
   TABLE DATA               _   COPY tblreward (emprewardid, empid, rewardpoint, createdby, createdon, rewardtype) FROM stdin;
    public       postgres    false    204   <!      �           0    0    tblreward_emprewardid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('tblreward_emprewardid_seq', 6, true);
            public       postgres    false    205                       2606    41695     tbldepartment tbldepartment_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY tbldepartment
    ADD CONSTRAINT tbldepartment_pkey PRIMARY KEY (departmentid);
 N   ALTER TABLE ONLY department.tbldepartment DROP CONSTRAINT tbldepartment_pkey;
    
   department         postgres    false    186    186                       2606    41697 (   tbldepartmentrole tbldepartmentrole_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY tbldepartmentrole
    ADD CONSTRAINT tbldepartmentrole_pkey PRIMARY KEY (departmentroleid);
 V   ALTER TABLE ONLY department.tbldepartmentrole DROP CONSTRAINT tbldepartmentrole_pkey;
    
   department         postgres    false    188    188                        2606    41699 *   tbldepartmentxrole tbldepartmentxrole_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY tbldepartmentxrole
    ADD CONSTRAINT tbldepartmentxrole_pkey PRIMARY KEY (departmentxroleid);
 X   ALTER TABLE ONLY department.tbldepartmentxrole DROP CONSTRAINT tbldepartmentxrole_pkey;
    
   department         postgres    false    190    190            "           2606    41701    citymaster citymaster_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY citymaster
    ADD CONSTRAINT citymaster_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.citymaster DROP CONSTRAINT citymaster_pkey;
       public         postgres    false    192    192            $           2606    41703     countrymaster countrymaster_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY countrymaster
    ADD CONSTRAINT countrymaster_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.countrymaster DROP CONSTRAINT countrymaster_pkey;
       public         postgres    false    194    194            &           2606    41705    statemaster statemaster_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY statemaster
    ADD CONSTRAINT statemaster_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.statemaster DROP CONSTRAINT statemaster_pkey;
       public         postgres    false    196    196            (           2606    41707    tbladmin tbladmin_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY tbladmin
    ADD CONSTRAINT tbladmin_pkey PRIMARY KEY (adminid);
 @   ALTER TABLE ONLY public.tbladmin DROP CONSTRAINT tbladmin_pkey;
       public         postgres    false    198    198            *           2606    41709    tblemployee tblemployee_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY tblemployee
    ADD CONSTRAINT tblemployee_pkey PRIMARY KEY (empid);
 F   ALTER TABLE ONLY public.tblemployee DROP CONSTRAINT tblemployee_pkey;
       public         postgres    false    200    200            ,           2606    41711 "   tblperformance tblperformance_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY tblperformance
    ADD CONSTRAINT tblperformance_pkey PRIMARY KEY (performanceid);
 L   ALTER TABLE ONLY public.tblperformance DROP CONSTRAINT tblperformance_pkey;
       public         postgres    false    202    202            .           2606    41713    tblreward tblreward_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY tblreward
    ADD CONSTRAINT tblreward_pkey PRIMARY KEY (emprewardid);
 B   ALTER TABLE ONLY public.tblreward DROP CONSTRAINT tblreward_pkey;
       public         postgres    false    204    204            /           2606    41714 *   tbldepartment tbldepartment_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tbldepartment
    ADD CONSTRAINT tbldepartment_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tbladmin(adminid);
 X   ALTER TABLE ONLY department.tbldepartment DROP CONSTRAINT tbldepartment_createdby_fkey;
    
   department       postgres    false    198    2088    186            0           2606    41719 2   tbldepartmentrole tbldepartmentrole_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tbldepartmentrole
    ADD CONSTRAINT tbldepartmentrole_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tbladmin(adminid);
 `   ALTER TABLE ONLY department.tbldepartmentrole DROP CONSTRAINT tbldepartmentrole_createdby_fkey;
    
   department       postgres    false    188    2088    198            1           2606    41724 4   tbldepartmentxrole tbldepartmentxrole_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tbldepartmentxrole
    ADD CONSTRAINT tbldepartmentxrole_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.tbladmin(adminid);
 b   ALTER TABLE ONLY department.tbldepartmentxrole DROP CONSTRAINT tbldepartmentxrole_createdby_fkey;
    
   department       postgres    false    2088    198    190            2           2606    41729 7   tbldepartmentxrole tbldepartmentxrole_departmentid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tbldepartmentxrole
    ADD CONSTRAINT tbldepartmentxrole_departmentid_fkey FOREIGN KEY (departmentid) REFERENCES tbldepartment(departmentid);
 e   ALTER TABLE ONLY department.tbldepartmentxrole DROP CONSTRAINT tbldepartmentxrole_departmentid_fkey;
    
   department       postgres    false    2076    186    190            3           2606    41734 ;   tbldepartmentxrole tbldepartmentxrole_departmentroleid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tbldepartmentxrole
    ADD CONSTRAINT tbldepartmentxrole_departmentroleid_fkey FOREIGN KEY (departmentroleid) REFERENCES tbldepartmentrole(departmentroleid);
 i   ALTER TABLE ONLY department.tbldepartmentxrole DROP CONSTRAINT tbldepartmentxrole_departmentroleid_fkey;
    
   department       postgres    false    190    2078    188            4           2606    41739 "   citymaster citymaster_stateid_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY citymaster
    ADD CONSTRAINT citymaster_stateid_fkey FOREIGN KEY (stateid) REFERENCES statemaster(id);
 L   ALTER TABLE ONLY public.citymaster DROP CONSTRAINT citymaster_stateid_fkey;
       public       postgres    false    196    2086    192            5           2606    41744 &   statemaster statemaster_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY statemaster
    ADD CONSTRAINT statemaster_countryid_fkey FOREIGN KEY (countryid) REFERENCES countrymaster(id);
 P   ALTER TABLE ONLY public.statemaster DROP CONSTRAINT statemaster_countryid_fkey;
       public       postgres    false    196    2084    194            6           2606    41749     tbladmin tbladmin_createdby_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY tbladmin
    ADD CONSTRAINT tbladmin_createdby_fkey FOREIGN KEY (createdby) REFERENCES tbladmin(adminid);
 J   ALTER TABLE ONLY public.tbladmin DROP CONSTRAINT tbladmin_createdby_fkey;
       public       postgres    false    2088    198    198            7           2606    41754 &   tblemployee tblemployee_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tblemployee
    ADD CONSTRAINT tblemployee_createdby_fkey FOREIGN KEY (createdby) REFERENCES tbladmin(adminid);
 P   ALTER TABLE ONLY public.tblemployee DROP CONSTRAINT tblemployee_createdby_fkey;
       public       postgres    false    200    2088    198            8           2606    41759 .   tblemployee tblemployee_departmentxroleid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tblemployee
    ADD CONSTRAINT tblemployee_departmentxroleid_fkey FOREIGN KEY (departmentxroleid) REFERENCES department.tbldepartmentxrole(departmentxroleid);
 X   ALTER TABLE ONLY public.tblemployee DROP CONSTRAINT tblemployee_departmentxroleid_fkey;
       public       postgres    false    190    2080    200            9           2606    41764 ,   tblperformance tblperformance_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tblperformance
    ADD CONSTRAINT tblperformance_createdby_fkey FOREIGN KEY (createdby) REFERENCES tbladmin(adminid);
 V   ALTER TABLE ONLY public.tblperformance DROP CONSTRAINT tblperformance_createdby_fkey;
       public       postgres    false    202    2088    198            :           2606    41769 (   tblperformance tblperformance_empid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tblperformance
    ADD CONSTRAINT tblperformance_empid_fkey FOREIGN KEY (empid) REFERENCES tblemployee(empid);
 R   ALTER TABLE ONLY public.tblperformance DROP CONSTRAINT tblperformance_empid_fkey;
       public       postgres    false    202    2090    200            ;           2606    41774 "   tblreward tblreward_createdby_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY tblreward
    ADD CONSTRAINT tblreward_createdby_fkey FOREIGN KEY (createdby) REFERENCES tbladmin(adminid);
 L   ALTER TABLE ONLY public.tblreward DROP CONSTRAINT tblreward_createdby_fkey;
       public       postgres    false    204    2088    198            <           2606    41779    tblreward tblreward_empid_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY tblreward
    ADD CONSTRAINT tblreward_empid_fkey FOREIGN KEY (empid) REFERENCES tblemployee(empid);
 H   ALTER TABLE ONLY public.tblreward DROP CONSTRAINT tblreward_empid_fkey;
       public       postgres    false    204    2090    200            �   �   x�m���0��ۧ�`Zёh��G��rD�%�5��-����|��ЙF\�3}����4�J�����!�pl��+;(ѽ�/���G��`c�d���J�
cl�Bb�qi��ܕ��V��4.�G(��6����Vqz˞Vh:v�
Ʒ���VIzn�!7��6B�bFV�      �   S   x�3�IM�U�M�KLO-�4�4204�54�52�4�2���w�	��9��L8�S�R�s��26�4�2������n�	W� S 6      �   m   x�eϻ�0�vq��.���Y)�N6�S�tq��#��\Շd��Z>��&��� D�J���
kdo���؟�Z{�g�t�<k�76d�.�TC|�T�xjݗ�>u�9�      �      x�t�ٖ�Ʋ-������F�C�(Y�du�����(�� ���j���ƌH2f�>�F=p"��>#3"f�v��z�?���bZ�������,�C�.�S��vq���u[4���ŗ�;����UYݱ�(�
�<5O����Lо�d��ա��y.M���7����Q�+g����\�m��F���n��,yRQ޻ūE�����!�:ͥ�O�?� �z]��Ǜ�w@���/�R���9��k:GN$U����&J�6OE�
ixGw��EY᳔4�T�����q12����V��ŕ���dw�������
��.��2nUk}�e�6�����М��2�ʃ�8�����Յ4�y�[�\�V7�"eY���I?O?�J��=�c�ǳA���t�)���i�&n�|����y�தη����w�c�N�J�uj�ZZ�$�)��J�2��Y�͟dx�cf�_�w���3������R��`�:��G��
O�����8���'w�k3�QT����C�2�����i>K����s������q�9p.�+��
�ҩ��j�xS����j-���4HV����L��⍮�qQW;���K�Jod�H��g���\*��e%o����|k�,�4��o�/~-��TH�k�;��*Y����8���z�kKC:Yo�v�1���z����UR��w�z'�0���ƛk�ȶ!�i!c&*F*�#�gѳϤ�Cu�/�>��$�;�$��7�����5��T����ldgkd|��˛����G���?�Ƀ3��h�H6�ᜇT���8wC*';�ϪM�^�J����J1N%5�'/�v�x�Ȋ��u�]�����d�[��������6Y�~3ڷ��}!�ڋ�Q�୎���Tt�K�<<as<I;��ww�@��x�Ov+�s�C>Ȳ4P �1je�@>�p�=E�� _�T	�]o���v��X� s����)�vX.��!�dX;������u�.��QڈJ��F�����C��L�R"TFV_�.�񓷁DĎu�Y���
��=�Hd�{����o#1 ����H@JD�����t>��R�~<�W�*�T�n"�<�P!�C������P�'N'�Ǉ�eurHj/�"s|�e�躛��!���y�cq�
"���v_��ك,����	�R�\�����D�`"�ܬ3"x|��~#l%"| �lE�������;n"#��NU�r'X]��}����!��2tKGQ��X<F�!G�NM{[ZԮC�}}K�P3!Zһ��#A��,"m��J�P�n��:�C��#����&�^���)h���d-%@���ө����8й$��f��'GW�n�z��IE��\ R��]�
���R*�ō��x�Y���c�[R�{��!���C�s�D� .�~��� �d�R��|R��a��Mר����I����S.]�n/�+F�q�,Y�87� �~�V�sSʸ�sS*"��������{���#�g*B�݁��Q��X~뚧J�7������5� gc�}���)�[K���h�KEv�Gs�cCdA����� ���F�ᾠ�f*��}�=6޼";�K�GrA�E0D<t�����v�t��L6�}.mQ���x;�D���ʿ(R$�w��@�xONEt���{s��� �|�D��q+��p�ㆌћ|�v�Y�~M��w���E��R�^%����b�$�i���΁��'R&簾��^��~�MH�KE���[�]I�NĊ��q^�D��������������=�⋈�������OE-_�eL$Ź�E��h�HE��=-�"_|�L�<�t��x�݊���xp�z�� �xOw� ;�9j�5=U�Q+MQQ�;t�)����-è�^pI<��,���*����Pß�:���y���_�x���2�&������q*�����e�MSu#@�"p<T�L�A����"q<TC����_���e�=����� ۃ�(q�E�x�]�
-b� c�Ҡ�㡏�*�7�����g8|���H�E[�gF�LD����@�D�0x��5��쓃eӯN�7Փ|��m3A�a���*d"�<̲�Q�e"��r�zf"�|�v���l���$��{}�f"�|��-T&��WY+��#����x�sD&"�W0�l_����k3�G�6Ì��=��H�D{c&�0)"e�{��+9���� ���G��!_g�2A�κ�;�^|����<�\9d"�|�e�fۢsx��MK�\&b�7���`�D�^�XPK�`&����L��3턙�"�+�KS$�f"�8���H#ߥ"!�{5śP&r���-1s�;B��<��,	��J����5���bQ/��{�)n[Zd������H'���O����w^�H*�������yyDZ��|�J(r�p�s��B���*��N���VT�S�~.�Hɥ�𠌲���^�U^�}�K� �G[J����\�d��~��v�8�C��;�[���S��%��'�m��M3\���>I_�����	�|Y��A��9�v	n�l`}C��㡒i䀬2�8�,���'��6��
�}M�5Sړ}s=��x�dA}R���`4���e/.�������k��y��$��zo����"-f�Ye���C�2�.4+n9�<��a/0(�@�/����C�2�.+M�����Yi;�0�*2�p(�T
�˝h�v�0��T��{*>�*���z�?��`X��|(������j��a����u6jkU�r�*��9T�~���+Ә���|-�_6�j�35�jX*Y����FP5K?��wE��)=&�UA\�G�N$�7�m�j*n�T<���\č7�����E� 23�^�i�"8C��F�þ�dۀ,�h���E�x��|��4�zv@�ьT�\�7��?�H��!�#����oB{"�Qp��P� |䄛+����{��B�HO�%5��G�����S�~�ʾ�e{��h�E�x��Q�\Y�h��"K ;�6���J�q�Gt�ƅ��,����.˽A[�T.��	z*�.�Q.� �M��Ż���T�^���։|swŖr���H��x�x�d����<"A�ﻢ����ZWd����%��B�H<�6��>��H�w�Gn���E���w�}H���C��z==����|���uԷ[\M�Gk�ō��|��Y�e1�;��H*͉�'����ݖ>�;ݎ&�	��_~���ʭ$2���T�: �A��[�/���O�kϚJ�å��V�.<���}�є���]iI�g�\��n��o�ٍoK����It�v�P���NoB	X��(�+�赍�"�Ro'�ly��F#-�5�/D��8�5�φF�����%mE��Fy�s��_�
���s?�f��y/B�g�i�h�N�v�?ŵ��� �k��y��eEM����F�^Q�I����p����<��H2-�**�����x@� ���u�QD�@ғ*�q�f8���h��p�W}i�}4���0H��a����O���Rq��z���{������\Ϸj��۟<�EN���Ƙ�pۍ�8��v*H\�E6�Vm�Ɋl��s��CH$�orB�E��OXG�~�{H�W�4�?��Nd�W���s��A�3d-H%�#��+9d\Zö�Wz0�(k��z#�ȩ���_��� �/CV=�S�rSd5:z�,�:9w�G�0.
G	!���Р�A�K8����r��<���wݼP�*|7r��w�;0D�Sf�@��Tu�y���jG��Z�I�./���B�! 2w�" ���z`3L�c�.���iR��^k�r<3��zO�׍쑧���u�H��Rָ�O�����ҷ7z@=�@ب�Rw�,�Gq��D�)��d�=�� �?���z�u��o�d��g+b��b.�V��MU���"�Өܪ,��;�A���mwh�K�M}w��ɟ&�V9�� [���3���ɢU�Q    �`�B����φ�"��[Y꤃ˆfL2��P��"zak�(� ��}�"�c�1��բ�0�A!$�Tu��.�����@"�kF�"�>��ak�����a���Ly�I�o5Q@��`(4{�'��01�z���Z�*�@�~�������b��ZZ6{��A��SHЇ}A�Ijf@x������*Uk�h����V�1%�3;�L`.\,X?��8�(��?j��c6}1y����xDo	9^!��!`j�0�6O-�&e]�����L��S���1�Td���b8D�f��Ǻ����A9j ��NWK��( �����<
D���x���C_7sY6�0�����O�Wwj}y�~�	�����*B���F��
���⯿�1������˲�S� ���< -��M�0
���u\�91�>W+\^n���.W��ԏ�" ��h�RY��D��}=cRN��>���tq?(d��P��Wn�ܡ�q�EXC;�GT������	�ZC;�T��GD�����j�܁��ڹ�e����(?^.��=\$����5ǚg�jM\5.GEx��'ZnV��
�޺H�T�5�����H!�WQ9�s;���J6�9KP�����:�TVٺ�VG�rٻ��0����{���S6�?��q��f�lwvix9�m�M��&� ��B��ձ��3���z[:��Bx�G7��ThW�& z�\����6K��C�=싚������Z��2�����;��$ �52�v;��8�}��]H��j���6���}�ߓ����p\�D��)����܀l�*�+%۸`5eQw�s­r�e��7tЎ�|�~PF���<).����e���j�>��D
��n�²�-4.�
F�ũ���M�i*8Yj�ǧ��:��A���#��{V9(-E�jq/�6��;�q�w��"n�сE�w��;S��Y�6T?/n ���.��d;�u��_����.Z��K*��۪�E{G/g"����[]��Y���u�v���8�q��M��wń;���mTt�H��^ſ @D1�.�w�q�^���J�Z�V�v��!�4�e��>_�A΂��;`-;����$���UL�I��-�ȉ���;�{jܵl�`���+J.P��e�#e��I.������S�p�:T�bUʾ|��?�CP�(LeO5��
F���\J�q�lg��l���+ܧv����h�����t�D��7y��E![���>�TD+�2��h�?��	_�X��Q�G�WL@8�*�6�L���x(����zT&�07+�+���{A���o�t+�ಳ��ԕ��	�`��L<x�XGEK�z��Ɔ��z��_0;%L��x�Zo��Zָ���k͏˷�����5]]Å�q�"o����%,��7��uQUd��834�����+���}�����aDef��\$��dk�ڴ�}T����Z���5D}պt#���l��U�z*F�&[
��F��f�){�����V�־E*i�޶�8J�S�սC�ū�;��H p�x��"�}�6�j��Q2�s+����6^u�s���d�{����=J%[9��� l��"'�^��3��t�hht����G��Ng��::H��`�q��SO�ZJ�UC�[d�� _��GT��fv2*�l��@4 �fO�d����z�a����ܳ�0��lt3%��^�q��g��f���l��e�E2G���0����QeR�cN�C��g��rcP��#.r���p>��
%S#�kgmv���W���;�j�ْe�������A��Z�-'T؄u�QP�Q��f0�����%��3WgzM�eA��7+P�-��J<��C?:�E��QM��k�EǢ�!Y2��=��
G��0s)pD�d���ެpH��%���_����_e��W"Q\��f}�6�a�2h�R��l������(O��Em�f��'J�؞{�L��Q5�P&��|���F�j?���&QDN�v?:����b���վ|����6OU.7��%p1����>mb��V��v
�q�=g�r_�� ���3�6K)6p2�C��ݣ�N��ݱ-�I1_XGӀ>���ϯ���>�A�1,Ǒ�����8G��y3 R�ɤ]���~�ر����[3��X����Ƃ�L��,/����.�R���D@���c����j���HW8Q��H�)Z�P~�j�J��|�gS�x�у��
�Ӏ`�-)�/���pV�Wf�r=�?Q���a����E������z�2P�]/�qF(�]���1S�z��;�F�yOm3��=R��JN�7�`<Vǲ�	���) �޼� �pF3`c����a��Q�����.��H�z2����:4� ��ZX�;f&o�HS�ݺ���/lǺ��f��J&P��S��"���ϋ���ӓy�#\��a��PK#-���5�c���5ހ�]�A��l����;3�kZJqy_������鈈�E�S>�/{*Ԋ�hoa�VU�gӶ�}��iö��P���uAch��i���+��H�������+�?�e͠^ u��X.��iW���k���`�T��: �/3���opz|��P	=vE�[�CO����@fܳv�������`�������o�s�ܬ�U߬�b����G���ڪ��IT��~Y�ҟ�m���+eAM�O~��ʗ�-��ѭ�-�:��_�xL��㤬\��#k�po��mٛ���5C���v�nK=��^��I��Z���(u��d}�	�.�l�JP_�f�����
Zݿq�;\׵��33�z]��y��T��(u�ݩ^��0P�%�t���nR����ِ�o$0�,I �B=ݏu$l��V���vl���zݲ�� u�'�7�����N�mE��m���k>���S�(i���4��+�)�{�+UI�q9E�A�� ���PŴ:ByR5�|�.H���nh�B/]��@)]L$om���{��Hh�E��%��J��g�ZE�6�w�2L�z��-b�'����>�)L ���Q��L�\)p��.L/.�Z�Y�:&�u��R�6�e)L�:J���ę+� �Xٝ?j-�1�� 䋏�i��i'{� ^������]mwg���N���j*�N����T�ީ_}=�5e�L���U��[�c1�)UnO�<��IK�y��e�q����
�hzuh�$jK���ΨZG�P��U�J՞����
��F���^�׹��uU���;���e0u
n��/�c������eu���V����U
]��O���ܣ��!��I��@���h�lVJ;Py7kCFZyv����n�6��z�W�O����$;-�ʴt��O��e�?�����o�~��c�Nv�?�3�[��˒%����ssm͝�E��������R.���L��[��o^� ��*>��vz�E'��N/���wz�ł$x��]ߑ��P�}�FJ]M-��pع���I�黇"��)d����2���`Q��-ѻ,f�$+�.���O�ss���@��83��ݾ_��3��!���fT�u^��^�T��N-���)t|c���Ҏ>��X:�l��ǁ.x@���&��hv���{��Jq�B������#@�B,D���!^�a�M�U�b(n�0�#7o�<�S�n��wj��b�Nm�!�ӊ�F��[��f�!���T?Xr�]���\v��%��#<��qW�y����8,�3;E��	N9��տ�!(���'��_�"*0��B�(Y=+��}+_�CTP0�};���.���WǴ ����<X����I�&*[��FY��˓�>�����d�O�H�':ҁOM�aMɶ�������V@w�~��۲���/���-㦒�����ֻ�*�5�	�wߋv_�(ƻ�p�����M���}���P�^C⬥Jz��c"�+�3�N�w��4L�}$��.��p
������^��A��p��CR���+8��t�K�;87�z�w���u01'�    =}�C�b�>�xJ;��F���;^�2��il�>�'�)���zر\ȏ��3`��<�Af����Z�H�Q/��{r<�t��P�CyE�Z��Yn���5�z/�#S�6�Z1Ыj�%C/Fw|�k���9�T��Y���q82T\��\�!�H�)�a�-�X��p��团�����Ɉ��j\ժ堷s��1O�9*q�yY2b0[�ڶ��<�9�%�c�%�]Z���R�F}CD�5��:N�Y��=܁���&�٣�QK��v���zX��c�;C�����Z��Ch�r
���J�ٱ��>`+XBՍ�&������}#d�xח4fd���㾄�X�m�p�"�r���S���u������R�����f����i��c1$h��ŀ�����J_>!set����մ���Xq�%l���Ԑk�X��q�x�_S����!�\Kx8�7�(i�T�%�ռH!��mp�}ĵ�r��1-��])��ͺ�p9f��T��:U��CѨ��t�?Y](ݢl��n��27@� u��ٞ���|�i�cMk���͔�h���Bgjԕ@w��wh)�V���UG�s��`���/�����t8T���ֿ�S֠�i惌�~�
�砢��yN��N�:�{Y����v��R�/����RLa�5D�HU��6�8:"g��L�+n- ��C�_M�����ϥv�齧`���;eD#N�u�5yV��vp�=�55L����a�%k�@� �=M�-���~[H�3��T�x����i�s0犖mp�}�G�y�����h�U.^ A"�M�t�ԊS���?�U,��\r��%��76t��zX�}�j��
��i�L���YG۽a�)�����p�Q��&�qo#+��0tl�1cA����<6������\x�z��>��/_{5�3���X���M��K��:d�b�E�j0���P��u��ѳm�BYr�ʰ���V���l�ϔI��N��#��=�)Þ8��E��,E�tL7ų:����2D]�.3� ��N��`U��e�) ��W�g�D�4��۪��n�ՐV�f��˪����@d���̱��V=�)����Dz�j��ʯ��s����.�2�e��2���̌�J�E���2E����;��h2u�ޱM�f��f!;P�z}7P�W��a)��r�ں���\��d?�>�R�}n;p�=�E�o���PYd+� ��9�t k�ܳ��0�[�T{mO���߆;�������N�K���R7� ���&=0?^]{���C����?}�?��W?��(�+�[�)߲0$��R&����� g�g\R^,^͕�6��
oԄ��,?��OSSQ6�~
B�a�Ơz�7A����ƺ����7�f�g�V����V1�����lr��)�]�b[u��7�`�
���׷HP'Gt� ��9�W���ڎ��� 9�1�~�Oz�����y����4�P�L���Z_�k�4�w��3�#8Oϭ����GN_��|�����DW��j�4;�3�f�gIx��x��C?��4M��3ȡ�Ѳ3����Q"��ʗ�I�딡p#�i(�D��g���;q�C1m����Q'�c�Sp�C-=w?+���e׆��j>d�j��1�B�9�P�M�P��a��S�y��O4*T
���bN`N���'�8�L����S!ٛ�*ā�����^��R��ǋ8m����)�L�g/k�A;��*&��`�����>��
�bȱ�R!�.�/b��%��s�B��5yϝ�+gi\�"���.�{��v?u8.ȕ��"4*2���e�o0��
�/�y;�
M&)	��̘��흂k�N�G�`�z V� ocJ��u?�wN���y�I5�Q73L� l��D5�8N���3�' F.	\A��AQ��ql�����|��iv0��Bs�
Xjl���^�3�dL���é��;#+�8����CA�Z�J�(L?MD�V��~����K5�R�������޴�S�f���V��A���6jKy�[j�M�,8�Ŗ�uhC,����F����������C_H�5�y���8��]��HL�1�.�E=f��7)ک�X��#�a�[�H����/��'�vg���h�`׮��f���p����3�R;�9\���߁*���l�qUw��;	�,~=h*�k��y��;�[}& �	o�Z4`)�A�[k�3x�z���:4<��Y�����%�=1�=�tý�\_��םSO��y�2��#Η�L>QU\%�sV� �N�res~W���l����.�Eٟ��)���9Z�ҭ^wN�p�����SZ��d3��L�ӧ�\ �A!��Stw��2�#h�x_њ)��:Z�d�6�r��T�n��[O����|�+��i��%���^\�χ1s!�i��)S#�+E�����D/ʻc��ڄA/6nɫ��7䈆���.�c���n��T�6J�وk���X�*v�0-�}��,lЩp�䏔D�����3`���k#�wz=~�����9�>pP�ev�ggs�7SБ}�_h�wj@Vֳ�Pz��cu5�K�Ky�Ԍ���C[zS�c\�P#�>ڠ�;5$��Yu��*�2��7�r�i��Sܡ�t�.��iu�ʚZD��C��9з�J'�5S��������4����i ����KA�2����^��)?eQ���2��<���6ƥx*�vd�ZG��O��8c���4���bMz�V&��rP���>���z�G]Fك
n�Wi�2��n���A�p��~��"�/�s��F��/�2MfwJ fjȴ'� 혀]��ٵRS�}g�2���Ͳl
汇����c�3M���뙒�<���ʊ&�l�z�J�
��	�4��x�H`�$�ߞ�n��A󞧏�O��ɻ�)@_0�;r�1��;�oh
�O�N\��]E�r�Q�����ϋ�j����a�,�SO{B���C35�0����jpD��e������h���^e����G3�2$�z�L�0�T���E��^>ʠ�c{�����fFTIoi�Z)�S5�t48	�t��������5�m q~kZ���z!�kф8��������8�=����F=��i���B@����r�0���L=�3L�l2���� �d�և�C,������Z�_�5��P�� m.P|��"�.b>�8�S(H�����\�F�����𪚨�8��o8��IK�5M��JϤ��"��1�kq�B����}TB����|c��QR�����ׁSh�`���<�@;��x���z�%刣�K1�B����vu�:{qx�a�y���ھ����8v�%HL�+z�Q?D!	h�h�Z��3������}q1������3��X���r8��C�cH��ͱ�xc]��z>o�=���a��s�4D.�se��I�E�hn(MO�fU�.���}����#zpI���ch��㠮�70̪d�����~��T��q\증��><���i��sIS	G���{����w��r2����뮧�G6a	8��H������3O����s8��nv/���2A[pT3	�/��7)��0N��D:�8��֓�l�Ѵ�9~��0z�/�}PS�y\ P�聾���\rJ��v���fo�4Z�p�W�����=�f�쫩SS�)�	�fL��'G�_@n���˷}[.?5�c�^�O$���]���z�t���[�jO/�Э:Ț\����_�Ԩ���j�Vr����#��"H�k�J��zU����*"޴QGg��VKfɩ�F��z������H( ��@�S�AR�~��'��X����>%���tyB�8G�f��$�Ļy�����f��NV�a��a#�=�5��Ai��ћ
�f��'(�ߩ@e�[��R���������}��/NJ�F����=���}�g�қ����?�� )P�d �ߐ���D����8S�V!F�����l;Z�v?8    �9���r��6P�}���Kw`9��� 9���V�#��RǢ:��>� ��%6�c��;�۞_����!�	�64�@o�A&�g��Ӑ�-W 7���H
ܗ��k��83!1M�4��>DK:��>�������0G�p�6C(�(�\�P�H
J3���������D���Y�چ��
 �3���U�n8o���>�-���P��c� ���RA�{r	Tg�S$ ����u�����N��.1���|2z�&A�v�'^k����؉�hۥl�t��	x����N .�hڧ�九�{?�@����y�$�^�B���O6��u%�h٥UOz���Oq�&f��Jx�%��jFsI~���d��O�f�m���-�=Uŷ~�]�*���ts�v@jα/^�4	�ez�Ti@.{�fgO�T�Ξ<�5�����]Vz�Vg����TF����*�b;�K$"��9���&�Ȓ���.1��[��f@y�Ên.k�0���lR���n.a�P���r��0����6�U��6�yW��f�:p���U*7��CO��]3���4i���'0t�|+�J����Q����B�;�ο��J��y�5�(_9�AO��Ǎ�>P6w�Ō����8漩l�������j�����J[~����>7�$�}~�JN�7���wF��qЪ�9J��l�2^=�)i����$n5����5�������ȍ��͏�SmBX�KT� �K9���j0R�W��XÎ�e_P:\D�a�.*a&x�?s�M�9���@��P(�w.8��_��ݨ�mɩ`��5O�H=���1�86j?�}X�O���F���cf�d�DO��zb!�kUI�ݮ�l>`�+�|��_��m����.��)hT�}�lus�GK��*(3���26��ۡqU���.��w�{\7ҵ0����Z�@���z�q^�J--(�DIwz�O�E�]���FU4�T0G	7�A\�٨� �9t���z6�44��p_�ԁ�ZY�x�6`2 G�m� ��}V�k'�C'���:`0����Q��.k.��)����[�׺?RAd��Zϧ�ϔq�μ���Yz�0 �6�|�&���1�۾��H9Ku�S���秊O۠m�V�g��H�d�y=��yߔ(�p�d�)�1�pu�����H��.7����"���^���^��_(R �h�)@��N�n��p��0ĸ&��)�U��6�6
��Ց7 � 3�ָS}��003�I[�upq>�?�B ��^�F����<]n���Zm�h`r{5PѶj�7簺&�ߗ�+ä
O2u��H�*��W��Rc���̟\Y�'�>��o�`����`pY�}	�gГCŀlf�}�2���/ ;��z����<˲�#�΅z�>_�-������)^:�kh(t��t}�h��J���˖�E]����m��jԶ���f���O�2�S���H=�?PJA,��V���]GI3C%�Ϛ˗��Du

_$���OOYl���+S#į*���c�������wc̧��r����fg�H(��	��K(R¯ܜ"$����=E����狊�������	�Wkz��U�>�����,~���,�Q�ey�'J��;�� A\?ʖ4�
����G�,�����\ ��&��Fd��x*�Z\d�;�W����lzD:z��h�*7�@�Q3���(V[��EO���e���֩�W�D]��Faz_/�.S�����\c�뤒}�}��qݣ�>Y�)�4�Q���A� ��n�	gì���ɓ� F$�����k�~4d��K{�*ʒ���v2j9^��X2��Q��mCΨ�F�r�MȺ�ڠ�"��STs�?�zp��P�j�3I8Y�|Lk��8�	��N]�ʛ�_�^��T�C1R��I� ������1�hVX�琫����JC���s�5f�?� ����Q��B�/�vwŖ�d����B\������i���/��&� �K��hc an3	XYhgtOj��ƿ�SCî�[�wjm�Q�����<4����N0�p6P޸N�Qr3��`'�T��+��y��݇9F����t��ko撑ى���M`��[�]g��Z�=b�)Ӏ`4Lk��p�a��~����+t|�*Ý�hQ�;��3@��dļx�`���R�UѾ�$ws}9��+�V^�]gv7v���O������E5��v���qm�bH$0������k#�+��l�w*-Pkl����X����W���O7_�źK/��C��:���C'��W{3�D��W�]G	��?�&G3M��?l���Do�n:���
�/�w����)5^�Ov�c��(G1����:�N��T�<�S��+�� ���$�*g^���H�۹�>����8��S.6��$��5$<�./<�GO�V\��m��]8��^�D) ����d��ю�����YpV�|}��q_р�PKC�һ�T�j�4]�	}�����<���7Dɶ�YKh��ߠ�O$�U��Q�RܷJ#x%�<��֎R��u��B�=XFK��`!i�z����{5�/�.�%��[�e�K�G  �Y�׀%�*�o��vcǝ�]�2���P�м�gᬼ�xmy"n��|����eo��klc||���$g���j,?mt�WV>�*S���)�Z<���ƛ0��j��EZ�� ��)����s�������8zk���+�.���<�K �Æ��&��6 Y�w��:]M��.:����;	���ol@���-O���/�`����1N��hѕ���!��?�D��&�W�*�Э"�.v����D(]".�if�I�d����� y�G���J>b5��oI_c�l�xu4/� lh�i�մ� �F7Wn� JZ3,�� �����W����yE���:��m��+/w<�������2�x�@&8����nH4VK� b�L�@��g����qcƺ?^�	���N��R��Ƿ5��� �|,������FٚI����R�\��%}W)�s���{e\���*���e���$}%���+�:J�w�NQ^�CKG�/Fw�d7]���g��m�Ɗ1%�c(y[V}4�5b�U_�m��V�m� ����W5X[��5C�:'���?S� n��'�����$W/�p�R�c�/4 �
U+UG�5ݸg�ƒU;̈�fip~�Z�������1�.84e3��/�r
!dLu	S �O'pla��1�=��yy�t�ʡ/ �؊	J4OYѻ�%�.}Wc�O��,n٣���X��ބ+:-� x3@�ES3�{�h쟁WCmL@-��jrf ���՘� ��.M�C��#�M��	t�q7D%��^l���<�Q���pDCs[���5l��r�B�%�8����u
^f���ߨ�bez��`O����6�Õ�:�+	Q?�ڟ�ת���
B>�s��l��~5�+�Ĺ����MP;����!�)���W⯀�8?W���r����,U�������z/������7���8{�T�0\㵒���`#�s��";q
�h< �L1Q �Lu!���9 k�&A�8q�l�`��O�p�����n��3T�S�(��� ���%2�a�;UL���TkDݩ^-����9V�R�1>)}h�(��I������<�1-5\W�>��3�p9"rM�p���Y�u���KY���Tvuę�G�=(���7��7p�`�
^� �:��ٵ�*�@7�^�*����=/��:"
 �P������8 ��`�@�H���4����K�A�JEL`���'>	��j/enF��	�Kx�:���V������LgX��\����D}���~�05Џ�)U�vU�쩵dw������?��:(@9lȫ!jB��Ǉ+GV���"N�^�s�:���ĥ�@�n!�x�������O����6�ʼ�\�x`�,d�����w�7Tp���u�G}a��ZaN�Q�Co\��    �-�8��<ҋF}O������:�5�׿o$A��>�f0�����ƃ��Y�k�U(_(��'؉���N鍃J�ܴ��>\���f��]��}�a�\3���$����V�J�6�aj�L�
��ԫ`�t(>�();}���Wm]��M9H�Tv���>�\+�񩠩r>� ���ϔF#���Q���>0MD^f>á�*ǔ�b�x�M��.&.*Ҵ?.��EU��H���}���Υhp��gJ���@Ro�2u&�jzI�_'������Z��>��	4B�3=_|,h���d R#��j�Mٶ?��!��Ǧ��^$����c_"�"�����1�HDM^������	>>���W"`�3~Z+��'`Sr�@|ߧ��b�`T?GYe��wP�GJ�S��2��D�.�(*��8����t�o�:�w��	��ב�ѣ�Uuvp���D�:	r�&�)ЕcA�S7�.�I���Sw��!=�K����V�������:�,Q���"ў��|`Q)�o�4�	�ꨀ�
��%cR����	xGzZ���d�!(�!P�[p�Zn���k����,�!y���I����\h&dP�h��R�<q v�zAX�Ե�9X��x���[?Q��(�	��l�j�e�5�&���Q����	AM�ܣ�H���rD�ٖ�>Q炝O�������>W��bH�$��k0��J��YĢe���2�\�֜
�\�ϴu���}U�V \}�d������T�q(��������/�X�{߽�u�{���D~xN�$���XA�h�0�ʢ��\Å�ߩƭ��4���_�`a�q�F�mȹq䗰e#P	�P]�X����}�����#u�:�F��P��B�ic�F#Id}��|�oF	� �q;��1�c`p�����[}@�C���C���݋d�r���FzY*3��OM�6����	޾/�r�A�z6�q;��ht�+=�c��O��$A���>�V
��� {$Kױ�Yx���jp^�@�W�(�����$~�!��H�{zU���Qy+�@yTO���v?w���b�O��8[�dH4�[4:�4�A�C��&�}E#�W/>�Ť�����'`G������n�2i,��n�r�E����LA$�*����Pu����NI�KZ6~.�� 5 �'���>B,:D��Bb!�ꨏ�����@�[�^0��8���g7���������#��}rG�rq��ȕi�з�C+�.1��)�v�.�!ʍ�?�}����2]x�JA���W�@z�y�}4G$�e�����}s]\O�(���3�@��0�~��@��0O�8��@z�SY�+�����T=W�6pS��+7����U�,Me���*�p��D�ѕvа��@��4@��W��51x���/q���=>�X��o�gJ�-��$��ϧ�@�1I߷NVdV��U��h]2��e�@���)���|6�ς���ST�5��ɖMS7��+:�%�%�W�RNAkz�NZ��D���*W�*
�����~��{ra�2h-���ҩ¾%@����hϼ���?DC���1E0�6�.a]4@��m�
A�}
��+eO�����m������	�2��Z"]p���_dkC��w:+�L}��	���e��7 W�S >�<Х��+B��e�~5������5��8��:)�S�u%�n���B!p�U7>��C���Txɠ�*����a20C���@߃:\�c4Ud�
�R��̎G0T�3����R���2t�=�	}l�mxm�j�[#�!�_��������iC�!�k���"�D�ݟ������t��TEu-��T:o-h��#j˩���]���#�K��ʶ�Od[b�v4(*J.����A�V>���2�&r{eJ�u��	+��]�hH��DV���:p�5��� >ӷs%;��W2Gu�sI_Pe`0:JPE���g͎�W�~o���S&���0��_IA�'��2X�ި�c`��(�Xur� t�����X=/���f1P'ћ�Z�j�u}�R�+�]A�:�ń �t�%1��u�]�k�`�S�g�~����h1������T�:��+h]�r ���	"� �0��������Ѱ9PUe�
�BJ��Gh���~�n����Xku>�J]����7ԁ�!tf󓳒}�70��7P��Of��٬�n�M�w�fs��~��t|F�}jgln�`�x������P��3er���c9��i�����������o�}�d�~�m_rݶ�u���@�ZGUڂ����zU�����O�ٔ1|1�04S4�0h����𠃘kQ�,��v��5ԘQ��6W�bC���+�g����� 6���g55��ȗ�Ij��#Mv��M7Qٯ�_�)�Fl�q���#����!��3����(���r-9�
]|iF�w܅SU��;M.���%�?HL+�+��5��vS�� 2 ��,���$�:��c�+���u-e��6��>��h�Ԁs�*OWŤʭ��b��ƝN���L����"E���n�f/��p��P���V+��U� �U'	J?�|e�g��R���Zɳ�47u$/� �8>#�I)�i;��/B����5��iZ�5�,�(�n@���鞽M���!Z�@���ok�Ҡ����K����O�|����� �<k�˃c`I_�o��<���xG�R�<���b��ɡ�A-��ʒ�#kʑ7p��Ч��x3�@����2H�>��k�bC�JK����+���*;�ǞV%��}T�Ɩ^ܪF�x��� ����-m�Ѐ)O9�0r�r�L���Y�����b��˽QG�R/�c4x6���\P*�D%'���`sa�z�ʺr�T���.�J�z�Ux�*U?�(�S��9y�1ƏР��$��፴� a�8��Z�#g$�c0�!!x�lPN�/�`��L�<: Ud�h�(	Z��҇?�=b�����"@�=��ł���#pd�S'�([x0��!�^x�I��+�m��09���k��r *Hy�ӓ��zeշ��.ŜT����|�8`�i`ϱ?�I �v�^H�J�y�Jj�t�H4�ӵb3�n��N��rC��)� -�M�(QW E���M������{��68�>W-���c����g��31H]-�h���i_ӥh��x�*��#L����D��QKei�U�'��S�p��Q�^�_������WWe��^[��\�]g�ȣ�%�o����o�@cw��ԔP+�es��w�T0H�*�u�i���n4 �@�� ;�~��Я�Dwv��:y[���*ı�b!��Q��R�i��U]�F�bPHKY��PG7�3'Z�/dAPw��)A��U	���?�JRwQ��Gu�;E[���ͣ<�})��?q�֪��%JO����$���e�4uѲeu���(&WE('L��h`��T��sr�{Q��x��hh�'?�n42�1<�Q��{���f���^ٞ�JSw��?]���87O�_� ���K������э~:V*�b$)L�芉�����jj��8�&Ք��x�:��N�#*$��`R�,�wX�v�ߙ��q�yD}����E����U-孤sP�\���@�y�9A��v�EU���r�tw�ds�����ds�,zPC+'މ?��]~�i�P⹦�[�f� 3���7�.��s]a+����y�k	�k��;et�":�:��G��C4x��ւ���
;�.h�n�3��ZdoJ�w8���Kc	��dU�}�s�9�A�*��f��ml�c�g��Dp��6�m[��k�mC����}�k]z�~�+����՝�<�sd��Z]=JU�IoePX6�DJރ���0�}Dz(|������K)\��	栛�� ��v�3`��&��#�5T�.Ӏq�] �6r%V�:,!�,!�Q;�z��i�,@=�A��EB���(�ё�s���Ƨ(�TL���ߪk���:fG2    �V��rK{ ��X�ުov������;ꭺf��Z+�!̽��8�R�_؃m�{��v������G3FE���{3y;�n��_t��ܟ�[6�?!2rN���IE�M���1�� ��J=�Z=B�MΩ��8�.��?N�c�'�ف5N?؀/�O4�ɑ��?��X+0��"��`��O5\-ۙ+;�T�Կ,����EY�D40S7=v������xEd��t�!+�R4{;������;��bKw�g�����&�a;�doH����U��R&���K��cыDy�SB�˜ԃ��F��i{FV��-Ż�����B֡��
��pw����v�����qh���%��gi������#]��tԚ�l��t��;�4 �<P+b[��'�.�J�W������n��٥��O`es�([PcHBK������> ��~�S�!L]?�?L����C"����L Lgq��}��6^���,��J�Q�V�!p{#��0����k����_����|�ƞ�
�m�3(Sh�z3�10Wp�_N'�d-/�t�0��ucmO ɏ�j�\S�F��EePk4�n�O�x:[�B�3e�����U�Sj$WDI�¦�A�%mK�e3��P����9�Z����U7���d���L��U�s��^�?G%S�79�5{����
j zSV�Y&ZEnO�� :FV����\�=�I��ʼ��pBi�߽!�n~�usvL	e:��ݾ��~�̰�7�T�[�n������ �t�>��
�����2�6B����D�t돽����bU����k=���DU7��$��8�,�;wu���A�}W��n� ?�h�����o��_M�� � ��E���QS����b�ɇ�*�L-��W�T��뎥J����)�DT�u�6���i���%�=���k����c��Q�7�:n|��g��
J?�e��a��c��Eb�SBC�!@#l��V�6���X��>1\m��P�=[3v�3V�g�a�����l�D@��h��!�t��F;<�W?*S���"�%�= K3H��r�Jrp�\�6f�X��7 ;�Ko*���������ְ�s��@�@X"�>Qg&����H,�a35��J�4�f �J@<����B�ޔ	�ʺ��2�1�8��Jy ���[��8QqRX����T7���+{��=e�S�`�+|
�` ��%W���p�;POҢ?+D�Π*m�,����=z[MC,|u@Ru�� �[
w���z�0��֐���|����FL��!�\#r�)��8�uM?�"@[H6��E�����!0�h�������L��ͫ7 p�~�|��]��ya��7���n޲g�y}��7/���+T��/������\���0%�j� ��;���A�`��C�%���`Z����X)<!��������H��4�Y9?֜���.ƤZ���9����3�)�5EC� f����ה�:SA�2luw�.�q�/�R@��58'3�1f�1%.ZB����Xh��2�H�i��T�-H���5B�\�s�L&J��u%�FӸ��:��z�=9����G��N]�
,�PƽD�3���m;S¸gD8�<G�X��U$l����<N�t�hbdx�V�ﺉ���	%3�򙱝*��csj|IK6�)wR�	G�].��`i��g�,w�2��F�F�o��'���rw��^����^ݰb�+�Nf�mǙ����-��f{j|u1��:>`�[��<5��k��Eͭ�f/�8H��ݬ�
Ѯ����i�~���Ƌ���۬�)n�A^�[Eb�e�E w�}WE�R���e������3��P\X(.��D���d��h)GXZ-��g��0���)7z���[�@����G�ߢEDd^������\(_|o�C<F�^fLwG�n�;��̬�`����Z���n��8��.��Y+}i��$�ese�p�(�|0���?E�e�cϾ�@���{|B+���p_�4��r���ʐ���ĩ6pEy�'����T���L#�����w�q8�A�P�z�O����܏:�^�,���nepnT��&��"dmdhL{N��� @zj���4��5���G�HLuT6Te����u��pա7][�p�����X�#z*9�����3D�*���FU8;7q�+|G��<۵|@�ҌUZI������ ��I TEV�����jX�*��^J��������`�.��J����+�c��P��9S��.���[a�2��ٻ$o�@���{�������,��`� ��ˀ�d.(�i�=}Sj��ؽMy�2��]��5�v�r�H�8�|�{��J$�?�f&H�~+~6��?+��o����V������O�~(�hZ��e�Ɣ���*�p����hn��-�IQ��2��;�X@����ƃ��%+/���Ӱ1�w��X����?6Qbp��ޞs�3ѧ5Č��l�!0�8^i7
�����Z+i�� ��[�[��L����9�O���� ����CC#I�̴qoh�)�%x��f-/�ƙ���Y;U31���I�w��e�)/5u�/~�Y=2,+h�5��G���y��g(���x����2��3j��>bY�Ft�����qp�u�� R�G%4��kZܻ���*�Q�w��h��f���=�^���s�>4�l[A^���}�e� �,�a�e;3�u �T4D���QwK��&���=�ѹ��D{���ELc�C:{d�$���F��|S�A,�lx��`%����� [֡(���|4{�46�T���)�s!K`=8��#��6-�hj�#���<�L]s�`��Ѧ��)���l���=�M4k�w_�p�9l�<�2����:,q�#gI�j�7.�
�or��o ��|�I�����d&]8:�Z� ��#@z��p_�s�����D�������%X��MJ��	2p3�����fl߼�k3|8�Z���2�i|١�#i�p0(��(��I����r�&d�:j��r8�$�$�ah��tVs!`�7?]�%ε��e�i�O;����֌״��?NPѶ0T� ��s�_yq�ܷ|�_Z@#�߆s���#�������.UL1�';������( �7������~�ݤ�� �����s���k�n �'�V=�����I=��G�c�L1D�L�������.=p�=�ҳw�SjskjT�D/��	4�%�z��&Tf��R�����a�z��T�L 
�&�!P/�����f/ejN��ȉ.j%G� �^���g��zd0PORc���!���(��35G�Ǩ6j�47�q����A+�է�3���z��'p���@͞)98퍈�>�@����S�z������+j:�i���	��aޡR���a���+ci�6J�}���X=�5����n��P�@��|Y�C4������Z�?Ѡ�s5W��&W��~,PW�fO|�gN��z~ |�cݩ�I��)�K������I2�4P��疆&(���}���)�i΀��Ms���cn�F��Y/��`gGŎ*��)����#9�4�mS�˰ܼ��L�w�C0e��d��|���z dM�<9,���[����&��\�0��P���ઋ�QI��j�ܩ3<x	\)XŠ��x�	�ނ�̐-d-/K�u��/'�_�(�Tٜ����?�A���G;����KL�o5��q����z��T���/W����<�P�v�e��fzŅ�*@ >dЄ)?��>��N����m(�T���[Ap�`7�8��w7�BK%BHWE�C@w�b�W����7��:Q%�
�&�>N܍q�ӠÙ��.����k��w�>5�u�)�g�S��p��ʟh,MJ��u��8��?x� 3���%����<�%�i��>�{z;9��N���%��t��5��G�,Nಎ{㨩^y�q@u{��M\q��>����8�ꪧ�6j`=tw%}3ԻqM3�ߍ�pf��M=v    ������%��kͅ�Cw_�˸����+R�j���÷�� g﹛�"!_A��cq���	<*�R���Z�M���L����r+���\��X2(#��G��n�g��.I����q���7wJ~��l�B��6�S���4D�a'%e�Н*oH�籠���5����>�kesP�}��) ��]�|x�ɡU��5l}qd�U�;Q��>�HTױﯧ�qpأ:�u��O	}�Ժ\;��6��Lr��	Ô�'���P	�����M��pʎ��VR��Ƶ?�֙���Q7��U֞#�[��I��x�@��ؔ��9�����fMt�R�k�7� �):R����re�P�|��;��Q+n2�/]~�K�G��*��s1��b����9!`t�Ծ�����etw!.��w�KW����u����+Z�U)Y�*��M�V/�� ��
�tE��������F�T�כ8�QZ7s������q,�G�@t7#y�1!h�r%��m)A�C�c������m���E	���M��G�?^�f9���ۏ�p���[5�?�xe7Rz�8������c����,".g	���Z@�9�Lx��Õh8�R镾?G�����X�&��ur�S���,�_�8�G��]q��\l�����Vx@�Ë���{s��tNh�0�-�[�p)2Xtw������ϩ|)��Y��M\�,W��)Fe7����q�0�a5SHNU�O�s����fpk��#��OF�3|��y��_� �[��p�ǣu���kӂ�h��v>��D}�_/^��jis�6J*{fP��U���5�F2
���>�	pX�=����U���#4�Bh�s���<�P��6�Jz֋������l�Ȑh�Ύl�T�;ð�2�®�����������j\jJ�O)5��[[ږ�<��>L�Υ
6��q�"�i�H�Qì�6���mo*��O������meIr��\�,��\�>���ھ�X���;�E��Hj����'#�Ȋ��+�T�#++3RZ���З�_/O�{ٮ���Ҥ�>ݭóa�]�Ù
��IW��.&^2d	�вK����$~$fF=�O�E}x��ш�+��E�tpF���v��˔�:�z�H��/����^��"kjID�Kp� ���M�w`�E�y4��yɄ%OE:�9	�7I#kC^Ńy�^�KDN	4�z�C Vzd��ta��^O�ui+L�m��n~ˠ�پM��c������F	�<r!�'� ?��7�;^���	�l�~�u rq�����v�φ�aX���l�2����3��զ0��E$ay�X��$dN6�f�V)|��R���!��nׄ�7[z���h�3�G;s>tD�e��A`�.�(5� s��r�.�S+�Y[�gt[��Zs&��	�4���k.	�g�a�	f��>n�@��{O6��2\�w�Dh�.�t<f�wk0\����r����9�$S2�yw�Qdj��q�0=��oг���_E����!G;d��x9���=D��+/S�V�vǾ�H��RłS�N��8�̴O:����Q�0���e����H��3m�$�yU�����d��,�Ç�bpS2��ݦ%��!W��V�B�H�V��@��Bx��\��8d�uX����w&X��U���e��Tϡ�1���-k���B;v�|B�9���OyJ.���*&#����Y����3�ʃ;��Y�:�u��2bV�R��3g��F�v]xgؙ�9l��Lʑ��c�J��Rh�R6K8>_o.���M��6Z\��2Z��c��-\}^�T�{3�}�a�ke ��7}�oz������:vJ����MS7Mn�)7�l���;���٭�׻����i[��iہ���_��_U�s@���<J�!Ǭ3#�>��Z������=�7���y��?��ǭ�3$tN�HGci6�MȦ7�'̡�Ϗ��u@��4%�E0�}����ɷ5>s:N\�zH ���V)�10;��$�&��i?%��u��{lgM�u�������|�o:�Z��i9�]\bL����6��T�R��A�6�T�m�΃����mzc�4�m��9� ?���s��^ǚc�-�ki��0~o;��&��9��K��_u�'~�Z1"��x��~J�$��&IoE|b%j����r�G�b󈸆�V]+�U� c�AV�tҊ#�X�q�t�8�{�un��9����B���m��$�~*Ͻz��l���1c8��o�m�ZWOW�Kx���/�'�j�\CՖV�2�����l��	:�"����X��	�@��%5R�ئ������no�̟���`�����z���УBUnp£x����SA1��2���W�i�"qN&^�g8,"�{�go�B6��cDebK��.���0f&���u�S���c̄�k��p�Ķ������c�.l��k���������W������[V��j]��hR{W��!���]��#AG�����`�%���/(��u:-APH86|Da���B��o�B�B���M���^ !.G�c %.���1]���y<���ݮH<�	�#�k*(?�
���L���Y�U����q��ū�n�)_4�WԺ5��_as�Ty ����W�b���L*PQ�t��hy�:]XA�&t��2��1�/Lm�-\��yS(?����"�C�Cp�t�a����g�^��r�W/�N� ��)�K��/��S��`�oQi3��qp�`�[̘14q�FS�Nc�0�����"�*>f&�V�z|����O�x=�|�̰��ZU���+`��l/�lR�����i��_��}��1ŀu�C�C�����$0�p�C�1�3�G�~����1�<a�xq�3A.E������9N�BZw���a���{_�	J_���ߍ4��V�OPa��i������QP�wj�"�����XP���LW`�(���8��πT��I�! [�\����<�������w���%}dj������o�/���I�i���3���v�e��������y�vYO��N�������qK�L<�:���'�m�+&8@���w&Lq�h%�d�}�Ɩ	����BH�JՄ�M��ZE�D���FF�^(��UmB����pB�Č�o�t;!y�cj�����Lb�p���y05~�Q�����x�F�ڰ���Kx�3���J�zӜ�[�?��1� �a�����e�H�VW�L�.�U���M�#���%,�R�}��"T�sk��t���+&�sI(�^
��ݳ/ޖ�i2�8��t5^�E�V �@��G�UX��0�^5�@d*S8o�y ^�N�[{�Ӂj͹c���T�`�S��t�7���`��7�`��R�A��:��6PC~IꪎN�t�{5ڃ � 9!� �˞���ތ��E�����.a��Ԑ�+$�7�c(x�������⃤D�u3R)�~�M��|x�4<5r�+dJW�v�C~�v!�:v���&]�a�l�e5~��o2�x|�|��I>g����B^y�=�(�8I��{3��moB��N�2��Zch��p�T�ۡ��5�g���k*G�֥s*����R�,-I��.�	�.�Y������VaE�/��p5nxd��_����j*ɯ����h6�$�p1#�A�hq�y���ȡS8lU���Wd��C�����
2_���9�z��=Vu[2�L�[�&���\�_��������ɯe���9����S>�	�IGvH�_ �_I��p�������h��P���!h��AI�
*-H)�=���L�R���1�u������4�	��*�R�L6I�U�@��Y�U0U~���� �:�&�-3�c�� �J��kpW~� W�i;NEpW"�Z[�dOܣ��ZX~�FY�Wd�T{��N_�#܎�|1��"��{�W���kvH[1�Bާ.��´�%JT�q
�WT���z    "Tw�y�<P������kPR�o���{��y���X��#,����7h.�������ȣ�X���o�O��(�',�J;H.�h�CP]�/�^ax�o��^�`�D�#�j�5|�s���b���t�����=��#��v���c�Y�1�8���j�S�\�/4�^���˿_\g��2�����w�t�˿��d�11S]iG�F?��>&�j���)M���-^�L�u
U<�MKf^�<����� ^��Mg��GCH5�rK�^�M��ꔎqC�0��
Iw�gF*�ˎ�o��TO=��)�S�Ӷ�,��lg�c&^YQ��=��T�Y�S����u�T?���̿�C%B#S��O.�a#��
��iv\�Oh�A\�dp<�=��˧�\��O��o��[�fPg*��c��տ�w&3v]������4����bj̷����'��t�o�nwSf�m68�Q�mƦ�|ۓ)L��Aw'�i~k��(4����Ph~�	B4Ph:%!(�`������i2��xF�{�S�/cƱ����Hp��L�pf7�iS3��i�7j��y@o�q���3�ǖθT��ï��<�ψ���yB���K��L���G|�+>b�589�e�6o����
��^$j�c���L/�6y4sT�4Pn�H7oH�u\�Lx#WPo���
^zp9	'��R�4���tY8�Bug��o���\��Ӝsq֫f/LW�b� '�կ��I4�W�r����0q�)�A�Gz�ȯ!���R���Q�ɌxՖ�uodN<��!^�����X�9V�����6U����7�qbj=Uӱ��s�9ozz�9�=�\�:5O�v6������&����|�ӥc�D�Λ����7���F�N`:"L��e��Jw�O�?�7h:ݝі��I�S�u��.�t�����i6[^j�u3��Ď�|,ŏ<���B3H��wk�I����l� ;]s�����'�dB�/R�����j�,(��v1t`�#H>���ō�>Y�Z
�����v5�rn�v�:���H����u���qh� Cg*-A��N� �4��N�(�t6u�Ut��uh!Wg�]��M��'1��9�L�8��d� }z��9
Pֈ��;�Ma��@z�rVx�`ԠW���c�m&�t;�M�{̵<r�`�E��r_$�������w�}�b��Z��c��t����p;��O�⻭���~�A�y��<gZ�h�33��$�h΄�O��h���qC�j>���geR��+6�9��� ���5grк[Ĝ�A�U��s���3(E�W/_�|�|	���#w����u����R����>ȡ8H%�Kn�ذ~�0{��8ϙ=V��H�=�5t��3)���mT��{6ѝ�aE�3��/gz;gr���ۜ)F��3�(��4g�Q���,��{d<ĝo�PiD9O�C�2h���6 ���9���n��i�{/Z��`�9^3�C�3������B�#���l�Dj�ov�-b���A$uI/ξ��FIO)#�hCL.x[Xg4�2g6��
�yւ"����'(?v�W{� ��������讇"�j�s��߂�p�"d<��D�AE<����|�q��lՍp�l�/�79�H�f��Ā�?������23�&��������.����}y��[�!}�KY��ͅ4��⭃��-��v�Q����1&S+��XLȃ_?h�-"o������RҀFO�邑��L] e?��cP�޶Zh�q� �)3��J����8��0���gލ��	=r8�>�vjE��Y��O�[�y,�	�`�~oR!���5�	�a�K�I0��>�0"Ի�o��*6s����m��z�o�U���y�>�����,�\�H�C��Q����h�.�K��!�+M��z�
�,��*Q�K��R�����(8���w̑%�� m����,��@�z���	����A�z�`a4�Sx~�h����~_�62Ъ�1����UxzU��$�Z�?�����;\e�7RF�p	+�(5�	ǒ��N�������z����ő�ԫ������N���hW�y�`M%Hх�
2V����џ!���4ϣ��x���ͯhO�$3+��Vh����6N��[/x���k�d�e]��z0[��宷Pg�z	#+��I�^t�[N�F'�ʕe��>�� ]��m��������[���i��	Zg�^
�k;8_��r��<���[G��ޑ�2\K�
IU�=g+�ށO_`��Q������Af��hۑ�e���A{�4,hH�Rd�K�]Ż<��L�7[���qN���<�X/(A�Sf���ဴǅj��<�B\��9jꓗ5X��L}��$��"�?��
Υ�������2{��$�Jʽ^�m��S)|�����u���e�r��9(g��pYqZ�X��Oq�.�	�p:����VC���q$��5PѲq*��-����G�␔V �s$�א���G��i�O�=�3H������?^
�йߗy�@:�u�����ɉ���CN��G���d�g���AW�C��j�in�?m��.펍K�,��`����KEP٢d����g�TU�^V�}.0��8V}�m�B���D�e��`���8�,�?��k��R?pq�����?hg��R}���$8�۲��0�®�Q��:X �E�~0����>z�p�e �Ϣw�.ܟl[!��(4@����.�!H�����lk�rbܟ~�'-AP��+��b�NA����)���'����VO�J��'{T^5:+��C2��
	�\���%�gv�vuo��g^�-^F�����q�z'i0����Z�ko.���^����Y0B�e*��r����/lቢ��4&��@�Jݟ����3�uQ�0�Z>��~u!�'Tǎ�H���-.�0�����X<ˁZ�xB�Z��{��$�(�Z� ؋��u	��0�;�j���'�
�����?����3��f����M+�J �0�hk��M�,蠠��I#��݃]�S׽�3�]>�%�vV=�%S��_\��ixo�6-���p(�.p92�s�캝�������)��6a�0^[��E$�w	��{��7_� 𡀅�
�rMN^�?�p^1/�^L�DeD�Ju^P��2rH4I� �ޟ��^x���'�:8l���g[�_y������`�uP��%��pߜ����"�_e{_t�צ��8T���G�>]^�����[b��]P%<P'�H��.~�Z���.���3�H�(�j�0&�g�4�GoߒqY�]�pf��<�P�� �I����l������C�2E��}����:..!	�#%[����k'��k'�N(��ˌ�V��F�.q�&p���y]��� "�~s��qC���)�|�%�)~ǖxd�3n�N�,3c�M�.�k�ZzO`���A�b��u���jO� ΂+K��جs�CtҬ�32d�	\4�H�nzcD�nCc3G�(�	Y�i4�p���hĐp t���a; ��r�����^�)Cp�GNl������ܵ�N����0���z�j�Q��e��t{�"o�oP��.=Ⱥ��G�}�"N)r�L��Ɛ�99��w����B^����s�2R=i�x��>+^o�` mIWZq�B�����& ��*8 黖�*��c �YU{���u־�����l�v�/�uTC��֭�1��?�p&����F��iL��/jE�<�L��w��z�\��3e�����pauO���)�Rk�D�E��,,	c�D
�M��u�8f[�{�,��l�
�hJ�ѫ���&��)c+��sI�U.�c��E�����b���U���o�8��*�8�=Z��:�v{�M0nPWm����B ���1TJ;!Gp(��	a���׈w�m��	���W�	�m���+a}g.��\��S��<���u�TdCn���    k_�w���f󯦽/��R��<��Y�Ю���1�$���	�9$�-��w�^戃��&�r���p��$��	��$ڞ����k[e���^�L4@:d��ܦCC*������-����i�h��l�(�����YEL��c�?��k����S�]��h5�r`g�|8��S�K�N�yQR
m��/��s����\��:�.+��QZf�.i]=�C�w���N�!��2$H|EL��%I0��e��z.t��#�l������}%�O�	�������W�q�H��s`��:䛏Az�*��c,�+�k��[�R>���r��׀��@�2�Й�)yl�o�?�v��%�n?׉��?���	���2�Y�>]G$��>4�L������q�hw�Y�	Z��@��c&h��|��;A�wUS�	_�y�NI5��kJ~�k��2O����k���S�۔�_�����2s�d�U�wꇛ�~O�w̿c.>�����/����y�ք0#_Y��c�+��J9dr��Ix�2E_��u4wH��	����yLS�/6�DO ��I9�L���x�/E��4R��X#���L��T}��僜�9��U~	��=��2f��u؎���.ir�#O_z��n�=�G-<�`#{Ȃ�7��S\������O߾��X	c����`���mA�֢g���=!��E�!��!�d���~��0��҄��3/��3	��ץ_�~ �򂾹ݖky��O�:�Aˋ\2��&dE#J�L�jG#�Ճg#BN��A�$:�"@#ϓXedL�j1��FvA2�V�m��f�B��#�B?0Xv>��]`�C4�^�A�W�ٱ��*�߶2�1Kd�����uG�!y0���J�?.^	AbH�D@����E���@����%�&M���u�ܢ�g ���n��N�"	9sa#hJ��Ǒ�I�����m\8�=KF\�o:8Ȇ�i��wt��-�C����d�A�q\|�p�.�FS�ċ����J*�p�h��̣��a��(��v�C4c���q�5��ｖN�����.}�m��(h��x���cB��G�	l�UIű�k��j��r��Ht�q9eسȈ��% t�{�P��DD�z^ϳ�d�-�2,A�k���[��Rmj��NbP�2
ca��lO	�/<+�� ��5��}��U�}�++o�cu[�6J����8a��s3 R�~�.��3� �Fq>�ʴ�[}�IR�
y��3�f�����@҅z�i��G������ٶ�&�&Yssf�̥�m�'�߾���*�7�'Ҵ����9sp���
���B�������^��F����4�(M15�_�<y.R��U<��Ԗ�J��]�W�F�t%�ĴC�n���^z6� .�:��d7�|���͗C-��')]����/��rrŐ޵;�r�o��Lr��U�M��%��b��.N{G�r�if��X��s#=�v�7�7��#u�ܱ`�5l�h��X�~���N�q+J$Xp?Bb.���!�X�S�@�k�Q�Θ��Y����b����Q	4�CE̶�F�d���ְ���}K���t	[�7[Y��y�D%�PK�:y>����!70Џ��v��T���h���Q��1s?U�M���I��~l�EUǪ3�.ڵ����ؖ6F���M��_0�p#%P�kŪR�6H���D�u-�m?v-�Q���q�B����9l�`��T�
v��~*�u��d��'�*�� CՆ/A½λ�l?��e*�'�l �-�.,�`��T�����|�wNH��C����PoN�,�k��!�L�)D@^�c�z�r���i��-��4�������7��Q�@�}�~�:��8���w����T莧�c�.ל���/a� 1ퟧ��-߼�s��NȐ9�� �l�ঊ���W<<u�����)�Z�l���������
@�����̳�\nP���V������!��9oP������V�98�r\��A/N� ��+h研��^j�-<��ߝ*� ��cye��l*�nG���<�-O�}+!qxU?l�<|�&�-�6\�=w`��j=���.�D��Ȥ4���Eϔ%��b��W.�Tv���d �-hoF���t,k)�x�|l��zhF�wQ��&;� T���
�X]�H$[T:,�#[�6E�d�5��	�1B�X���˯�N��B�X��C'V��v�O�1�d��M�<���)ysB�x��D:|��$�-�"),�2�v?���s��P��Ľd���Ɍ�H�VŃ�EP����9���_miE��/��!��IM����'P����h$,4�"�HLi@�Z"�\�+�n�uVH�
گ0=�Ry���Х�t�u'�+2��c�]9
��$r��O=��G+�S��:�i�	��?��nۈ�
r��))\6����I\��N�	�[�������Tě72�n�u�>`n��AY���4([�i�����	��ϰ���!=�� �>��4����)��:9A������z͛�:x�5���Jd�h��R�6p���9�Mnd�\��7'}.���j���NTl��h����=G5� ��7.�<�v���Pae=���th�WPA���;� ���9s��OA��6��������a�AU���6�~��xV`��Ki��)oz_b�/�A����Qd����~W7���6�*\�:��zۄƒM��,�R��%����=A���$��e�iعS��*B�ԭ�%R��*+u��ժ�dG��OD���	�0H�@[*3�>�*rСD�T���%��,u_+���E�91I�
+�|Gr�Z�v��ɔJos�Hu�����0R��bX#3*��m��%	b�R$*4Ь�������16?ԧtZ�o��C�(��@-������� Hс7C��\@*.�O���@#�i�,ZO˲���d<-�a���԰��$<-���Sr��20��^�2��2�����\�pNzӪ��,��m���bL�ָ^�״���k����3�f`�@�4Vu�uq�陭�nڜ�I 5�_JҤ5�b�Vr�
��k����������ǂ�u�7�vP(edM���P�id�N@�j�Ǝ���������W��oS���������Nt��t's��M�?���^:�i�v���%�>���M�U�&r���8�i������tZ眦��|����z�3M�Bc��)L�����L�Rӝ�g�9��U��+���ܑM{d*�־2-�t���"7�Ja�v����;nҔ����&���Qڴ����Ƚx�*&X�ziJϸ�|�����(:iǚn�m�M]��V�q9���2���N+����P[b��������S���"/��V>!����Pzc�sv�=��z����7�����ϴp=�x��ϫ�l�,�G���^���%9��6RC|,/J�y��j���:�������.ۜA;
Ӄ4�����h�ћJ=b@=zS��ն:ell'�
hG���ћ
���K�����Z���<ZE�5�G���RE�Q��A�]��n�j��g��{")F;��h�!�h��w�[��-�����>σ��Q@[f�>ˇ������@+
>-�6}ó/L[
��оk�9�V�B3g�
?�&d��=��٥�s7���Xm�T�l�ʤ��	�����Bfo���")A���|��-+xD���	,� ���he��~2���$o21�Dc������B�"&�0�B�7��=��B�7����b�8�P`�#�%��S��k'�.�;��G�Mj|wf��Z'Q�g$�
JɌ�X���ȇ�+|�aE�D��<"Et��EC@�L�^p�Ӷ���F] �>�fP��Z>�U.���I261�����&kD�f�`8�����7#E���~��[.�$�8��vU�f�Oд��,�F �{�wl`�4�$'V�zު�;�<	Ȅ�;[5�Z�'	4�    rS����\V~�'O�mxd��L�,b��l �*Nz {��ъ@�.V�Z�'`�-��o����)Q]2�U���� �f'(��.	<�G;���h���x�=�A�WpSm��F[j�-���nZ�m��f�v��r!D'�yA��] &�mu�'�Ӱ�u�����[�M 6uB=��lۨ��q��֝&��а���6i���}���3�0�7/�6n�6������F�d<��m+�C�� �8A'��ot�:Stx�j`j��o"x6o�owpm�V'��A�yKn���0�!�9BxΊѡ��-�E�Լ��M#�����*7xq� ��_9Pk�v�2t�h�8�d9 �&��V�bͻ8�@"U�W��O�0=[�D�tg��	ٲ�cҜ�Z��̹d�殴�hz��P8o�G*�d9���	e����}u�j��Ae��w��ϼS�g���V�����;Pf�U�sV���N�MA e�.f�Ǽ���*`&���y)�#%�6h�~�����ܿ��x���1��@��8��S�OY`��!�����ELй�	l:��cQ� 2�G؜�{��<�@y����2M�Y��WVz0_�� Dl���g[��Cއ����`��Üf�A�A����0�k����!��c"Ä���l���bB��Ll�?���U�됃��XGy%c>�Y�FI�M��H\�l�+~uܹDq�o��-�R�k�?�ct�>����ٛ&S��Ǟ,�I���F���O��5�u��j{��}W�֍����;��±]�D\2@����WtI�ս���Y��{��K��Kz����N+�38x���ɛ�պ
�Ԡ����;h�5U|���m.���D��ē��Q0��G�SO�
"ŧTс�9-��ũZ?k�ɛOe��Sx	�Nǌb�J�������t�spA���Dwc�%�#�ϸ�m�/��zu������!�M�q�~���:6v,�~8�[����;��7���徸F9��S�ep9�/GSG���=e�:Q�{��C���Qk!��~��sFȵ����M��/����/e}�DB86{���(Z��`����[� C�1�f��q�}�꼈)7��˱1/d9��f`������� _��j�<��h���bAj��6�k���{�ƞ���X3[U
�C�a��1!��D�p֐0IT�7�%���؄Fi��b���ag[D28��k�`*���iwe�������T��+M��ޥktF���)OP�S:6�Bm<02���1�i�ΡC^��3-�xi�)6���0�B����a)���	�؄	u������h2���q�����)�&��(E�7��S��ٛw�<���yWm�����>^��!p��v�"�����*�u���r���A�W�M^�/gw�O���s����h-Ĕ7��%��A������^���&T�;J���g����-���sԚ�L/~Bq�$��[~k�o�����~lr+)n�NT({gZ���zA܎B}Z�z������.��b�x�#�t}q+$��F�a�l�C�Xl�"-1�
�A�2Kj���(�M�M'2=rYi�5b����p�Ct�4d	�p ��R�?�s|Ο��$#�4yd��1��P:�d^~����q��S�9%x� ��wW~!�QZU���=S&�&�uY�b�7�˫�`p�#�94d�t� n���d10��*�S���V�QQ�T�!�aY8\�P��~]�[\�ު�Ōo�;���l��F�n��琇��t2������ e������'4����m��rp�
1�`/-� ױj�{� �q�+�����A��r�N�	�VY�1yf���eA���85���wő=f|3,W���Ö�"O�к��ےq�D�Z!D�1C���YaP0��g����$�z�%��ru���8��^g�2�ck[���r��0Å� ieF��N^�8[S7El!�}|��4���҆O<��3�> &V�'��SG��]?˗6}⟠�t�ϡ�A�i��k<�I;�Fӥ��b�k���:��.��)
9��@"^�S���P�֐Rא���a7�X�Ё�Y:J��;�;�N')�M�̎-S�qo�߆�cǆ��:�\��d�:V���ⴃ?�{�-T�}-���t�|�΂P�o�sļQ�.���[�d_Z@8;���O��V;Z5@ZYK�1���J�~�QsFS;ekBL����@�	S�Vt������ 5�t��ŵ�/�o0f������	�Ƶ�J]�#��+����!x2�0n��N)�5`�;���l�
s f��W��/=�X�#ͅmǐ!(���X�����ʨ����ǉY,�eN���ج��4���mW���sDw�Aȫ�����RѠ�Xm	�#u��C0+�����q�^5�.�:�#�8# u֯��V|�Q$b�W���AAL��Z06��{����A��a��^�� 3EFF��E�ti�h�h��N ����kM��Wc���}s<��#"u�������v1�8�@T�����=v6�C�)"$v�h�
������pt@a�`H�c�YN�^���.�1�m�8F��mGm�x������z��=FPj���6FT��v��siNŏ�
�D֊� U4�
[����@��Q�UTf�`RDj�<;j�$�$�{�OY���P���(k����n��q�+��NJ�1�ѐ��.�=�Fp��s�M��S�5��z��<Ʈ:��t��&̯��M2�ehN�:k
QN�a6e�:�75%�S����4�:|�IY�νڗǫ!�+�dM��^DC�(~j�Sp�#&T��W� q�����0��}� ����X��x���__�[�:�U���7L�`�gx" �V4|�H�Ю��(d(�f��ù��y)b($��?�b8�~�-d�a@$<�DpFD�>[m:=��<����9�1Ht�sRE����ka���G|dy�a��H"���s�	V�����1������o�ȱijſ<���~�p@/�tC!O��]��[Z�;P�<KX�tB1rv^�@���"�L&�0�q�������i���-��V3����}-���9+���[��T��p���:��!cm��z���w`�N�)8CF?֧�B�>]w8��G[BKKx�.j���8���x�ak�J���w)8����!�1u�֔@͘��"0�<t��9�sy,V�h']������.=�/�v��}�A���y{u�p��w��Q��wm�ѷ�&�������/Y6(P)2<�N~��g�q�W�)�I��X�f�S:��j�DL��-��!H/��n[�;yp�<���m�{�9AM�w@���c��F0-X7:�E�ͪ�H�R:�n2�ݳ҅ċ@��߅x�AK:�O��e"�����I�!�9ӎ��A���� �y�Xw��Bf꘮�`c�ZlK$����HV���2����3��"���SF�!�m��KP2"���=��_��%�)D�B����4Q���%�"�z~h�8V"׌n=#�쌈�2�^�4~-w���A�+��Ư`�	OD�R[�2��	'�!H���F�~�x�"�E`e���"Qs���26��X� f�����*nS�iDy�(V�"IHO�*}�3��̢x���o��H��#�����9`NUX2�a*�A��B7N05�]���APS�.�/-�C�6�]z��!���D�kc4����7u�w0��!)�<o���z�͔�o���{���o�NXT/F#,�k��G�!�,���tc,
Mg�Eدf�A�=�,0�v�*�vIH�%�d�C��W�^��F�lw�K�!x=E�A�v��FP5��D�7�,V���S�:���tu��Q��N����%�Q���U/�@��q�r9��ё�d_l#���k};�.p��c�� ��z�v�s�?�Nd6�udU���Qt�#�9'��/6�n]�V�%{�>���j/��0^��#Fbd��[R�3��_�o8 �  b`F5�C2�"<b$F�b<�-V��>bHF�Fb�]�
��@�:����K�����Dg@o�9�����" B��~�h�r8bx�܎�����˭!H�w:�&������c4IQ2V��a_<f`��_�	��|8bt��.VGР�7E@e�F[��;b�F��;�!��QkĔ�-��������E۶��(�o��NvDiT�p ���(@�x{����!]����Ϩ�)��hV�pr��m>3��`'����]�Od�ꝉZ��5[�D��H缓=<�w �ZH�Y�3�h>r�z-���μ��1���;�$����l�FKP8:�ӎ�3����䏘-�>v;}�G�0��]�+�#A��c�3˔��EMy�����z:G:���aP:z��FW|S�I����>;S���Z,R闞�rG/���g�2y�n�Q쎎�֖��V�%�?�#�]����������:I8Y      �      x�340���K�L�������� (��      �   �  x�m��r1����'��O�}tpUL��.\:^�%�6%iI��g�D�Iq�oF��
Y
Z�=l�d��qx��>����"/f�,�Ԥ��C���|N+7Z5�����G�{�UN�50'�x�*�i�`�--i��'_݁+��Tgb��zt�6c�5�U�S���QH��p�iw�Mژ�kUKz@ߏ�q[xݛ�S��o�N{ET��"��W�%m���"�8t����h�F��S��vh��m �d�C�Hp�9Ck���lA;u�epI=Kڙ߃K�����^͋��ҵ�d�S���ύa�Q״�?j�g;՘[B�~ഏZ9w�P�~�g<F=�/8�~���մ�I&�t@o:�MLZ�tPl���,���	��-�:�����b�f&k��i��Ť�ʇ�N��
���f �O��      �   V   x�3�H,*� �%�9�~��FƜ�f�ƦFf�F��@��id`h�k`�kh�e��YT��PZT\�����E�#����� \�T      �   �  x����N�0���S� bZ�ss��c��L�TA!���ٷ�-��f'�Ɛ��&��1��Z���(�"���s>�QQ�6e2s�Y��߼�5H�8
���(�\B��C[���ms�?��Gh�R�z�C)���UVlbji�ٔ9g�ߘa�0���-
Uz]�JYc�+L͚Ӱ�*�ƪ�u�}���2�L�Q`��5-Bh!���M,�I(kN�pؗG�}24�^(�MKN;Vk��ʺ�ᤰ��*^���U���/�RפĢ*�ma��xj��ؐ����������b:Hi[b���k=x2^L���!N
���6�b���&�M�L���n�Ө�1a�C&0� +�9̶����t�����ϯn�dr���%�eKJ�hD������]���;�\.�Dq,˺���No�PX�r֭A>��V�״ ^��$>쇎��鴠^���w^o���$[�      �   �   x�u�A�0�5���c�������#Zlx��G%P'k��Hs�,�qO��|i��xxN&O�\�ɒھ��r�u�F���g�Y�а[���W�%,���Ϸ��2��Ӛ��)�&��z0��5�35d-�]���9�Uߍ�?d�J      �   u   x�3�4�4�3�4�4204�50�56�t��+-�0500��2�4�4E�6Vp�()JT����LI�,�2�B=4U.�I��
!E�\����0���0�4�U��H�М3(�<�(�+F��� �+�     