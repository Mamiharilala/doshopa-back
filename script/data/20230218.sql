-- BEGIN commande_type 
INSERT INTO commande_type
(id, code, description)
VALUES('COMMANDE', 'Commande', 'Commande');
INSERT INTO commande_type
(id, code, description)
VALUES('PRECOMMANDE', 'Précommande', 'Précommande');
-- END commande_type 
--BEGIN menu_roles
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU17');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'boutique', 'MENU12');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU3');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU5');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU8');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU16');
 INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU9');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU6');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU7');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU15');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU1');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'livreur', 'MENU19');
INSERT INTO menu_roles
(id, role_id, menu_id)
VALUES('MNRL'||(select nextval('seq_menu_roles')), 'boutique', 'MENU1');
--BEGIN ROLES
INSERT INTO roles
(id, description)
VALUES('boutique', 'BOUTIQUE');
INSERT INTO roles
(id, description)
VALUES('public', 'UTILISATEUR');
INSERT INTO roles
(id, description)
VALUES('livreur', 'LIVREUR');
INSERT INTO roles
(id, description)
VALUES('admin', 'ADMIN');
--FIN ROLES








