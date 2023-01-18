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

-- JAN 09 2023
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Accueil', 'micon dw dw-home', '', 1, 2, 'MENU1');
INSERT INTO  menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Tableau de bord', 'micon dw dw-home', 'container.jsp?content=boutique/boutique_dashboard.jsp', 1, 3, 'MENU1');

-- JAn 15 2023
INSERT INTO utilisateur
(id, nom, prenom, mail, telephone, mot_passe, adresse, etat, sexe, role_id, login, has_valid_mail, boutique_id)
VALUES('UTLS'||(select nextval('seq_utilisateur'), 'Sylvana', 'Precilia', 'sylvanaprecilia.l17@gmail.com', '0324370684', '77de68daecd823babbb58edb1c8e14d7106e83bb', 'Tsiadana ', 11, 'f', 'admin', 'sylvana', true, 'BO4676');
INSERT INTO boutique
(id, denomination, siege, categorie_id, logo, mail, telephone, remarque, nif, stat, etat, type_id, "views", apropos, information, note)
VALUES('BO'||(select nexval('seq_boutique')), 'Pannini food', 'Ivato', 'BC003', '', 'sylvanaprecilia.l17@gmail.com', '0329403490', 'Livraison ÃÂ  Tana seulement', '243645', '353537', 1, 'BT002', 0, NULL, NULL, NULL);

INSERT INTO  boutique_categorie
(id, code, description)
VALUES('BC'||(select nexval('seq_boutique_categorie'), 'Matériel informatique', 'Matériel informatique');
INSERT INTO  boutique_categorie
(id, code, description)
VALUES('BC004', 'Habillement', 'Habillement');
INSERT INTO  boutique_categorie
(id, code, description)
VALUES('BC005', 'Produit cosmétique', 'Produit cosmétique');
INSERT INTO  boutique_categorie
(id, code, description)
VALUES('BC006', 'Piece auto_moto', 'Piece auto_moto');
INSERT INTO  boutique_categorie
(id, code, description)
VALUES('BC003', 'Restaurant', 'Restaurant');
INSERT INTO  boutique_categorie
(id, code, description)
VALUES('BC001', 'Accessoire de mode', 'Accessoire de mode');
