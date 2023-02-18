create or replace view commande_fillecomplet as
select 
commande_fille.id, article_id, commande_fille.quantite, commande_fille.pu, mere, commande_fille.etat, commande_type, commande_fille.remarque, date_fille, code_collecter, 
code_livrer, est_payer,commande_type.description as commande_typelib,etat.description as etatlib,article.designation
from commande_fille join commande_type on commande_type.id = commande_fille.commande_type
join etat on etat.id = commande_fille.etat join article on commande_fille.article_id = article.id;

CREATE OR REPLACE VIEW etat_commande
AS SELECT etat.id,
    etat.code,
    etat.description
   FROM etat
  WHERE etat.id = ANY (ARRAY[11, 14, 12, 22, 10,0])
  ORDER BY etat.id desc;