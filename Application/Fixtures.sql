

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at) VALUES ('f49b296b-6bbe-49ae-819f-a084516b38f6', 'First ever post', 'This is another test for a much longer piece of text *bold* or **italic**. ', '2020-12-30 15:16:06.06887+05');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('3b26b4bd-45d0-45e9-8a7c-d492265de702', 'second post', 'hell naw ```code stuff```', '2020-12-30 16:11:10.19833+05');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;



ALTER TABLE public.comments ENABLE TRIGGER ALL;


