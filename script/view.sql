CREATE EXTENSION pgcrypto;
CREATE OR REPLACE FUNCTION sha1(bytea) returns text AS $$
SELECT encode(digest($1, 'sha1'), 'hex')
$$ LANGUAGE SQL STRICT IMMUTABLE;
create or replace view boutique_and_categorie as select b.*,c.code as categorie  from boutique as b 
join  boutique_categorie as c on b.categorie_id = c.id where etat>=11


create or replace view article_and_boutique as select a.*,b."denomination" as boutique_denomination  from online.article as a 
join online.boutique as b on a.boutique_id = b.id

create or replace view article_and_devise as select a.*,d.description as devise  from online.article as a 
join online.devise as d on a.devise_id = d.id
 
create or replace view promotion_article_boutique as
 select a.*,ab.boutique_id,ab.boutique_denomination  
from online.article_promotion as a left join article_and_boutique as ab on a.article_id = ab.id

create or replace view v_article_promotion as
select article.id, article.designation, article.prix, article.reference, article.image, article.observation, article.categorie_id, article.boutique_id, article.devise_id,promotion.prix_actuel 
 ,date_debut, date_fin,promotion.quantite ,promotion.etat,article.devise
 from article_and_devise as article join online.article_promotion as promotion on article.id = promotion.article_id
 
 
	 
create view article_libcomplet as select article.*,boutique.denomination as boutique_denomination,devise.description as devise_description,ac.code as article_categorie_code  from article join boutique on article.boutique_id = boutique.id
left join devise on article.devise_id = devise.id left join article_categorie ac on article.categorie_id = ac.id ;
    
create or replace view boutique_categorie_boutique as select bc.id,code,description from boutique_categorie bc join boutique on boutique.categorie_id = bc.id 
group by bc.id,code,description having count(boutique.id)>0;  

create or replace view boutique_and_categorie_4first as select * from boutique_and_categorie order by views desc limit 4

create or replace view boutique_blog_4first as select * from boutique_blog where etat>=11 order by views desc limit 4

create or replace view boutique_blog_andboutique as
select bb.*,boutique.denomination as denomination from boutique_blog bb left join boutique on bb.boutique_id = boutique.id

create or replace view article_libcomplet_valider as select * from article_libcomplet where etat >=11

--#New 05 01 2023
CREATE OR REPLACE VIEW public.commandeliste
AS SELECT fille.id,
    mere.id AS idmere,
    mere.date_mere,
    fille.article_id,
    article.designation,
    fille.pu,
    fille.commande_type,
    fille.date_fille,
    fille.quantite::double precision * fille.pu AS montant,
    mere.utilisateur_id,
    fille.etat,
    etat.description AS etatlib,
    fille.remarque,
    fille.code_collecter
   FROM commande_mere mere
     JOIN commande_fille fille ON mere.id::text = fille.mere::text
     LEFT JOIN article ON article.id::text = fille.article_id::text
     LEFT JOIN etat ON fille.etat = etat.id;
	 
CREATE OR REPLACE VIEW commandeliste_cree
AS SELECT * from commandeliste where etat = 1;

CREATE OR REPLACE VIEW commandeliste_boutique
AS SELECT * from commandeliste where etat >= 10;

 create or replace view etat_commande as select * from etat where id in(11,14,12,22,10) order by id asc
 
ALTER TABLE utilisateur ADD UNIQUE (login);