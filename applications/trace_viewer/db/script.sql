--
-- PostgreSQL database dump
--

-- Started on 2010-08-14 15:28:16

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 6 (class 2615 OID 16749)
-- Name: mod_admin; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA mod_admin;


ALTER SCHEMA mod_admin OWNER TO postgres;

--
-- TOC entry 344 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1531 (class 1259 OID 16750)
-- Dependencies: 6
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
-- TOC entry 1905 (class 0 OID 0)
-- Dependencies: 1531
-- Name: seq_entidad_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_entidad_seq', 25, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1532 (class 1259 OID 16752)
-- Dependencies: 1832 6
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
-- TOC entry 1533 (class 1259 OID 16756)
-- Dependencies: 6
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
-- TOC entry 1906 (class 0 OID 0)
-- Dependencies: 1533
-- Name: seq_funcionalidad_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_funcionalidad_seq', 2, true);


--
-- TOC entry 1534 (class 1259 OID 16758)
-- Dependencies: 1833 6
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
-- TOC entry 1535 (class 1259 OID 16765)
-- Dependencies: 6
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
-- TOC entry 1907 (class 0 OID 0)
-- Dependencies: 1535
-- Name: seq_modulo_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_modulo_seq', 9, true);


--
-- TOC entry 1536 (class 1259 OID 16767)
-- Dependencies: 1834 6
-- Name: modulo; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE modulo (
    idmodulo numeric(19,0) DEFAULT nextval('seq_modulo_seq'::regclass) NOT NULL,
    modulo character varying(255),
    rgt numeric(19,0),
    lft numeric(19,0),
    level numeric(19,0),
    idraiz numeric(19,0)
);


ALTER TABLE mod_admin.modulo OWNER TO postgres;

--
-- TOC entry 1537 (class 1259 OID 16771)
-- Dependencies: 6
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
-- TOC entry 1908 (class 0 OID 0)
-- Dependencies: 1537
-- Name: seq_rol_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_rol_seq', 3, true);


--
-- TOC entry 1538 (class 1259 OID 16773)
-- Dependencies: 1835 6
-- Name: rol; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE rol (
    idrol numeric(19,0) DEFAULT nextval('seq_rol_seq'::regclass) NOT NULL,
    rol character varying(255)
);


ALTER TABLE mod_admin.rol OWNER TO postgres;

--
-- TOC entry 1539 (class 1259 OID 16777)
-- Dependencies: 6
-- Name: roles_funcionalidades; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE roles_funcionalidades (
    idrol numeric(19,0) NOT NULL,
    idfuncionalidad numeric(19,0) NOT NULL
);


ALTER TABLE mod_admin.roles_funcionalidades OWNER TO postgres;

--
-- TOC entry 1540 (class 1259 OID 16780)
-- Dependencies: 6
-- Name: roles_usuarios_entidades; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE roles_usuarios_entidades (
    idusuario numeric(19,0) NOT NULL,
    idrol numeric(19,0) NOT NULL,
    identidad numeric(19,0) NOT NULL
);


ALTER TABLE mod_admin.roles_usuarios_entidades OWNER TO postgres;

--
-- TOC entry 1541 (class 1259 OID 16783)
-- Dependencies: 6
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
-- TOC entry 1909 (class 0 OID 0)
-- Dependencies: 1541
-- Name: seq_usuario_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_usuario_seq', 15, true);


--
-- TOC entry 1542 (class 1259 OID 16785)
-- Dependencies: 6
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
-- TOC entry 1543 (class 1259 OID 16788)
-- Dependencies: 1836 6
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
-- TOC entry 1544 (class 1259 OID 16795)
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
-- TOC entry 1910 (class 0 OID 0)
-- Dependencies: 1544
-- Name: seq_cargo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_cargo', 5, true);


--
-- TOC entry 1545 (class 1259 OID 16797)
-- Dependencies: 1837 7
-- Name: cargo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cargo (
    id_cargo numeric(19,0) DEFAULT nextval('seq_cargo'::regclass) NOT NULL,
    nombre_cargo character(255) NOT NULL
);


ALTER TABLE public.cargo OWNER TO postgres;

--
-- TOC entry 1546 (class 1259 OID 16801)
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
-- TOC entry 1547 (class 1259 OID 16804)
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
-- TOC entry 1911 (class 0 OID 0)
-- Dependencies: 1547
-- Name: seq_jovenclub; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_jovenclub', 1, true);


--
-- TOC entry 1548 (class 1259 OID 16806)
-- Dependencies: 1838 7
-- Name: jovenclub; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jovenclub (
    id_jovenclub numeric(19,0) DEFAULT nextval('seq_jovenclub'::regclass) NOT NULL,
    nombre_jc character(50),
    id_municipio numeric(19,0)
);


ALTER TABLE public.jovenclub OWNER TO postgres;

--
-- TOC entry 1549 (class 1259 OID 16810)
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
-- TOC entry 1912 (class 0 OID 0)
-- Dependencies: 1549
-- Name: seq_municipio; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_municipio', 1, true);


--
-- TOC entry 1550 (class 1259 OID 16812)
-- Dependencies: 1839 7
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE municipio (
    id_municipio numeric(19,0) DEFAULT nextval('seq_municipio'::regclass) NOT NULL,
    nombre_munc character varying(50),
    id_provincia numeric(19,0) NOT NULL
);


ALTER TABLE public.municipio OWNER TO postgres;

--
-- TOC entry 1551 (class 1259 OID 16816)
-- Dependencies: 7
-- Name: provincia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE provincia (
    id_provincia numeric(19,0) NOT NULL,
    provincia character varying(50)
);


ALTER TABLE public.provincia OWNER TO postgres;

--
-- TOC entry 1552 (class 1259 OID 16819)
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
-- TOC entry 1913 (class 0 OID 0)
-- Dependencies: 1552
-- Name: seq_trabajador; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_trabajador', 1, true);


--
-- TOC entry 1553 (class 1259 OID 16821)
-- Dependencies: 1840 7
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
-- TOC entry 1554 (class 1259 OID 24892)
-- Dependencies: 7
-- Name: vv; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vv (
    a bigint NOT NULL
);


ALTER TABLE public.vv OWNER TO postgres;

SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1886 (class 0 OID 16752)
-- Dependencies: 1532
-- Data for Name: entidad; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (23, 2, 'DM Guantánamo', 7, 4, 3);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (2, 2, 'MIC', 12, 1, 0);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (21, 2, 'Joven Club de Computación y Electrónica', 11, 2, 1);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (22, 2, 'DP Guantánamo', 10, 3, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (24, 2, 'PPC Guantánamo', 9, 8, 3);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (25, 2, 'Guantánamo I', 6, 5, 4);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (15, 13, 'DP Guantánamo', 15, 2, 1);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (13, 13, 'MINSAP', 16, 1, 0);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (20, 13, 'CEP "Luis Galván Soca"', 5, 4, 3);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (19, 13, 'P "Emilio Daudinot Bueno"', 7, 6, 3);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (18, 13, 'P "Mártires 4 de Agosto"', 9, 8, 3);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (17, 13, 'HGD "Dr. Agosthino Neto"', 11, 10, 3);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (14, 13, 'DM Guantánamo', 14, 3, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (16, 13, 'HP "Pedro Agustin Pérez"', 13, 12, 3);


--
-- TOC entry 1887 (class 0 OID 16758)
-- Dependencies: 1534
-- Data for Name: funcionalidad; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

INSERT INTO funcionalidad (idfuncionalidad, idmodulo, funcionalidad, url, menu, alto, ancho) VALUES (1, 5, 'Usuarios', 'admin/user', 1, 400, 400);


--
-- TOC entry 1888 (class 0 OID 16767)
-- Dependencies: 1536
-- Data for Name: modulo; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

INSERT INTO modulo (idmodulo, modulo, rgt, lft, level, idraiz) VALUES (4, 'BD', 4, 3, 2, 5);
INSERT INTO modulo (idmodulo, modulo, rgt, lft, level, idraiz) VALUES (5, 'Administración', 6, 1, 0, 5);
INSERT INTO modulo (idmodulo, modulo, rgt, lft, level, idraiz) VALUES (3, 'Servers', 5, 2, 1, 5);
INSERT INTO modulo (idmodulo, modulo, rgt, lft, level, idraiz) VALUES (7, 'Presupuesto', 2, 1, 0, 7);
INSERT INTO modulo (idmodulo, modulo, rgt, lft, level, idraiz) VALUES (8, 'Certificaciones', 2, 1, 0, 8);


--
-- TOC entry 1889 (class 0 OID 16773)
-- Dependencies: 1538
-- Data for Name: rol; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

INSERT INTO rol (idrol, rol) VALUES (1, 'Administradores');
INSERT INTO rol (idrol, rol) VALUES (2, 'Usuarios avanzados');


--
-- TOC entry 1890 (class 0 OID 16777)
-- Dependencies: 1539
-- Data for Name: roles_funcionalidades; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--



--
-- TOC entry 1891 (class 0 OID 16780)
-- Dependencies: 1540
-- Data for Name: roles_usuarios_entidades; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

INSERT INTO roles_usuarios_entidades (idusuario, idrol, identidad) VALUES (6, 1, 2);
INSERT INTO roles_usuarios_entidades (idusuario, idrol, identidad) VALUES (8, 1, 2);
INSERT INTO roles_usuarios_entidades (idusuario, idrol, identidad) VALUES (9, 1, 2);
INSERT INTO roles_usuarios_entidades (idusuario, idrol, identidad) VALUES (10, 1, 2);
INSERT INTO roles_usuarios_entidades (idusuario, idrol, identidad) VALUES (11, 1, 2);
INSERT INTO roles_usuarios_entidades (idusuario, idrol, identidad) VALUES (12, 1, 2);
INSERT INTO roles_usuarios_entidades (idusuario, idrol, identidad) VALUES (14, 1, 2);
INSERT INTO roles_usuarios_entidades (idusuario, idrol, identidad) VALUES (15, 1, 2);


--
-- TOC entry 1892 (class 0 OID 16785)
-- Dependencies: 1542
-- Data for Name: traza; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--



--
-- TOC entry 1893 (class 0 OID 16788)
-- Dependencies: 1543
-- Data for Name: usuario; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (6, 'oadiaz', 'oadiaz@uci.cu', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (8, 'dsdiaz', 'dsdiaz@uci.cu', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (9, 'alcy', 'alcy@infosol.gtm.sld.cu', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (10, 'atinael', 'atinaelhaiti@gmail.com', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (11, 'lmdiaz', 'lmdiaz@estudiantes.gtm.sld.cu', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (12, 'oadiaz10', 'oadiaz10@graduados.uci.cu', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (14, 'zcool', 'zcool2005@gmail.com', 'YQ==');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (15, 'zcool', 'zcool2005', 'c2FsaQ==');


SET search_path = public, pg_catalog;

--
-- TOC entry 1894 (class 0 OID 16797)
-- Dependencies: 1545
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cargo (id_cargo, nombre_cargo) VALUES (1, 'Director Municipal                                                                                                                                                                                                                                             ');
INSERT INTO cargo (id_cargo, nombre_cargo) VALUES (3, 'Instructor                                                                                                                                                                                                                                                     ');
INSERT INTO cargo (id_cargo, nombre_cargo) VALUES (4, 'Auxiliar General                                                                                                                                                                                                                                               ');
INSERT INTO cargo (id_cargo, nombre_cargo) VALUES (5, 'Especialista en Servicios Informaticos                                                                                                                                                                                                                         ');
INSERT INTO cargo (id_cargo, nombre_cargo) VALUES (2, 'Especialista Principal                                                                                                                                                                                                                                         ');


--
-- TOC entry 1895 (class 0 OID 16801)
-- Dependencies: 1546
-- Data for Name: entrega_certificado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO entrega_certificado (fecha_entrega, folio_inicial, folio_final, recibe, entrega, id_jovenclub) VALUES ('2010-07-24', 0, 12, 1, 1, 1);
INSERT INTO entrega_certificado (fecha_entrega, folio_inicial, folio_final, recibe, entrega, id_jovenclub) VALUES ('2010-07-24', 12, 24, 1, 1, 1);
INSERT INTO entrega_certificado (fecha_entrega, folio_inicial, folio_final, recibe, entrega, id_jovenclub) VALUES ('2010-07-24', 24, 25, 1, 1, 1);


--
-- TOC entry 1896 (class 0 OID 16806)
-- Dependencies: 1548
-- Data for Name: jovenclub; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO jovenclub (id_jovenclub, nombre_jc, id_municipio) VALUES (1, 'Guantánamo IV                                     ', 1);


--
-- TOC entry 1897 (class 0 OID 16812)
-- Dependencies: 1550
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO municipio (id_municipio, nombre_munc, id_provincia) VALUES (1, 'Gtmo.', 14);


--
-- TOC entry 1898 (class 0 OID 16816)
-- Dependencies: 1551
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO provincia (id_provincia, provincia) VALUES (14, 'Guantánamo');


--
-- TOC entry 1899 (class 0 OID 16821)
-- Dependencies: 1553
-- Data for Name: trabajador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO trabajador (id_trabajador, nombres, apellidos, id_cargo, id_jovenclub) VALUES (1, 'Juan Carlos                                                                                                                                                                                                                                                    ', 'Begué Reyna                                       ', 1, 1);


--
-- TOC entry 1900 (class 0 OID 24892)
-- Dependencies: 1554
-- Data for Name: vv; Type: TABLE DATA; Schema: public; Owner: postgres
--



SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1842 (class 2606 OID 16826)
-- Dependencies: 1532 1532
-- Name: entidad_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT entidad_pkey PRIMARY KEY (identidad);


--
-- TOC entry 1844 (class 2606 OID 16828)
-- Dependencies: 1534 1534
-- Name: funcionalidades_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionalidad
    ADD CONSTRAINT funcionalidades_pkey PRIMARY KEY (idfuncionalidad);


--
-- TOC entry 1846 (class 2606 OID 16830)
-- Dependencies: 1536 1536
-- Name: modulos_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (idmodulo);


--
-- TOC entry 1850 (class 2606 OID 16832)
-- Dependencies: 1539 1539 1539
-- Name: roles_funcionalidades_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT roles_funcionalidades_pkey PRIMARY KEY (idrol, idfuncionalidad);


--
-- TOC entry 1848 (class 2606 OID 16834)
-- Dependencies: 1538 1538
-- Name: roles_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT roles_pkey PRIMARY KEY (idrol);


--
-- TOC entry 1854 (class 2606 OID 16836)
-- Dependencies: 1542 1542
-- Name: traza_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY traza
    ADD CONSTRAINT traza_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 1856 (class 2606 OID 16838)
-- Dependencies: 1543 1543
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 1852 (class 2606 OID 16840)
-- Dependencies: 1540 1540 1540 1540
-- Name: usuarios_roles_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (idusuario, idrol, identidad);


SET search_path = public, pg_catalog;

--
-- TOC entry 1859 (class 2606 OID 16842)
-- Dependencies: 1545 1545
-- Name: cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id_cargo);


--
-- TOC entry 1862 (class 2606 OID 16844)
-- Dependencies: 1548 1548
-- Name: jovenclub_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jovenclub
    ADD CONSTRAINT jovenclub_pkey PRIMARY KEY (id_jovenclub);


--
-- TOC entry 1865 (class 2606 OID 16846)
-- Dependencies: 1550 1550
-- Name: municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id_municipio);


--
-- TOC entry 1868 (class 2606 OID 16848)
-- Dependencies: 1551 1551
-- Name: provincia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id_provincia);


--
-- TOC entry 1870 (class 2606 OID 16850)
-- Dependencies: 1553 1553
-- Name: trabajador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id_trabajador);


--
-- TOC entry 1857 (class 1259 OID 16851)
-- Dependencies: 1545
-- Name: cargo_id_cargo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX cargo_id_cargo ON cargo USING btree (id_cargo);


--
-- TOC entry 1860 (class 1259 OID 16852)
-- Dependencies: 1548
-- Name: jovenclub_id_jovenclub; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX jovenclub_id_jovenclub ON jovenclub USING btree (id_jovenclub);


--
-- TOC entry 1863 (class 1259 OID 16853)
-- Dependencies: 1550
-- Name: municipio_id_municipio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX municipio_id_municipio ON municipio USING btree (id_municipio);


--
-- TOC entry 1866 (class 1259 OID 16854)
-- Dependencies: 1551
-- Name: provincia_id_provincia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX provincia_id_provincia ON provincia USING btree (id_provincia);


SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1871 (class 2606 OID 16855)
-- Dependencies: 1536 1845 1534
-- Name: fkfuncionali294302; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY funcionalidad
    ADD CONSTRAINT fkfuncionali294302 FOREIGN KEY (idmodulo) REFERENCES modulo(idmodulo);


--
-- TOC entry 1872 (class 2606 OID 16860)
-- Dependencies: 1843 1539 1534
-- Name: fkroles_func177086; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT fkroles_func177086 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidad(idfuncionalidad);


--
-- TOC entry 1873 (class 2606 OID 16865)
-- Dependencies: 1538 1847 1539
-- Name: fkroles_func72333; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT fkroles_func72333 FOREIGN KEY (idrol) REFERENCES rol(idrol);


--
-- TOC entry 1874 (class 2606 OID 16870)
-- Dependencies: 1532 1841 1540
-- Name: fkroles_usua940907; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkroles_usua940907 FOREIGN KEY (identidad) REFERENCES entidad(identidad);


--
-- TOC entry 1877 (class 2606 OID 16875)
-- Dependencies: 1534 1843 1542
-- Name: fktraza358336; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY traza
    ADD CONSTRAINT fktraza358336 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidad(idfuncionalidad);


--
-- TOC entry 1878 (class 2606 OID 16880)
-- Dependencies: 1543 1855 1542
-- Name: fktraza512940; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY traza
    ADD CONSTRAINT fktraza512940 FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 1875 (class 2606 OID 16885)
-- Dependencies: 1538 1847 1540
-- Name: fkusuarios_r313725; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkusuarios_r313725 FOREIGN KEY (idrol) REFERENCES rol(idrol);


--
-- TOC entry 1876 (class 2606 OID 16890)
-- Dependencies: 1543 1855 1540
-- Name: fkusuarios_r984714; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkusuarios_r984714 FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


SET search_path = public, pg_catalog;

--
-- TOC entry 1879 (class 2606 OID 16895)
-- Dependencies: 1546 1553 1869
-- Name: fkentrega_ce336337; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrega_certificado
    ADD CONSTRAINT fkentrega_ce336337 FOREIGN KEY (entrega) REFERENCES trabajador(id_trabajador);


--
-- TOC entry 1880 (class 2606 OID 16900)
-- Dependencies: 1553 1546 1869
-- Name: fkentrega_ce673628; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrega_certificado
    ADD CONSTRAINT fkentrega_ce673628 FOREIGN KEY (recibe) REFERENCES trabajador(id_trabajador);


--
-- TOC entry 1881 (class 2606 OID 16905)
-- Dependencies: 1861 1546 1548
-- Name: fkentrega_ce725532; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrega_certificado
    ADD CONSTRAINT fkentrega_ce725532 FOREIGN KEY (id_jovenclub) REFERENCES jovenclub(id_jovenclub);


--
-- TOC entry 1882 (class 2606 OID 16910)
-- Dependencies: 1864 1548 1550
-- Name: fkjovenclub33989; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jovenclub
    ADD CONSTRAINT fkjovenclub33989 FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio);


--
-- TOC entry 1883 (class 2606 OID 16915)
-- Dependencies: 1550 1551 1867
-- Name: fkmunicipio465070; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT fkmunicipio465070 FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia);


--
-- TOC entry 1884 (class 2606 OID 16920)
-- Dependencies: 1861 1553 1548
-- Name: fktrabajador47728; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trabajador
    ADD CONSTRAINT fktrabajador47728 FOREIGN KEY (id_jovenclub) REFERENCES jovenclub(id_jovenclub);


--
-- TOC entry 1885 (class 2606 OID 16925)
-- Dependencies: 1545 1553 1858
-- Name: fktrabajador86788; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trabajador
    ADD CONSTRAINT fktrabajador86788 FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo);


--
-- TOC entry 1904 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2010-08-14 15:28:18

--
-- PostgreSQL database dump complete
--

