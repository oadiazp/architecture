--
-- PostgreSQL database dump
--

-- Started on 2010-08-14 15:28:39

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 7 (class 2615 OID 16399)
-- Name: mod_admin; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA mod_admin;


ALTER SCHEMA mod_admin OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 16400)
-- Name: mod_certificaciones; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA mod_certificaciones;


ALTER SCHEMA mod_certificaciones OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 16401)
-- Name: mod_nomencladores; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA mod_nomencladores;


ALTER SCHEMA mod_nomencladores OWNER TO postgres;

--
-- TOC entry 369 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1556 (class 1259 OID 16402)
-- Dependencies: 7
-- Name: seq_funcionalidades_seq; Type: SEQUENCE; Schema: mod_admin; Owner: postgres
--

CREATE SEQUENCE seq_funcionalidades_seq
    START WITH 10
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 10
    CACHE 1;


ALTER TABLE mod_admin.seq_funcionalidades_seq OWNER TO postgres;

--
-- TOC entry 1978 (class 0 OID 0)
-- Dependencies: 1556
-- Name: seq_funcionalidades_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_funcionalidades_seq', 16, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1557 (class 1259 OID 16404)
-- Dependencies: 1871 7
-- Name: funcionalidades; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE funcionalidades (
    idfuncionalidad numeric(19,0) DEFAULT nextval('seq_funcionalidades_seq'::regclass) NOT NULL,
    idmodulo numeric(19,0) NOT NULL,
    funcionalidad character varying(255),
    url character varying(255),
    menu numeric(1,0),
    alto integer,
    ancho integer
);


ALTER TABLE mod_admin.funcionalidades OWNER TO postgres;

--
-- TOC entry 1558 (class 1259 OID 16411)
-- Dependencies: 7
-- Name: seq_modulos_seq; Type: SEQUENCE; Schema: mod_admin; Owner: postgres
--

CREATE SEQUENCE seq_modulos_seq
    START WITH 15
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 15
    CACHE 1;


ALTER TABLE mod_admin.seq_modulos_seq OWNER TO postgres;

--
-- TOC entry 1979 (class 0 OID 0)
-- Dependencies: 1558
-- Name: seq_modulos_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_modulos_seq', 23, true);


--
-- TOC entry 1559 (class 1259 OID 16413)
-- Dependencies: 1872 7
-- Name: modulos; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE modulos (
    idmodulo numeric(19,0) DEFAULT nextval('seq_modulos_seq'::regclass) NOT NULL,
    modulo character varying(255),
    idpadre numeric(19,0),
    lft numeric(19,0),
    rgt numeric(19,0),
    level numeric(19,0)
);


ALTER TABLE mod_admin.modulos OWNER TO postgres;

--
-- TOC entry 1560 (class 1259 OID 16417)
-- Dependencies: 7
-- Name: seq_roles_seq; Type: SEQUENCE; Schema: mod_admin; Owner: postgres
--

CREATE SEQUENCE seq_roles_seq
    START WITH 15
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 15
    CACHE 1;


ALTER TABLE mod_admin.seq_roles_seq OWNER TO postgres;

--
-- TOC entry 1980 (class 0 OID 0)
-- Dependencies: 1560
-- Name: seq_roles_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_roles_seq', 15, false);


--
-- TOC entry 1561 (class 1259 OID 16419)
-- Dependencies: 1873 7
-- Name: roles; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    idrol numeric(19,0) DEFAULT nextval('seq_roles_seq'::regclass) NOT NULL,
    rol character varying(255)
);


ALTER TABLE mod_admin.roles OWNER TO postgres;

--
-- TOC entry 1562 (class 1259 OID 16423)
-- Dependencies: 7
-- Name: roles_funcionalidades; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE roles_funcionalidades (
    idrol numeric(19,0) NOT NULL,
    idfuncionalidad numeric(19,0) NOT NULL
);


ALTER TABLE mod_admin.roles_funcionalidades OWNER TO postgres;

--
-- TOC entry 1563 (class 1259 OID 16426)
-- Dependencies: 7
-- Name: roles_usuarios_entidades; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE roles_usuarios_entidades (
    idusuario numeric(19,0) NOT NULL,
    idrol numeric(19,0) NOT NULL,
    identidad numeric(19,0) NOT NULL
);


ALTER TABLE mod_admin.roles_usuarios_entidades OWNER TO postgres;

--
-- TOC entry 1564 (class 1259 OID 16429)
-- Dependencies: 7
-- Name: seq_usuarios_seq; Type: SEQUENCE; Schema: mod_admin; Owner: postgres
--

CREATE SEQUENCE seq_usuarios_seq
    START WITH 10
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 10
    CACHE 1;


ALTER TABLE mod_admin.seq_usuarios_seq OWNER TO postgres;

--
-- TOC entry 1981 (class 0 OID 0)
-- Dependencies: 1564
-- Name: seq_usuarios_seq; Type: SEQUENCE SET; Schema: mod_admin; Owner: postgres
--

SELECT pg_catalog.setval('seq_usuarios_seq', 12, true);


--
-- TOC entry 1565 (class 1259 OID 16431)
-- Dependencies: 7
-- Name: trazas; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE trazas (
    idusuario numeric(19,0) NOT NULL,
    fecha date,
    hora time(6) without time zone,
    ip character varying(20),
    idfuncionalidad numeric(19,0) NOT NULL
);


ALTER TABLE mod_admin.trazas OWNER TO postgres;

--
-- TOC entry 1566 (class 1259 OID 16434)
-- Dependencies: 1874 7
-- Name: usuarios; Type: TABLE; Schema: mod_admin; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    idusuario numeric(19,0) DEFAULT nextval('seq_usuarios_seq'::regclass) NOT NULL,
    usuario character varying(255),
    correo character varying(255),
    passwd character varying(255)
);


ALTER TABLE mod_admin.usuarios OWNER TO postgres;

SET search_path = mod_certificaciones, pg_catalog;

--
-- TOC entry 1567 (class 1259 OID 16441)
-- Dependencies: 8
-- Name: seq_certificaciones_seq; Type: SEQUENCE; Schema: mod_certificaciones; Owner: postgres
--

CREATE SEQUENCE seq_certificaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_certificaciones.seq_certificaciones_seq OWNER TO postgres;

--
-- TOC entry 1982 (class 0 OID 0)
-- Dependencies: 1567
-- Name: seq_certificaciones_seq; Type: SEQUENCE SET; Schema: mod_certificaciones; Owner: postgres
--

SELECT pg_catalog.setval('seq_certificaciones_seq', 1, false);


--
-- TOC entry 1568 (class 1259 OID 16443)
-- Dependencies: 1875 8
-- Name: certificaciones; Type: TABLE; Schema: mod_certificaciones; Owner: postgres; Tablespace: 
--

CREATE TABLE certificaciones (
    idcertificacion numeric(19,0) DEFAULT nextval('seq_certificaciones_seq'::regclass) NOT NULL,
    idobra numeric(19,0) NOT NULL
);


ALTER TABLE mod_certificaciones.certificaciones OWNER TO postgres;

--
-- TOC entry 1569 (class 1259 OID 16447)
-- Dependencies: 8
-- Name: normas_certificacion; Type: TABLE; Schema: mod_certificaciones; Owner: postgres; Tablespace: 
--

CREATE TABLE normas_certificacion (
    idcertificacion numeric(19,0) NOT NULL,
    idrv numeric(19,0) NOT NULL,
    idnorma numeric(19,0) NOT NULL,
    precio_mn numeric(19,10),
    precio_cuc numeric(19,10),
    cantidad numeric(19,10)
);


ALTER TABLE mod_certificaciones.normas_certificacion OWNER TO postgres;

--
-- TOC entry 1570 (class 1259 OID 16450)
-- Dependencies: 8
-- Name: rv_certificacion; Type: TABLE; Schema: mod_certificaciones; Owner: postgres; Tablespace: 
--

CREATE TABLE rv_certificacion (
    idcertificacion numeric(19,0) NOT NULL,
    idrv numeric(19,0) NOT NULL,
    idobra numeric(19,0) NOT NULL,
    idetapa numeric(19,0) NOT NULL,
    cantidad numeric(19,10)
);


ALTER TABLE mod_certificaciones.rv_certificacion OWNER TO postgres;

--
-- TOC entry 1571 (class 1259 OID 16453)
-- Dependencies: 8
-- Name: seq_normas_certificacion_seq; Type: SEQUENCE; Schema: mod_certificaciones; Owner: postgres
--

CREATE SEQUENCE seq_normas_certificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_certificaciones.seq_normas_certificacion_seq OWNER TO postgres;

--
-- TOC entry 1983 (class 0 OID 0)
-- Dependencies: 1571
-- Name: seq_normas_certificacion_seq; Type: SEQUENCE SET; Schema: mod_certificaciones; Owner: postgres
--

SELECT pg_catalog.setval('seq_normas_certificacion_seq', 1, false);


SET search_path = mod_nomencladores, pg_catalog;

--
-- TOC entry 1572 (class 1259 OID 16455)
-- Dependencies: 9
-- Name: seq_componentes_norma_seq; Type: SEQUENCE; Schema: mod_nomencladores; Owner: postgres
--

CREATE SEQUENCE seq_componentes_norma_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_nomencladores.seq_componentes_norma_seq OWNER TO postgres;

--
-- TOC entry 1984 (class 0 OID 0)
-- Dependencies: 1572
-- Name: seq_componentes_norma_seq; Type: SEQUENCE SET; Schema: mod_nomencladores; Owner: postgres
--

SELECT pg_catalog.setval('seq_componentes_norma_seq', 1, false);


--
-- TOC entry 1573 (class 1259 OID 16457)
-- Dependencies: 1876 9
-- Name: componentes_norma; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE componentes_norma (
    idcomponente numeric(19,0) DEFAULT nextval('seq_componentes_norma_seq'::regclass) NOT NULL,
    norma character varying(50),
    precio_mn numeric(19,10),
    precio_cuc numeric(19,10)
);


ALTER TABLE mod_nomencladores.componentes_norma OWNER TO postgres;

--
-- TOC entry 1574 (class 1259 OID 16461)
-- Dependencies: 9
-- Name: seq_entidades_seq; Type: SEQUENCE; Schema: mod_nomencladores; Owner: postgres
--

CREATE SEQUENCE seq_entidades_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_nomencladores.seq_entidades_seq OWNER TO postgres;

--
-- TOC entry 1985 (class 0 OID 0)
-- Dependencies: 1574
-- Name: seq_entidades_seq; Type: SEQUENCE SET; Schema: mod_nomencladores; Owner: postgres
--

SELECT pg_catalog.setval('seq_entidades_seq', 1, true);


--
-- TOC entry 1575 (class 1259 OID 16463)
-- Dependencies: 1877 9
-- Name: entidades; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE entidades (
    identidad numeric(19,0) DEFAULT nextval('seq_entidades_seq'::regclass) NOT NULL,
    idraiz numeric(19,0) NOT NULL,
    entidad character varying(255),
    rgt numeric(19,0),
    lft numeric(19,0),
    level numeric(19,0)
);


ALTER TABLE mod_nomencladores.entidades OWNER TO postgres;

--
-- TOC entry 1576 (class 1259 OID 16467)
-- Dependencies: 9
-- Name: equipos; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE equipos (
    equipo character varying(50),
    idcomponente numeric(19,0) NOT NULL
);


ALTER TABLE mod_nomencladores.equipos OWNER TO postgres;

--
-- TOC entry 1577 (class 1259 OID 16470)
-- Dependencies: 9
-- Name: etapas; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE etapas (
    idetapa numeric(19,0) NOT NULL,
    etapa character varying(50),
    codigo character varying(50)
);


ALTER TABLE mod_nomencladores.etapas OWNER TO postgres;

--
-- TOC entry 1578 (class 1259 OID 16473)
-- Dependencies: 9
-- Name: grupos_rv; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE grupos_rv (
    idgrupo numeric(19,0) NOT NULL,
    grupo character varying(50),
    idraiz numeric(19,0),
    lft numeric(19,0),
    rgt numeric(19,0),
    level numeric(19,0),
    codigo character varying(10)
);


ALTER TABLE mod_nomencladores.grupos_rv OWNER TO postgres;

--
-- TOC entry 1579 (class 1259 OID 16476)
-- Dependencies: 9
-- Name: juegos; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE juegos (
    juego integer,
    idcomponente numeric(19,0) NOT NULL
);


ALTER TABLE mod_nomencladores.juegos OWNER TO postgres;

--
-- TOC entry 1580 (class 1259 OID 16479)
-- Dependencies: 9
-- Name: mano_obra; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE mano_obra (
    mano_obra character varying(50),
    idcomponente numeric(19,0) NOT NULL
);


ALTER TABLE mod_nomencladores.mano_obra OWNER TO postgres;

--
-- TOC entry 1581 (class 1259 OID 16482)
-- Dependencies: 9
-- Name: materiales; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE materiales (
    material character varying(50),
    idcomponente numeric(19,0) NOT NULL
);


ALTER TABLE mod_nomencladores.materiales OWNER TO postgres;

--
-- TOC entry 1582 (class 1259 OID 16485)
-- Dependencies: 9
-- Name: seq_normas_seq; Type: SEQUENCE; Schema: mod_nomencladores; Owner: postgres
--

CREATE SEQUENCE seq_normas_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_nomencladores.seq_normas_seq OWNER TO postgres;

--
-- TOC entry 1986 (class 0 OID 0)
-- Dependencies: 1582
-- Name: seq_normas_seq; Type: SEQUENCE SET; Schema: mod_nomencladores; Owner: postgres
--

SELECT pg_catalog.setval('seq_normas_seq', 1, false);


--
-- TOC entry 1583 (class 1259 OID 16487)
-- Dependencies: 1878 9
-- Name: normas; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE normas (
    idnorma numeric(19,0) DEFAULT nextval('seq_normas_seq'::regclass) NOT NULL,
    norma character varying(50)
);


ALTER TABLE mod_nomencladores.normas OWNER TO postgres;

--
-- TOC entry 1584 (class 1259 OID 16491)
-- Dependencies: 9
-- Name: normas_componentes_normas; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE normas_componentes_normas (
    idcomponente numeric(19,0) NOT NULL,
    idnorma numeric(19,0) NOT NULL
);


ALTER TABLE mod_nomencladores.normas_componentes_normas OWNER TO postgres;

--
-- TOC entry 1585 (class 1259 OID 16494)
-- Dependencies: 9
-- Name: normas_renglones_variantes; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE normas_renglones_variantes (
    idrv numeric(19,0) NOT NULL,
    idnorma numeric(19,0) NOT NULL,
    cantidad numeric(19,10)
);


ALTER TABLE mod_nomencladores.normas_renglones_variantes OWNER TO postgres;

--
-- TOC entry 1586 (class 1259 OID 16497)
-- Dependencies: 9
-- Name: seq_obras_seq; Type: SEQUENCE; Schema: mod_nomencladores; Owner: postgres
--

CREATE SEQUENCE seq_obras_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_nomencladores.seq_obras_seq OWNER TO postgres;

--
-- TOC entry 1987 (class 0 OID 0)
-- Dependencies: 1586
-- Name: seq_obras_seq; Type: SEQUENCE SET; Schema: mod_nomencladores; Owner: postgres
--

SELECT pg_catalog.setval('seq_obras_seq', 1, false);


--
-- TOC entry 1587 (class 1259 OID 16499)
-- Dependencies: 1879 9
-- Name: obras; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE obras (
    idobra numeric(19,0) DEFAULT nextval('seq_obras_seq'::regclass) NOT NULL,
    identidad numeric(19,0) NOT NULL,
    idraiz numeric(19,0) NOT NULL,
    obra character varying(255),
    rgt numeric(19,0),
    lft numeric(19,0),
    level integer
);


ALTER TABLE mod_nomencladores.obras OWNER TO postgres;

--
-- TOC entry 1588 (class 1259 OID 16503)
-- Dependencies: 9
-- Name: seq_renglones_variantes_seq; Type: SEQUENCE; Schema: mod_nomencladores; Owner: postgres
--

CREATE SEQUENCE seq_renglones_variantes_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_nomencladores.seq_renglones_variantes_seq OWNER TO postgres;

--
-- TOC entry 1988 (class 0 OID 0)
-- Dependencies: 1588
-- Name: seq_renglones_variantes_seq; Type: SEQUENCE SET; Schema: mod_nomencladores; Owner: postgres
--

SELECT pg_catalog.setval('seq_renglones_variantes_seq', 1, false);


--
-- TOC entry 1589 (class 1259 OID 16505)
-- Dependencies: 1880 9
-- Name: renglones_variantes; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE renglones_variantes (
    idrv numeric(19,0) DEFAULT nextval('seq_renglones_variantes_seq'::regclass) NOT NULL,
    descripcion character varying(255),
    codigo character varying(10),
    idum numeric(19,0) NOT NULL,
    idgrupo numeric(19,0) NOT NULL
);


ALTER TABLE mod_nomencladores.renglones_variantes OWNER TO postgres;

--
-- TOC entry 1590 (class 1259 OID 16509)
-- Dependencies: 9
-- Name: seq_etapas_seq; Type: SEQUENCE; Schema: mod_nomencladores; Owner: postgres
--

CREATE SEQUENCE seq_etapas_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_nomencladores.seq_etapas_seq OWNER TO postgres;

--
-- TOC entry 1989 (class 0 OID 0)
-- Dependencies: 1590
-- Name: seq_etapas_seq; Type: SEQUENCE SET; Schema: mod_nomencladores; Owner: postgres
--

SELECT pg_catalog.setval('seq_etapas_seq', 1, false);


--
-- TOC entry 1591 (class 1259 OID 16511)
-- Dependencies: 9
-- Name: seq_grupos_rv_seq; Type: SEQUENCE; Schema: mod_nomencladores; Owner: postgres
--

CREATE SEQUENCE seq_grupos_rv_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_nomencladores.seq_grupos_rv_seq OWNER TO postgres;

--
-- TOC entry 1990 (class 0 OID 0)
-- Dependencies: 1591
-- Name: seq_grupos_rv_seq; Type: SEQUENCE SET; Schema: mod_nomencladores; Owner: postgres
--

SELECT pg_catalog.setval('seq_grupos_rv_seq', 4489, true);


--
-- TOC entry 1592 (class 1259 OID 16513)
-- Dependencies: 9
-- Name: seq_unidades_medida_seq; Type: SEQUENCE; Schema: mod_nomencladores; Owner: postgres
--

CREATE SEQUENCE seq_unidades_medida_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE mod_nomencladores.seq_unidades_medida_seq OWNER TO postgres;

--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 1592
-- Name: seq_unidades_medida_seq; Type: SEQUENCE SET; Schema: mod_nomencladores; Owner: postgres
--

SELECT pg_catalog.setval('seq_unidades_medida_seq', 1, false);


--
-- TOC entry 1593 (class 1259 OID 16515)
-- Dependencies: 1881 9
-- Name: unidades_medida; Type: TABLE; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

CREATE TABLE unidades_medida (
    idum numeric(19,0) DEFAULT nextval('seq_unidades_medida_seq'::regclass) NOT NULL,
    um character varying(20)
);


ALTER TABLE mod_nomencladores.unidades_medida OWNER TO postgres;

SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1949 (class 0 OID 16404)
-- Dependencies: 1557
-- Data for Name: funcionalidades; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

INSERT INTO funcionalidades (idfuncionalidad, idmodulo, funcionalidad, url, menu, alto, ancho) VALUES (1, 10, 'Funcionalidades', 'admin/func/', 1, 300, 650);
INSERT INTO funcionalidades (idfuncionalidad, idmodulo, funcionalidad, url, menu, alto, ancho) VALUES (7, 10, 'Usuarios', 'admin/user/', 1, 430, 600);
INSERT INTO funcionalidades (idfuncionalidad, idmodulo, funcionalidad, url, menu, alto, ancho) VALUES (14, 22, 'Entidades', 'nomencladores/entidad/', 1, 500, 500);
INSERT INTO funcionalidades (idfuncionalidad, idmodulo, funcionalidad, url, menu, alto, ancho) VALUES (16, 22, 'Obras', 'nomencladores/obra/', 1, 400, 400);
INSERT INTO funcionalidades (idfuncionalidad, idmodulo, funcionalidad, url, menu, alto, ancho) VALUES (2, 10, 'Trazas', 'admin/trazas/', 1, NULL, NULL);
INSERT INTO funcionalidades (idfuncionalidad, idmodulo, funcionalidad, url, menu, alto, ancho) VALUES (8, 10, 'Módulos', 'admin/modules/', 1, 500, 500);
INSERT INTO funcionalidades (idfuncionalidad, idmodulo, funcionalidad, url, menu, alto, ancho) VALUES (3, 10, 'Roles', 'admin/roles/', 1, 350, 350);


--
-- TOC entry 1950 (class 0 OID 16413)
-- Dependencies: 1559
-- Data for Name: modulos; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

INSERT INTO modulos (idmodulo, modulo, idpadre, lft, rgt, level) VALUES (10, 'Administración', 10, NULL, NULL, NULL);
INSERT INTO modulos (idmodulo, modulo, idpadre, lft, rgt, level) VALUES (22, 'Nomencladores', 22, NULL, NULL, NULL);
INSERT INTO modulos (idmodulo, modulo, idpadre, lft, rgt, level) VALUES (23, 'Certificaciones', NULL, 1, 2, 0);


--
-- TOC entry 1951 (class 0 OID 16419)
-- Dependencies: 1561
-- Data for Name: roles; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

INSERT INTO roles (idrol, rol) VALUES (0, 'Administradores');
INSERT INTO roles (idrol, rol) VALUES (2, 'Revisores');


--
-- TOC entry 1952 (class 0 OID 16423)
-- Dependencies: 1562
-- Data for Name: roles_funcionalidades; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--



--
-- TOC entry 1953 (class 0 OID 16426)
-- Dependencies: 1563
-- Data for Name: roles_usuarios_entidades; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--



--
-- TOC entry 1954 (class 0 OID 16431)
-- Dependencies: 1565
-- Data for Name: trazas; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--



--
-- TOC entry 1955 (class 0 OID 16434)
-- Dependencies: 1566
-- Data for Name: usuarios; Type: TABLE DATA; Schema: mod_admin; Owner: postgres
--

INSERT INTO usuarios (idusuario, usuario, correo, passwd) VALUES (1, 'zcool', 'zcool2005@gmail.com', 'YQ==');
INSERT INTO usuarios (idusuario, usuario, correo, passwd) VALUES (3, 'oadiaz', 'oadiaz@uci.cu', 'MTIz');
INSERT INTO usuarios (idusuario, usuario, correo, passwd) VALUES (4, 'zc', 'zcool@a.uc', 'YQ==');
INSERT INTO usuarios (idusuario, usuario, correo, passwd) VALUES (2, 'oadp', 'oadiaz@gmail.com', 'MQ==');
INSERT INTO usuarios (idusuario, usuario, correo, passwd) VALUES (10, 'sdsa', 'dasds@s.com', 'YQ==');
INSERT INTO usuarios (idusuario, usuario, correo, passwd) VALUES (12, 'omar', 'omar@m.cu', 'YQ==');


SET search_path = mod_certificaciones, pg_catalog;

--
-- TOC entry 1956 (class 0 OID 16443)
-- Dependencies: 1568
-- Data for Name: certificaciones; Type: TABLE DATA; Schema: mod_certificaciones; Owner: postgres
--



--
-- TOC entry 1957 (class 0 OID 16447)
-- Dependencies: 1569
-- Data for Name: normas_certificacion; Type: TABLE DATA; Schema: mod_certificaciones; Owner: postgres
--



--
-- TOC entry 1958 (class 0 OID 16450)
-- Dependencies: 1570
-- Data for Name: rv_certificacion; Type: TABLE DATA; Schema: mod_certificaciones; Owner: postgres
--



SET search_path = mod_nomencladores, pg_catalog;

--
-- TOC entry 1959 (class 0 OID 16457)
-- Dependencies: 1573
-- Data for Name: componentes_norma; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1960 (class 0 OID 16463)
-- Dependencies: 1575
-- Data for Name: entidades; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1961 (class 0 OID 16467)
-- Dependencies: 1576
-- Data for Name: equipos; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1962 (class 0 OID 16470)
-- Dependencies: 1577
-- Data for Name: etapas; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1963 (class 0 OID 16473)
-- Dependencies: 1578
-- Data for Name: grupos_rv; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--

INSERT INTO grupos_rv (idgrupo, grupo, idraiz, lft, rgt, level, codigo) VALUES (4488, 'MOVIMIENTO DE TIERRA Y TRABAJOS AUXILIARES', 4488, 1, 4, 0, '01');
INSERT INTO grupos_rv (idgrupo, grupo, idraiz, lft, rgt, level, codigo) VALUES (4489, 'DEMOLICIONES, DESMONTAJES O EXTRACCIONES', 4488, 2, 3, 1, '010');


--
-- TOC entry 1964 (class 0 OID 16476)
-- Dependencies: 1579
-- Data for Name: juegos; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1965 (class 0 OID 16479)
-- Dependencies: 1580
-- Data for Name: mano_obra; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1966 (class 0 OID 16482)
-- Dependencies: 1581
-- Data for Name: materiales; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1967 (class 0 OID 16487)
-- Dependencies: 1583
-- Data for Name: normas; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1968 (class 0 OID 16491)
-- Dependencies: 1584
-- Data for Name: normas_componentes_normas; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1969 (class 0 OID 16494)
-- Dependencies: 1585
-- Data for Name: normas_renglones_variantes; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1970 (class 0 OID 16499)
-- Dependencies: 1587
-- Data for Name: obras; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1971 (class 0 OID 16505)
-- Dependencies: 1589
-- Data for Name: renglones_variantes; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



--
-- TOC entry 1972 (class 0 OID 16515)
-- Dependencies: 1593
-- Data for Name: unidades_medida; Type: TABLE DATA; Schema: mod_nomencladores; Owner: postgres
--



SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1883 (class 2606 OID 16520)
-- Dependencies: 1557 1557
-- Name: funcionalidades_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionalidades
    ADD CONSTRAINT funcionalidades_pkey PRIMARY KEY (idfuncionalidad);


--
-- TOC entry 1885 (class 2606 OID 16522)
-- Dependencies: 1559 1559
-- Name: modulos_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (idmodulo);


--
-- TOC entry 1889 (class 2606 OID 16524)
-- Dependencies: 1562 1562 1562
-- Name: roles_funcionalidades_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT roles_funcionalidades_pkey PRIMARY KEY (idrol, idfuncionalidad);


--
-- TOC entry 1887 (class 2606 OID 16526)
-- Dependencies: 1561 1561
-- Name: roles_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (idrol);


--
-- TOC entry 1893 (class 2606 OID 16528)
-- Dependencies: 1565 1565
-- Name: trazas_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trazas
    ADD CONSTRAINT trazas_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 1895 (class 2606 OID 16530)
-- Dependencies: 1566 1566
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 1891 (class 2606 OID 16532)
-- Dependencies: 1563 1563 1563 1563
-- Name: usuarios_roles_pkey; Type: CONSTRAINT; Schema: mod_admin; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (idusuario, idrol, identidad);


SET search_path = mod_certificaciones, pg_catalog;

--
-- TOC entry 1897 (class 2606 OID 16534)
-- Dependencies: 1568 1568
-- Name: certificaciones_pkey; Type: CONSTRAINT; Schema: mod_certificaciones; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY certificaciones
    ADD CONSTRAINT certificaciones_pkey PRIMARY KEY (idcertificacion);


--
-- TOC entry 1899 (class 2606 OID 16536)
-- Dependencies: 1569 1569 1569 1569
-- Name: normas_certificacion_pkey; Type: CONSTRAINT; Schema: mod_certificaciones; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY normas_certificacion
    ADD CONSTRAINT normas_certificacion_pkey PRIMARY KEY (idcertificacion, idrv, idnorma);


--
-- TOC entry 1901 (class 2606 OID 16538)
-- Dependencies: 1570 1570 1570
-- Name: rv_certificacion_pkey; Type: CONSTRAINT; Schema: mod_certificaciones; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rv_certificacion
    ADD CONSTRAINT rv_certificacion_pkey PRIMARY KEY (idcertificacion, idrv);


SET search_path = mod_nomencladores, pg_catalog;

--
-- TOC entry 1903 (class 2606 OID 16540)
-- Dependencies: 1573 1573
-- Name: componentes_norma_pkey; Type: CONSTRAINT; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY componentes_norma
    ADD CONSTRAINT componentes_norma_pkey PRIMARY KEY (idcomponente);


--
-- TOC entry 1913 (class 2606 OID 16542)
-- Dependencies: 1584 1584 1584
-- Name: componentes_normas_pkey; Type: CONSTRAINT; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY normas_componentes_normas
    ADD CONSTRAINT componentes_normas_pkey PRIMARY KEY (idcomponente, idnorma);


--
-- TOC entry 1905 (class 2606 OID 16544)
-- Dependencies: 1575 1575
-- Name: entidades_pkey; Type: CONSTRAINT; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entidades
    ADD CONSTRAINT entidades_pkey PRIMARY KEY (identidad);


--
-- TOC entry 1907 (class 2606 OID 16546)
-- Dependencies: 1577 1577
-- Name: etapas_pkey; Type: CONSTRAINT; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY etapas
    ADD CONSTRAINT etapas_pkey PRIMARY KEY (idetapa);


--
-- TOC entry 1909 (class 2606 OID 16548)
-- Dependencies: 1578 1578
-- Name: grupos_rv_pkey; Type: CONSTRAINT; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupos_rv
    ADD CONSTRAINT grupos_rv_pkey PRIMARY KEY (idgrupo);


--
-- TOC entry 1911 (class 2606 OID 16550)
-- Dependencies: 1583 1583
-- Name: normas_pkey; Type: CONSTRAINT; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY normas
    ADD CONSTRAINT normas_pkey PRIMARY KEY (idnorma);


--
-- TOC entry 1915 (class 2606 OID 16552)
-- Dependencies: 1585 1585 1585
-- Name: normas_renglones_variantes_pkey; Type: CONSTRAINT; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY normas_renglones_variantes
    ADD CONSTRAINT normas_renglones_variantes_pkey PRIMARY KEY (idrv, idnorma);


--
-- TOC entry 1917 (class 2606 OID 16554)
-- Dependencies: 1587 1587
-- Name: obras_pkey; Type: CONSTRAINT; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY obras
    ADD CONSTRAINT obras_pkey PRIMARY KEY (idobra);


--
-- TOC entry 1919 (class 2606 OID 16556)
-- Dependencies: 1589 1589
-- Name: renglones_variantes_pkey; Type: CONSTRAINT; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY renglones_variantes
    ADD CONSTRAINT renglones_variantes_pkey PRIMARY KEY (idrv);


--
-- TOC entry 1921 (class 2606 OID 16558)
-- Dependencies: 1593 1593
-- Name: unidades_medida_pkey; Type: CONSTRAINT; Schema: mod_nomencladores; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidades_medida
    ADD CONSTRAINT unidades_medida_pkey PRIMARY KEY (idum);


SET search_path = mod_admin, pg_catalog;

--
-- TOC entry 1922 (class 2606 OID 16559)
-- Dependencies: 1559 1884 1557
-- Name: fkfuncionali294302; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY funcionalidades
    ADD CONSTRAINT fkfuncionali294302 FOREIGN KEY (idmodulo) REFERENCES modulos(idmodulo);


--
-- TOC entry 1923 (class 2606 OID 16564)
-- Dependencies: 1559 1884 1559
-- Name: fkmodulos424504; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT fkmodulos424504 FOREIGN KEY (idpadre) REFERENCES modulos(idmodulo);


--
-- TOC entry 1924 (class 2606 OID 16569)
-- Dependencies: 1557 1882 1562
-- Name: fkroles_func177086; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT fkroles_func177086 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidades(idfuncionalidad);


--
-- TOC entry 1925 (class 2606 OID 16574)
-- Dependencies: 1561 1886 1562
-- Name: fkroles_func72333; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_funcionalidades
    ADD CONSTRAINT fkroles_func72333 FOREIGN KEY (idrol) REFERENCES roles(idrol);


--
-- TOC entry 1929 (class 2606 OID 16579)
-- Dependencies: 1566 1894 1565
-- Name: fktrazas204817; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY trazas
    ADD CONSTRAINT fktrazas204817 FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario);


--
-- TOC entry 1930 (class 2606 OID 16584)
-- Dependencies: 1565 1557 1882
-- Name: fktrazas373612; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY trazas
    ADD CONSTRAINT fktrazas373612 FOREIGN KEY (idfuncionalidad) REFERENCES funcionalidades(idfuncionalidad);


--
-- TOC entry 1926 (class 2606 OID 16589)
-- Dependencies: 1563 1561 1886
-- Name: fkusuarios_r313725; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkusuarios_r313725 FOREIGN KEY (idrol) REFERENCES roles(idrol);


--
-- TOC entry 1927 (class 2606 OID 16594)
-- Dependencies: 1563 1894 1566
-- Name: fkusuarios_r984714; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT fkusuarios_r984714 FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario);


--
-- TOC entry 1928 (class 2606 OID 16599)
-- Dependencies: 1575 1904 1563
-- Name: roles_usuarios_entidades_fk; Type: FK CONSTRAINT; Schema: mod_admin; Owner: postgres
--

ALTER TABLE ONLY roles_usuarios_entidades
    ADD CONSTRAINT roles_usuarios_entidades_fk FOREIGN KEY (identidad) REFERENCES mod_nomencladores.entidades(identidad);


SET search_path = mod_certificaciones, pg_catalog;

--
-- TOC entry 1931 (class 2606 OID 16604)
-- Dependencies: 1568 1916 1587
-- Name: certificaciones_fk; Type: FK CONSTRAINT; Schema: mod_certificaciones; Owner: postgres
--

ALTER TABLE ONLY certificaciones
    ADD CONSTRAINT certificaciones_fk FOREIGN KEY (idobra) REFERENCES mod_nomencladores.obras(idobra);


--
-- TOC entry 1932 (class 2606 OID 16609)
-- Dependencies: 1569 1900 1570 1570 1569
-- Name: fknormas_cer604587; Type: FK CONSTRAINT; Schema: mod_certificaciones; Owner: postgres
--

ALTER TABLE ONLY normas_certificacion
    ADD CONSTRAINT fknormas_cer604587 FOREIGN KEY (idcertificacion, idrv) REFERENCES rv_certificacion(idcertificacion, idrv);


--
-- TOC entry 1934 (class 2606 OID 16614)
-- Dependencies: 1568 1896 1570
-- Name: fkrv_certifi565878; Type: FK CONSTRAINT; Schema: mod_certificaciones; Owner: postgres
--

ALTER TABLE ONLY rv_certificacion
    ADD CONSTRAINT fkrv_certifi565878 FOREIGN KEY (idcertificacion) REFERENCES certificaciones(idcertificacion);


--
-- TOC entry 1933 (class 2606 OID 16619)
-- Dependencies: 1569 1910 1583
-- Name: normas_certificacion_fk; Type: FK CONSTRAINT; Schema: mod_certificaciones; Owner: postgres
--

ALTER TABLE ONLY normas_certificacion
    ADD CONSTRAINT normas_certificacion_fk FOREIGN KEY (idnorma) REFERENCES mod_nomencladores.normas(idnorma);


--
-- TOC entry 1935 (class 2606 OID 16624)
-- Dependencies: 1918 1589 1570
-- Name: rv_certificacion_fk; Type: FK CONSTRAINT; Schema: mod_certificaciones; Owner: postgres
--

ALTER TABLE ONLY rv_certificacion
    ADD CONSTRAINT rv_certificacion_fk FOREIGN KEY (idrv) REFERENCES mod_nomencladores.renglones_variantes(idrv);


--
-- TOC entry 1936 (class 2606 OID 16629)
-- Dependencies: 1570 1916 1587
-- Name: rv_certificacion_fk1; Type: FK CONSTRAINT; Schema: mod_certificaciones; Owner: postgres
--

ALTER TABLE ONLY rv_certificacion
    ADD CONSTRAINT rv_certificacion_fk1 FOREIGN KEY (idobra) REFERENCES mod_nomencladores.obras(idobra);


--
-- TOC entry 1937 (class 2606 OID 16634)
-- Dependencies: 1570 1906 1577
-- Name: rv_certificacion_fk2; Type: FK CONSTRAINT; Schema: mod_certificaciones; Owner: postgres
--

ALTER TABLE ONLY rv_certificacion
    ADD CONSTRAINT rv_certificacion_fk2 FOREIGN KEY (idetapa) REFERENCES mod_nomencladores.etapas(idetapa);


SET search_path = mod_nomencladores, pg_catalog;

--
-- TOC entry 1942 (class 2606 OID 16639)
-- Dependencies: 1902 1584 1573
-- Name: fkcomponente732034; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY normas_componentes_normas
    ADD CONSTRAINT fkcomponente732034 FOREIGN KEY (idcomponente) REFERENCES componentes_norma(idcomponente);


--
-- TOC entry 1943 (class 2606 OID 16644)
-- Dependencies: 1584 1910 1583
-- Name: fkcomponente904682; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY normas_componentes_normas
    ADD CONSTRAINT fkcomponente904682 FOREIGN KEY (idnorma) REFERENCES normas(idnorma);


--
-- TOC entry 1938 (class 2606 OID 16649)
-- Dependencies: 1902 1573 1576
-- Name: fkequipos460626; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY equipos
    ADD CONSTRAINT fkequipos460626 FOREIGN KEY (idcomponente) REFERENCES componentes_norma(idcomponente);


--
-- TOC entry 1939 (class 2606 OID 16654)
-- Dependencies: 1573 1579 1902
-- Name: fkjuegos370547; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY juegos
    ADD CONSTRAINT fkjuegos370547 FOREIGN KEY (idcomponente) REFERENCES componentes_norma(idcomponente);


--
-- TOC entry 1940 (class 2606 OID 16659)
-- Dependencies: 1580 1902 1573
-- Name: fkmano_obra484299; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY mano_obra
    ADD CONSTRAINT fkmano_obra484299 FOREIGN KEY (idcomponente) REFERENCES componentes_norma(idcomponente);


--
-- TOC entry 1941 (class 2606 OID 16664)
-- Dependencies: 1902 1581 1573
-- Name: fkmateriales742796; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY materiales
    ADD CONSTRAINT fkmateriales742796 FOREIGN KEY (idcomponente) REFERENCES componentes_norma(idcomponente);


--
-- TOC entry 1944 (class 2606 OID 16669)
-- Dependencies: 1918 1585 1589
-- Name: fknormas_ren44726; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY normas_renglones_variantes
    ADD CONSTRAINT fknormas_ren44726 FOREIGN KEY (idrv) REFERENCES renglones_variantes(idrv);


--
-- TOC entry 1945 (class 2606 OID 16674)
-- Dependencies: 1585 1910 1583
-- Name: fknormas_ren476043; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY normas_renglones_variantes
    ADD CONSTRAINT fknormas_ren476043 FOREIGN KEY (idnorma) REFERENCES normas(idnorma);


--
-- TOC entry 1946 (class 2606 OID 16679)
-- Dependencies: 1587 1575 1904
-- Name: fkobras834041; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY obras
    ADD CONSTRAINT fkobras834041 FOREIGN KEY (identidad) REFERENCES entidades(identidad);


--
-- TOC entry 1947 (class 2606 OID 16684)
-- Dependencies: 1920 1589 1593
-- Name: fkrenglones_479760; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY renglones_variantes
    ADD CONSTRAINT fkrenglones_479760 FOREIGN KEY (idum) REFERENCES unidades_medida(idum);


--
-- TOC entry 1948 (class 2606 OID 16689)
-- Dependencies: 1578 1589 1908
-- Name: fkrenglones_680591; Type: FK CONSTRAINT; Schema: mod_nomencladores; Owner: postgres
--

ALTER TABLE ONLY renglones_variantes
    ADD CONSTRAINT fkrenglones_680591 FOREIGN KEY (idgrupo) REFERENCES grupos_rv(idgrupo);


--
-- TOC entry 1977 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2010-08-14 15:28:41

--
-- PostgreSQL database dump complete
--

