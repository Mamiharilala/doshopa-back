 
INSERT INTO utilisateur_privilege
(id, utilisateur_id, menu_id, etat)
VALUES('UP'||(select nextval('seq_user_privilege')), 'UTL0001', 'MENU9', 11);


INSERT INTO menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Personnel', 'micon bi bi-house', '', 9, 2, 'MENU1');
--mere = id an'ilay eo ambony
INSERT INTO menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Liste', 'micon bi bi-table', 'container.jsp?content=utilisateur/utilisateur_read.jsp', 2, 3, 'MENU21');
--mere = mere an'ilay eo ambony
INSERT INTO menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Créer', 'icon-copy dw dw-add', 'container.jsp?content=utilisateur/utilisateur_create.jsp', 1, 3, 'MENU21');
