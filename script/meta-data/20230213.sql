create table sexe(
	id varchar(100) NOT NULL,
	code varchar(100) NOT NULL,
	description varchar(100) NOT NULL
);
create or replace view utilisateur_token as
select utilisateur.*,token from utilisateur join token on token.utilisateur_id = utilisateur.id 

create table exception(
	id varchar(100) NOT NULL,
	message varchar(250),
	description varchar(100),
	utilisateur_id varchar(100) 
);
CREATE SEQUENCE public.seq_exception
	INCREMENT BY 1
	MINVALUE 1
 	START 1
	CACHE 1
	NO CYCLE;