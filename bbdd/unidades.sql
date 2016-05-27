--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: unidad_acad; Type: TABLE DATA; Schema: public; Owner: postgres
--
delete from mocovi_descentralizado_permutas;
delete from mocovi_descentralizado_cargos;
delete from mocovi_descentralizado_presupuesto_general;
delete from mocovi_descentralizado_politica;
delete from mocovi_descentralizado_ingresos;

delete from unidad_acad;

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
INSERT INTO unidad_acad VALUES ('FACA ', 'Facultad de Ciencias Agrarias                               ', 6, 'NCAP ', 2);
INSERT INTO unidad_acad VALUES ('ESCM ', 'Escuela de Ciencias Marinas                                 ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('CRUB ', 'Centro Regional Universitario Bariloche                     ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('CUZA ', 'Centro Regional Zona Atlántica                              ', 6, 'RNG ', 2);


--
-- PostgreSQL database dump complete
--

INSERT INTO unidad_acad VALUES ('VREC','VICE RECTORADO', 6,'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SEHA','SECRETARIA DE HACIENDA', 6,'NCAP', 1 );
INSERT INTO unidad_acad VALUES ('SEXU','SECRETARIA DE EXTENSION',  6,'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SEGE','SECRETARIA GENERAL',  6,'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SEAC','SECRETARIA ACADÉMICA ',  6,'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SEBI','SECRETARIA DE BIENESTAR UNIVERSITARIO',  6,'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SECT','SECRETARIA DE CIENCIA Y TECNICA ',  6,'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SEPL','SECRETARÍA DE PLANEAMIENTO y DESARROLLO INSTITUCIONAL',  6,'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SUTI', 'SUBSECRETARÍA DE TECNOLOGÍAS DE LA INFORMACIÓN', 6,'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SUVT', 'SUBSECRETARIA DE VINCULACION Y TRANSFERENCIA y FUNYDER', 6,'NCAP', 1);
INSERT INTO unidad_acad VALUES ('SURI', 'SUBSECRETARÍA DE RELACIONES INTERNACIONALES', 6,'NCAP', 1);
INSERT INTO unidad_acad VALUES ('IBMP', 'Instituto de Biología Marina y Pezca', 6,'NCAP', 2);
INSERT INTO unidad_acad VALUES ('UAI', 'Unidad de Auditoría Interna', 6,'NCAP', 1);
