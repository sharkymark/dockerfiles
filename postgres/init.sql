CREATE SEQUENCE persons_sequence
  start 1
  increment 1;

CREATE TABLE public.persons (
    id SERIAL PRIMARY KEY,
    firstName varchar(255),
    lastName varchar(255),
    email varchar(255)
);

INSERT INTO public.persons values(nextval('persons_sequence'),'Mark','Milligan','mark@coder.com'),
(nextval('persons_sequence'),'Kyle','Carberry','kyle@coder.com'),
(nextval('persons_sequence'),'Brad','Pitt','brad@coder.com'),
(nextval('persons_sequence'),'Katie','Perry','katie@coder.com');