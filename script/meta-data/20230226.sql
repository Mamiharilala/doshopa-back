CREATE TABLE visit (
	id varchar(50) NOT NULL,
	utilisateur_id varchar(100) NOT NULL,
	visit INTEGER NOT NULL,
	object_id varchar(100) NOT NULL,
	ref_object varchar(100) NOT NULL,
	CONSTRAINT seq_visit_pkey PRIMARY KEY (id)
);
CREATE SEQUENCE seq_visit INCREMENT BY 1 MINVALUE 1 START 1 CACHE 1 NO CYCLE;
CREATE TABLE localisation_livraison (
	id varchar(50) NOT NULL,
 	localisation varchar(100) NOT NULL,
	observation varchar(100),
	est_gratuit boolean NOT NULL default false,
	CONSTRAINT seq_loc_livraison_pkey PRIMARY KEY (id)
);
CREATE SEQUENCE seq_localisation_livraison INCREMENT BY 1 MINVALUE 1 START 1 CACHE 1 NO CYCLE;