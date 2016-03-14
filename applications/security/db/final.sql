--
-- PostgreSQL database dump
--

-- Started on 2011-02-05 15:22:53

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 5 (class 2615 OID 16397)
-- Name: mod_admin; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA mod_admin;


SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1540 (class 1259 OID 16582)
-- Dependencies: 5
-- Name: seq_aplicacion_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_aplicacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1870 (class 0 OID 0)
-- Dependencies: 1540
-- Name: seq_aplicacion_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_aplicacion_seq', 7, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1541 (class 1259 OID 16584)
-- Dependencies: 1826 5
-- Name: aplicacion; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE aplicacion (
    idaplicacion numeric(19,0) DEFAULT nextval('seq_aplicacion_seq'::regclass) NOT NULL,
    aplicacion character varying(50)
);


--
-- TOC entry 1543 (class 1259 OID 25294)
-- Dependencies: 5
-- Name: seq_url_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_url_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1871 (class 0 OID 0)
-- Dependencies: 1543
-- Name: seq_url_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_url_seq', 10, true);


--
-- TOC entry 1542 (class 1259 OID 25284)
-- Dependencies: 1827 5
-- Name: direccion; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE direccion (
    idfuncionalidad numeric(19,0) NOT NULL,
    url character varying(255) NOT NULL,
    idurl numeric(19,0) DEFAULT nextval('seq_url_seq'::regclass) NOT NULL
);


--
-- TOC entry 1523 (class 1259 OID 16398)
-- Dependencies: 5
-- Name: seq_entidad_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_entidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1872 (class 0 OID 0)
-- Dependencies: 1523
-- Name: seq_entidad_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_entidad_seq', 48, true);


--
-- TOC entry 1524 (class 1259 OID 16400)
-- Dependencies: 1821 5
-- Name: entidad; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE entidad (
    identidad numeric(19,0) DEFAULT nextval('seq_entidad_seq'::regclass) NOT NULL,
    idraiz numeric(19,0),
    entidad character varying(255),
    rgt numeric(19,0),
    lft numeric(19,0),
    level numeric(19,0)
);


--
-- TOC entry 1525 (class 1259 OID 16404)
-- Dependencies: 5
-- Name: seq_funcionalidad_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_funcionalidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1873 (class 0 OID 0)
-- Dependencies: 1525
-- Name: seq_funcionalidad_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_funcionalidad_seq', 16, true);


--
-- TOC entry 1526 (class 1259 OID 16406)
-- Dependencies: 1822 5
-- Name: funcionalidad; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE funcionalidad (
    idfuncionalidad numeric(19,0) DEFAULT nextval('seq_funcionalidad_seq'::regclass) NOT NULL,
    idmodulo numeric(19,0) NOT NULL,
    funcionalidad character varying(255),
    menu numeric(1,0),
    alto integer,
    ancho integer
);


--
-- TOC entry 1527 (class 1259 OID 16413)
-- Dependencies: 5
-- Name: seq_modulo_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_modulo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1874 (class 0 OID 0)
-- Dependencies: 1527
-- Name: seq_modulo_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_modulo_seq', 13, true);


--
-- TOC entry 1528 (class 1259 OID 16415)
-- Dependencies: 1823 5
-- Name: modulo; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
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


--
-- TOC entry 1529 (class 1259 OID 16419)
-- Dependencies: 5
-- Name: seq_rol_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1875 (class 0 OID 0)
-- Dependencies: 1529
-- Name: seq_rol_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_rol_seq', 3, true);


--
-- TOC entry 1530 (class 1259 OID 16421)
-- Dependencies: 1824 5
-- Name: rol; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE rol (
    idrol numeric(19,0) DEFAULT nextval('seq_rol_seq'::regclass) NOT NULL,
    rol character varying(255)
);


--
-- TOC entry 1531 (class 1259 OID 16425)
-- Dependencies: 5
-- Name: roles_funcionalidades; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE roles_funcionalidades (
    idrol numeric(19,0) NOT NULL,
    idfuncionalidad numeric(19,0) NOT NULL
);


--
-- TOC entry 1532 (class 1259 OID 16428)
-- Dependencies: 5
-- Name: roles_usuarios_entidades; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE roles_usuarios_entidades (
    idusuario numeric(19,0) NOT NULL,
    idrol numeric(19,0) NOT NULL,
    identidad numeric(19,0) NOT NULL
);


--
-- TOC entry 1533 (class 1259 OID 16431)
-- Dependencies: 5
-- Name: seq_usuario_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1876 (class 0 OID 0)
-- Dependencies: 1533
-- Name: seq_usuario_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_usuario_seq', 15, true);


--
-- TOC entry 1534 (class 1259 OID 16433)
-- Dependencies: 5
-- Name: traza; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE traza (
    idusuario numeric(19,0) NOT NULL,
    fecha date,
    hora time(6) without time zone,
    ip character varying(20),
    idfuncionalidad numeric(19,0) NOT NULL
);


--
-- TOC entry 1535 (class 1259 OID 16436)
-- Dependencies: 1825 5
-- Name: usuario; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE usuario (
    idusuario numeric(19,0) DEFAULT nextval('seq_usuario_seq'::regclass) NOT NULL,
    usuario character varying(255),
    correo character varying(255),
    passwd character varying(255)
);


SET search_path = public, pg_catalog;

--
-- TOC entry 1536 (class 1259 OID 16443)
-- Dependencies: 7
-- Name: seq_cargo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cargo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1877 (class 0 OID 0)
-- Dependencies: 1536
-- Name: seq_cargo; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seq_cargo', 5, true);


--
-- TOC entry 1537 (class 1259 OID 16452)
-- Dependencies: 7
-- Name: seq_jovenclub; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_jovenclub
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1878 (class 0 OID 0)
-- Dependencies: 1537
-- Name: seq_jovenclub; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seq_jovenclub', 1, true);


--
-- TOC entry 1538 (class 1259 OID 16458)
-- Dependencies: 7
-- Name: seq_municipio; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_municipio
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1879 (class 0 OID 0)
-- Dependencies: 1538
-- Name: seq_municipio; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seq_municipio', 1, true);


--
-- TOC entry 1539 (class 1259 OID 16467)
-- Dependencies: 7
-- Name: seq_trabajador; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_trabajador
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1880 (class 0 OID 0)
-- Dependencies: 1539
-- Name: seq_trabajador; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seq_trabajador', 1, true);


SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1863 (class 0 OID 16584)
-- Dependencies: 1541
-- Data for Name: aplicacion; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO aplicacion (idaplicacion, aplicacion) VALUES (1, 'Security');
INSERT INTO aplicacion (idaplicacion, aplicacion) VALUES (7, 'Akademos');


--
-- TOC entry 1864 (class 0 OID 25284)
-- Dependencies: 1542
-- Data for Name: direccion; Type: TABLE DATA; Schema: mod_admin; Owner: -
--



--
-- TOC entry 1855 (class 0 OID 16400)
-- Dependencies: 1524
-- Data for Name: entidad; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (23, 2, 'DM Guantánamo', 7, 4, 3);
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
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (48, 2, 'DP. CH', 50, 49, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (2, 2, 'MIC', 58, 1, 0);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (27, 2, 'ALBET', 14, 13, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (45, 2, 'Empresa de Telecomunicaciones de Cuba', 57, 52, 1);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (28, 2, 'CALISOFT', 16, 15, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (29, 2, 'CEDAE', 18, 17, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (30, 2, 'CEDIN', 20, 19, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (31, 2, 'CEGEL', 22, 21, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (32, 2, 'CEIGE', 24, 23, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (33, 2, 'CENIA', 26, 25, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (34, 2, 'CICE', 28, 27, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (35, 2, 'CESIM', 30, 29, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (36, 2, 'CISED', 32, 31, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (37, 2, 'Comunidades', 34, 33, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (38, 2, 'DPN', 36, 35, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (39, 2, 'DSC', 38, 37, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (40, 2, 'DT', 40, 39, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (41, 2, 'FORTES', 42, 41, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (42, 2, 'GEITEL', 44, 43, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (43, 2, 'ISEC', 46, 45, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (44, 2, 'TLM', 48, 47, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (26, 2, 'Universidad de las Ciencias Informáticas', 51, 12, 1);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (46, 2, 'DP Gtmo', 54, 53, 2);
INSERT INTO entidad (identidad, idraiz, entidad, rgt, lft, level) VALUES (47, 2, 'DP. Stgo', 56, 55, 2);


--
-- TOC entry 1856 (class 0 OID 16406)
-- Dependencies: 1526
-- Data for Name: funcionalidad; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO funcionalidad (idfuncionalidad, idmodulo, funcionalidad, menu, alto, ancho) VALUES (1, 5, 'Usuarios', 1, 400, 400);
INSERT INTO funcionalidad (idfuncionalidad, idmodulo, funcionalidad, menu, alto, ancho) VALUES (14, 5, 'Módulos', 1, 100, 100);
INSERT INTO funcionalidad (idfuncionalidad, idmodulo, funcionalidad, menu, alto, ancho) VALUES (15, 5, 'Accesos', 1, 100, 100);
INSERT INTO funcionalidad (idfuncionalidad, idmodulo, funcionalidad, menu, alto, ancho) VALUES (12, 5, 'Entidades', 1, 20, 100);
INSERT INTO funcionalidad (idfuncionalidad, idmodulo, funcionalidad, menu, alto, ancho) VALUES (3, 5, 'Roles', 0, 400, 500);


--
-- TOC entry 1857 (class 0 OID 16415)
-- Dependencies: 1528
-- Data for Name: modulo; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO modulo (idmodulo, modulo, rgt, lft, level, idraiz, idaplicacion) VALUES (10, 'Pregrado', 2, 1, 0, 10, 7);
INSERT INTO modulo (idmodulo, modulo, rgt, lft, level, idraiz, idaplicacion) VALUES (13, 'Carrera', 2, 1, 0, 13, 7);
INSERT INTO modulo (idmodulo, modulo, rgt, lft, level, idraiz, idaplicacion) VALUES (5, 'Administración', 2, 1, 0, 5, 1);


--
-- TOC entry 1858 (class 0 OID 16421)
-- Dependencies: 1530
-- Data for Name: rol; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO rol (idrol, rol) VALUES (1, 'Administradores');
INSERT INTO rol (idrol, rol) VALUES (2, 'Usuarios avanzados');


--
-- TOC entry 1859 (class 0 OID 16425)
-- Dependencies: 1531
-- Data for Name: roles_funcionalidades; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO roles_funcionalidades (idrol, idfuncionalidad) VALUES (1, 1);
INSERT INTO roles_funcionalidades (idrol, idfuncionalidad) VALUES (1, 3);
INSERT INTO roles_funcionalidades (idrol, idfuncionalidad) VALUES (1, 12);
INSERT INTO roles_funcionalidades (idrol, idfuncionalidad) VALUES (1, 13);
INSERT INTO roles_funcionalidades (idrol, idfuncionalidad) VALUES (1, 14);
INSERT INTO roles_funcionalidades (idrol, idfuncionalidad) VALUES (1, 15);


--
-- TOC entry 1860 (class 0 OID 16428)
-- Dependencies: 1532
-- Data for Name: roles_usuarios_entidades; Type: TABLE DATA; Schema: mod_admin; Owner: -
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
-- TOC entry 1861 (class 0 OID 16433)
-- Dependencies: 1534
-- Data for Name: traza; Type: TABLE DATA; Schema: mod_admin; Owner: -
--



--
-- TOC entry 1862 (class 0 OID 16436)
-- Dependencies: 1535
-- Data for Name: usuario; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (8, 'dsdiaz', 'dsdiaz@uci.cu', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (9, 'alcy', 'alcy@infosol.gtm.sld.cu', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (10, 'atinael', 'atinaelhaiti@gmail.com', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (11, 'lmdiaz', 'lmdiaz@estudiantes.gtm.sld.cu', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (12, 'oadiaz10', 'oadiaz10@graduados.uci.cu', 'a');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (14, 'zcool', 'zcool2005@gmail.com', 'YQ==');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (15, 'zcool', 'zcool2005', 'c2FsaQ==');
INSERT INTO usuario (idusuario, usuario, correo, passwd) VALUES (6, 'oadiaz', 'oadiaz@uci.cu', 'YQ==');


--
-- TOC entry 1845 (class 2606 OID 16588)
-- Dependencies: 1541 1541
-- Name: aplicacion_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY aplicacion
    ADD CONSTRAINT aplicacion_pkey PRIMARY KEY (idaplicacion);


--
-- TOC entry 1829 (class 2606 OID 16477)
-- Dependencies: 1524 1524
-- Name: entidad_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT entidad_pkey PRIMARY KEY (identidad);


--
-- TOC entry 1831 (class 2606 OID 16479)
-- Dependencies: 1526 1526
-- Name: funcionalidades_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY funcionalidad
    ADD CONSTRAINT funcionalidades_pkey PRIMARY KEY (idfuncionalidad);


--
-- TOC entry 1833 (class 2606 OID 16481)
-- Dependencies: 1528 1528
-- Name: modulos_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (idmodulo);


--
-- TOC entry 1837 (class 2606 OID 16483)
-- Dependencies: 1531 1531 1531
-- Name: roles_funcionalidades_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT roles_funcionalidades_pkey PRIMARY KEY (idrol, idfuncionalidad);


--
-- TOC entry 1835 (class 2606 OID 16485)
-- Dependencies: 1530 1530
-- Name: roles_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT roles_pkey PRIMARY KEY (idrol);


--
-- TOC entry 1847 (class 2606 OID 25298)
-- Dependencies: 1542 1542
-- Name: sdfdfdfdfdfdsf; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY direccion
    ADD CONSTRAINT sdfdfdfdfdfdsf PRIMARY KEY (idurl);


--
-- TOC entry 1841 (class 2606 OID 16487)
-- Dependencies: 1534 1534
-- Name: traza_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY traza
    ADD CONSTRAINT traza_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 1843 (class 2606 OID 16489)
-- Dependencies: 1535 1535
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 1839 (class 2606 OID 16491)
-- Dependencies: 1532 1532 1532 1532
-- Name: usuarios_roles_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (idusuario, idrol, identidad);


--
-- TOC entry 1854 (class 2606 OID 25299)
-- Dependencies: 1542 1830 1526
-- Name: fkdireccion78412; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY direccion
    ADD CONSTRAINT fkdireccion78412 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidad(idfuncionalidad) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1848 (class 2606 OID 25304)
-- Dependencies: 1832 1526 1528
-- Name: fkfuncionali294302; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY funcionalidad
    ADD CONSTRAINT fkfuncionali294302 FOREIGN KEY (idmodulo) REFERENCES modulo(idmodulo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1849 (class 2606 OID 25309)
-- Dependencies: 1541 1528 1844
-- Name: fkmodulo46731; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT fkmodulo46731 FOREIGN KEY (idaplicacion) REFERENCES aplicacion(idaplicacion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1852 (class 2606 OID 25364)
-- Dependencies: 1526 1830 1534
-- Name: fktraza358336; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY traza
    ADD CONSTRAINT fktraza358336 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidad(idfuncionalidad) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1853 (class 2606 OID 25369)
-- Dependencies: 1534 1842 1535
-- Name: fktraza512940; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY traza
    ADD CONSTRAINT fktraza512940 FOREIGN KEY (idusuario) REFERENCES usuario(idusuario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1850 (class 2606 OID 25354)
-- Dependencies: 1532 1530 1834
-- Name: fkusuarios_r313725; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkusuarios_r313725 FOREIGN KEY (idrol) REFERENCES rol(idrol) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1851 (class 2606 OID 25359)
-- Dependencies: 1532 1842 1535
-- Name: fkusuarios_r984714; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkusuarios_r984714 FOREIGN KEY (idusuario) REFERENCES usuario(idusuario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1869 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2011-02-05 15:22:54

--
-- PostgreSQL database dump complete
--

