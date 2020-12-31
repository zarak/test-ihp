

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
INSERT INTO public.posts (id, title, body, created_at) VALUES ('cbd7adf5-5099-4ef3-acf4-8640bc1c8d45', 'Amazing grass', 'There are way too many places to graze around here.', '2020-12-30 17:27:15.70273+05');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('77a83e3a-a124-48f9-a71a-b2955c57e7a8', 'Script', 'To add an omnipresent Navigation Bar in the app we first need to define how it looks and what it contains. The best place to do that is the Layout file. There, create your desired navigation. Also, add the navigation links you want the user to navigate. I am quickly adding links for the Post Index and for Creating a new Post. After setting our navbar up we can just add it in our layout definition. That way, we don’t need to add the navigation bar in every single view file. If you have multiple layouts, you may need to add the navigation to the other layouts as well. Now we have a Navbar which is visible everywhere.', '2020-12-30 22:00:36.568844+05');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('4bbf0392-3b68-4d27-a37a-10c945024a0a', '3b26b4bd-45d0-45e9-8a7c-d492265de702', 'Tony', 'New comment', '2020-12-30 17:24:06.844777+05');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('1d5dfd04-0d18-46bf-98d3-f5dd212d4f25', '3b26b4bd-45d0-45e9-8a7c-d492265de702', 'Jeff', 'Testing with another comment', '2020-12-30 17:24:06.845668+05');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('e0d9b336-1dc6-4f20-a843-301c422feb7e', 'cbd7adf5-5099-4ef3-acf4-8640bc1c8d45', 'Andrew', 'This is a new tablet. Thanks for the comment!', '2020-12-30 17:27:35.862451+05');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('bb5d8653-2c81-4340-94d9-723493c6ad59', 'f49b296b-6bbe-49ae-819f-a084516b38f6', 'Tony', 'well this is a comment (edited lel)', '2020-12-30 17:24:06.845317+05');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;



ALTER TABLE public.users ENABLE TRIGGER ALL;


