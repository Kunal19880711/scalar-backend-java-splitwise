--
-- PostgreSQL database dump
--

\restrict H1X4ZyNAUb6SR20iB3SpHb6tmoeNko8v48OgaUEpbt3iYIAxf9fX6ouyVCqmvIB

-- Dumped from database version 17.6 (Ubuntu 17.6-1.pgdg22.04+1)
-- Dumped by pg_dump version 17.6 (Ubuntu 17.6-1.pgdg22.04+1)

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
-- Name: expense; Type: TABLE; Schema: public; Owner: kunal
--

CREATE TABLE public.expense (
    created_at timestamp(6) without time zone,
    done_at timestamp(6) without time zone,
    group_id bigint,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    expense_type character varying(31) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.expense OWNER TO kunal;

--
-- Name: expense_seq; Type: SEQUENCE; Schema: public; Owner: kunal
--

CREATE SEQUENCE public.expense_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.expense_seq OWNER TO kunal;

--
-- Name: sw_groups; Type: TABLE; Schema: public; Owner: kunal
--

CREATE TABLE public.sw_groups (
    created_at timestamp(6) without time zone,
    id bigint NOT NULL,
    owner_id bigint,
    updated_at timestamp(6) without time zone,
    name character varying(255)
);


ALTER TABLE public.sw_groups OWNER TO kunal;

--
-- Name: sw_groups_seq; Type: SEQUENCE; Schema: public; Owner: kunal
--

CREATE SEQUENCE public.sw_groups_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sw_groups_seq OWNER TO kunal;

--
-- Name: sw_user_groups; Type: TABLE; Schema: public; Owner: kunal
--

CREATE TABLE public.sw_user_groups (
    group_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.sw_user_groups OWNER TO kunal;

--
-- Name: sw_users; Type: TABLE; Schema: public; Owner: kunal
--

CREATE TABLE public.sw_users (
    created_at timestamp(6) without time zone,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    email character varying(255),
    name character varying(255),
    pass_hash character varying(255)
);


ALTER TABLE public.sw_users OWNER TO kunal;

--
-- Name: sw_users_seq; Type: SEQUENCE; Schema: public; Owner: kunal
--

CREATE SEQUENCE public.sw_users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sw_users_seq OWNER TO kunal;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: kunal
--

CREATE TABLE public.transaction (
    transaction_status smallint,
    created_at timestamp(6) without time zone,
    from_id bigint,
    group_id bigint,
    id bigint NOT NULL,
    to_id bigint,
    updated_at timestamp(6) without time zone,
    transaction_type character varying(31) NOT NULL,
    CONSTRAINT transaction_transaction_status_check CHECK (((transaction_status >= 0) AND (transaction_status <= 1)))
);


ALTER TABLE public.transaction OWNER TO kunal;

--
-- Name: transaction_seq; Type: SEQUENCE; Schema: public; Owner: kunal
--

CREATE SEQUENCE public.transaction_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_seq OWNER TO kunal;

--
-- Name: user_expense; Type: TABLE; Schema: public; Owner: kunal
--

CREATE TABLE public.user_expense (
    amount double precision,
    type smallint,
    created_at timestamp(6) without time zone,
    expense_id bigint,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    user_id bigint,
    CONSTRAINT user_expense_type_check CHECK (((type >= 0) AND (type <= 1)))
);


ALTER TABLE public.user_expense OWNER TO kunal;

--
-- Name: user_expense_seq; Type: SEQUENCE; Schema: public; Owner: kunal
--

CREATE SEQUENCE public.user_expense_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_expense_seq OWNER TO kunal;

--
-- Data for Name: expense; Type: TABLE DATA; Schema: public; Owner: kunal
--

COPY public.expense (created_at, done_at, group_id, id, updated_at, expense_type, description) FROM stdin;
\.


--
-- Data for Name: sw_groups; Type: TABLE DATA; Schema: public; Owner: kunal
--

COPY public.sw_groups (created_at, id, owner_id, updated_at, name) FROM stdin;
\.


--
-- Data for Name: sw_user_groups; Type: TABLE DATA; Schema: public; Owner: kunal
--

COPY public.sw_user_groups (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: sw_users; Type: TABLE DATA; Schema: public; Owner: kunal
--

COPY public.sw_users (created_at, id, updated_at, email, name, pass_hash) FROM stdin;
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: kunal
--

COPY public.transaction (transaction_status, created_at, from_id, group_id, id, to_id, updated_at, transaction_type) FROM stdin;
\.


--
-- Data for Name: user_expense; Type: TABLE DATA; Schema: public; Owner: kunal
--

COPY public.user_expense (amount, type, created_at, expense_id, id, updated_at, user_id) FROM stdin;
\.


--
-- Name: expense_seq; Type: SEQUENCE SET; Schema: public; Owner: kunal
--

SELECT pg_catalog.setval('public.expense_seq', 1, false);


--
-- Name: sw_groups_seq; Type: SEQUENCE SET; Schema: public; Owner: kunal
--

SELECT pg_catalog.setval('public.sw_groups_seq', 1, false);


--
-- Name: sw_users_seq; Type: SEQUENCE SET; Schema: public; Owner: kunal
--

SELECT pg_catalog.setval('public.sw_users_seq', 1, false);


--
-- Name: transaction_seq; Type: SEQUENCE SET; Schema: public; Owner: kunal
--

SELECT pg_catalog.setval('public.transaction_seq', 1, false);


--
-- Name: user_expense_seq; Type: SEQUENCE SET; Schema: public; Owner: kunal
--

SELECT pg_catalog.setval('public.user_expense_seq', 1, false);


--
-- Name: expense expense_pkey; Type: CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT expense_pkey PRIMARY KEY (id);


--
-- Name: sw_groups sw_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.sw_groups
    ADD CONSTRAINT sw_groups_pkey PRIMARY KEY (id);


--
-- Name: sw_users sw_users_pkey; Type: CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.sw_users
    ADD CONSTRAINT sw_users_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: user_expense user_expense_pkey; Type: CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.user_expense
    ADD CONSTRAINT user_expense_pkey PRIMARY KEY (id);


--
-- Name: expense fk14j4t0wncuvns1jaxsn50epq7; Type: FK CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT fk14j4t0wncuvns1jaxsn50epq7 FOREIGN KEY (group_id) REFERENCES public.sw_groups(id);


--
-- Name: transaction fk5lte82qf49mytejwvmwjkvq69; Type: FK CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk5lte82qf49mytejwvmwjkvq69 FOREIGN KEY (to_id) REFERENCES public.sw_users(id);


--
-- Name: transaction fk81tewtpwsr1y7pgj6kvktavnl; Type: FK CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk81tewtpwsr1y7pgj6kvktavnl FOREIGN KEY (from_id) REFERENCES public.sw_users(id);


--
-- Name: sw_groups fkatn82651o2je96kj44c2nup2; Type: FK CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.sw_groups
    ADD CONSTRAINT fkatn82651o2je96kj44c2nup2 FOREIGN KEY (owner_id) REFERENCES public.sw_users(id);


--
-- Name: transaction fkdd8mdg8e4s6tccxsavadynfm5; Type: FK CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fkdd8mdg8e4s6tccxsavadynfm5 FOREIGN KEY (group_id) REFERENCES public.sw_groups(id);


--
-- Name: user_expense fkkk40759a6but9cug2lpcy3j7; Type: FK CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.user_expense
    ADD CONSTRAINT fkkk40759a6but9cug2lpcy3j7 FOREIGN KEY (expense_id) REFERENCES public.expense(id);


--
-- Name: sw_user_groups fkmavcmwu6i629gjlk9v81y86pk; Type: FK CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.sw_user_groups
    ADD CONSTRAINT fkmavcmwu6i629gjlk9v81y86pk FOREIGN KEY (user_id) REFERENCES public.sw_users(id);


--
-- Name: sw_user_groups fkrk5lkulxyxqbruc10lv372efj; Type: FK CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.sw_user_groups
    ADD CONSTRAINT fkrk5lkulxyxqbruc10lv372efj FOREIGN KEY (group_id) REFERENCES public.sw_groups(id);


--
-- Name: user_expense fksj9iolsyw9jqiwc7t3b5wxy1p; Type: FK CONSTRAINT; Schema: public; Owner: kunal
--

ALTER TABLE ONLY public.user_expense
    ADD CONSTRAINT fksj9iolsyw9jqiwc7t3b5wxy1p FOREIGN KEY (user_id) REFERENCES public.sw_users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict H1X4ZyNAUb6SR20iB3SpHb6tmoeNko8v48OgaUEpbt3iYIAxf9fX6ouyVCqmvIB

