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
  
  CREATE OR REPLACE VIEW commandeliste
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
    fille.code_collecter,
    article.devise_id,
    fille.code_livrer 
   FROM commande_mere mere
     JOIN commande_fille fille ON mere.id::text = fille.mere::text
     LEFT JOIN article ON article.id::text = fille.article_id::text
     LEFT JOIN etat ON fille.etat = etat.id;
	 
CREATE OR REPLACE VIEW commandeliste_boutique
AS SELECT boutique.id AS boutique_id,
    commandeliste.id,
    commandeliste.idmere,
    commandeliste.date_mere,
    commandeliste.article_id,
    commandeliste.designation,
    commandeliste.pu,
    commandeliste.commande_type,
    commandeliste.date_fille,
    commandeliste.quantite,
    commandeliste.montant,
    commandeliste.utilisateur_id,
    commandeliste.etat,
    commandeliste.etatlib,
    commandeliste.remarque,
    commandeliste.code_collecter,
    commandeliste.devise_id,
    commandeliste.code_livrer
   FROM boutique,
    article,
    commandeliste
  WHERE boutique.id::text = article.boutique_id::text AND article.id::text = commandeliste.article_id::text AND commandeliste.etat >= 10;
  
CREATE TABLE menu_roles (
	id varchar(50) NOT NULL,
	role_id varchar(100) NOT NULL,
	menu_id varchar(100) NOT NULL,
	CONSTRAINT menu_roles_pkey PRIMARY KEY (id)
);
CREATE SEQUENCE seq_menu_roles INCREMENT BY 1 MINVALUE 1 START 1 CACHE 1 NO CYCLE;
ALTER TABLE menu_roles
ADD CONSTRAINT constraint_menu_roles
UNIQUE(role_id,menu_id);