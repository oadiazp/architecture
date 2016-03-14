--
-- PostgreSQL database dump
--

-- Started on 2010-12-17 18:17:27

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 5 (class 2615 OID 16397)
-- Name: mod_admin; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA mod_admin;


ALTER SCHEMA mod_admin OWNER TO postgres;

--
-- TOC entry 349 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1560 (class 1259 OID 16582)
-- Dependencies: 5
-- Name: seq_aplicacion_seq; Type: SEQUENCE; Schema: mod_admin; Owner: postgres
--

CREATE SEQUENCE seq_aplicacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_admin.seq_aplicacion_seq OWNER TO postgres;

--
-- TOC entry 1921 (class 0 OID 0)
-- Dependencies: 1560
-- Name: seq_aplicacion_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_aplicacion_seq', 7, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1561 (class 1259 OID 16584)
-- Dependencies: 1849 5
-- Name: aplicacion; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE aplicacion (
    idaplicacion numeric(19,0) DEFAULT nextval('seq_aplicacion_seq'::regclass) NOT NULL,
    aplicacion character varying(50)
);


ALTER TABLE mod_admin.aplicacion OWNER TO postgres;

--
-- TOC entry 1536 (class 1259 OID 16398)
-- Dependencies: 5
-- Name: seq_entidad_seq; Type: SEQUENCE; Schema: mod_admin; Owner: postgres
--

CREATE SEQUENCE seq_entidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_admin.seq_entidad_seq OWNER TO postgres;

--
-- TOC entry 1922 (class 0 OID 0)
-- Dependencies: 1536
-- Name: seq_entidad_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_entidad_seq', 48, true);


--
-- TOC entry 1537 (class 1259 OID 16400)
-- Dependencies: 1840 5
-- Name: entidad; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE entidad (
    identidad numeric(19,0) DEFAULT nextval('seq_entidad_seq'::regclass) NOT NULL,
    idraiz numeric(19,0),
    entidad character varying(255),
    rgt numeric(19,0),
    lft numeric(19,0),
    level numeric(19,0)
);


ALTER TABLE mod_admin.entidad OWNER TO postgres;

--
-- TOC entry 1538 (class 1259 OID 16404)
-- Dependencies: 5
-- Name: seq_funcionalidad_seq; Type: SEQUENCE; Schema: mod_admin; Owner: postgres
--

CREATE SEQUENCE seq_funcionalidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_admin.seq_funcionalidad_seq OWNER TO postgres;

--
-- TOC entry 1923 (class 0 OID 0)
-- Dependencies: 1538
-- Name: seq_funcionalidad_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_funcionalidad_seq', 15, true);


--
-- TOC entry 1539 (class 1259 OID 16406)
-- Dependencies: 1841 5
-- Name: funcionalidad; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE funcionalidad (
    idfuncionalidad numeric(19,0) DEFAULT nextval('seq_funcionalidad_seq'::regclass) NOT NULL,
    idmodulo numeric(19,0) NOT NULL,
    funcionalidad character varying(255),
    url character varying(255),
    menu numeric(1,0),
    alto integer,
    ancho integer
);


ALTER TABLE mod_admin.funcionalidad OWNER TO postgres;

--
-- TOC entry 1540 (class 1259 OID 16413)
-- Dependencies: 5
-- Name: seq_modulo_seq; Type: SEQUENCE; Schema: mod_admin; Owner: postgres
--

CREATE SEQUENCE seq_modulo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_admin.seq_modulo_seq OWNER TO postgres;

--
-- TOC entry 1924 (class 0 OID 0)
-- Dependencies: 1540
-- Name: seq_modulo_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_modulo_seq', 13, true);


--
-- TOC entry 1541 (class 1259 OID 16415)
-- Dependencies: 1842 5
-- Name: modulo; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE modulo (
    idmodulo numeric(19,0) DEFAULT nextval('seq_modulo_seq'::regclass) NOT NULL,
    modulo character varying(255),
    rgt numeric(19,0),
    lft numeric(19,0),
    level numeric(19,0),
    idraiz numeric(19,0),
    idaplicacion numeric(19,0)
);


ALTER TABLE mod_admin.modulo OWNER TO postgres;

--
-- TOC entry 1542 (class 1259 OID 16419)
-- Dependencies: 5
-- Name: seq_rol_seq; Type: SEQUENCE; Schema: mod_admin; Owner: postgres
--

CREATE SEQUENCE seq_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_admin.seq_rol_seq OWNER TO postgres;

--
-- TOC entry 1925 (class 0 OID 0)
-- Dependencies: 1542
-- Name: seq_rol_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_rol_seq', 3, true);


--
-- TOC entry 1543 (class 1259 OID 16421)
-- Dependencies: 1843 5
-- Name: rol; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE rol (
    idrol numeric(19,0) DEFAULT nextval('seq_rol_seq'::regclass) NOT NULL,
    rol character varying(255)
);


ALTER TABLE mod_admin.rol OWNER TO postgres;

--
-- TOC entry 1544 (class 1259 OID 16425)
-- Dependencies: 5
-- Name: roles_funcionalidades; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE roles_funcionalidades (
    idrol numeric(19,0) NOT NULL,
    idfuncionalidad numeric(19,0) NOT NULL
);


ALTER TABLE mod_admin.roles_funcionalidades OWNER TO postgres;

--
-- TOC entry 1545 (class 1259 OID 16428)
-- Dependencies: 5
-- Name: roles_usuarios_entidades; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE roles_usuarios_entidades (
    idusuario numeric(19,0) NOT NULL,
    idrol numeric(19,0) NOT NULL,
    identidad numeric(19,0) NOT NULL
);


ALTER TABLE mod_admin.roles_usuarios_entidades OWNER TO postgres;

--
-- TOC entry 1546 (class 1259 OID 16431)
-- Dependencies: 5
-- Name: seq_usuario_seq; Type: SEQUENCE; Schema: mod_admin; Owner: postgres
--

CREATE SEQUENCE seq_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_admin.seq_usuario_seq OWNER TO postgres;

--
-- TOC entry 1926 (class 0 OID 0)
-- Dependencies: 1546
-- Name: seq_usuario_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_usuario_seq', 15, true);


--
-- TOC entry 1547 (class 1259 OID 16433)
-- Dependencies: 5
-- Name: traza; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE traza (
    idusuario numeric(19,0) NOT NULL,
    fecha date,
    hora time(6) without time zone,
    ip character varying(20),
    idfuncionalidad numeric(19,0) NOT NULL
);


ALTER TABLE mod_admin.traza OWNER TO postgres;

--
-- TOC entry 1562 (class 1259 OID 17092)
-- Dependencies: 5
-- Name: url; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE url (
    idfuncionalidad numeric(19,0) NOT NULL,
    url character varying(255)
);


ALTER TABLE mod_admin.url OWNER TO postgres;

--
-- TOC entry 1548 (class 1259 OID 16436)
-- Dependencies: 1844 5
-- Name: usuario; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    idusuario numeric(19,0) DEFAULT nextval('seq_usuario_seq'::regclass) NOT NULL,
    usuario character varying(255),
    correo character varying(255),
    passwd character varying(255)
);


ALTER TABLE mod_admin.usuario OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 1549 (class 1259 OID 16443)
-- Dependencies: 7
-- Name: seq_cargo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_cargo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_cargo OWNER TO postgres;

--
-- TOC entry 1927 (class 0 OID 0)
-- Dependencies: 1549
-- Name: seq_cargo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_cargo', 5, true);


--
-- TOC entry 1550 (class 1259 OID 16445)
-- Dependencies: 1845 7
-- Name: cargo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cargo (
    id_cargo numeric(19,0) DEFAULT nextval('seq_cargo'::regclass) NOT NULL,
    nombre_cargo character(255) NOT NULL
);


ALTER TABLE public.cargo OWNER TO postgres;

--
-- TOC entry 1551 (class 1259 OID 16449)
-- Dependencies: 7
-- Name: entrega_certificado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entrega_certificado (
    fecha_entrega date,
    folio_inicial integer,
    folio_final integer,
    recibe numeric(19,0) NOT NULL,
    entrega numeric(19,0) NOT NULL,
    id_jovenclub numeric(19,0) NOT NULL
);


ALTER TABLE public.entrega_certificado OWNER TO postgres;

--
-- TOC entry 1552 (class 1259 OID 16452)
-- Dependencies: 7
-- Name: seq_jovenclub; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_jovenclub
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_jovenclub OWNER TO postgres;

--
-- TOC entry 1928 (class 0 OID 0)
-- Dependencies: 1552
-- Name: seq_jovenclub; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_jovenclub', 1, true);


--
-- TOC entry 1553 (class 1259 OID 16454)
-- Dependencies: 1846 7
-- Name: jovenclub; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jovenclub (
    id_jovenclub numeric(19,0) DEFAULT nextval('seq_jovenclub'::regclass) NOT NULL,
    nombre_jc character(50),
    id_municipio numeric(19,0)
);


ALTER TABLE public.jovenclub OWNER TO postgres;

--
-- TOC entry 1554 (class 1259 OID 16458)
-- Dependencies: 7
-- Name: seq_municipio; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_municipio
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_municipio OWNER TO postgres;

--
-- TOC entry 1929 (class 0 OID 0)
-- Dependencies: 1554
-- Name: seq_municipio; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_municipio', 1, true);


--
-- TOC entry 1555 (class 1259 OID 16460)
-- Dependencies: 1847 7
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE municipio (
    id_municipio numeric(19,0) DEFAULT nextval('seq_municipio'::regclass) NOT NULL,
    nombre_munc character varying(50),
    id_provincia numeric(19,0) NOT NULL
);


ALTER TABLE public.municipio OWNER TO postgres;

--
-- TOC entry 1556 (class 1259 OID 16464)
-- Dependencies: 7
-- Name: provincia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE provincia (
    id_provincia numeric(19,0) NOT NULL,
    provincia character varying(50)
);


ALTER TABLE public.provincia OWNER TO postgres;

--
-- TOC entry 1557 (class 1259 OID 16467)
-- Dependencies: 7
-- Name: seq_trabajador; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_trabajador
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_trabajador OWNER TO postgres;

--
-- TOC entry 1930 (class 0 OID 0)
-- Dependencies: 1557
-- Name: seq_trabajador; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_trabajador', 1, true);


--
-- TOC entry 1558 (class 1259 OID 16469)
-- Dependencies: 1848 7
-- Name: trabajador; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trabajador (
    id_trabajador numeric(19,0) DEFAULT nextval('seq_trabajador'::regclass) NOT NULL,
    nombres character(255) NOT NULL,
    apellidos character(50) NOT NULL,
    id_cargo numeric(19,0) NOT NULL,
    id_jovenclub numeric(19,0) NOT NULL
);


ALTER TABLE public.trabajador OWNER TO postgres;

SET default_with_oids = true;

--
-- TOC entry 1559 (class 1259 OID 16473)
-- Dependencies: 7
-- Name: vv; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vv (
    a bigint NOT NULL
);


ALTER TABLE public.vv OWNER TO postgres;

SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1914 (class 0 OID 16584)
-- Dependencies: 1561
-- Data for Name: aplicacion; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

COPY aplicacion (idaplicacion, aplicacion) FROM stdin;
1	Security
7	Akademos
\.


--
-- TOC entry 1899 (class 0 OID 16400)
-- Dependencies: 1537
-- Data for Name: entidad; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

COPY entidad (identidad, idraiz, entidad, rgt, lft, level) FROM stdin;
23	2	DM Guantánamo	7	4	3
21	2	Joven Club de Computación y Electrónica	11	2	1
22	2	DP Guantánamo	10	3	2
24	2	PPC Guantánamo	9	8	3
25	2	Guantánamo I	6	5	4
15	13	DP Guantánamo	15	2	1
13	13	MINSAP	16	1	0
20	13	CEP "Luis Galván Soca"	5	4	3
19	13	P "Emilio Daudinot Bueno"	7	6	3
18	13	P "Mártires 4 de Agosto"	9	8	3
17	13	HGD "Dr. Agosthino Neto"	11	10	3
14	13	DM Guantánamo	14	3	2
16	13	HP "Pedro Agustin Pérez"	13	12	3
48	2	DP. CH	50	49	2
2	2	MIC	58	1	0
27	2	ALBET	14	13	2
45	2	Empresa de Telecomunicaciones de Cuba	57	52	1
28	2	CALISOFT	16	15	2
29	2	CEDAE	18	17	2
30	2	CEDIN	20	19	2
31	2	CEGEL	22	21	2
32	2	CEIGE	24	23	2
33	2	CENIA	26	25	2
34	2	CICE	28	27	2
35	2	CESIM	30	29	2
36	2	CISED	32	31	2
37	2	Comunidades	34	33	2
38	2	DPN	36	35	2
39	2	DSC	38	37	2
40	2	DT	40	39	2
41	2	FORTES	42	41	2
42	2	GEITEL	44	43	2
43	2	ISEC	46	45	2
44	2	TLM	48	47	2
26	2	Universidad de las Ciencias Informáticas	51	12	1
46	2	DP Gtmo	54	53	2
47	2	DP. Stgo	56	55	2
\.


--
-- TOC entry 1900 (class 0 OID 16406)
-- Dependencies: 1539
-- Data for Name: funcionalidad; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

COPY funcionalidad (idfuncionalidad, idmodulo, funcionalidad, url, menu, alto, ancho) FROM stdin;
1	5	Usuarios	admin/user	1	400	400
3	5	Roles	admin/role	0	543	45
9	3	Autenticación	admin/servers/auth	1	500	500
10	3	Bases de datos	admin/servers/db	1	500	500
12	5	Entidades	admin/entidad	1	100	100
13	5	Aplicaciones	admin/apps	1	100	100
14	5	Módulos	admin/module	1	100	100
15	5	Accesos	admin/access	1	100	100
\.


--
-- TOC entry 1901 (class 0 OID 16415)
-- Dependencies: 1541
-- Data for Name: modulo; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

COPY modulo (idmodulo, modulo, rgt, lft, level, idraiz, idaplicacion) FROM stdin;
5	Administración	4	1	0	5	1
3	Servers	3	2	1	5	1
10	Pregrado	2	1	0	10	7
13	Carrera	2	1	0	13	7
\.


--
-- TOC entry 1902 (class 0 OID 16421)
-- Dependencies: 1543
-- Data for Name: rol; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

COPY rol (idrol, rol) FROM stdin;
1	Administradores
2	Usuarios avanzados
\.


--
-- TOC entry 1903 (class 0 OID 16425)
-- Dependencies: 1544
-- Data for Name: roles_funcionalidades; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

COPY roles_funcionalidades (idrol, idfuncionalidad) FROM stdin;
1	1
1	3
1	12
1	13
1	14
1	15
\.


--
-- TOC entry 1904 (class 0 OID 16428)
-- Dependencies: 1545
-- Data for Name: roles_usuarios_entidades; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

COPY roles_usuarios_entidades (idusuario, idrol, identidad) FROM stdin;
6	1	2
8	1	2
9	1	2
10	1	2
11	1	2
12	1	2
14	1	2
15	1	2
\.


--
-- TOC entry 1905 (class 0 OID 16433)
-- Dependencies: 1547
-- Data for Name: traza; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

COPY traza (idusuario, fecha, hora, ip, idfuncionalidad) FROM stdin;
\.


--
-- TOC entry 1915 (class 0 OID 17092)
-- Dependencies: 1562
-- Data for Name: url; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

COPY url (idfuncionalidad, url) FROM stdin;
\.


--
-- TOC entry 1906 (class 0 OID 16436)
-- Dependencies: 1548
-- Data for Name: usuario; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

COPY usuario (idusuario, usuario, correo, passwd) FROM stdin;
8	dsdiaz	dsdiaz@uci.cu	a
9	alcy	alcy@infosol.gtm.sld.cu	a
10	atinael	atinaelhaiti@gmail.com	a
11	lmdiaz	lmdiaz@estudiantes.gtm.sld.cu	a
12	oadiaz10	oadiaz10@graduados.uci.cu	a
14	zcool	zcool2005@gmail.com	YQ==
15	zcool	zcool2005	c2FsaQ==
6	oadiaz	oadiaz@uci.cu	YQ==
\.


SET search_path = public, pg_catalog;

--
-- TOC entry 1907 (class 0 OID 16445)
-- Dependencies: 1550
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cargo (id_cargo, nombre_cargo) FROM stdin;
1	Director Municipal                                                                                                                                                                                                                                             
3	Instructor                                                                                                                                                                                                                                                     
4	Auxiliar General                                                                                                                                                                                                                                               
5	Especialista en Servicios Informaticos                                                                                                                                                                                                                         
2	Especialista Principal                                                                                                                                                                                                                                         
\.


--
-- TOC entry 1908 (class 0 OID 16449)
-- Dependencies: 1551
-- Data for Name: entrega_certificado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entrega_certificado (fecha_entrega, folio_inicial, folio_final, recibe, entrega, id_jovenclub) FROM stdin;
2010-07-24	0	12	1	1	1
2010-07-24	12	24	1	1	1
2010-07-24	24	25	1	1	1
\.


--
-- TOC entry 1909 (class 0 OID 16454)
-- Dependencies: 1553
-- Data for Name: jovenclub; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jovenclub (id_jovenclub, nombre_jc, id_municipio) FROM stdin;
1	Guantánamo IV                                     	1
\.


--
-- TOC entry 1910 (class 0 OID 16460)
-- Dependencies: 1555
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY municipio (id_municipio, nombre_munc, id_provincia) FROM stdin;
1	Gtmo.	14
\.


--
-- TOC entry 1911 (class 0 OID 16464)
-- Dependencies: 1556
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY provincia (id_provincia, provincia) FROM stdin;
14	Guantánamo
\.


--
-- TOC entry 1912 (class 0 OID 16469)
-- Dependencies: 1558
-- Data for Name: trabajador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trabajador (id_trabajador, nombres, apellidos, id_cargo, id_jovenclub) FROM stdin;
1	Juan Carlos                                                                                                                                                                                                                                                    	Begué Reyna                                       	1	1
\.


--
-- TOC entry 1913 (class 0 OID 16473)
-- Dependencies: 1559
-- Data for Name: vv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vv (a) FROM stdin;
\.


SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1881 (class 2606 OID 16588)
-- Dependencies: 1561 1561
-- Name: aplicacion_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aplicacion
    ADD CONSTRAINT aplicacion_pkey PRIMARY KEY (idaplicacion);


--
-- TOC entry 1851 (class 2606 OID 16477)
-- Dependencies: 1537 1537
-- Name: entidad_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT entidad_pkey PRIMARY KEY (identidad);


--
-- TOC entry 1853 (class 2606 OID 16479)
-- Dependencies: 1539 1539
-- Name: funcionalidades_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionalidad
    ADD CONSTRAINT funcionalidades_pkey PRIMARY KEY (idfuncionalidad);


--
-- TOC entry 1855 (class 2606 OID 16481)
-- Dependencies: 1541 1541
-- Name: modulos_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (idmodulo);


--
-- TOC entry 1859 (class 2606 OID 16483)
-- Dependencies: 1544 1544 1544
-- Name: roles_funcionalidades_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT roles_funcionalidades_pkey PRIMARY KEY (idrol, idfuncionalidad);


--
-- TOC entry 1857 (class 2606 OID 16485)
-- Dependencies: 1543 1543
-- Name: roles_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT roles_pkey PRIMARY KEY (idrol);


--
-- TOC entry 1863 (class 2606 OID 16487)
-- Dependencies: 1547 1547
-- Name: traza_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY traza
    ADD CONSTRAINT traza_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 1865 (class 2606 OID 16489)
-- Dependencies: 1548 1548
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 1861 (class 2606 OID 16491)
-- Dependencies: 1545 1545 1545 1545
-- Name: usuarios_roles_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (idusuario, idrol, identidad);


SET search_path = public, pg_catalog;

--
-- TOC entry 1868 (class 2606 OID 16493)
-- Dependencies: 1550 1550
-- Name: cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id_cargo);


--
-- TOC entry 1871 (class 2606 OID 16495)
-- Dependencies: 1553 1553
-- Name: jovenclub_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jovenclub
    ADD CONSTRAINT jovenclub_pkey PRIMARY KEY (id_jovenclub);


--
-- TOC entry 1874 (class 2606 OID 16497)
-- Dependencies: 1555 1555
-- Name: municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id_municipio);


--
-- TOC entry 1877 (class 2606 OID 16499)
-- Dependencies: 1556 1556
-- Name: provincia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id_provincia);


--
-- TOC entry 1879 (class 2606 OID 16501)
-- Dependencies: 1558 1558
-- Name: trabajador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id_trabajador);


--
-- TOC entry 1866 (class 1259 OID 16502)
-- Dependencies: 1550
-- Name: cargo_id_cargo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX cargo_id_cargo ON cargo USING btree (id_cargo);


--
-- TOC entry 1869 (class 1259 OID 16503)
-- Dependencies: 1553
-- Name: jovenclub_id_jovenclub; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX jovenclub_id_jovenclub ON jovenclub USING btree (id_jovenclub);


--
-- TOC entry 1872 (class 1259 OID 16504)
-- Dependencies: 1555
-- Name: municipio_id_municipio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX municipio_id_municipio ON municipio USING btree (id_municipio);


--
-- TOC entry 1875 (class 1259 OID 16505)
-- Dependencies: 1556
-- Name: provincia_id_provincia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX provincia_id_provincia ON provincia USING btree (id_provincia);


SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1882 (class 2606 OID 16506)
-- Dependencies: 1539 1854 1541
-- Name: fkfuncionali294302; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY funcionalidad
    ADD CONSTRAINT fkfuncionali294302 FOREIGN KEY (idmodulo) REFERENCES modulo(idmodulo);


--
-- TOC entry 1883 (class 2606 OID 16589)
-- Dependencies: 1541 1561 1880
-- Name: fkmodulo46731; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT fkmodulo46731 FOREIGN KEY (idaplicacion) REFERENCES aplicacion(idaplicacion);


--
-- TOC entry 1884 (class 2606 OID 16511)
-- Dependencies: 1544 1852 1539
-- Name: fkroles_func177086; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT fkroles_func177086 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidad(idfuncionalidad);


--
-- TOC entry 1885 (class 2606 OID 16516)
-- Dependencies: 1543 1544 1856
-- Name: fkroles_func72333; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT fkroles_func72333 FOREIGN KEY (idrol) REFERENCES rol(idrol);


--
-- TOC entry 1886 (class 2606 OID 16521)
-- Dependencies: 1537 1545 1850
-- Name: fkroles_usua940907; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkroles_usua940907 FOREIGN KEY (identidad) REFERENCES entidad(identidad);


--
-- TOC entry 1889 (class 2606 OID 16526)
-- Dependencies: 1539 1547 1852
-- Name: fktraza358336; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY traza
    ADD CONSTRAINT fktraza358336 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidad(idfuncionalidad);


--
-- TOC entry 1890 (class 2606 OID 16531)
-- Dependencies: 1547 1548 1864
-- Name: fktraza512940; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY traza
    ADD CONSTRAINT fktraza512940 FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 1898 (class 2606 OID 17095)
-- Dependencies: 1852 1562 1539
-- Name: fkurl864073; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY url
    ADD CONSTRAINT fkurl864073 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidad(idfuncionalidad);


--
-- TOC entry 1887 (class 2606 OID 16536)
-- Dependencies: 1543 1545 1856
-- Name: fkusuarios_r313725; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkusuarios_r313725 FOREIGN KEY (idrol) REFERENCES rol(idrol);


--
-- TOC entry 1888 (class 2606 OID 16541)
-- Dependencies: 1545 1548 1864
-- Name: fkusuarios_r984714; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkusuarios_r984714 FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


SET search_path = public, pg_catalog;

--
-- TOC entry 1891 (class 2606 OID 16546)
-- Dependencies: 1878 1551 1558
-- Name: fkentrega_ce336337; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrega_certificado
    ADD CONSTRAINT fkentrega_ce336337 FOREIGN KEY (entrega) REFERENCES trabajador(id_trabajador);


--
-- TOC entry 1892 (class 2606 OID 16551)
-- Dependencies: 1558 1551 1878
-- Name: fkentrega_ce673628; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrega_certificado
    ADD CONSTRAINT fkentrega_ce673628 FOREIGN KEY (recibe) REFERENCES trabajador(id_trabajador);


--
-- TOC entry 1893 (class 2606 OID 16556)
-- Dependencies: 1551 1553 1870
-- Name: fkentrega_ce725532; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrega_certificado
    ADD CONSTRAINT fkentrega_ce725532 FOREIGN KEY (id_jovenclub) REFERENCES jovenclub(id_jovenclub);


--
-- TOC entry 1894 (class 2606 OID 16561)
-- Dependencies: 1555 1553 1873
-- Name: fkjovenclub33989; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jovenclub
    ADD CONSTRAINT fkjovenclub33989 FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio);


--
-- TOC entry 1895 (class 2606 OID 16566)
-- Dependencies: 1555 1876 1556
-- Name: fkmunicipio465070; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT fkmunicipio465070 FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia);


--
-- TOC entry 1896 (class 2606 OID 16571)
-- Dependencies: 1870 1553 1558
-- Name: fktrabajador47728; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trabajador
    ADD CONSTRAINT fktrabajador47728 FOREIGN KEY (id_jovenclub) REFERENCES jovenclub(id_jovenclub);


--
-- TOC entry 1897 (class 2606 OID 16576)
-- Dependencies: 1550 1558 1867
-- Name: fktrabajador86788; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trabajador
    ADD CONSTRAINT fktrabajador86788 FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo);


--
-- TOC entry 1920 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2010-12-17 18:17:28

--
-- PostgreSQL database dump complete
--

