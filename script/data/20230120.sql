UPDATE menu
SET libelle='Tableau de bord global', icone='micon bi bi-table', src='container.jsp?content=boutique/dashboard_global_read.jsp', rang=7, profondeur=3, mere='MENU4'
WHERE id='MENU20';
INSERT INTO utilisateur_privilege
(id, utilisateur_id, menu_id, etat)
VALUES('UP1', 'UTL0001', 'MENU16', 11);
INSERT INTO utilisateur_privilege
(id, utilisateur_id, menu_id, etat)
VALUES('UP2', 'UTL0001', 'MENU4', 11);
INSERT INTO utilisateur_privilege
(id, utilisateur_id, menu_id, etat)
VALUES('UP3', 'UTL0001', 'MENU1', 11);

