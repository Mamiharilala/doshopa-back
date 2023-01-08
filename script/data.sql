INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Liste', 'micon bi bi-table', 'container.jsp?content=promotion/promotion_read.jsp', 2, 3, 'MENU3');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Créer', 'icon-copy dw dw-add', 'container.jsp?content=promotion/promotion_create.jsp', 1, 3, 'MENU3');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Créer', 'icon-copy dw dw-calendar-3', 'container.jsp?content=boutique/boutique_create.jsp', 1, 3, 'MENU4');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Liste', 'micon bi bi-table', 'container.jsp?content=boutique/boutique_read.jsp', 2, 3, 'MENU4');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Liste', 'micon bi bi-table', 'container.jsp?content=produit/produit_read.jsp', 2, 3, 'MENU5');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Créer', 'icon-copy dw dw-add', 'container.jsp?content=produit/produit_create.jsp', 1, 3, 'MENU5');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Liste des commandes', 'micon bi bi-table', 'container.jsp?content=boutique/boutique_commande_read.jsp', 3, 3, 'MENU4');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Racine', 'icon-copy dw dw-home', '', 1, 1, '');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Produit', 'micon bi bi-archive', '', 1, 2, 'MENU1');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Boutique', 'micon bi bi-house', '', 2, 2, 'MENU1');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Promotion', 'micon bi bi-calendar4-week', '', 3, 2, 'MENU1');
INSERT INTO menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Affecter code collecter', 'icon-copy dw dw-add', 'container.jsp?content=boutique/boutique_affectation_code_collecter.jsp', 4, 3, 'MENU4');
INSERT INTO menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu'))  , 'Collecter', 'micon bi bi-table', 'container.jsp?content=boutique/boutique_collecter.jsp', 5, 3, 'MENU4');
 INSERT INTO menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu'))  , 'Livraison', 'micon bi bi-table', 'container.jsp?content=boutique/boutique_livrer.jsp', 6, 3, 'MENU4');
