--
-- PostgreSQL database dump
--

-- Dumped from database version 14rc1
-- Dumped by pg_dump version 14rc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id text NOT NULL,
    name text
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_id text,
    dept_id text,
    id integer NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- Name: dept_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.dept_emp ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dept_emp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_id text,
    emp_id text,
    id integer NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- Name: dept_manager_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.dept_manager ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dept_manager_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id text NOT NULL,
    title_id text,
    birth_date date,
    first_name text,
    last_name text,
    sex text,
    hire_date date
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_id text,
    salary integer,
    id integer NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- Name: salaries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.salaries ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.salaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    id text NOT NULL,
    title text
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: titles titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_pkey PRIMARY KEY (id);
	
ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (id);
	

--
-- Name: dept_emp dept_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_fkey FOREIGN KEY (dept_id) REFERENCES public.departments(id);


--
-- Name: dept_manager dept_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_fkey FOREIGN KEY (dept_id) REFERENCES public.departments(id);


--
-- Name: dept_emp emp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT emp_fkey FOREIGN KEY (emp_id) REFERENCES public.employees(id);


--
-- Name: dept_manager emp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT emp_fkey FOREIGN KEY (emp_id) REFERENCES public.employees(id);


--
-- Name: salaries emp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT emp_fkey FOREIGN KEY (emp_id) REFERENCES public.employees(id);


--
-- Name: employees title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT title_fkey FOREIGN KEY (title_id) REFERENCES public.titles(id);


--
-- PostgreSQL database dump complete
--

