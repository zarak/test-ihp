

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

ALTER TABLE public.admins DISABLE TRIGGER ALL;

INSERT INTO public.admins (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('9d379d15-8d05-4d1c-a384-a88448f74392', 'admin@test.com', 'sha256|17|ouukE3gDzq4esMIG5HgvWw==|+JOYGaFhWN55zfqmHBOin9Gmzr0tCydRXjOfxLMG1vA=', NULL, 0);
INSERT INTO public.admins (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('51e56983-603a-4829-a24f-7aed6939efb7', 'admin2@test.com', 'sha256|17|rPnlZKdJ3cROEtWD4px6Dw==|RKc6ixLBDH90ES453YQYgrtpLiQbHkezbGA9H5JbeWs=', NULL, 0);


ALTER TABLE public.admins ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, first_name, last_name, email, password_hash, locked_at, failed_login_attempts, is_confirmed, token) VALUES ('5c15af53-bff4-4136-b95e-04348b33dd7a', 'Test', 'User', 'test@testmail.com', 'sha256|17|iF2CoCnirCChcrQY89/GXQ==|1Fg60yEZKFZJmZORUPVSuJElWlUCQx9SDLK0gsGpB4A=', NULL, 0, true, '');


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at, user_id, upvotes, downvotes, toxicity_score) VALUES ('c06bb0e4-4dc5-4494-9d47-367702be1060', 'well', 'this is a new post
', '2021-01-01 12:37:51.857428+05', '5c15af53-bff4-4136-b95e-04348b33dd7a', 0, 0, 0);
INSERT INTO public.posts (id, title, body, created_at, user_id, upvotes, downvotes, toxicity_score) VALUES ('5602bbdb-a7f8-406c-aaf2-72930a05ce69', 'lovely', 'This is a wonderful new post innit', '2021-01-01 15:45:11.994588+05', '5c15af53-bff4-4136-b95e-04348b33dd7a', 0, 0, 0);
INSERT INTO public.posts (id, title, body, created_at, user_id, upvotes, downvotes, toxicity_score) VALUES ('c74eb894-1668-45b5-87cf-d9ebb79e132d', 'test', 'test test test', '2021-01-01 17:20:40.753364+05', '5c15af53-bff4-4136-b95e-04348b33dd7a', 0, 0, 0);


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('4bbf0392-3b68-4d27-a37a-10c945024a0a', '3b26b4bd-45d0-45e9-8a7c-d492265de702', 'Tony', 'New comment', '2020-12-30 17:24:06.844777+05');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('1d5dfd04-0d18-46bf-98d3-f5dd212d4f25', '3b26b4bd-45d0-45e9-8a7c-d492265de702', 'Jeff', 'Testing with another comment', '2020-12-30 17:24:06.845668+05');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('e0d9b336-1dc6-4f20-a843-301c422feb7e', 'cbd7adf5-5099-4ef3-acf4-8640bc1c8d45', 'Andrew', 'This is a new tablet. Thanks for the comment!', '2020-12-30 17:27:35.862451+05');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('bb5d8653-2c81-4340-94d9-723493c6ad59', 'f49b296b-6bbe-49ae-819f-a084516b38f6', 'Tony', 'well this is a comment (edited lel)', '2020-12-30 17:24:06.845317+05');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('a55f7c7f-3f12-494a-b1f9-60fea3bf78e0', 'de8f7afb-c00b-4d74-b4be-e1f608d19124', 'ono', 'oh rlly lel', '2021-01-01 09:25:15.954201+05');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


ALTER TABLE public.votes DISABLE TRIGGER ALL;

INSERT INTO public.votes (id, user_id, post_id) VALUES ('74464092-1f23-4b3f-9ca1-fab24493c1c3', '5c15af53-bff4-4136-b95e-04348b33dd7a', 'c74eb894-1668-45b5-87cf-d9ebb79e132d');
INSERT INTO public.votes (id, user_id, post_id) VALUES ('6bc173b9-06fb-4bc1-9bc4-07de7c7f49df', '5c15af53-bff4-4136-b95e-04348b33dd7a', '5602bbdb-a7f8-406c-aaf2-72930a05ce69');


ALTER TABLE public.votes ENABLE TRIGGER ALL;


