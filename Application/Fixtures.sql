

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

ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('4bbf0392-3b68-4d27-a37a-10c945024a0a', '3b26b4bd-45d0-45e9-8a7c-d492265de702', 'Tony', 'New comment', '2020-12-30 17:24:06.844777+05');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('1d5dfd04-0d18-46bf-98d3-f5dd212d4f25', '3b26b4bd-45d0-45e9-8a7c-d492265de702', 'Jeff', 'Testing with another comment', '2020-12-30 17:24:06.845668+05');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('e0d9b336-1dc6-4f20-a843-301c422feb7e', 'cbd7adf5-5099-4ef3-acf4-8640bc1c8d45', 'Andrew', 'This is a new tablet. Thanks for the comment!', '2020-12-30 17:27:35.862451+05');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('bb5d8653-2c81-4340-94d9-723493c6ad59', 'f49b296b-6bbe-49ae-819f-a084516b38f6', 'Tony', 'well this is a comment (edited lel)', '2020-12-30 17:24:06.845317+05');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, first_name, last_name, email, password_hash, locked_at, failed_login_attempts) VALUES ('3c96258a-4a79-45b3-8e08-a3496ddf2524', 'test', 'user', 'test@testmail.com', 'sha256|17|8KpuZ7PFPsJhBujAIEahQQ==|QI4zv+QXpzChyYsLrvmn4tNbKRDK2yV4syJvTT/E9Fs=', NULL, 0);
INSERT INTO public.users (id, first_name, last_name, email, password_hash, locked_at, failed_login_attempts) VALUES ('3af41507-24db-4e9e-b4b1-35dadc348c0a', 'Another', 'User', 'another@user.com', 'sha256|17|V0quBg/TOZtkXmTcWCTyHg==|x2kwE+b7NkNOqy30l+uz85rZ7ujpj+D7llRFlXISxuE=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


