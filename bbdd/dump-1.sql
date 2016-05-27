--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: dbdsgnr; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dbdsgnr;


ALTER SCHEMA dbdsgnr OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = dbdsgnr, pg_catalog;

--
-- Name: function_check_user_privileges(); Type: FUNCTION; Schema: dbdsgnr; Owner: postgres
--

CREATE FUNCTION function_check_user_privileges() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
        current_user_oid OID;
        postgres_user_oid OID;
        current_user_has_privileges BOOLEAN;
    BEGIN
        SELECT usesysid INTO current_user_oid FROM pg_catalog.pg_user WHERE usename = current_user;
        SELECT usesysid INTO postgres_user_oid FROM pg_catalog.pg_user WHERE usename = 'postgres';
        current_user_has_privileges := (current_user_oid = ANY(OLD.roles_with_privileges));
        -- check if the user is in a group with privileges
        IF NOT current_user_has_privileges THEN
            SELECT TRUE INTO current_user_has_privileges
            FROM pg_catalog.pg_group
            WHERE
                current_user_oid = ANY (grolist)
                AND grosysid = ANY(OLD.roles_with_privileges);
            IF NOT FOUND THEN
                current_user_has_privileges := FALSE;
            END IF;
        END IF;

        IF TG_OP = 'DELETE' THEN
            IF current_user_oid = OLD.owner OR current_user_oid = postgres_user_oid THEN
                RETURN OLD;
            ELSE 
                RAISE EXCEPTION 'Only the owner and the user postgres have privileges to drop diagram "%"', OLD.name;
            END IF;
        ELSEIF TG_OP = 'UPDATE' THEN
            IF current_user_oid = OLD.owner OR current_user_oid = postgres_user_oid THEN
                NEW.last_update := NOW();
                RETURN NEW;
            ELSEIF NOT current_user_has_privileges THEN
                RAISE EXCEPTION 'You do not have privileges to modify diagram "%"', OLD.name;
            ELSEIF OLD.erdiagram_id != NEW.erdiagram_id OR OLD.roles_with_privileges != NEW.roles_with_privileges
            OR OLD.owner != NEW.owner OR OLD.date_created != NEW.date_created
            OR OLD.pg_schema != NEW.pg_schema OR OLD.pg_database != NEW.pg_database THEN
                RAISE EXCEPTION 'Only the owner and the user postgres can change those properties';
            END IF;
            NEW.last_update := NOW();
            RETURN NEW;
        END IF;
    END;
$$;


ALTER FUNCTION dbdsgnr.function_check_user_privileges() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: erdiagrams; Type: TABLE; Schema: dbdsgnr; Owner: postgres; Tablespace: 
--

CREATE TABLE erdiagrams (
    erdiagram_id integer NOT NULL,
    name name,
    comment text,
    roles_with_privileges oid[],
    owner oid,
    date_created timestamp without time zone DEFAULT now(),
    last_update timestamp without time zone DEFAULT now(),
    pg_schema oid,
    pg_database oid,
    data text
);


ALTER TABLE dbdsgnr.erdiagrams OWNER TO postgres;

--
-- Name: erdiagrams_erdiagram_id_seq; Type: SEQUENCE; Schema: dbdsgnr; Owner: postgres
--

CREATE SEQUENCE erdiagrams_erdiagram_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbdsgnr.erdiagrams_erdiagram_id_seq OWNER TO postgres;

--
-- Name: erdiagrams_erdiagram_id_seq; Type: SEQUENCE OWNED BY; Schema: dbdsgnr; Owner: postgres
--

ALTER SEQUENCE erdiagrams_erdiagram_id_seq OWNED BY erdiagrams.erdiagram_id;


SET search_path = public, pg_catalog;

--
-- Name: categ_siu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categ_siu (
    codigo_siu character(4) DEFAULT ''::bpchar NOT NULL,
    descripcion character(45) DEFAULT ''::bpchar NOT NULL,
    escalafon character(1)
);


ALTER TABLE public.categ_siu OWNER TO postgres;

--
-- Name: escalafon; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE escalafon (
    id_escalafon character(1) NOT NULL,
    descripcion character(15) NOT NULL
);


ALTER TABLE public.escalafon OWNER TO postgres;

--
-- Name: mocovi_costo_categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_costo_categoria (
    id_costo_categoria integer NOT NULL,
    id_periodo integer,
    codigo_siu character(4),
    costo_basico numeric,
    costo_diario numeric
);


ALTER TABLE public.mocovi_costo_categoria OWNER TO postgres;

--
-- Name: mocovi_costo_categoria_id_costo_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_costo_categoria_id_costo_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_costo_categoria_id_costo_categoria_seq OWNER TO postgres;

--
-- Name: mocovi_costo_categoria_id_costo_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_costo_categoria_id_costo_categoria_seq OWNED BY mocovi_costo_categoria.id_costo_categoria;


--
-- Name: mocovi_descentralizado_cargos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_descentralizado_cargos (
    id_cargo integer NOT NULL,
    id_periodo integer,
    id_unidad character(5),
    id_categoria character(4),
    id_programa integer,
    id_tipo_gasto integer,
    id_escalafon character(1),
    cantidad numeric,
    descripcion character varying,
    contratado boolean,
    id_fuente integer
);


ALTER TABLE public.mocovi_descentralizado_cargos OWNER TO postgres;

--
-- Name: mocovi_descentralizado_cargos_id_cargo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_descentralizado_cargos_id_cargo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_descentralizado_cargos_id_cargo_seq OWNER TO postgres;

--
-- Name: mocovi_descentralizado_cargos_id_cargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_descentralizado_cargos_id_cargo_seq OWNED BY mocovi_descentralizado_cargos.id_cargo;


--
-- Name: mocovi_descentralizado_fuente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_descentralizado_fuente (
    id_fuente integer NOT NULL,
    tipo character(20)
);


ALTER TABLE public.mocovi_descentralizado_fuente OWNER TO postgres;

--
-- Name: mocovi_descentralizado_ingresos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_descentralizado_ingresos (
    id_ingresos integer NOT NULL,
    id_periodo integer,
    id_unidad character(5),
    id_fuente integer,
    descripcion character varying,
    monto numeric
);


ALTER TABLE public.mocovi_descentralizado_ingresos OWNER TO postgres;

--
-- Name: mocovi_descentralizado_ingresos_id_ingresos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_descentralizado_ingresos_id_ingresos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_descentralizado_ingresos_id_ingresos_seq OWNER TO postgres;

--
-- Name: mocovi_descentralizado_ingresos_id_ingresos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_descentralizado_ingresos_id_ingresos_seq OWNED BY mocovi_descentralizado_ingresos.id_ingresos;


--
-- Name: mocovi_descentralizado_objeto_del_gasto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_descentralizado_objeto_del_gasto (
    id_objeto_del_gasto integer NOT NULL,
    codigo_completo character varying,
    nombre character varying,
    elemento_padre integer,
    elemento integer,
    componente character varying,
    codigo integer,
    presupuestable boolean
);


ALTER TABLE public.mocovi_descentralizado_objeto_del_gasto OWNER TO postgres;

--
-- Name: mocovi_descentralizado_objeto_del_gasto_id_objeto_del_gasto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_descentralizado_objeto_del_gasto_id_objeto_del_gasto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_descentralizado_objeto_del_gasto_id_objeto_del_gasto_seq OWNER TO postgres;

--
-- Name: mocovi_descentralizado_objeto_del_gasto_id_objeto_del_gasto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_descentralizado_objeto_del_gasto_id_objeto_del_gasto_seq OWNED BY mocovi_descentralizado_objeto_del_gasto.id_objeto_del_gasto;


--
-- Name: mocovi_descentralizado_permutas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_descentralizado_permutas (
    id_permutas integer NOT NULL,
    id_tipo_permuta integer,
    id_tipo_gasto integer,
    id_periodo integer,
    id_escalafon character(1),
    id_categoria character(4),
    id_unidad character(5),
    id_programa integer,
    id_unidad_permuta character(5),
    id_programa_permuta integer,
    cantidad numeric,
    descripcion character varying
);


ALTER TABLE public.mocovi_descentralizado_permutas OWNER TO postgres;

--
-- Name: mocovi_descentralizado_permutas_id_permutas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_descentralizado_permutas_id_permutas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_descentralizado_permutas_id_permutas_seq OWNER TO postgres;

--
-- Name: mocovi_descentralizado_permutas_id_permutas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_descentralizado_permutas_id_permutas_seq OWNED BY mocovi_descentralizado_permutas.id_permutas;


--
-- Name: mocovi_descentralizado_politica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_descentralizado_politica (
    id_politica integer NOT NULL,
    id_periodo integer,
    id_unidad character(5),
    politica character varying
);


ALTER TABLE public.mocovi_descentralizado_politica OWNER TO postgres;

--
-- Name: mocovi_descentralizado_politica_id_politica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_descentralizado_politica_id_politica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_descentralizado_politica_id_politica_seq OWNER TO postgres;

--
-- Name: mocovi_descentralizado_politica_id_politica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_descentralizado_politica_id_politica_seq OWNED BY mocovi_descentralizado_politica.id_politica;


--
-- Name: mocovi_descentralizado_presupuesto_general; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_descentralizado_presupuesto_general (
    id_presupuesto integer NOT NULL,
    id_periodo integer,
    id_unidad character(5),
    id_objeto_del_gasto integer,
    id_tipo_gasto integer,
    id_programa integer,
    monto numeric,
    inciso integer,
    descripcion character varying,
    id_fuente integer
);


ALTER TABLE public.mocovi_descentralizado_presupuesto_general OWNER TO postgres;

--
-- Name: mocovi_descentralizado_presupuesto_general_id_prespuesto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_descentralizado_presupuesto_general_id_prespuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_descentralizado_presupuesto_general_id_prespuesto_seq OWNER TO postgres;

--
-- Name: mocovi_descentralizado_presupuesto_general_id_prespuesto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_descentralizado_presupuesto_general_id_prespuesto_seq OWNED BY mocovi_descentralizado_presupuesto_general.id_presupuesto;


--
-- Name: mocovi_descentralizado_tipo_gasto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_descentralizado_tipo_gasto (
    id_tipo_gasto integer NOT NULL,
    tipo_gasto character(20)
);


ALTER TABLE public.mocovi_descentralizado_tipo_gasto OWNER TO postgres;

--
-- Name: mocovi_descentralizado_tipo_gasto_id_tipo_gasto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_descentralizado_tipo_gasto_id_tipo_gasto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_descentralizado_tipo_gasto_id_tipo_gasto_seq OWNER TO postgres;

--
-- Name: mocovi_descentralizado_tipo_gasto_id_tipo_gasto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_descentralizado_tipo_gasto_id_tipo_gasto_seq OWNED BY mocovi_descentralizado_tipo_gasto.id_tipo_gasto;


--
-- Name: mocovi_descentralizado_tipo_ingresos_id_tipo_ingresos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_descentralizado_tipo_ingresos_id_tipo_ingresos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_descentralizado_tipo_ingresos_id_tipo_ingresos_seq OWNER TO postgres;

--
-- Name: mocovi_descentralizado_tipo_ingresos_id_tipo_ingresos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_descentralizado_tipo_ingresos_id_tipo_ingresos_seq OWNED BY mocovi_descentralizado_fuente.id_fuente;


--
-- Name: mocovi_descentralizado_tipo_permuta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_descentralizado_tipo_permuta (
    id_tipo_permuta integer NOT NULL,
    tipo_permuta character varying
);


ALTER TABLE public.mocovi_descentralizado_tipo_permuta OWNER TO postgres;

--
-- Name: mocovi_descentralizado_tipo_permuta_id_tipo_permuta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_descentralizado_tipo_permuta_id_tipo_permuta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_descentralizado_tipo_permuta_id_tipo_permuta_seq OWNER TO postgres;

--
-- Name: mocovi_descentralizado_tipo_permuta_id_tipo_permuta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_descentralizado_tipo_permuta_id_tipo_permuta_seq OWNED BY mocovi_descentralizado_tipo_permuta.id_tipo_permuta;


--
-- Name: mocovi_periodo_presupuestario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_periodo_presupuestario (
    id_periodo integer NOT NULL,
    anio integer,
    fecha_inicio date,
    fecha_fin date,
    fecha_ultima_liquidacion date,
    actual boolean,
    id_liqui_ini integer,
    id_liqui_fin integer,
    id_liqui_1sac integer,
    id_liqui_2sac integer,
    presupuestando boolean,
    activo_para_carga_presupuestando boolean
);


ALTER TABLE public.mocovi_periodo_presupuestario OWNER TO postgres;

--
-- Name: mocovi_periodo_presupuestario_id_periodo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_periodo_presupuestario_id_periodo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_periodo_presupuestario_id_periodo_seq OWNER TO postgres;

--
-- Name: mocovi_periodo_presupuestario_id_periodo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_periodo_presupuestario_id_periodo_seq OWNED BY mocovi_periodo_presupuestario.id_periodo;


--
-- Name: mocovi_programa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_programa (
    id_programa integer NOT NULL,
    id_unidad character(5),
    id_tipo_programa integer,
    nombre character varying,
    area integer,
    sub_area integer,
    sub_sub_area integer,
    fuente integer,
    imputacion character varying
);


ALTER TABLE public.mocovi_programa OWNER TO postgres;

--
-- Name: mocovi_programa_id_programa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_programa_id_programa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_programa_id_programa_seq OWNER TO postgres;

--
-- Name: mocovi_programa_id_programa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_programa_id_programa_seq OWNED BY mocovi_programa.id_programa;


--
-- Name: mocovi_tipo_dependencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_tipo_dependencia (
    id_tipo_dependencia integer NOT NULL,
    tipo character(60) NOT NULL
);


ALTER TABLE public.mocovi_tipo_dependencia OWNER TO postgres;

--
-- Name: mocovi_tipo_dependencia_id_tipo_dependencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mocovi_tipo_dependencia_id_tipo_dependencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mocovi_tipo_dependencia_id_tipo_dependencia_seq OWNER TO postgres;

--
-- Name: mocovi_tipo_dependencia_id_tipo_dependencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mocovi_tipo_dependencia_id_tipo_dependencia_seq OWNED BY mocovi_tipo_dependencia.id_tipo_dependencia;


--
-- Name: mocovi_tipo_programa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mocovi_tipo_programa (
    id_tipo_programa integer NOT NULL,
    tipo character varying
);


ALTER TABLE public.mocovi_tipo_programa OWNER TO postgres;

--
-- Name: unidad_acad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_acad (
    sigla character(5) NOT NULL,
    descripcion character(60) NOT NULL,
    nro_tab6 integer,
    cod_regional character(4),
    id_tipo_dependencia integer
);


ALTER TABLE public.unidad_acad OWNER TO postgres;

SET search_path = dbdsgnr, pg_catalog;

--
-- Name: erdiagram_id; Type: DEFAULT; Schema: dbdsgnr; Owner: postgres
--

ALTER TABLE ONLY erdiagrams ALTER COLUMN erdiagram_id SET DEFAULT nextval('erdiagrams_erdiagram_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: id_costo_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_costo_categoria ALTER COLUMN id_costo_categoria SET DEFAULT nextval('mocovi_costo_categoria_id_costo_categoria_seq'::regclass);


--
-- Name: id_cargo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_cargos ALTER COLUMN id_cargo SET DEFAULT nextval('mocovi_descentralizado_cargos_id_cargo_seq'::regclass);


--
-- Name: id_ingresos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_ingresos ALTER COLUMN id_ingresos SET DEFAULT nextval('mocovi_descentralizado_ingresos_id_ingresos_seq'::regclass);


--
-- Name: id_objeto_del_gasto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_objeto_del_gasto ALTER COLUMN id_objeto_del_gasto SET DEFAULT nextval('mocovi_descentralizado_objeto_del_gasto_id_objeto_del_gasto_seq'::regclass);


--
-- Name: id_permutas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_permutas ALTER COLUMN id_permutas SET DEFAULT nextval('mocovi_descentralizado_permutas_id_permutas_seq'::regclass);


--
-- Name: id_politica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_politica ALTER COLUMN id_politica SET DEFAULT nextval('mocovi_descentralizado_politica_id_politica_seq'::regclass);


--
-- Name: id_presupuesto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_presupuesto_general ALTER COLUMN id_presupuesto SET DEFAULT nextval('mocovi_descentralizado_presupuesto_general_id_prespuesto_seq'::regclass);


--
-- Name: id_tipo_gasto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_tipo_gasto ALTER COLUMN id_tipo_gasto SET DEFAULT nextval('mocovi_descentralizado_tipo_gasto_id_tipo_gasto_seq'::regclass);


--
-- Name: id_tipo_permuta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_tipo_permuta ALTER COLUMN id_tipo_permuta SET DEFAULT nextval('mocovi_descentralizado_tipo_permuta_id_tipo_permuta_seq'::regclass);


--
-- Name: id_periodo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_periodo_presupuestario ALTER COLUMN id_periodo SET DEFAULT nextval('mocovi_periodo_presupuestario_id_periodo_seq'::regclass);


--
-- Name: id_programa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_programa ALTER COLUMN id_programa SET DEFAULT nextval('mocovi_programa_id_programa_seq'::regclass);


--
-- Name: id_tipo_dependencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_tipo_dependencia ALTER COLUMN id_tipo_dependencia SET DEFAULT nextval('mocovi_tipo_dependencia_id_tipo_dependencia_seq'::regclass);


SET search_path = dbdsgnr, pg_catalog;

--
-- Data for Name: erdiagrams; Type: TABLE DATA; Schema: dbdsgnr; Owner: postgres
--



--
-- Name: erdiagrams_erdiagram_id_seq; Type: SEQUENCE SET; Schema: dbdsgnr; Owner: postgres
--

SELECT pg_catalog.setval('erdiagrams_erdiagram_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- Data for Name: categ_siu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categ_siu VALUES ('ADJ1', 'Profesor Adjunto Simple                      ', 'D');
INSERT INTO categ_siu VALUES ('ADJE', 'Profesor Adjunto Exclusivo                   ', 'D');
INSERT INTO categ_siu VALUES ('ADJS', 'Profesor Adjunto Semi-Exclusivo              ', 'D');
INSERT INTO categ_siu VALUES ('ASO1', 'Profesor Asociado Simple                     ', 'D');
INSERT INTO categ_siu VALUES ('ASOE', 'Profesor Asociado Exclusivo                  ', 'D');
INSERT INTO categ_siu VALUES ('ASOS', 'Profesor Asociado Semi-Exclusivo             ', 'D');
INSERT INTO categ_siu VALUES ('AY11', 'Ayudante de Primera Simple                   ', 'D');
INSERT INTO categ_siu VALUES ('AY1E', 'Ayudante de Primera Exclusivo                ', 'D');
INSERT INTO categ_siu VALUES ('AY1S', 'Ayudante de Primera Semi-Exclusiva           ', 'D');
INSERT INTO categ_siu VALUES ('AY21', 'Ayudante de Segunda Simple                   ', 'D');
INSERT INTO categ_siu VALUES ('JTP1', 'Jefe de Trabajos Prácticos Simple            ', 'D');
INSERT INTO categ_siu VALUES ('JTPE', 'Jefe de Trabajos Prácticos Exclusivo         ', 'D');
INSERT INTO categ_siu VALUES ('JTPS', 'Jefe de Trabajos Prácticos Semi-Exclusivo    ', 'D');
INSERT INTO categ_siu VALUES ('TIT1', 'Profesor Titular Simple                      ', 'D');
INSERT INTO categ_siu VALUES ('TITE', 'Profesor Titular Exclusivo                   ', 'D');
INSERT INTO categ_siu VALUES ('TITS', 'Profesor Titular Semi-Exclusivo              ', 'D');
INSERT INTO categ_siu VALUES ('VREE', 'Vice Rector                                  ', 'S');
INSERT INTO categ_siu VALUES ('SEFP', 'Secretario de Facultad Parcial               ', 'S');
INSERT INTO categ_siu VALUES ('RECT', 'Rector                                       ', 'S');
INSERT INTO categ_siu VALUES ('SEFC', 'Secretario de Facultad Tiempo Completo       ', 'S');
INSERT INTO categ_siu VALUES ('DECP', 'Decano de Facultad Parcial                   ', 'S');
INSERT INTO categ_siu VALUES ('SEFE', 'Secretario de Facultad Exclusivo             ', 'S');
INSERT INTO categ_siu VALUES ('SEUE', 'Secretario de Universidad Exclusivo          ', 'S');
INSERT INTO categ_siu VALUES ('VDEE', 'Vice Decano Facultad Exclusivo               ', 'S');
INSERT INTO categ_siu VALUES ('DECE', 'Decano de Facultad Exclusivo                 ', 'S');
INSERT INTO categ_siu VALUES ('01  ', 'Cat. 1 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('02  ', 'Cat. 2 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('03  ', 'Cat. 3 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('04  ', 'Cat. 4 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('05  ', 'Cat. 5 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('06  ', 'Cat. 6 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('07  ', 'Cat. 7 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('SEF1', 'Secretario de Facultad Simple                ', 'S');
INSERT INTO categ_siu VALUES ('VDE1', 'Vice Decano Facultad Simple                  ', 'S');
INSERT INTO categ_siu VALUES ('VDEC', 'Vice Decano Facultad Tiempo Completo         ', 'S');
INSERT INTO categ_siu VALUES ('VDEP', 'Vice Decano Facultad Parcial                 ', 'S');


--
-- Data for Name: escalafon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO escalafon VALUES ('D', 'Docente        ');
INSERT INTO escalafon VALUES ('N', 'No Docente     ');
INSERT INTO escalafon VALUES ('S', 'Superior       ');


--
-- Data for Name: mocovi_costo_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_costo_categoria VALUES (5, 1, 'ASOE', NULL, 653.269);
INSERT INTO mocovi_costo_categoria VALUES (2, 1, 'ADJE', NULL, 577.258);
INSERT INTO mocovi_costo_categoria VALUES (12, 1, 'JTPE', NULL, 501.247);
INSERT INTO mocovi_costo_categoria VALUES (8, 1, 'AY1E', NULL, 425.236);
INSERT INTO mocovi_costo_categoria VALUES (16, 1, 'TITS', NULL, 364.641);
INSERT INTO mocovi_costo_categoria VALUES (6, 1, 'ASOS', NULL, 326.635);
INSERT INTO mocovi_costo_categoria VALUES (3, 1, 'ADJS', NULL, 288.630);
INSERT INTO mocovi_costo_categoria VALUES (13, 1, 'JTPS', NULL, 250.624);
INSERT INTO mocovi_costo_categoria VALUES (9, 1, 'AY1S', NULL, 212.618);
INSERT INTO mocovi_costo_categoria VALUES (14, 1, 'TIT1', NULL, 182.318);
INSERT INTO mocovi_costo_categoria VALUES (4, 1, 'ASO1', NULL, 163.315);
INSERT INTO mocovi_costo_categoria VALUES (1, 1, 'ADJ1', NULL, 144.313);
INSERT INTO mocovi_costo_categoria VALUES (11, 1, 'JTP1', NULL, 125.311);
INSERT INTO mocovi_costo_categoria VALUES (7, 1, 'AY11', NULL, 106.308);
INSERT INTO mocovi_costo_categoria VALUES (10, 1, 'AY21', NULL, 85.046);
INSERT INTO mocovi_costo_categoria VALUES (15, 1, 'TITE', 14626, 729.29643835616);
INSERT INTO mocovi_costo_categoria VALUES (19, 2, 'TITE', 19123.71, 950.9604426229508197);
INSERT INTO mocovi_costo_categoria VALUES (20, 2, 'ASOE', 17114.33, 851.0404535519125683);
INSERT INTO mocovi_costo_categoria VALUES (21, 2, 'ADJE', 15104.96, 751.1209617486338798);
INSERT INTO mocovi_costo_categoria VALUES (22, 2, 'JTPE', 13095.58, 651.2009726775956284);
INSERT INTO mocovi_costo_categoria VALUES (23, 2, 'AY1E', 11086.21, 551.2814808743169399);
INSERT INTO mocovi_costo_categoria VALUES (24, 2, 'TITS', 9561.87, 475.4809672131147541);
INSERT INTO mocovi_costo_categoria VALUES (25, 2, 'ASOS', 8557.18, 425.5209726775956284);
INSERT INTO mocovi_costo_categoria VALUES (26, 2, 'ADJS', 7552.49, 375.5609781420765027);
INSERT INTO mocovi_costo_categoria VALUES (27, 2, 'JTPS', 6547.8, 325.6009836065573770);
INSERT INTO mocovi_costo_categoria VALUES (28, 2, 'AY1S', 5543.11, 275.6409890710382514);
INSERT INTO mocovi_costo_categoria VALUES (29, 2, 'TIT1', 4780.87, 237.7372513661202186);
INSERT INTO mocovi_costo_categoria VALUES (30, 2, 'ASO1', 4278.54, 212.7580000000000000);
INSERT INTO mocovi_costo_categoria VALUES (31, 2, 'ADJ1', 3776.2, 187.7782513661202186);
INSERT INTO mocovi_costo_categoria VALUES (32, 2, 'JTP1', 3273.86, 162.7985027322404372);
INSERT INTO mocovi_costo_categoria VALUES (33, 2, 'AY11', 2771.52, 137.8187540983606557);
INSERT INTO mocovi_costo_categoria VALUES (34, 2, 'AY21', 2217.22, 110.2552021857923497);


--
-- Name: mocovi_costo_categoria_id_costo_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_costo_categoria_id_costo_categoria_seq', 34, true);


--
-- Data for Name: mocovi_descentralizado_cargos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_descentralizado_cargos VALUES (14, 2, 'ASMA ', '05  ', 16, 1, 'N', 1, 'Tito', true, 11);


--
-- Name: mocovi_descentralizado_cargos_id_cargo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_descentralizado_cargos_id_cargo_seq', 14, true);


--
-- Data for Name: mocovi_descentralizado_fuente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_descentralizado_fuente VALUES (11, '11 Tesoro Nacional  ');
INSERT INTO mocovi_descentralizado_fuente VALUES (12, '12 Recursos Propios ');
INSERT INTO mocovi_descentralizado_fuente VALUES (13, '13 Rec. Afec. Esp   ');
INSERT INTO mocovi_descentralizado_fuente VALUES (14, '14 Transf. Int.     ');


--
-- Data for Name: mocovi_descentralizado_ingresos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_descentralizado_ingresos VALUES (8, 2, 'FALE ', 12, 'Cursos', 100000);


--
-- Name: mocovi_descentralizado_ingresos_id_ingresos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_descentralizado_ingresos_id_ingresos_seq', 8, true);


--
-- Data for Name: mocovi_descentralizado_objeto_del_gasto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (7, '1.4.0.0000', 'Asignaciones familiares', 5832, 5844, 'PP', 4, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (8, '1.5.0.0000', 'Asistencia social al personal', 5832, 5843, 'PP', 5, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (78, '1.9.0.0000', 'Personal Docente', 5832, 1000303, 'PP', 9, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (19, '2.7.0.0000', 'Productos metálicos', 5833, 5850, 'PP', 7, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (4, '1.1.0.0000', 'Docente', 5832, 5847, 'PP', 1, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (5, '1.2.0.0000', 'No Docente', 5832, 5846, 'PP', 2, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (6, '1.3.0.0000', 'Autoridades', 5832, 5845, 'PP', 3, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (3, '1.0.0.0000', 'Gastos en personal', NULL, 5832, 'IN', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (12, '2.0.0.0000', 'Bienes de consumo', NULL, 5833, 'IN', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (22, '3.0.0.0000', 'Servicios no personales', NULL, 5834, 'IN', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (24, '3.2.0.0000', 'Alquileres y derechos', 5834, 5864, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (27, '3.5.0.0000', 'Servicios comerciales y financieros', 5834, 5861, 'PP', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (28, '3.6.0.0000', 'Publicidad y propaganda', 5834, 5860, 'PP', 6, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (30, '3.8.0.0000', 'Impuestos, derechos, tasas y juicios', 5834, 5858, 'PP', 8, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (31, '3.9.0.0000', 'Otros servicios', 5834, 5857, 'PP', 9, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (32, '4.0.0.0000', 'Bienes de uso', NULL, 5835, 'IN', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (33, '4.1.0.0000', 'Bienes preexistentes', 5835, 5873, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (34, '4.2.0.0000', 'Construcciones', 5835, 5872, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (35, '4.3.0.0000', 'Maquinaria y equipo', 5835, 5871, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (36, '4.4.0.0000', 'Equipo militar y de seguridad', 5835, 5870, 'PP', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (37, '4.5.0.0000', 'Libros, revistas y otros elementos coleccionables', 5835, 5869, 'PP', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (38, '4.6.0.0000', 'Obras de arte', 5835, 5868, 'PP', 6, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (39, '4.7.0.0000', 'Semovientes', 5835, 5867, 'PP', 7, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (41, '5.0.0.0000', 'Transferencias', NULL, 5836, 'IN', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (51, '6.1.0.0000', 'Compra de acciones y participaciones de capital', 5837, 5890, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (55, '6.5.0.0000', 'Incremento de disponibilidades', 5837, 5886, 'PP', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (56, '6.6.0.0000', 'Incremento de cuentas a cobrar', 5837, 5885, 'PP', 6, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (57, '6.7.0.0000', 'Incremento de documentos a cobrar', 5837, 5884, 'PP', 7, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (60, '7.1.0.0000', 'Servicio de la deuda en moneda nacional', 5838, 5899, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (61, '7.2.0.0000', 'Servicio de la deuda en moneda extranjera', 5838, 5898, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (71, '8.3.0.0000', 'Descuentos y bonificaciones', 5839, 5902, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (23, '3.1.0.0000', 'Servicios básicos', 5834, 5865, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (25, '3.3.0.0000', 'Mantenimiento, reparación y limpieza', 5834, 5863, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (26, '3.4.0.0000', 'Servicios técnicos y profesionales', 5834, 5862, 'PP', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (29, '3.7.0.0000', 'Pasajes y viáticos', 5834, 5859, 'PP', 7, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (52, '6.2.0.0000', 'Préstamos a corto plazo', 5837, 5889, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (53, '6.3.0.0000', 'Préstamos a largo plazo', 5837, 5888, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (54, '6.4.0.0000', 'Adquisicion de títulos y valores', 5837, 5887, 'PP', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (62, '7.3.0.0000', 'Intereses por préstamos recibidos', 5838, 5897, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (63, '7.4.0.0000', 'Disminución de préstamos a corto plazo', 5838, 5896, 'PP', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (64, '7.5.0.0000', 'Disminución de préstamos a largo plazo', 5838, 5895, 'PP', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (65, '7.6.0.0000', 'Disminución de cuentas y documentos a pagar', 5838, 5894, 'PP', 6, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (67, '7.8.0.0000', 'Disminución de otros pasivos', 5838, 5892, 'PP', 8, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (69, '8.1.0.0000', 'Intereses de instituciones públicas financieras', 5839, 5904, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (70, '8.2.0.0000', 'Depreciación y amortización', 5839, 5903, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (72, '8.4.0.0000', 'Otras pérdidas', 5839, 5901, 'PP', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (73, '8.5.0.0000', 'Disminución del patrimonio', 5839, 5900, 'PP', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (75, '9.1.0.0000', 'Gastos figurativos de la administración nacional para transacciones corrientes', 5840, 5907, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (76, '9.2.0.0000', 'Gastos figurativos de la administración nacional para transacciones de capital', 5840, 5906, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (77, '9.3.0.0000', 'Gastos figurativos de la administración nacional para aplicaciones financieras', 5840, 5905, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (58, '6.8.0.0000', 'Incremento de activos diferidos y adelantos a proveedores y contratistas', 5837, 5883, 'PP', 8, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (66, '7.7.0.0000', 'Disminución de depósitos en instituciones públicas financieras', 5838, 5893, 'PP', 7, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (9, '1.6.0.0000', 'Beneficios y compensaciones', 5832, 5842, 'PP', 6, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (13, '2.1.0.0000', 'Bienes de Consumo', 5833, 5856, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (40, '4.8.0.0000', 'Activos intangibles (Software)', 5835, 5866, 'PP', 8, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (11, '1.8.0.0000', 'Personal Contratado', 5832, 1000302, 'PP', 8, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (79, '1.10.0.0000', 'Personal No Docente', 5832, 1000304, 'PP', 10, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (10, '1.7.0.0000', 'Gabinete de autoridades superiores', 5832, 5841, 'PP', 7, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (43, '5.1.5.0000', 'Transferencias a instituciones de enseñanza', 5836, 5881, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (14, '2.2.0.0000', 'Textiles y vestuario', 5833, 5855, 'PP', 2, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (16, '2.4.0.0000', 'Productos de cuero y caucho', 5833, 5853, 'PP', 4, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (20, '2.8.0.0000', 'Minerales', 5833, 5849, 'PP', 8, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (21, '2.9.0.0000', 'Otros bienes de consumo', 5833, 5848, 'PP', 9, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (15, '2.3.0.0000', 'Productos de papel, cartón e impresos', 5833, 5854, 'PP', 3, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (17, '2.5.0.0000', 'Productos químicos, combustibles y lubricantes', 5833, 5852, 'PP', 5, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (18, '2.6.0.0000', 'Productos de minerales no metálicos', 5833, 5851, 'PP', 6, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (42, '5.1.3.0000', 'Becas', 5836, 5882, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (44, '5.1.7.0000', 'Transferencias a otras instituciones culturales', 5836, 5880, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (49, '5.9.0.0000', 'Otras Transferencias', 5836, 5874, 'PP', 9, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (48, '5.8.0.0000', 'Transferencias a instituciones provinciales y municipales para financiar gastos de capital', 5836, 5875, 'PP', 8, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (47, '5.7.0.0000', 'Transferencias a instituciones provinciales y municipales para financiar gastos corrientes', 5836, 5876, 'PP', 7, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (46, '5.6.0.0000', 'Transferencias a universidades nacionales', 5836, 5877, 'PP', 6, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (45, '5.5.0.0000', 'Transferencias a otras entidades del sector público nacional', 5836, 5878, 'PP', 5, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (50, '6.0.0.0000', 'Activos financieros', NULL, 5837, 'IN', 6, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (59, '7.0.0.0000', 'Servicio de la deuda y disminución de otros pasivos', NULL, 5838, 'IN', 7, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (68, '8.0.0.0000', 'Otros gastos', NULL, 5839, 'IN', 8, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (74, '9.0.0.0000', 'Gastos figurativos', NULL, 5840, 'IN', 9, false);


--
-- Name: mocovi_descentralizado_objeto_del_gasto_id_objeto_del_gasto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_descentralizado_objeto_del_gasto_id_objeto_del_gasto_seq', 79, true);


--
-- Data for Name: mocovi_descentralizado_permutas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_descentralizado_permutas VALUES (6, 1, 1, 2, NULL, 'TITE', 'ASMA ', 16, 'FALE ', 24, 4, NULL);
INSERT INTO mocovi_descentralizado_permutas VALUES (7, 2, 1, 2, NULL, 'ADJE', 'FALE ', 24, 'FADE ', 21, 1, NULL);


--
-- Name: mocovi_descentralizado_permutas_id_permutas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_descentralizado_permutas_id_permutas_seq', 7, true);


--
-- Data for Name: mocovi_descentralizado_politica; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_descentralizado_politica VALUES (15, 2, 'ASMA ', 'Politica');


--
-- Name: mocovi_descentralizado_politica_id_politica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_descentralizado_politica_id_politica_seq', 15, true);


--
-- Data for Name: mocovi_descentralizado_presupuesto_general; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_descentralizado_presupuesto_general VALUES (11, 2, 'ASMA ', 11, 1, 16, 111, 5832, NULL, 11);


--
-- Name: mocovi_descentralizado_presupuesto_general_id_prespuesto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_descentralizado_presupuesto_general_id_prespuesto_seq', 11, true);


--
-- Data for Name: mocovi_descentralizado_tipo_gasto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_descentralizado_tipo_gasto VALUES (2, 'Nuevas Acciones     ');
INSERT INTO mocovi_descentralizado_tipo_gasto VALUES (1, 'Servicios Existentes');


--
-- Name: mocovi_descentralizado_tipo_gasto_id_tipo_gasto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_descentralizado_tipo_gasto_id_tipo_gasto_seq', 2, true);


--
-- Name: mocovi_descentralizado_tipo_ingresos_id_tipo_ingresos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_descentralizado_tipo_ingresos_id_tipo_ingresos_seq', 3, true);


--
-- Data for Name: mocovi_descentralizado_tipo_permuta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_descentralizado_tipo_permuta VALUES (1, 'Cede');
INSERT INTO mocovi_descentralizado_tipo_permuta VALUES (2, 'Recibe');


--
-- Name: mocovi_descentralizado_tipo_permuta_id_tipo_permuta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_descentralizado_tipo_permuta_id_tipo_permuta_seq', 2, true);


--
-- Data for Name: mocovi_periodo_presupuestario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_periodo_presupuestario VALUES (1, 2015, '2015-02-01', '2016-01-31', NULL, false, NULL, NULL, NULL, NULL, false, false);
INSERT INTO mocovi_periodo_presupuestario VALUES (2, 2016, '2016-02-01', '2017-01-31', '2016-04-01', true, 468, 469, 473, 480, true, true);


--
-- Name: mocovi_periodo_presupuestario_id_periodo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_periodo_presupuestario_id_periodo_seq', 1, false);


--
-- Data for Name: mocovi_programa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_programa VALUES (128, 'FACE ', 11, 'Extensión FACE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (129, 'FACE ', 12, 'Investigación FACE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (130, 'FACE ', 13, 'Post-Grado FACE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (131, 'FACE ', 14, 'Bienestar FACE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (132, 'FADE ', 11, 'Extensión FADE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (133, 'FADE ', 12, 'Investigación FADE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (134, 'FADE ', 13, 'Post-Grado FADE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (135, 'FADE ', 14, 'Bienestar FADE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (136, 'FAEA ', 11, 'Extensión FAEA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (137, 'FAEA ', 12, 'Investigación FAEA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (138, 'FAEA ', 13, 'Post-Grado FAEA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (139, 'FAEA ', 14, 'Bienestar FAEA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (140, 'FAIN ', 11, 'Extensión FAIN ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (141, 'FAIN ', 12, 'Investigación FAIN ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (142, 'FAIN ', 13, 'Post-Grado FAIN ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (143, 'FAIN ', 14, 'Bienestar FAIN ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (144, 'FALE ', 11, 'Extensión FALE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (145, 'FALE ', 12, 'Investigación FALE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (146, 'FALE ', 13, 'Post-Grado FALE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (147, 'FALE ', 14, 'Bienestar FALE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (148, 'FATU ', 11, 'Extensión FATU ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (149, 'FATU ', 12, 'Investigación FATU ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (150, 'FATU ', 13, 'Post-Grado FATU ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (151, 'FATU ', 14, 'Bienestar FATU ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (152, 'FAIF ', 11, 'Extensión FAIF ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (153, 'FAIF ', 12, 'Investigación FAIF ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (154, 'FAIF ', 13, 'Post-Grado FAIF ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (155, 'FAIF ', 14, 'Bienestar FAIF ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (156, 'FAAS ', 11, 'Extensión FAAS ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (157, 'FAAS ', 12, 'Investigación FAAS ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (158, 'FAAS ', 13, 'Post-Grado FAAS ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (159, 'FAAS ', 14, 'Bienestar FAAS ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (160, 'FATA ', 11, 'Extensión FATA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (161, 'FATA ', 12, 'Investigación FATA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (162, 'FATA ', 13, 'Post-Grado FATA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (163, 'FATA ', 14, 'Bienestar FATA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (164, 'FAME ', 11, 'Extensión FAME ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (165, 'FAME ', 12, 'Investigación FAME ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (166, 'FAME ', 13, 'Post-Grado FAME ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (167, 'FAME ', 14, 'Bienestar FAME ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (168, 'ASMA ', 11, 'Extensión ASMA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (169, 'ASMA ', 12, 'Investigación ASMA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (170, 'ASMA ', 13, 'Post-Grado ASMA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (171, 'ASMA ', 14, 'Bienestar ASMA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (172, 'AUZA ', 11, 'Extensión AUZA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (47, 'FALE ', 10, 'FRH en Tec. Adm. Sist. y Software Libre (FALE)', 29, 15, 19, 11, 'A.0001.029.015.019.11.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (48, 'FALE ', 2, 'FRH en Enfermería (Sede: Viedma) - FALE', 29, 7, 19, 11, 'A.0001.029.007.019.11.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (49, 'FAME ', 2, 'FRH en Enfermería (Sede: Viedma) - FAME', 29, 7, 27, 11, 'A.0001.029.007.027.11.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (50, 'FALE ', 2, 'FRH en Enfermería (Sede: Bariloche) - FALE', 29, 6, 19, 11, NULL);
INSERT INTO mocovi_programa VALUES (20, 'FACA ', 1, 'FRH en Cs. Agrarias', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (53, 'FAHU ', 5, 'FRH en Topografía', 29, 13, 24, 11, NULL);
INSERT INTO mocovi_programa VALUES (11, 'FACE ', 1, 'FRH en Cs. de la Educación', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (21, 'FADE ', 1, 'FRH en Derecho y Cs. Sociales', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (8, 'FAEA ', 1, 'FRH en Economia, Adm. y Matemática', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (1, 'FAIF ', 1, 'FRH en Informática', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (9, 'FAHU ', 1, 'FRH en Humanidades', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (23, 'FAIN ', 1, 'FRH en Ingenierías, Geología y Prof.', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (17, 'CRUB ', 1, 'FRH en Acuicultura, Biología y Educ. Física', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (18, 'CUZA ', 1, 'FRH en Adm. Pública, Psicop. y Cs. Políticas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (28, 'ESCM ', 1, 'FRH en Ciencias Marinas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (16, 'ASMA ', 1, 'FRH en Tec. Forestal y Esp. Verdes', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (14, 'AUZA ', 1, 'FRH en Minería, Planta y Analisis de Menas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (26, 'FATA ', 1, 'FRH en Cs. y Tecnol. de los Alimentos', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (19, 'FAAS ', 1, 'FRH en Cs. del Ambiente y la Salud', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (24, 'FALE ', 1, 'FRH en Lenguas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (25, 'FAME ', 1, 'FRH en Cs. Médicas', 27, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (31, 'CUZA ', 2, 'FRH en Enfermería (Sede: Viedma)', 29, 7, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (32, 'CRUB ', 2, 'FRH en Enfermería (Sede: Bariloche)', 29, 6, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (34, 'FAAS ', 8, 'FRH en Tec. Sup. Higiene y Seg. Trabajo (Sede: Las Lajas)', 26, 7, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (54, 'FALE ', 5, 'FRH en Topografía', 29, 13, 19, 11, NULL);
INSERT INTO mocovi_programa VALUES (52, 'FAEA ', 5, 'FRH en Topografía', 29, 13, 23, 11, NULL);
INSERT INTO mocovi_programa VALUES (55, 'FAIF ', 5, 'FRH en Topografía', 29, 13, 33, 11, NULL);
INSERT INTO mocovi_programa VALUES (41, 'CUZA ', 9, 'FRH en Lengua y Com. Oral y Escrita', 29, 12, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (42, 'CUZA ', 10, 'FRH en Tec. Adm. Sist. y Software Libre', 29, 15, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (12, 'FACE ', 4, 'FRH en Cs Humanas (PROHUM)', 20, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (35, 'CRUB ', 4, 'FRH en Cs Humanas (PROHUM)', 17, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (37, 'CUZA ', 4, 'FRH en Cs Humanas (PROHUM)', 16, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (10, 'FAHU ', 4, 'FRH en Cs Humanas (PROHUM)', 24, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (36, 'FALE ', 4, 'FRH en Cs Humanas (PROHUM)', 19, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (173, 'AUZA ', 12, 'Investigación AUZA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (174, 'AUZA ', 13, 'Post-Grado AUZA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (175, 'AUZA ', 14, 'Bienestar AUZA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (176, 'FAHU ', 11, 'Extensión FAHU ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (177, 'FAHU ', 12, 'Investigación FAHU ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (178, 'FAHU ', 13, 'Post-Grado FAHU ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (179, 'FAHU ', 14, 'Bienestar FAHU ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (180, 'FACA ', 11, 'Extensión FACA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (181, 'FACA ', 12, 'Investigación FACA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (182, 'FACA ', 13, 'Post-Grado FACA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (183, 'FACA ', 14, 'Bienestar FACA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (184, 'ESCM ', 11, 'Extensión ESCM ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (185, 'ESCM ', 12, 'Investigación ESCM ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (186, 'ESCM ', 13, 'Post-Grado ESCM ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (187, 'ESCM ', 14, 'Bienestar ESCM ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (40, 'CRUB ', 6, 'FRH en Acuicultura, Biología y Educ. Física', 29, 14, 17, 11, NULL);
INSERT INTO mocovi_programa VALUES (29, 'FAAS ', 3, 'FRH en Enfermería (Sede:Chubut)', 29, 5, 0, 14, 'A.0001.029.005.000.14.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (57, 'FAEA ', 7, 'FRH en Ingenierías (Sede: Chos Malal)', 22, 99, 23, 14, NULL);
INSERT INTO mocovi_programa VALUES (43, 'FAIN ', 7, 'FRH en Ingenierías (Sede: Chos Malal)', 22, 99, 0, 14, NULL);
INSERT INTO mocovi_programa VALUES (38, 'AUZA ', 5, 'FRH en Topografía', 29, 13, 0, 11, NULL);
INSERT INTO mocovi_programa VALUES (39, 'FACE ', 6, 'FACE-Prog. Unificacion de cargos', 29, 14, 20, 11, NULL);
INSERT INTO mocovi_programa VALUES (2, 'FAIF ', 8, 'FRH Tec. Desarrollo Web (Sede: Chos Malal)', 29, 11, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (33, 'FAAS ', 2, 'FRH en Enfermería (Sede: Zapala)', 26, 8, 0, 14, NULL);
INSERT INTO mocovi_programa VALUES (3, 'FATU ', 1, 'FRH en Turismo', 29, 0, 0, 11, '29-29_0-ACT 01-PP 11-F.F 11');
INSERT INTO mocovi_programa VALUES (30, 'FAAS ', 2, 'FRH en Enfermería (Sede:Allen-Choele Choel)', 29, 3, 0, 11, NULL);
INSERT INTO mocovi_programa VALUES (58, 'FALE ', 2, 'FRH en Enfermería (Sede:Allen-Choele Choel)', 29, 3, 19, 11, NULL);
INSERT INTO mocovi_programa VALUES (44, 'FACA ', 8, 'FRH en Tec. Espacios Verdes (Munic.Cinco Saltos)', 21, 2, NULL, 14, NULL);
INSERT INTO mocovi_programa VALUES (188, 'CRUB ', 11, 'Extensión CRUB ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (189, 'CRUB ', 12, 'Investigación CRUB ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (190, 'CRUB ', 13, 'Post-Grado CRUB ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (191, 'CRUB ', 14, 'Bienestar CRUB ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (192, 'CUZA ', 11, 'Extensión CUZA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (193, 'CUZA ', 12, 'Investigación CUZA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (194, 'CUZA ', 13, 'Post-Grado CUZA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (195, 'CUZA ', 14, 'Bienestar CUZA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (196, 'RECT ', 15, 'Actividades Centrales RECT ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (198, 'VREC ', 15, 'Actividades Centrales VREC ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (200, 'SEHA ', 15, 'Actividades Centrales SEHA ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (204, 'SEGE ', 15, 'Actividades Centrales SEGE ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (206, 'SEAC ', 15, 'Actividades Centrales SEAC ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (212, 'SEPL ', 15, 'Actividades Centrales SEPL ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (214, 'SUTI ', 15, 'Actividades Centrales SUTI ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (216, 'SUVT ', 15, 'Actividades Centrales SUVT ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (218, 'SURI ', 15, 'Actividades Centrales SURI ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (220, 'UAI  ', 15, 'Actividades Centrales UAI  ', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (208, 'SEBU ', 14, 'Bienestar SEBU', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (210, 'SECT ', 12, 'Investigación SECT', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (202, 'SEXU ', 11, 'Extensión SEXU', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (197, 'SUAS ', 16, 'Actividades Comunes SUAS', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (222, 'MECO ', 15, 'Actividades Centrales MECO', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (223, 'DPOS ', 13, 'Post-Grado DPOS', NULL, NULL, NULL, 11, NULL);
INSERT INTO mocovi_programa VALUES (224, 'BICE ', 15, 'Actividades Centrales BICE', NULL, NULL, NULL, 11, NULL);


--
-- Name: mocovi_programa_id_programa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_programa_id_programa_seq', 224, true);


--
-- Data for Name: mocovi_tipo_dependencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_tipo_dependencia VALUES (1, 'Centrales                                                   ');
INSERT INTO mocovi_tipo_dependencia VALUES (2, 'Dependencia                                                 ');
INSERT INTO mocovi_tipo_dependencia VALUES (3, 'Asentamiento                                                ');
INSERT INTO mocovi_tipo_dependencia VALUES (4, 'MÃ³dulo                                                     ');


--
-- Name: mocovi_tipo_dependencia_id_tipo_dependencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_tipo_dependencia_id_tipo_dependencia_seq', 1, false);


--
-- Data for Name: mocovi_tipo_programa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_tipo_programa VALUES (2, 'Lic. en Enfermeria Convenio Rio Negro');
INSERT INTO mocovi_tipo_programa VALUES (3, 'Lic. en Enfermeria Convenio Chubut');
INSERT INTO mocovi_tipo_programa VALUES (4, 'PROHUM');
INSERT INTO mocovi_tipo_programa VALUES (8, 'Otros Convenios');
INSERT INTO mocovi_tipo_programa VALUES (9, 'Comunicación Oral y Escrita (COE)');
INSERT INTO mocovi_tipo_programa VALUES (1, 'Educación de Grado');
INSERT INTO mocovi_tipo_programa VALUES (10, 'Programa de Articulación Académica (PROAA)');
INSERT INTO mocovi_tipo_programa VALUES (6, 'Prog. Unificación de Cargos');
INSERT INTO mocovi_tipo_programa VALUES (5, 'Convenio Carrera de Topografí­a');
INSERT INTO mocovi_tipo_programa VALUES (7, 'Convenio Carreras Ingeniería');
INSERT INTO mocovi_tipo_programa VALUES (12, 'Investigación');
INSERT INTO mocovi_tipo_programa VALUES (13, 'Post-Grado');
INSERT INTO mocovi_tipo_programa VALUES (14, 'Bienestar');
INSERT INTO mocovi_tipo_programa VALUES (15, 'Actividades Centrales');
INSERT INTO mocovi_tipo_programa VALUES (16, 'Actividades Comunes');
INSERT INTO mocovi_tipo_programa VALUES (11, 'Extensión');


--
-- Data for Name: unidad_acad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad_acad VALUES ('FACE ', 'Facultad de Ciencias de la Educación                        ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('FADE ', 'Facultad de Derecho y Ciencias Sociales                     ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('FAEA ', 'Facultad de Economía y Administración                       ', 6, 'NCAP', 2);
INSERT INTO unidad_acad VALUES ('FAIN ', 'Facultad de Ingeniería                                      ', 6, 'NCAP', 2);
INSERT INTO unidad_acad VALUES ('FALE ', 'Facultad de Lenguas                                         ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('FATU ', 'Facultad de Turismo                                         ', 6, 'NCAP', 2);
INSERT INTO unidad_acad VALUES ('FAIF ', 'Facultad de Informática                                     ', 6, 'NCAP', 2);
INSERT INTO unidad_acad VALUES ('FAAS ', 'Facultad de Ciencias del Ambiente y la Salud                ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('FATA ', 'Facultad de Ciencia y Tecnología de los Alimentos           ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('FAME ', 'Facultad de Ciencias Médicas                                ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('RECT ', 'Rectorado                                                   ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('ASMA ', 'Asentamiento Universitario San Martín de los Andes          ', 6, 'RNG ', 3);
INSERT INTO unidad_acad VALUES ('AUZA ', 'Asentamiento Universitario Zapala                           ', 6, 'RNG ', 3);
INSERT INTO unidad_acad VALUES ('SESO ', 'Módulo de Derecho                                           ', 6, 'NCAP', 4);
INSERT INTO unidad_acad VALUES ('FAHU ', 'Facultad de Humanidades                                     ', 6, 'NCAP', 2);
INSERT INTO unidad_acad VALUES ('FACA ', 'Facultad de Ciencias Agrarias                               ', 6, 'NQN ', 2);
INSERT INTO unidad_acad VALUES ('ESCM ', 'Escuela de Ciencias Marinas                                 ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('CRUB ', 'Centro Regional Universitario Bariloche                     ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('CUZA ', 'Centro Regional Zona Atlántica                              ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('VREC ', 'VICE RECTORADO                                              ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SEHA ', 'SECRETARIA DE HACIENDA                                      ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SEXU ', 'SECRETARIA DE EXTENSION                                     ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SEGE ', 'SECRETARIA GENERAL                                          ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SEAC ', 'SECRETARIA ACADÉMICA                                        ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SECT ', 'SECRETARIA DE CIENCIA Y TECNICA                             ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SEPL ', 'SECRETARÍA DE PLANEAMIENTO y DESARROLLO INSTITUCIONAL       ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SUTI ', 'SUBSECRETARÍA DE TECNOLOGÍAS DE LA INFORMACIÓN              ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SUVT ', 'SUBSECRETARIA DE VINCULACION Y TRANSFERENCIA y FUNYDER      ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SURI ', 'SUBSECRETARÍA DE RELACIONES INTERNACIONALES                 ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('UAI  ', 'Unidad de Auditoría Interna                                 ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('IBMP ', 'Instituto de Biología Marina y Pezca                        ', 6, 'NCAP', 4);
INSERT INTO unidad_acad VALUES ('SEBU ', 'SECRETARIA DE BIENESTAR UNIVERSITARIO                       ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SUAS ', 'Subsecretaría de Administración y Servicios                 ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('DPOS ', 'Dirección de Posgrado                                       ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('BICE ', 'Biblioteca Central                                          ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('MECO ', 'Medios y Comunicación                                       ', 6, 'NCAP', 1);


SET search_path = dbdsgnr, pg_catalog;

--
-- Name: erdiagrams_pg_database_pg_schema_name_key; Type: CONSTRAINT; Schema: dbdsgnr; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY erdiagrams
    ADD CONSTRAINT erdiagrams_pg_database_pg_schema_name_key UNIQUE (pg_database, pg_schema, name);


--
-- Name: erdiagrams_pkey; Type: CONSTRAINT; Schema: dbdsgnr; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY erdiagrams
    ADD CONSTRAINT erdiagrams_pkey PRIMARY KEY (erdiagram_id);


SET search_path = public, pg_catalog;

--
-- Name: categ_siu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categ_siu
    ADD CONSTRAINT categ_siu_pkey PRIMARY KEY (codigo_siu);


--
-- Name: escalafon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY escalafon
    ADD CONSTRAINT escalafon_pkey PRIMARY KEY (id_escalafon);


--
-- Name: mocovi_costo_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_costo_categoria
    ADD CONSTRAINT mocovi_costo_categoria_pkey PRIMARY KEY (id_costo_categoria);


--
-- Name: mocovi_descentralizado_cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_descentralizado_cargos
    ADD CONSTRAINT mocovi_descentralizado_cargos_pkey PRIMARY KEY (id_cargo);


--
-- Name: mocovi_descentralizado_ingresos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_descentralizado_ingresos
    ADD CONSTRAINT mocovi_descentralizado_ingresos_pkey PRIMARY KEY (id_ingresos);


--
-- Name: mocovi_descentralizado_objeto_del_gasto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_descentralizado_objeto_del_gasto
    ADD CONSTRAINT mocovi_descentralizado_objeto_del_gasto_pkey PRIMARY KEY (id_objeto_del_gasto);


--
-- Name: mocovi_descentralizado_permutas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_descentralizado_permutas
    ADD CONSTRAINT mocovi_descentralizado_permutas_pkey PRIMARY KEY (id_permutas);


--
-- Name: mocovi_descentralizado_politica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_descentralizado_politica
    ADD CONSTRAINT mocovi_descentralizado_politica_pkey PRIMARY KEY (id_politica);


--
-- Name: mocovi_descentralizado_presupuesto_general_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_descentralizado_presupuesto_general
    ADD CONSTRAINT mocovi_descentralizado_presupuesto_general_pkey PRIMARY KEY (id_presupuesto);


--
-- Name: mocovi_descentralizado_tipo_gasto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_descentralizado_tipo_gasto
    ADD CONSTRAINT mocovi_descentralizado_tipo_gasto_pkey PRIMARY KEY (id_tipo_gasto);


--
-- Name: mocovi_descentralizado_tipo_ingresos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_descentralizado_fuente
    ADD CONSTRAINT mocovi_descentralizado_tipo_ingresos_pkey PRIMARY KEY (id_fuente);


--
-- Name: mocovi_descentralizado_tipo_permuta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_descentralizado_tipo_permuta
    ADD CONSTRAINT mocovi_descentralizado_tipo_permuta_pkey PRIMARY KEY (id_tipo_permuta);


--
-- Name: mocovi_periodo_presupuestario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_periodo_presupuestario
    ADD CONSTRAINT mocovi_periodo_presupuestario_pkey PRIMARY KEY (id_periodo);


--
-- Name: mocovi_programa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_programa
    ADD CONSTRAINT mocovi_programa_pkey PRIMARY KEY (id_programa);


--
-- Name: mocovi_tipo_dependencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_tipo_dependencia
    ADD CONSTRAINT mocovi_tipo_dependencia_pkey PRIMARY KEY (id_tipo_dependencia);


--
-- Name: mocovi_tipo_programa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mocovi_tipo_programa
    ADD CONSTRAINT mocovi_tipo_programa_pkey PRIMARY KEY (id_tipo_programa);


--
-- Name: unidad_acad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_acad
    ADD CONSTRAINT unidad_acad_pkey PRIMARY KEY (sigla);


SET search_path = dbdsgnr, pg_catalog;

--
-- Name: trigger_check_user_privileges; Type: TRIGGER; Schema: dbdsgnr; Owner: postgres
--

CREATE TRIGGER trigger_check_user_privileges BEFORE DELETE OR UPDATE ON erdiagrams FOR EACH ROW EXECUTE PROCEDURE function_check_user_privileges();


SET search_path = public, pg_catalog;

--
-- Name: fk_costo_categoria_periodo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_costo_categoria
    ADD CONSTRAINT fk_costo_categoria_periodo FOREIGN KEY (id_periodo) REFERENCES mocovi_periodo_presupuestario(id_periodo) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fk_costo_categoria_siu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_costo_categoria
    ADD CONSTRAINT fk_costo_categoria_siu FOREIGN KEY (codigo_siu) REFERENCES categ_siu(codigo_siu) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fk_programa_tipo_programa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_programa
    ADD CONSTRAINT fk_programa_tipo_programa FOREIGN KEY (id_tipo_programa) REFERENCES mocovi_tipo_programa(id_tipo_programa) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fk_programa_uni_acad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_programa
    ADD CONSTRAINT fk_programa_uni_acad FOREIGN KEY (id_unidad) REFERENCES unidad_acad(sigla) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fk_ua_tipo_dep; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_acad
    ADD CONSTRAINT fk_ua_tipo_dep FOREIGN KEY (id_tipo_dependencia) REFERENCES mocovi_tipo_dependencia(id_tipo_dependencia) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: id_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_cargos
    ADD CONSTRAINT id_categoria FOREIGN KEY (id_categoria) REFERENCES categ_siu(codigo_siu) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_permutas
    ADD CONSTRAINT id_categoria FOREIGN KEY (id_categoria) REFERENCES categ_siu(codigo_siu) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_escalafon; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_cargos
    ADD CONSTRAINT id_escalafon FOREIGN KEY (id_escalafon) REFERENCES escalafon(id_escalafon) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_escalafon; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_permutas
    ADD CONSTRAINT id_escalafon FOREIGN KEY (id_escalafon) REFERENCES escalafon(id_escalafon) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_fuente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_cargos
    ADD CONSTRAINT id_fuente FOREIGN KEY (id_fuente) REFERENCES mocovi_descentralizado_fuente(id_fuente) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_fuente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_presupuesto_general
    ADD CONSTRAINT id_fuente FOREIGN KEY (id_fuente) REFERENCES mocovi_descentralizado_fuente(id_fuente) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_objeto_del_gasto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_presupuesto_general
    ADD CONSTRAINT id_objeto_del_gasto FOREIGN KEY (id_objeto_del_gasto) REFERENCES mocovi_descentralizado_objeto_del_gasto(id_objeto_del_gasto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_periodo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_politica
    ADD CONSTRAINT id_periodo FOREIGN KEY (id_periodo) REFERENCES mocovi_periodo_presupuestario(id_periodo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_periodo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_cargos
    ADD CONSTRAINT id_periodo FOREIGN KEY (id_periodo) REFERENCES mocovi_periodo_presupuestario(id_periodo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_periodo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_permutas
    ADD CONSTRAINT id_periodo FOREIGN KEY (id_periodo) REFERENCES mocovi_periodo_presupuestario(id_periodo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_periodo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_presupuesto_general
    ADD CONSTRAINT id_periodo FOREIGN KEY (id_periodo) REFERENCES mocovi_periodo_presupuestario(id_periodo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_programa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_cargos
    ADD CONSTRAINT id_programa FOREIGN KEY (id_programa) REFERENCES mocovi_programa(id_programa) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_programa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_permutas
    ADD CONSTRAINT id_programa FOREIGN KEY (id_programa) REFERENCES mocovi_programa(id_programa) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_programa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_presupuesto_general
    ADD CONSTRAINT id_programa FOREIGN KEY (id_programa) REFERENCES mocovi_programa(id_programa) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_programa_permuta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_permutas
    ADD CONSTRAINT id_programa_permuta FOREIGN KEY (id_programa_permuta) REFERENCES mocovi_programa(id_programa) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_ingresos
    ADD CONSTRAINT id_tipo FOREIGN KEY (id_fuente) REFERENCES mocovi_descentralizado_fuente(id_fuente) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_tipo_gasto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_cargos
    ADD CONSTRAINT id_tipo_gasto FOREIGN KEY (id_tipo_gasto) REFERENCES mocovi_descentralizado_tipo_gasto(id_tipo_gasto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_tipo_gasto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_permutas
    ADD CONSTRAINT id_tipo_gasto FOREIGN KEY (id_tipo_gasto) REFERENCES mocovi_descentralizado_tipo_gasto(id_tipo_gasto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_tipo_gasto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_presupuesto_general
    ADD CONSTRAINT id_tipo_gasto FOREIGN KEY (id_tipo_gasto) REFERENCES mocovi_descentralizado_tipo_gasto(id_tipo_gasto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_tipo_permuta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_permutas
    ADD CONSTRAINT id_tipo_permuta FOREIGN KEY (id_tipo_permuta) REFERENCES mocovi_descentralizado_tipo_permuta(id_tipo_permuta) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_unidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_politica
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES unidad_acad(sigla) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_unidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_ingresos
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES unidad_acad(sigla) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_unidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_cargos
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES unidad_acad(sigla) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_unidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_permutas
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES unidad_acad(sigla) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_unidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_presupuesto_general
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES unidad_acad(sigla) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: id_unidad_permuta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_permutas
    ADD CONSTRAINT id_unidad_permuta FOREIGN KEY (id_unidad_permuta) REFERENCES unidad_acad(sigla) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: idperiodo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mocovi_descentralizado_ingresos
    ADD CONSTRAINT idperiodo FOREIGN KEY (id_periodo) REFERENCES mocovi_periodo_presupuestario(id_periodo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: dbdsgnr; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA dbdsgnr FROM PUBLIC;
REVOKE ALL ON SCHEMA dbdsgnr FROM postgres;
GRANT ALL ON SCHEMA dbdsgnr TO postgres;
GRANT USAGE ON SCHEMA dbdsgnr TO PUBLIC;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


SET search_path = dbdsgnr, pg_catalog;

--
-- Name: erdiagrams; Type: ACL; Schema: dbdsgnr; Owner: postgres
--

REVOKE ALL ON TABLE erdiagrams FROM PUBLIC;
REVOKE ALL ON TABLE erdiagrams FROM postgres;
GRANT ALL ON TABLE erdiagrams TO postgres;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE erdiagrams TO PUBLIC;


--
-- Name: erdiagrams_erdiagram_id_seq; Type: ACL; Schema: dbdsgnr; Owner: postgres
--

REVOKE ALL ON SEQUENCE erdiagrams_erdiagram_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE erdiagrams_erdiagram_id_seq FROM postgres;
GRANT ALL ON SEQUENCE erdiagrams_erdiagram_id_seq TO postgres;
GRANT SELECT,UPDATE ON SEQUENCE erdiagrams_erdiagram_id_seq TO PUBLIC;


--
-- PostgreSQL database dump complete
--

