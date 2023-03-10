CREATE TABLE visit (
	id varchar(50) NOT NULL,
	utilisateur_id varchar(100) NOT NULL,
	visit INTEGER NOT NULL,
	object_id varchar(100) NOT NULL,
	ref_object varchar(100) NOT NULL,
	CONSTRAINT seq_visit_pkey PRIMARY KEY (id)
);
CREATE SEQUENCE seq_visit INCREMENT BY 1 MINVALUE 1 START 1 CACHE 1 NO CYCLE;