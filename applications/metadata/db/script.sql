--
-- PostgreSQL database dump
--

-- Started on 2011-02-25 19:31:36

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: mod_metadata; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA mod_metadata;


--
-- TOC entry 1875 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA mod_metadata; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA mod_metadata IS 'standard public schema';


--
-- TOC entry 333 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = mod_metadata, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1534 (class 1259 OID 25596)
-- Dependencies: 5
-- Name: checkbox; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE checkbox (
    idcomponent numeric(19,0) NOT NULL,
    box_label character varying(50)
);


--
-- TOC entry 1533 (class 1259 OID 25591)
-- Dependencies: 5
-- Name: combobox; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE combobox (
    idcomponent numeric(19,0) NOT NULL,
    value_field character varying(50),
    display_field character varying(50)
);


--
-- TOC entry 1523 (class 1259 OID 25553)
-- Dependencies: 5
-- Name: seq_component_seq; Type: SEQUENCE; Schema: mod_metadata; Owner: -
--

CREATE SEQUENCE seq_component_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1877 (class 0 OID 0)
-- Dependencies: 1523
-- Name: seq_component_seq; Type: SEQUENCE SET; Schema: mod_metadata; Owner: -
--

SELECT pg_catalog.setval('seq_component_seq', 1, false);


--
-- TOC entry 1530 (class 1259 OID 25576)
-- Dependencies: 1818 5
-- Name: component; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE component (
    idcomponent numeric(19,0) DEFAULT nextval('seq_component_seq'::regclass) NOT NULL,
    idfield numeric(19,0) NOT NULL,
    idtype numeric(19,0) NOT NULL,
    field_label character varying(50)
);


--
-- TOC entry 1521 (class 1259 OID 25549)
-- Dependencies: 5
-- Name: seq_field_seq; Type: SEQUENCE; Schema: mod_metadata; Owner: -
--

CREATE SEQUENCE seq_field_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1878 (class 0 OID 0)
-- Dependencies: 1521
-- Name: seq_field_seq; Type: SEQUENCE SET; Schema: mod_metadata; Owner: -
--

SELECT pg_catalog.setval('seq_field_seq', 1, false);


--
-- TOC entry 1528 (class 1259 OID 25566)
-- Dependencies: 1817 5
-- Name: field; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE field (
    idfield numeric(19,0) DEFAULT nextval('seq_field_seq'::regclass) NOT NULL,
    idtable numeric(19,0) NOT NULL,
    field character varying(50),
    length numeric(3,0)
);


--
-- TOC entry 1537 (class 1259 OID 25611)
-- Dependencies: 5
-- Name: local; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE local (
    idcomponent numeric(19,0) NOT NULL,
    idoption numeric(19,0) NOT NULL
);


--
-- TOC entry 1526 (class 1259 OID 25559)
-- Dependencies: 5
-- Name: seq_option_seq; Type: SEQUENCE; Schema: mod_metadata; Owner: -
--

CREATE SEQUENCE seq_option_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1879 (class 0 OID 0)
-- Dependencies: 1526
-- Name: seq_option_seq; Type: SEQUENCE SET; Schema: mod_metadata; Owner: -
--

SELECT pg_catalog.setval('seq_option_seq', 1, false);


--
-- TOC entry 1536 (class 1259 OID 25606)
-- Dependencies: 1821 5
-- Name: option; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE option (
    idoption numeric(19,0) DEFAULT nextval('seq_option_seq'::regclass) NOT NULL,
    idcomponent numeric(19,0) NOT NULL,
    option character varying(50)
);


--
-- TOC entry 1525 (class 1259 OID 25557)
-- Dependencies: 5
-- Name: seq_regex_seq; Type: SEQUENCE; Schema: mod_metadata; Owner: -
--

CREATE SEQUENCE seq_regex_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1880 (class 0 OID 0)
-- Dependencies: 1525
-- Name: seq_regex_seq; Type: SEQUENCE SET; Schema: mod_metadata; Owner: -
--

SELECT pg_catalog.setval('seq_regex_seq', 1, false);


--
-- TOC entry 1535 (class 1259 OID 25601)
-- Dependencies: 1820 5
-- Name: regex; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE regex (
    idregex numeric(19,0) DEFAULT nextval('seq_regex_seq'::regclass) NOT NULL,
    regex character varying(255),
    denominacion character varying(50)
);


--
-- TOC entry 1529 (class 1259 OID 25571)
-- Dependencies: 5
-- Name: relation; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE relation (
    idrelation numeric(19,0) NOT NULL,
    source_field numeric(19,0) NOT NULL,
    target_field numeric(19,0) NOT NULL
);


--
-- TOC entry 1538 (class 1259 OID 25616)
-- Dependencies: 5
-- Name: remote; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE remote (
    idcomponent numeric(19,0) NOT NULL,
    idfield numeric(19,0) NOT NULL
);


--
-- TOC entry 1522 (class 1259 OID 25551)
-- Dependencies: 5
-- Name: seq_relation_seq; Type: SEQUENCE; Schema: mod_metadata; Owner: -
--

CREATE SEQUENCE seq_relation_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1881 (class 0 OID 0)
-- Dependencies: 1522
-- Name: seq_relation_seq; Type: SEQUENCE SET; Schema: mod_metadata; Owner: -
--

SELECT pg_catalog.setval('seq_relation_seq', 1, false);


--
-- TOC entry 1520 (class 1259 OID 25547)
-- Dependencies: 5
-- Name: seq_table_seq; Type: SEQUENCE; Schema: mod_metadata; Owner: -
--

CREATE SEQUENCE seq_table_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1882 (class 0 OID 0)
-- Dependencies: 1520
-- Name: seq_table_seq; Type: SEQUENCE SET; Schema: mod_metadata; Owner: -
--

SELECT pg_catalog.setval('seq_table_seq', 1, false);


--
-- TOC entry 1524 (class 1259 OID 25555)
-- Dependencies: 5
-- Name: seq_type_seq; Type: SEQUENCE; Schema: mod_metadata; Owner: -
--

CREATE SEQUENCE seq_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1883 (class 0 OID 0)
-- Dependencies: 1524
-- Name: seq_type_seq; Type: SEQUENCE SET; Schema: mod_metadata; Owner: -
--

SELECT pg_catalog.setval('seq_type_seq', 1, false);


--
-- TOC entry 1527 (class 1259 OID 25561)
-- Dependencies: 1816 5
-- Name: table; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE "table" (
    idtable numeric(19,0) DEFAULT nextval('seq_table_seq'::regclass) NOT NULL,
    "table" character varying(50),
    schema character varying(50)
);


--
-- TOC entry 1532 (class 1259 OID 25586)
-- Dependencies: 5
-- Name: textfield; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE textfield (
    idcomponent numeric(19,0) NOT NULL,
    blank_text character varying(100),
    idregex numeric(19,0)
);


--
-- TOC entry 1531 (class 1259 OID 25581)
-- Dependencies: 1819 5
-- Name: type; Type: TABLE; Schema: mod_metadata; Owner: -; Tablespace: 
--

CREATE TABLE type (
    idtype numeric(19,0) DEFAULT nextval('seq_type_seq'::regclass) NOT NULL,
    type character varying(50),
    "table" character varying(50)
);


--
-- TOC entry 1867 (class 0 OID 25596)
-- Dependencies: 1534
-- Data for Name: checkbox; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1866 (class 0 OID 25591)
-- Dependencies: 1533
-- Data for Name: combobox; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1863 (class 0 OID 25576)
-- Dependencies: 1530
-- Data for Name: component; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1861 (class 0 OID 25566)
-- Dependencies: 1528
-- Data for Name: field; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1870 (class 0 OID 25611)
-- Dependencies: 1537
-- Data for Name: local; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1869 (class 0 OID 25606)
-- Dependencies: 1536
-- Data for Name: option; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1868 (class 0 OID 25601)
-- Dependencies: 1535
-- Data for Name: regex; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1862 (class 0 OID 25571)
-- Dependencies: 1529
-- Data for Name: relation; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1871 (class 0 OID 25616)
-- Dependencies: 1538
-- Data for Name: remote; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1860 (class 0 OID 25561)
-- Dependencies: 1527
-- Data for Name: table; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1865 (class 0 OID 25586)
-- Dependencies: 1532
-- Data for Name: textfield; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1864 (class 0 OID 25581)
-- Dependencies: 1531
-- Data for Name: type; Type: TABLE DATA; Schema: mod_metadata; Owner: -
--



--
-- TOC entry 1837 (class 2606 OID 25600)
-- Dependencies: 1534 1534
-- Name: checkbox_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY checkbox
    ADD CONSTRAINT checkbox_pkey PRIMARY KEY (idcomponent);


--
-- TOC entry 1835 (class 2606 OID 25595)
-- Dependencies: 1533 1533
-- Name: combobox_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY combobox
    ADD CONSTRAINT combobox_pkey PRIMARY KEY (idcomponent);


--
-- TOC entry 1829 (class 2606 OID 25580)
-- Dependencies: 1530 1530
-- Name: component_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY component
    ADD CONSTRAINT component_pkey PRIMARY KEY (idcomponent);


--
-- TOC entry 1825 (class 2606 OID 25570)
-- Dependencies: 1528 1528
-- Name: field_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY field
    ADD CONSTRAINT field_pkey PRIMARY KEY (idfield);


--
-- TOC entry 1843 (class 2606 OID 25615)
-- Dependencies: 1537 1537
-- Name: local_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY local
    ADD CONSTRAINT local_pkey PRIMARY KEY (idcomponent);


--
-- TOC entry 1841 (class 2606 OID 25610)
-- Dependencies: 1536 1536
-- Name: option_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (idoption);


--
-- TOC entry 1839 (class 2606 OID 25605)
-- Dependencies: 1535 1535
-- Name: regex_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY regex
    ADD CONSTRAINT regex_pkey PRIMARY KEY (idregex);


--
-- TOC entry 1827 (class 2606 OID 25575)
-- Dependencies: 1529 1529
-- Name: relation_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relation
    ADD CONSTRAINT relation_pkey PRIMARY KEY (idrelation);


--
-- TOC entry 1845 (class 2606 OID 25620)
-- Dependencies: 1538 1538
-- Name: remote_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY remote
    ADD CONSTRAINT remote_pkey PRIMARY KEY (idcomponent);


--
-- TOC entry 1823 (class 2606 OID 25565)
-- Dependencies: 1527 1527
-- Name: table_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "table"
    ADD CONSTRAINT table_pkey PRIMARY KEY (idtable);


--
-- TOC entry 1833 (class 2606 OID 25590)
-- Dependencies: 1532 1532
-- Name: textfield_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY textfield
    ADD CONSTRAINT textfield_pkey PRIMARY KEY (idcomponent);


--
-- TOC entry 1831 (class 2606 OID 25585)
-- Dependencies: 1531 1531
-- Name: type_pkey; Type: CONSTRAINT; Schema: mod_metadata; Owner: -; Tablespace: 
--

ALTER TABLE ONLY type
    ADD CONSTRAINT type_pkey PRIMARY KEY (idtype);


--
-- TOC entry 1854 (class 2606 OID 25651)
-- Dependencies: 1530 1828 1534
-- Name: fkcheckbox480817; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY checkbox
    ADD CONSTRAINT fkcheckbox480817 FOREIGN KEY (idcomponent) REFERENCES component(idcomponent);


--
-- TOC entry 1853 (class 2606 OID 25646)
-- Dependencies: 1828 1530 1533
-- Name: fkcombobox701305; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY combobox
    ADD CONSTRAINT fkcombobox701305 FOREIGN KEY (idcomponent) REFERENCES component(idcomponent);


--
-- TOC entry 1849 (class 2606 OID 25636)
-- Dependencies: 1528 1824 1530
-- Name: fkcomponent420244; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY component
    ADD CONSTRAINT fkcomponent420244 FOREIGN KEY (idfield) REFERENCES field(idfield);


--
-- TOC entry 1850 (class 2606 OID 25656)
-- Dependencies: 1530 1830 1531
-- Name: fkcomponent678881; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY component
    ADD CONSTRAINT fkcomponent678881 FOREIGN KEY (idtype) REFERENCES type(idtype);


--
-- TOC entry 1846 (class 2606 OID 25621)
-- Dependencies: 1528 1527 1822
-- Name: fkfield150778; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY field
    ADD CONSTRAINT fkfield150778 FOREIGN KEY (idtable) REFERENCES "table"(idtable);


--
-- TOC entry 1857 (class 2606 OID 25686)
-- Dependencies: 1840 1537 1536
-- Name: fklocal238938; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY local
    ADD CONSTRAINT fklocal238938 FOREIGN KEY (idoption) REFERENCES option(idoption);


--
-- TOC entry 1856 (class 2606 OID 25671)
-- Dependencies: 1834 1533 1537
-- Name: fklocal352595; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY local
    ADD CONSTRAINT fklocal352595 FOREIGN KEY (idcomponent) REFERENCES combobox(idcomponent);


--
-- TOC entry 1855 (class 2606 OID 25666)
-- Dependencies: 1536 1534 1836
-- Name: fkoption251311; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT fkoption251311 FOREIGN KEY (idcomponent) REFERENCES checkbox(idcomponent);


--
-- TOC entry 1848 (class 2606 OID 25631)
-- Dependencies: 1528 1824 1529
-- Name: fkrelation719520; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY relation
    ADD CONSTRAINT fkrelation719520 FOREIGN KEY (target_field) REFERENCES field(idfield);


--
-- TOC entry 1847 (class 2606 OID 25626)
-- Dependencies: 1824 1529 1528
-- Name: fkrelation857999; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY relation
    ADD CONSTRAINT fkrelation857999 FOREIGN KEY (source_field) REFERENCES field(idfield);


--
-- TOC entry 1859 (class 2606 OID 25681)
-- Dependencies: 1538 1528 1824
-- Name: fkremote254680; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY remote
    ADD CONSTRAINT fkremote254680 FOREIGN KEY (idfield) REFERENCES field(idfield);


--
-- TOC entry 1858 (class 2606 OID 25676)
-- Dependencies: 1834 1538 1533
-- Name: fkremote404639; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY remote
    ADD CONSTRAINT fkremote404639 FOREIGN KEY (idcomponent) REFERENCES combobox(idcomponent);


--
-- TOC entry 1852 (class 2606 OID 25661)
-- Dependencies: 1532 1535 1838
-- Name: fktextfield183690; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY textfield
    ADD CONSTRAINT fktextfield183690 FOREIGN KEY (idregex) REFERENCES regex(idregex);


--
-- TOC entry 1851 (class 2606 OID 25641)
-- Dependencies: 1532 1828 1530
-- Name: fktextfield847852; Type: FK CONSTRAINT; Schema: mod_metadata; Owner: -
--

ALTER TABLE ONLY textfield
    ADD CONSTRAINT fktextfield847852 FOREIGN KEY (idcomponent) REFERENCES component(idcomponent);


--
-- TOC entry 1876 (class 0 OID 0)
-- Dependencies: 5
-- Name: mod_metadata; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA mod_metadata FROM PUBLIC;
REVOKE ALL ON SCHEMA mod_metadata FROM postgres;
GRANT ALL ON SCHEMA mod_metadata TO postgres;
GRANT ALL ON SCHEMA mod_metadata TO PUBLIC;


-- Completed on 2011-02-25 19:31:36

--
-- PostgreSQL database dump complete
--

