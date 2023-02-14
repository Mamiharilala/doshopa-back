create table sexe(
	id varchar(100) NOT NULL,
	code varchar(100) NOT NULL,
	description varchar(100) NOT NULL
);
create or replace view utilisateur_token as
select utilisateur.*,token from utilisateur join token on token.utilisateur_id = utilisateur.id 