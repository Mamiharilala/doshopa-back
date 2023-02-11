--
CREATE OR REPLACE VIEW boutique_libcomplet AS 
SELECT b.id,
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
    c.code AS categorielib
   FROM boutique b
     JOIN boutique_categorie c ON b.categorie_id::text = c.id::text;

CREATE OR REPLACE VIEW commandeliste
AS
 SELECT fille.id,
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
    fille.code_collecter,
    article.devise_id
   FROM commande_mere mere
     JOIN commande_fille fille ON mere.id::text = fille.mere::text
     LEFT JOIN article ON article.id::text = fille.article_id::text
     LEFT JOIN etat ON fille.etat = etat.id;
CREATE OR REPLACE VIEW public.boutique_and_categorie
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
    c.code AS categorie,
    c.description AS categorielib
   FROM boutique b
     JOIN boutique_categorie c ON b.categorie_id::text = c.id::text
  WHERE b.etat >= 11;
  CREATE OR REPLACE VIEW public.boutique_blog_valider
AS SELECT boutique_blog.id,
    boutique_blog.titre,
    boutique_blog.body,
    boutique_blog.date_insert,
    boutique_blog.boutique_id,
    boutique_blog.views,
    boutique_blog.image,
    boutique_blog.etat,
    boutique.denomination as boutiquelib
   FROM boutique_blog join boutique on boutique_blog.boutique_id = boutique.id 
  WHERE boutique_blog.etat >= 11;

  CREATE OR REPLACE VIEW promotion_article_boutique
AS SELECT a.id,
    a.prix_avant,
    a.prix_actuel,
    a.date_debut,
    a.date_fin,
    a.etat,
    a.article_id,
    a.quantite,
    ab.boutique_id,
    ab.boutique_denomination,
    ab.designation 
   FROM article_promotion a
     LEFT JOIN article_and_boutique ab ON a.article_id::text = ab.id::text;