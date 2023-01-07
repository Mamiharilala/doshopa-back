INSERT INTO menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu'))  , 'Validation et paiement', 'micon bi bi-table', 'container.jsp?content=boutique/boutique_commande_validation.jsp', 4, 3, 'MENU4');
