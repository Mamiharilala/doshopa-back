create or replace view dashboarddata_lib as
select d.*,boutique.denomination as boutique_denomination from dashboarddata d left join boutique on d.boutique_id = boutique.id


--
INSERT INTO menu
(id, libelle, icone, src, rang, profondeur, mere)
VALUES('MENU'||(select nextval('seq_menu')), 'Tableau de bord global', 'micon bi bi-table', 'container.jsp?content=boutique/tableau_bord_global_read.jsp', 7, 3, 'MENU4');
