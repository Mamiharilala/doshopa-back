 CREATE OR REPLACE VIEW boutique_and_categorie_4first
AS SELECT boutique_and_categorie.id,
    boutique_and_categorie.denomination,
    boutique_and_categorie.siege,
    boutique_and_categorie.categorie_id,
    boutique_and_categorie.logo,
    boutique_and_categorie.mail,
    boutique_and_categorie.telephone,
    boutique_and_categorie.remarque,
    boutique_and_categorie.nif,
    boutique_and_categorie.stat,
    boutique_and_categorie.etat,
    boutique_and_categorie.type_id,
    boutique_and_categorie.views,
    boutique_and_categorie.apropos,
    boutique_and_categorie.information,
    boutique_and_categorie.note,
    boutique_and_categorie.categorie as categorielib
   FROM boutique_and_categorie
  ORDER BY boutique_and_categorie.views DESC
 LIMIT 4;
  create or replace view article_search as
 select distinct b.*,a.id as article,a.designation as article_designation,a.categorie_id as article_categorie,b.categorie from article a join boutique_and_categorie b on b.id = a.boutique_id 
 --menu 
create or replace view menu_granted as 
 select menu.*,utilisateur_id from menu join utilisateur_privilege up on up.menu_id = menu.id 
--Fin menu
--Dashboard
CREATE OR REPLACE VIEW dashboarddata
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
          WHERE bb.boutique_id::text = b.id::text AND bb.etat > 0) AS total_blog
   FROM boutique b
  GROUP BY b.id;
CREATE OR REPLACE VIEW dashboarddata_lib
AS SELECT d.boutique_id,
    d.commande_en_cours,
    d.quantite_vente,
    d.chiffre_affaires,
    d.total_views,
    d.total_articles,
    d.total_promotions,
    d.total_blog,
    boutique.denomination AS boutique_denomination
   FROM dashboarddata d
     LEFT JOIN boutique ON d.boutique_id::text = boutique.id::text;