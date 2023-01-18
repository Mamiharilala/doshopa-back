CREATE EXTENSION pgcrypto;
CREATE OR REPLACE FUNCTION sha1(bytea) returns text AS $$
SELECT encode(digest($1, 'sha1'), 'hex')
$$ LANGUAGE SQL STRICT IMMUTABLE;
create or replace view boutique_and_categorie as select b.*,c.code as categorie  from boutique as b 
join  boutique_categorie as c on b.categorie_id = c.id where etat>=11


 
--#New 15 01 2023
--  alldashboarddata source

CREATE OR REPLACE VIEW  alldashboarddata
AS SELECT COALESCE(count(dashboarddata.boutique_id), 0::bigint) AS totales_boutiques,
    COALESCE(sum(dashboarddata.commande_en_cours), 0::numeric) AS commande_en_cours,
    COALESCE(sum(dashboarddata.quantite_vente), 0::numeric) AS quantite_vente,
    COALESCE(sum(dashboarddata.chiffre_affaires), 0::double precision) AS chiffre_affaires,
    COALESCE(sum(dashboarddata.total_views), 0::bigint) AS total_views,
    COALESCE(sum(dashboarddata.total_articles), 0::numeric) AS total_articles,
    COALESCE(sum(dashboarddata.total_promotions), 0::numeric) AS total_promotions,
    COALESCE(sum(dashboarddata.total_blog), 0::numeric) AS total_blog
   FROM dashboarddata;


--  article_and_boutique source

CREATE OR REPLACE VIEW  article_and_boutique
AS SELECT a.id,
    a.designation,
    a.prix,
    a.reference,
    a.image,
    a.observation,
    a.categorie_id,
    a.quantite,
    a.boutique_id,
    a.devise_id,
    a.etat,
    b.denomination AS boutique_denomination
   FROM article a
     JOIN boutique b ON a.boutique_id::text = b.id::text;


--  article_and_devise source

CREATE OR REPLACE VIEW  article_and_devise
AS SELECT a.id,
    a.designation,
    a.prix,
    a.reference,
    a.image,
    a.observation,
    a.categorie_id,
    a.quantite,
    a.boutique_id,
    a.devise_id,
    a.etat,
    a.views,
    d.description AS devise
   FROM article a
     JOIN devise d ON a.devise_id::text = d.id::text;


--  article_libcomplet source

CREATE OR REPLACE VIEW  article_libcomplet
AS SELECT article.id,
    article.designation,
    article.prix,
    article.reference,
    article.image,
    article.observation,
    article.categorie_id,
    article.quantite,
    article.boutique_id,
    article.devise_id,
    article.etat,
    article.views,
    boutique.denomination AS boutique_denomination,
    devise.description AS devise_description,
    ac.code AS article_categorie_code
   FROM article
     JOIN boutique ON article.boutique_id::text = boutique.id::text
     LEFT JOIN devise ON article.devise_id::text = devise.id::text
     LEFT JOIN article_categorie ac ON article.categorie_id::text = ac.id::text;


--  article_libcomplet_valider source
CREATE OR REPLACE VIEW  article_libcomplet_valider
AS SELECT  *
   FROM article_libcomplet
  WHERE article_libcomplet.etat >= 11;


--  boutique_and_categorie source

CREATE OR REPLACE VIEW  boutique_and_categorie
AS SELECT b.id,
    b.denomination,
    b.siege,
    b.categorie_id,
    b.logo,
    b.mail,
    b.telephone,
    b.remarque,
    b.nif,
    b.stat,
    b.etat,
    b.type_id,
    b.views,
    b.apropos,
    b.information,
    b.note,
    c.code AS categorie
   FROM boutique b
     JOIN boutique_categorie c ON b.categorie_id::text = c.id::text
  WHERE b.etat >= 11;


--  boutique_and_categorie_4first source

CREATE OR REPLACE VIEW  boutique_and_categorie_4first
AS SELECT  *
   FROM boutique_and_categorie
  ORDER BY boutique_and_categorie.views DESC
 LIMIT 4;


--  boutique_blog_4first source

CREATE OR REPLACE VIEW  boutique_blog_4first
AS SELECT *
   FROM boutique_blog
  WHERE boutique_blog.etat >= 11
  ORDER BY boutique_blog.views DESC
 LIMIT 4;


--  boutique_blog_andboutique source

CREATE OR REPLACE VIEW  boutique_blog_andboutique
AS SELECT bb.id,
    bb.titre,
    bb.body,
    bb.date_insert,
    bb.boutique_id,
    bb.views,
    bb.image,
    bb.etat,
    boutique.denomination
   FROM boutique_blog bb
     LEFT JOIN boutique ON bb.boutique_id::text = boutique.id::text;


--  boutique_categorie_boutique source

CREATE OR REPLACE VIEW  boutique_categorie_boutique
AS SELECT bc.id,
    bc.code,
    bc.description
   FROM boutique_categorie bc
     JOIN boutique ON boutique.categorie_id::text = bc.id::text
  GROUP BY bc.id, bc.code, bc.description
 HAVING count(boutique.id) > 0;


--  commandeliste source

CREATE OR REPLACE VIEW  commandeliste
AS SELECT fille.id,
    mere.id AS idmere,
    mere.date_mere,
    fille.article_id,
    article.designation,
    fille.pu,
    fille.commande_type,
    fille.date_fille,
    fille.quantite,
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


--  commandeliste_boutique source
 
CREATE OR REPLACE VIEW  commandeliste_boutique
AS SELECT *
   FROM commandeliste
  WHERE commandeliste.etat >= 10;


--  commandeliste_cree source

CREATE OR REPLACE VIEW  commandeliste_cree
AS SELECT *
   FROM commandeliste
  WHERE commandeliste.etat = 1;


--  dashboarddata source

CREATE OR REPLACE VIEW  dashboarddata
AS SELECT b.id AS boutique_id,
    ( SELECT count(*) AS count
           FROM commande_fille cf2
          WHERE (cf2.article_id::text IN ( SELECT a4.id
                   FROM article a4
                  WHERE a4.boutique_id::text = b.id::text)) AND cf2.etat > 0 AND cf2.etat < 14) AS commande_en_cours,
    ( SELECT count(*) AS count
           FROM commande_fille cf3
          WHERE (cf3.article_id::text IN ( SELECT a4.id
                   FROM article a4
                  WHERE a4.boutique_id::text = b.id::text)) AND cf3.est_payer) AS quantite_vente,
    ( SELECT COALESCE(sum(cf.quantite::double precision * cf.pu), 0::double precision) AS "coalesce"
           FROM commande_fille cf
          WHERE (cf.article_id::text IN ( SELECT a3.id
                   FROM article a3
                  WHERE a3.boutique_id::text = b.id::text)) AND cf.est_payer) AS chiffre_affaires,
    b.views AS total_views,
    ( SELECT count(*) AS count
           FROM article a
          WHERE a.boutique_id::text = b.id::text AND a.etat > 0) AS total_articles,
    ( SELECT count(*) AS count
           FROM article_promotion ap
          WHERE (ap.article_id::text IN ( SELECT a2.id
                   FROM article a2
                  WHERE a2.boutique_id::text = b.id::text)) AND ap.etat > 0) AS total_promotions,
    ( SELECT count(*) AS count
           FROM boutique_blog bb
          WHERE bb.boutique_id::text = b.id::text AND bb.etat > 0) AS total_blog,
    ( SELECT u.id
           FROM utilisateur u
          WHERE u.boutique_id::text = b.id::text) AS utilisateur_id
   FROM boutique b
  GROUP BY b.id;


--  dashboarddata_lib source

CREATE OR REPLACE VIEW  dashboarddata_lib
AS SELECT d.boutique_id,
    d.commande_en_cours,
    d.quantite_vente,
    d.chiffre_affaires,
    d.total_views,
    d.total_articles,
    d.total_promotions,
    d.total_blog,
    d.utilisateur_id,
    boutique.denomination AS boutique_denomination
   FROM dashboarddata d
     LEFT JOIN boutique ON d.boutique_id::text = boutique.id::text;


--  etat_commande source

CREATE OR REPLACE VIEW  etat_commande
AS SELECT etat.id,
    etat.code,
    etat.description
   FROM etat
  WHERE etat.id = ANY (ARRAY[11, 14, 12, 22, 10])
  ORDER BY etat.id;


--  promotion_article_boutique source

CREATE OR REPLACE VIEW  promotion_article_boutique
AS SELECT a.id,
    a.prix_avant,
    a.prix_actuel,
    a.date_debut,
    a.date_fin,
    a.etat,
    a.article_id,
    a.quantite,
    ab.boutique_id,
    ab.boutique_denomination
   FROM article_promotion a
     LEFT JOIN article_and_boutique ab ON a.article_id::text = ab.id::text;


--  v_article_promotion source

CREATE OR REPLACE VIEW  v_article_promotion
AS SELECT article.id,
    article.designation,
    article.prix,
    article.reference,
    article.image,
    article.observation,
    article.categorie_id,
    article.boutique_id,
    article.devise_id,
    promotion.prix_actuel,
    promotion.date_debut,
    promotion.date_fin,
    promotion.quantite,
    promotion.etat,
    article.devise
   FROM article_and_devise article
     JOIN article_promotion promotion ON article.id::text = promotion.article_id::text;
	 
ALTER TABLE utilisateur ADD UNIQUE (login);