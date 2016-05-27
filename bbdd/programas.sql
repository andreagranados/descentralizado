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
-- Data for Name: mocovi_programa; Type: TABLE DATA; Schema: public; Owner: postgres
--

delete from mocovi_programa;
INSERT INTO mocovi_programa VALUES (47, 'FALE', 10, 'FRH en Tec. Adm. Sist. y Software Libre (FALE)', 29, 15, 19, 11, 'A.0001.029.015.019.11.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (48, 'FALE', 2, 'FRH en Enfermería (Sede: Viedma) - FALE', 29, 7, 19, 11, 'A.0001.029.007.019.11.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (49, 'FAME', 2, 'FRH en Enfermería (Sede: Viedma) - FAME', 29, 7, 27, 11, 'A.0001.029.007.027.11.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (50, 'FALE', 2, 'FRH en Enfermería (Sede: Bariloche) - FALE', 29, 6, 19, 11, NULL);
INSERT INTO mocovi_programa VALUES (20, 'FACA', 1, 'FRH en Cs. Agrarias', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (53, 'FAHU', 5, 'FRH en Topografía', 29, 13, 24, 11, NULL);
INSERT INTO mocovi_programa VALUES (11, 'FACE', 1, 'FRH en Cs. de la Educación', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (21, 'FADE', 1, 'FRH en Derecho y Cs. Sociales', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (8, 'FAEA', 1, 'FRH en Economia, Adm. y Matemática', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (1, 'FAIF', 1, 'FRH en Informática', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (9, 'FAHU', 1, 'FRH en Humanidades', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (23, 'FAIN', 1, 'FRH en Ingenierías, Geología y Prof.', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (17, 'CRUB', 1, 'FRH en Acuicultura, Biología y Educ. Física', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (18, 'CUZA', 1, 'FRH en Adm. Pública, Psicop. y Cs. Políticas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (28, 'ESCM', 1, 'FRH en Ciencias Marinas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (16, 'ASMA', 1, 'FRH en Tec. Forestal y Esp. Verdes', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (14, 'AUZA', 1, 'FRH en Minería, Planta y Analisis de Menas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (26, 'FATA', 1, 'FRH en Cs. y Tecnol. de los Alimentos', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (19, 'FAAS', 1, 'FRH en Cs. del Ambiente y la Salud', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (24, 'FALE', 1, 'FRH en Lenguas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (25, 'FAME', 1, 'FRH en Cs. Médicas', 27, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (31, 'CUZA', 2, 'FRH en Enfermería (Sede: Viedma)', 29, 7, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (32, 'CRUB', 2, 'FRH en Enfermería (Sede: Bariloche)', 29, 6, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (34, 'FAAS', 8, 'FRH en Tec. Sup. Higiene y Seg. Trabajo (Sede: Las Lajas)', 26, 7, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (54, 'FALE', 5, 'FRH en Topografía', 29, 13, 19, 11, NULL);
INSERT INTO mocovi_programa VALUES (52, 'FAEA', 5, 'FRH en Topografía', 29, 13, 23, 11, NULL);
INSERT INTO mocovi_programa VALUES (55, 'FAIF', 5, 'FRH en Topografía', 29, 13, 33, 11, NULL);
INSERT INTO mocovi_programa VALUES (41, 'CUZA', 9, 'FRH en Lengua y Com. Oral y Escrita', 29, 12, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (42, 'CUZA', 10, 'FRH en Tec. Adm. Sist. y Software Libre', 29, 15, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (12, 'FACE', 4, 'FRH en Cs Humanas (PROHUM)', 20, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (35, 'CRUB', 4, 'FRH en Cs Humanas (PROHUM)', 17, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (37, 'CUZA', 4, 'FRH en Cs Humanas (PROHUM)', 16, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (10, 'FAHU', 4, 'FRH en Cs Humanas (PROHUM)', 24, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (36, 'FALE', 4, 'FRH en Cs Humanas (PROHUM)', 19, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (40, 'CRUB', 6, 'FRH en Acuicultura, Biología y Educ. Física', 29, 14, 17, 11, NULL);
INSERT INTO mocovi_programa VALUES (29, 'FAAS', 3, 'FRH en Enfermería (Sede:Chubut)', 29, 5, 0, 14, 'A.0001.029.005.000.14.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (57, 'FAEA', 7, 'FRH en Ingenierías (Sede: Chos Malal)', 22, 99, 23, 14, NULL);
INSERT INTO mocovi_programa VALUES (43, 'FAIN', 7, 'FRH en Ingenierías (Sede: Chos Malal)', 22, 99, 0, 14, NULL);
INSERT INTO mocovi_programa VALUES (38, 'AUZA', 5, 'FRH en Topografía', 29, 13, 0, 11, NULL);
INSERT INTO mocovi_programa VALUES (39, 'FACE', 6, 'FACE-Prog. Unificacion de cargos', 29, 14, 20, 11, NULL);
INSERT INTO mocovi_programa VALUES (2, 'FAIF', 8, 'FRH Tec. Desarrollo Web (Sede: Chos Malal)', 29, 11, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (33, 'FAAS', 2, 'FRH en Enfermería (Sede: Zapala)', 26, 8, 0, 14, NULL);
INSERT INTO mocovi_programa VALUES (3, 'FATU', 1, 'FRH en Turismo', 29, 0, 0, 11, '29-29_0-ACT 01-PP 11-F.F 11');
INSERT INTO mocovi_programa VALUES (30, 'FAAS', 2, 'FRH en Enfermería (Sede:Allen-Choele Choel)', 29, 3, 0, 11, NULL);
INSERT INTO mocovi_programa VALUES (58, 'FALE', 2, 'FRH en Enfermería (Sede:Allen-Choele Choel)', 29, 3, 19, 11, NULL);
INSERT INTO mocovi_programa VALUES (44, 'FACA', 8, 'FRH en Tec. Espacios Verdes (Munic.Cinco Saltos)', 21, 2, NULL, 14, NULL);


--
-- Name: mocovi_programa_id_programa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_programa_id_programa_seq', 58, true);


--
-- PostgreSQL database dump complete
--

