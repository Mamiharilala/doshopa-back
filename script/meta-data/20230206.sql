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
     JOIN boutique_categorie c ON b.categorie_id::text = c.id::text