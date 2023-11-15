-- Database: aboba

-- DROP DATABASE IF EXISTS aboba;

CREATE DATABASE aboba
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	-- Table: public.category_services

-- DROP TABLE IF EXISTS public.category_services;

CREATE TABLE IF NOT EXISTS public.category_services
(
    id_category_services bigint NOT NULL,
    name_category_services character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT category_services_pkey PRIMARY KEY (id_category_services)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.category_services
    OWNER to postgres;
-- Table: public.discount_cards

-- DROP TABLE IF EXISTS public.discount_cards;

CREATE TABLE IF NOT EXISTS public.discount_cards
(
    id_discount_card bigint NOT NULL,
    number_discount_card character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT discount_cards_pkey PRIMARY KEY (id_discount_card)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.discount_cards
    OWNER to postgres;
-- Table: public.employee_post

-- DROP TABLE IF EXISTS public.employee_post;

CREATE TABLE IF NOT EXISTS public.employee_post
(
    post_id bigint NOT NULL,
    employee_id bigint NOT NULL,
    CONSTRAINT fk86mb2vk1aj5w4kwhc63otqsv4 FOREIGN KEY (employee_id)
        REFERENCES public.employees (id_employee) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkpjcs31jl9fo3tlcwcmsx3ifmf FOREIGN KEY (post_id)
        REFERENCES public.posts (id_post) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employee_post
    OWNER to postgres;

-- Table: public.employees

-- DROP TABLE IF EXISTS public.employees;

CREATE TABLE IF NOT EXISTS public.employees
(
    id_employee bigint NOT NULL,
    first_name_employee character varying(32) COLLATE pg_catalog."default",
    last_name_employee character varying(32) COLLATE pg_catalog."default",
    login_employee character varying(32) COLLATE pg_catalog."default",
    password_employee character varying COLLATE pg_catalog."default",
    second_name_employee character varying(32) COLLATE pg_catalog."default",
    CONSTRAINT employees_pkey PRIMARY KEY (id_employee)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employees
    OWNER to postgres;
-- Table: public.executors

-- DROP TABLE IF EXISTS public.executors;

CREATE TABLE IF NOT EXISTS public.executors
(
    id_executor bigint NOT NULL,
    inn_executor character varying(32) COLLATE pg_catalog."default",
    name_executor character varying(32) COLLATE pg_catalog."default",
    CONSTRAINT executors_pkey PRIMARY KEY (id_executor)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.executors
    OWNER to postgres;
-- Table: public.orders

-- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    id_order bigint NOT NULL,
    date_order date,
    number_order character varying(255) COLLATE pg_catalog."default",
    user_id bigint,
    CONSTRAINT orders_pkey PRIMARY KEY (id_order),
    CONSTRAINT fk32ql8ubntj5uh44ph9659tiih FOREIGN KEY (user_id)
        REFERENCES public.users (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders
    OWNER to postgres;
-- Table: public.post_employee

-- DROP TABLE IF EXISTS public.post_employee;

CREATE TABLE IF NOT EXISTS public.post_employee
(
    employee_id bigint NOT NULL,
    post_id bigint NOT NULL,
    CONSTRAINT fkd3o74cqf7fjkfoqi3yk7k30g0 FOREIGN KEY (employee_id)
        REFERENCES public.employees (id_employee) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkltwgf8d8iqffor1r4bvi78qo0 FOREIGN KEY (post_id)
        REFERENCES public.posts (id_post) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.post_employee
    OWNER to postgres;

-- Table: public.posts

-- DROP TABLE IF EXISTS public.posts;

CREATE TABLE IF NOT EXISTS public.posts
(
    id_post bigint NOT NULL,
    name_post character varying(255) COLLATE pg_catalog."default",
    salary_post double precision NOT NULL,
    CONSTRAINT posts_pkey PRIMARY KEY (id_post)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.posts
    OWNER to postgres;
-- Table: public.services

-- DROP TABLE IF EXISTS public.services;

CREATE TABLE IF NOT EXISTS public.services
(
    id_services bigint NOT NULL,
    article_services character varying(8) COLLATE pg_catalog."default",
    cost_services double precision NOT NULL,
    name_services character varying(255) COLLATE pg_catalog."default",
    category_services_id bigint,
    CONSTRAINT services_pkey PRIMARY KEY (id_services),
    CONSTRAINT fk4iofxnqnme6uo5qqa67cwn3sq FOREIGN KEY (category_services_id)
        REFERENCES public.category_services (id_category_services) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.services
    OWNER to postgres;

-- Table: public.user_role

-- DROP TABLE IF EXISTS public.user_role;

CREATE TABLE IF NOT EXISTS public.user_role
(
    user_id bigint NOT NULL,
    roles character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT fkj345gk1bovqvfame88rcx7yyx FOREIGN KEY (user_id)
        REFERENCES public.users (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.user_role
    OWNER to postgres;
-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id_user bigint NOT NULL,
    first_name_user character varying(32) COLLATE pg_catalog."default",
    last_name_user character varying(32) COLLATE pg_catalog."default",
    login_user character varying(32) COLLATE pg_catalog."default",
    password_user character varying(255) COLLATE pg_catalog."default",
    second_name_user character varying(32) COLLATE pg_catalog."default",
    active boolean NOT NULL,
    discount_card_id bigint,
    CONSTRAINT users_pkey PRIMARY KEY (id_user),
    CONSTRAINT fkol1y22q7cp8rm23xr2rdnudgv FOREIGN KEY (discount_card_id)
        REFERENCES public.discount_cards (id_discount_card) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;


