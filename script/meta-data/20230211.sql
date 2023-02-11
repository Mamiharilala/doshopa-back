-- Update on view "commandeliste_boutique" in 20130115.sql on line 192
DROP VIEW commandeliste_boutique;
CREATE OR REPLACE VIEW  commandeliste_boutique
AS SELECT boutique.id as boutique_id, commandeliste.*
   FROM boutique, article, commandeliste
  WHERE boutique.id = article.boutique_id and article.id = commandeliste.article_id and commandeliste.etat >= 10;