--SELECT encode(sha256('foo'::bytea), 'hex');
ALTER TABLE boutique
ADD COLUMN date_expired DATE not null default CURRENT_DATE;

CREATE OR REPLACE VIEW v_article_promotion
AS SELECT 
	promotion.id,
	article.id as article_id ,
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
    article.devise,
    promotion."views" 
   FROM article_and_devise article
     JOIN article_promotion promotion ON article.id::text = promotion.article_id::text;
create or replace view promotion_valider as select * from v_article_promotion where etat >=11