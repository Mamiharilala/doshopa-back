--SELECT encode(sha256('foo'::bytea), 'hex');
ALTER TABLE boutique
ADD COLUMN date_expired DATE not null default CURRENT_DATE;

drop view v_article_promotion;
CREATE OR REPLACE VIEW v_article_promotion
AS SELECT promotion.id,
    article.id AS article_id,
    article.designation,
    article.prix,
    article.reference,
    article.image,
    article.observation,
    article.categorie_id,
    article.boutique_id,
    article.devise_id,
    promotion.prix_avant,
    promotion.prix_actuel,
    promotion.date_debut,
    promotion.date_fin,
    promotion.quantite,
    promotion.etat,
    etat.description AS etatlib,
    article.devise,
    promotion.views,
    ac.code as categorielib
   FROM article_and_devise article
     JOIN article_promotion promotion ON article.id::text = promotion.article_id::text
     join article_categorie ac on ac.id = article.categorie_id 
     JOIN etat ON etat.id = promotion.etat;
create or replace view promotion_valider as select * from v_article_promotion where etat >=11


create table notification(
	id varchar(100) NOT NULL,
	message varchar(250) NOT NULL,
	utilisateur_id varchar(100),
	role_id varchar(100),
	date_insert timestamp not null default CURRENT_TIMESTAMP,
	has_viewed boolean not null default false
);
CREATE SEQUENCE seq_notification INCREMENT BY 1 MINVALUE 1 START 1 CACHE 1 NO CYCLE;

create or replace view etat_categorie as
SELECT * FROM ETAT e where id in ('11','0','1');


drop table commande_type;
 CREATE TABLE commande_type (
	id varchar(50) NOT NULL,
	code varchar(100) NOT NULL,
	description varchar(100) NOT NULL,
	CONSTRAINT commande_type_pkey PRIMARY KEY (id)
);


