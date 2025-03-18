--
-- PostgreSQL database cluster dump
--

-- Started on 2025-03-17 21:52:51

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE atendente;
ALTER ROLE atendente WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE estagiario;
ALTER ROLE estagiario WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE gerente;
ALTER ROLE gerente WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE jonas;
ALTER ROLE jonas WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:+Cl/XGjCVClDNw+dt+gLSA==$awQJBtnsT3mGOScEfSFLVa5L/ohldEZkcBdsXD0UpEU=:sjmalJQJsA7R9HslILgFMBEDurYFIbDpxGgJmnhsO4U=';
CREATE ROLE jose;
ALTER ROLE jose WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:8OBjwbeK/4sNoI9Oieg0og==$hw6z+XaLDZ6riS54n7ERubgP2dBLLCf7XqLxIKQ6Y6E=:OB6Ywv3gJ6UmCzmZPR7wNRBvfiNW/K60F5D7G2kQ7sU=';
CREATE ROLE jucas;
ALTER ROLE jucas WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:BNxqejyeGiMG1BoZVWjq+g==$xvN3MWNWkF7e7ugStadDdoWzhAJFEUAVPal4ofnerZE=:fUt+6pJYbprCHCwyPH9+/mQDHig8Hd3+hBsFMIpMSSY=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:/jFY2ixfWhS6bRFZKBJ58g==$ZKn8sX1LMlAtD4Lyoog2yWaqjn8CakF08i3H/OgB3OY=:XsYPx4J7FHTTi5GmnCfZbfWvYxc4WtPNi30vO3pPDcU=';

--
-- User Configurations
--


--
-- Role memberships
--

GRANT atendente TO jose WITH INHERIT TRUE GRANTED BY postgres;
GRANT estagiario TO jonas WITH INHERIT TRUE GRANTED BY postgres;
GRANT gerente TO jucas WITH INHERIT TRUE GRANTED BY postgres;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-17 21:52:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-03-17 21:52:51

--
-- PostgreSQL database dump complete
--

--
-- Database "hotel" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-17 21:52:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4944 (class 1262 OID 16450)
-- Name: hotel; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hotel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE hotel OWNER TO postgres;

\connect hotel

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16471)
-- Name: atendimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atendimento (
    id_atendimento integer NOT NULL,
    id_servico integer NOT NULL,
    id_hospedagem integer NOT NULL
);


ALTER TABLE public.atendimento OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16451)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    rg character varying(15) NOT NULL,
    nome character varying(50) NOT NULL,
    sexo character varying(50) NOT NULL,
    telefone integer
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16461)
-- Name: hospedagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospedagem (
    id_hospedagem integer NOT NULL,
    rg character varying(50) NOT NULL,
    num_quarto integer NOT NULL,
    data_entrada date NOT NULL,
    data_saida date,
    status character varying(50) NOT NULL
);


ALTER TABLE public.hospedagem OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16466)
-- Name: quarto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quarto (
    num_quarto integer NOT NULL,
    andar integer,
    id_tipo integer NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.quarto OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16456)
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva (
    id_reserva integer NOT NULL,
    rg character varying(15) NOT NULL,
    num_quarto integer NOT NULL,
    dt_reserva date NOT NULL,
    qtd_dias integer NOT NULL,
    data_entrada date NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.reserva OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16481)
-- Name: servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servico (
    id_servico integer NOT NULL,
    descricao character varying(50) NOT NULL,
    valor double precision NOT NULL
);


ALTER TABLE public.servico OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16476)
-- Name: tipo_quarto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_quarto (
    id_tipo integer NOT NULL,
    descricao character varying(50) NOT NULL,
    valor double precision NOT NULL
);


ALTER TABLE public.tipo_quarto OWNER TO postgres;

--
-- TOC entry 4936 (class 0 OID 16471)
-- Dependencies: 221
-- Data for Name: atendimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atendimento (id_atendimento, id_servico, id_hospedagem) FROM stdin;
\.


--
-- TOC entry 4932 (class 0 OID 16451)
-- Dependencies: 217
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (rg, nome, sexo, telefone) FROM stdin;
\.


--
-- TOC entry 4934 (class 0 OID 16461)
-- Dependencies: 219
-- Data for Name: hospedagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospedagem (id_hospedagem, rg, num_quarto, data_entrada, data_saida, status) FROM stdin;
\.


--
-- TOC entry 4935 (class 0 OID 16466)
-- Dependencies: 220
-- Data for Name: quarto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quarto (num_quarto, andar, id_tipo, status) FROM stdin;
\.


--
-- TOC entry 4933 (class 0 OID 16456)
-- Dependencies: 218
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reserva (id_reserva, rg, num_quarto, dt_reserva, qtd_dias, data_entrada, status) FROM stdin;
\.


--
-- TOC entry 4938 (class 0 OID 16481)
-- Dependencies: 223
-- Data for Name: servico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servico (id_servico, descricao, valor) FROM stdin;
\.


--
-- TOC entry 4937 (class 0 OID 16476)
-- Dependencies: 222
-- Data for Name: tipo_quarto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_quarto (id_tipo, descricao, valor) FROM stdin;
\.


--
-- TOC entry 4775 (class 2606 OID 16475)
-- Name: atendimento atendimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT atendimento_pkey PRIMARY KEY (id_atendimento);


--
-- TOC entry 4765 (class 2606 OID 16523)
-- Name: cliente ck_sexo; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.cliente
    ADD CONSTRAINT ck_sexo CHECK (((sexo)::text = ANY ((ARRAY['masculino'::character varying, 'feminino'::character varying, 'outro'::character varying])::text[]))) NOT VALID;


--
-- TOC entry 4767 (class 2606 OID 16455)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (rg);


--
-- TOC entry 4771 (class 2606 OID 16465)
-- Name: hospedagem hospedagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospedagem
    ADD CONSTRAINT hospedagem_pkey PRIMARY KEY (id_hospedagem);


--
-- TOC entry 4773 (class 2606 OID 16470)
-- Name: quarto quarto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quarto
    ADD CONSTRAINT quarto_pkey PRIMARY KEY (num_quarto);


--
-- TOC entry 4769 (class 2606 OID 16460)
-- Name: reserva reserva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva);


--
-- TOC entry 4779 (class 2606 OID 16485)
-- Name: servico servico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (id_servico);


--
-- TOC entry 4777 (class 2606 OID 16480)
-- Name: tipo_quarto tipo_quarto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_quarto
    ADD CONSTRAINT tipo_quarto_pkey PRIMARY KEY (id_tipo);


--
-- TOC entry 4785 (class 2606 OID 16516)
-- Name: atendimento id_hospedagem_atendimento_hospedagem_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT "id_hospedagem_atendimento_hospedagem_FK" FOREIGN KEY (id_hospedagem) REFERENCES public.hospedagem(id_hospedagem) NOT VALID;


--
-- TOC entry 4786 (class 2606 OID 16511)
-- Name: atendimento id_servico_atendimento_servico_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT "id_servico_atendimento_servico_FK" FOREIGN KEY (id_servico) REFERENCES public.servico(id_servico) NOT VALID;


--
-- TOC entry 4784 (class 2606 OID 16506)
-- Name: quarto id_tipo_quarto_tipo_quarto_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quarto
    ADD CONSTRAINT "id_tipo_quarto_tipo_quarto_FK" FOREIGN KEY (id_tipo) REFERENCES public.tipo_quarto(id_tipo) NOT VALID;


--
-- TOC entry 4782 (class 2606 OID 16501)
-- Name: hospedagem num_quarto_hospedagem_quarto_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospedagem
    ADD CONSTRAINT "num_quarto_hospedagem_quarto_FK" FOREIGN KEY (num_quarto) REFERENCES public.quarto(num_quarto) NOT VALID;


--
-- TOC entry 4780 (class 2606 OID 16491)
-- Name: reserva num_quarto_reserva_quarto_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT "num_quarto_reserva_quarto_FK" FOREIGN KEY (num_quarto) REFERENCES public.quarto(num_quarto) NOT VALID;


--
-- TOC entry 4783 (class 2606 OID 16496)
-- Name: hospedagem rg_hospedagem_cliente_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospedagem
    ADD CONSTRAINT "rg_hospedagem_cliente_FK" FOREIGN KEY (rg) REFERENCES public.cliente(rg) NOT VALID;


--
-- TOC entry 4781 (class 2606 OID 16486)
-- Name: reserva rg_reserva_cliente_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT "rg_reserva_cliente_FK" FOREIGN KEY (rg) REFERENCES public.cliente(rg) NOT VALID;


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE atendimento; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,DELETE,UPDATE ON TABLE public.atendimento TO gerente WITH GRANT OPTION;


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE cliente; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,DELETE,UPDATE ON TABLE public.cliente TO gerente WITH GRANT OPTION;
GRANT SELECT ON TABLE public.cliente TO estagiario WITH GRANT OPTION;


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE hospedagem; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,DELETE,UPDATE ON TABLE public.hospedagem TO gerente WITH GRANT OPTION;


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE quarto; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,DELETE,UPDATE ON TABLE public.quarto TO gerente WITH GRANT OPTION;


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE reserva; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,DELETE,UPDATE ON TABLE public.reserva TO gerente WITH GRANT OPTION;
GRANT SELECT,DELETE,UPDATE ON TABLE public.reserva TO atendente WITH GRANT OPTION;


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE servico; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,DELETE,UPDATE ON TABLE public.servico TO gerente WITH GRANT OPTION;


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE tipo_quarto; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,DELETE,UPDATE ON TABLE public.tipo_quarto TO gerente WITH GRANT OPTION;


-- Completed on 2025-03-17 21:52:51

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-17 21:52:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-03-17 21:52:51

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-03-17 21:52:51

--
-- PostgreSQL database cluster dump complete
--

