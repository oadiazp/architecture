--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.1
-- Dumped by pg_dump version 9.0.1
-- Started on 2011-04-19 21:41:21

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 6 (class 2615 OID 16546)
-- Name: mod_admin; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA mod_admin;


SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1528 (class 1259 OID 16547)
-- Dependencies: 6
-- Name: seq_aplicacion_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_aplicacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1869 (class 0 OID 0)
-- Dependencies: 1528
-- Name: seq_aplicacion_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_aplicacion_seq', 7, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1529 (class 1259 OID 16549)
-- Dependencies: 1825 6
-- Name: aplicacion; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE aplicacion (
    idaplicacion numeric(19,0) DEFAULT nextval('seq_aplicacion_seq'::regclass) NOT NULL,
    aplicacion character varying(50)
);


--
-- TOC entry 1530 (class 1259 OID 16553)
-- Dependencies: 6
-- Name: seq_url_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_url_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1870 (class 0 OID 0)
-- Dependencies: 1530
-- Name: seq_url_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_url_seq', 10, true);


--
-- TOC entry 1531 (class 1259 OID 16555)
-- Dependencies: 1826 6
-- Name: direccion; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE direccion (
    idfuncionalidad numeric(19,0) NOT NULL,
    url character varying(255),
    idurl numeric(19,0) DEFAULT nextval('seq_url_seq'::regclass) NOT NULL,
    principal numeric(1,0)
);


--
-- TOC entry 1532 (class 1259 OID 16559)
-- Dependencies: 6
-- Name: seq_entidad_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_entidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1871 (class 0 OID 0)
-- Dependencies: 1532
-- Name: seq_entidad_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_entidad_seq', 48, true);


--
-- TOC entry 1533 (class 1259 OID 16561)
-- Dependencies: 1827 6
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
-- TOC entry 1534 (class 1259 OID 16565)
-- Dependencies: 6
-- Name: seq_funcionalidad_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_funcionalidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1872 (class 0 OID 0)
-- Dependencies: 1534
-- Name: seq_funcionalidad_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_funcionalidad_seq', 16, true);


--
-- TOC entry 1535 (class 1259 OID 16567)
-- Dependencies: 1828 6
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
-- TOC entry 1536 (class 1259 OID 16571)
-- Dependencies: 6
-- Name: seq_modulo_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_modulo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1873 (class 0 OID 0)
-- Dependencies: 1536
-- Name: seq_modulo_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_modulo_seq', 13, true);


--
-- TOC entry 1537 (class 1259 OID 16573)
-- Dependencies: 1829 6
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
-- TOC entry 1538 (class 1259 OID 16577)
-- Dependencies: 6
-- Name: seq_rol_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1874 (class 0 OID 0)
-- Dependencies: 1538
-- Name: seq_rol_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_rol_seq', 3, true);


--
-- TOC entry 1539 (class 1259 OID 16579)
-- Dependencies: 1830 6
-- Name: rol; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE rol (
    idrol numeric(19,0) DEFAULT nextval('seq_rol_seq'::regclass) NOT NULL,
    rol character varying(255)
);


--
-- TOC entry 1540 (class 1259 OID 16583)
-- Dependencies: 6
-- Name: roles_funcionalidades; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE roles_funcionalidades (
    idrol numeric(19,0) NOT NULL,
    idfuncionalidad numeric(19,0) NOT NULL
);


--
-- TOC entry 1541 (class 1259 OID 16586)
-- Dependencies: 6
-- Name: roles_usuarios_entidades; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE roles_usuarios_entidades (
    idusuario numeric(19,0) NOT NULL,
    idrol numeric(19,0) NOT NULL,
    identidad numeric(19,0) NOT NULL
);


--
-- TOC entry 1542 (class 1259 OID 16589)
-- Dependencies: 6
-- Name: seq_usuario_seq; Type: SEQUENCE; Schema: mod_admin; Owner: -
--

CREATE SEQUENCE seq_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1875 (class 0 OID 0)
-- Dependencies: 1542
-- Name: seq_usuario_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: -
--

SELECT pg_catalog.setval('seq_usuario_seq', 15, true);


--
-- TOC entry 1543 (class 1259 OID 16594)
-- Dependencies: 1831 6
-- Name: usuario; Type: TABLE; Schema: mod_admin; Owner: -; Tablespace: 
--

CREATE TABLE usuario (
    idusuario numeric(19,0) DEFAULT nextval('seq_usuario_seq'::regclass) NOT NULL,
    usuario character varying(255),
    correo character varying(255),
    passwd character varying(255)
);


--
-- TOC entry 1858 (class 0 OID 16549)
-- Dependencies: 1529
-- Data for Name: aplicacion; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO aplicacion VALUES (1, 'Security');
INSERT INTO aplicacion VALUES (7, 'Akademos');


--
-- TOC entry 1859 (class 0 OID 16555)
-- Dependencies: 1531
-- Data for Name: direccion; Type: TABLE DATA; Schema: mod_admin; Owner: -
--



--
-- TOC entry 1860 (class 0 OID 16561)
-- Dependencies: 1533
-- Data for Name: entidad; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO entidad VALUES (23, 2, 'DM Guantánamo', 7, 4, 3);
INSERT INTO entidad VALUES (21, 2, 'Joven Club de Computación y Electrónica', 11, 2, 1);
INSERT INTO entidad VALUES (22, 2, 'DP Guantánamo', 10, 3, 2);
INSERT INTO entidad VALUES (24, 2, 'PPC Guantánamo', 9, 8, 3);
INSERT INTO entidad VALUES (25, 2, 'Guantánamo I', 6, 5, 4);
INSERT INTO entidad VALUES (15, 13, 'DP Guantánamo', 15, 2, 1);
INSERT INTO entidad VALUES (13, 13, 'MINSAP', 16, 1, 0);
INSERT INTO entidad VALUES (20, 13, 'CEP "Luis Galván Soca"', 5, 4, 3);
INSERT INTO entidad VALUES (19, 13, 'P "Emilio Daudinot Bueno"', 7, 6, 3);
INSERT INTO entidad VALUES (18, 13, 'P "Mártires 4 de Agosto"', 9, 8, 3);
INSERT INTO entidad VALUES (17, 13, 'HGD "Dr. Agosthino Neto"', 11, 10, 3);
INSERT INTO entidad VALUES (14, 13, 'DM Guantánamo', 14, 3, 2);
INSERT INTO entidad VALUES (16, 13, 'HP "Pedro Agustin Pérez"', 13, 12, 3);
INSERT INTO entidad VALUES (48, 2, 'DP. CH', 50, 49, 2);
INSERT INTO entidad VALUES (2, 2, 'MIC', 58, 1, 0);
INSERT INTO entidad VALUES (27, 2, 'ALBET', 14, 13, 2);
INSERT INTO entidad VALUES (45, 2, 'Empresa de Telecomunicaciones de Cuba', 57, 52, 1);
INSERT INTO entidad VALUES (28, 2, 'CALISOFT', 16, 15, 2);
INSERT INTO entidad VALUES (29, 2, 'CEDAE', 18, 17, 2);
INSERT INTO entidad VALUES (30, 2, 'CEDIN', 20, 19, 2);
INSERT INTO entidad VALUES (31, 2, 'CEGEL', 22, 21, 2);
INSERT INTO entidad VALUES (32, 2, 'CEIGE', 24, 23, 2);
INSERT INTO entidad VALUES (33, 2, 'CENIA', 26, 25, 2);
INSERT INTO entidad VALUES (34, 2, 'CICE', 28, 27, 2);
INSERT INTO entidad VALUES (35, 2, 'CESIM', 30, 29, 2);
INSERT INTO entidad VALUES (36, 2, 'CISED', 32, 31, 2);
INSERT INTO entidad VALUES (37, 2, 'Comunidades', 34, 33, 2);
INSERT INTO entidad VALUES (38, 2, 'DPN', 36, 35, 2);
INSERT INTO entidad VALUES (39, 2, 'DSC', 38, 37, 2);
INSERT INTO entidad VALUES (40, 2, 'DT', 40, 39, 2);
INSERT INTO entidad VALUES (41, 2, 'FORTES', 42, 41, 2);
INSERT INTO entidad VALUES (42, 2, 'GEITEL', 44, 43, 2);
INSERT INTO entidad VALUES (43, 2, 'ISEC', 46, 45, 2);
INSERT INTO entidad VALUES (44, 2, 'TLM', 48, 47, 2);
INSERT INTO entidad VALUES (26, 2, 'Universidad de las Ciencias Informáticas', 51, 12, 1);
INSERT INTO entidad VALUES (46, 2, 'DP Gtmo', 54, 53, 2);
INSERT INTO entidad VALUES (47, 2, 'DP. Stgo', 56, 55, 2);


--
-- TOC entry 1861 (class 0 OID 16567)
-- Dependencies: 1535
-- Data for Name: funcionalidad; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO funcionalidad VALUES (1, 5, 'Usuarios', 1, 400, 400);
INSERT INTO funcionalidad VALUES (14, 5, 'Módulos', 1, 100, 100);
INSERT INTO funcionalidad VALUES (15, 5, 'Accesos', 1, 100, 100);
INSERT INTO funcionalidad VALUES (12, 5, 'Entidades', 1, 20, 100);
INSERT INTO funcionalidad VALUES (3, 5, 'Roles', 0, 400, 500);


--
-- TOC entry 1862 (class 0 OID 16573)
-- Dependencies: 1537
-- Data for Name: modulo; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO modulo VALUES (10, 'Pregrado', 2, 1, 0, 10, 7);
INSERT INTO modulo VALUES (13, 'Carrera', 2, 1, 0, 13, 7);
INSERT INTO modulo VALUES (5, 'Administración', 2, 1, 0, 5, 1);


--
-- TOC entry 1863 (class 0 OID 16579)
-- Dependencies: 1539
-- Data for Name: rol; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO rol VALUES (1, 'Administradores');
INSERT INTO rol VALUES (2, 'Usuarios avanzados');


--
-- TOC entry 1864 (class 0 OID 16583)
-- Dependencies: 1540
-- Data for Name: roles_funcionalidades; Type: TABLE DATA; Schema: mod_admin; Owner: -
--



--
-- TOC entry 1865 (class 0 OID 16586)
-- Dependencies: 1541
-- Data for Name: roles_usuarios_entidades; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO roles_usuarios_entidades VALUES (6, 1, 2);
INSERT INTO roles_usuarios_entidades VALUES (8, 1, 2);
INSERT INTO roles_usuarios_entidades VALUES (9, 1, 2);
INSERT INTO roles_usuarios_entidades VALUES (10, 1, 2);
INSERT INTO roles_usuarios_entidades VALUES (11, 1, 2);
INSERT INTO roles_usuarios_entidades VALUES (12, 1, 2);
INSERT INTO roles_usuarios_entidades VALUES (14, 1, 2);
INSERT INTO roles_usuarios_entidades VALUES (15, 1, 2);


--
-- TOC entry 1866 (class 0 OID 16594)
-- Dependencies: 1543
-- Data for Name: usuario; Type: TABLE DATA; Schema: mod_admin; Owner: -
--

INSERT INTO usuario VALUES (8, 'dsdiaz', 'dsdiaz@uci.cu', 'a');
INSERT INTO usuario VALUES (9, 'alcy', 'alcy@infosol.gtm.sld.cu', 'a');
INSERT INTO usuario VALUES (10, 'atinael', 'atinaelhaiti@gmail.com', 'a');
INSERT INTO usuario VALUES (11, 'lmdiaz', 'lmdiaz@estudiantes.gtm.sld.cu', 'a');
INSERT INTO usuario VALUES (12, 'oadiaz10', 'oadiaz10@graduados.uci.cu', 'a');
INSERT INTO usuario VALUES (14, 'zcool', 'zcool2005@gmail.com', 'YQ==');
INSERT INTO usuario VALUES (15, 'zcool', 'zcool2005', 'c2FsaQ==');
INSERT INTO usuario VALUES (6, 'oadiaz', 'oadiaz@uci.cu', 'YQ==');


--
-- TOC entry 1833 (class 2606 OID 16610)
-- Dependencies: 1529 1529
-- Name: aplicacion_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY aplicacion
    ADD CONSTRAINT aplicacion_pkey PRIMARY KEY (idaplicacion);


--
-- TOC entry 1837 (class 2606 OID 16612)
-- Dependencies: 1533 1533
-- Name: entidad_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT entidad_pkey PRIMARY KEY (identidad);


--
-- TOC entry 1839 (class 2606 OID 16614)
-- Dependencies: 1535 1535
-- Name: funcionalidades_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY funcionalidad
    ADD CONSTRAINT funcionalidades_pkey PRIMARY KEY (idfuncionalidad);


--
-- TOC entry 1841 (class 2606 OID 16616)
-- Dependencies: 1537 1537
-- Name: modulos_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (idmodulo);


--
-- TOC entry 1845 (class 2606 OID 16618)
-- Dependencies: 1540 1540 1540
-- Name: roles_funcionalidades_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT roles_funcionalidades_pkey PRIMARY KEY (idrol, idfuncionalidad);


--
-- TOC entry 1843 (class 2606 OID 16620)
-- Dependencies: 1539 1539
-- Name: roles_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT roles_pkey PRIMARY KEY (idrol);


--
-- TOC entry 1835 (class 2606 OID 16622)
-- Dependencies: 1531 1531
-- Name: sdfdfdfdfdfdsf; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY direccion
    ADD CONSTRAINT sdfdfdfdfdfdsf PRIMARY KEY (idurl);


--
-- TOC entry 1849 (class 2606 OID 16626)
-- Dependencies: 1543 1543
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 1847 (class 2606 OID 16628)
-- Dependencies: 1541 1541 1541 1541
-- Name: usuarios_roles_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (idusuario, idrol, identidad);


--
-- TOC entry 1850 (class 2606 OID 16629)
-- Dependencies: 1535 1531 1838
-- Name: fkdireccion78412; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY direccion
    ADD CONSTRAINT fkdireccion78412 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidad(idfuncionalidad) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1851 (class 2606 OID 16634)
-- Dependencies: 1537 1535 1840
-- Name: fkfuncionali294302; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY funcionalidad
    ADD CONSTRAINT fkfuncionali294302 FOREIGN KEY (idmodulo) REFERENCES modulo(idmodulo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1852 (class 2606 OID 16639)
-- Dependencies: 1832 1529 1537
-- Name: fkmodulo46731; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT fkmodulo46731 FOREIGN KEY (idaplicacion) REFERENCES aplicacion(idaplicacion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1854 (class 2606 OID 16680)
-- Dependencies: 1535 1540 1838
-- Name: fkroles_func177086; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT fkroles_func177086 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidad(idfuncionalidad);


--
-- TOC entry 1853 (class 2606 OID 16675)
-- Dependencies: 1539 1540 1842
-- Name: fkroles_func72333; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT fkroles_func72333 FOREIGN KEY (idrol) REFERENCES rol(idrol);


--
-- TOC entry 1857 (class 2606 OID 16665)
-- Dependencies: 1836 1541 1533
-- Name: fkroles_usua940907; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkroles_usua940907 FOREIGN KEY (identidad) REFERENCES entidad(identidad);


--
-- TOC entry 1855 (class 2606 OID 16654)
-- Dependencies: 1539 1541 1842
-- Name: fkusuarios_r313725; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkusuarios_r313725 FOREIGN KEY (idrol) REFERENCES rol(idrol) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1856 (class 2606 OID 16659)
-- Dependencies: 1848 1541 1543
-- Name: fkusuarios_r984714; Type: FK CONSTRAINT; Schema: mod_admin; Owner: -
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkusuarios_r984714 FOREIGN KEY (idusuario) REFERENCES usuario(idusuario) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2011-04-19 21:41:22

--
-- PostgreSQL database dump complete
--

