create or replace view dashboard_lib as
select d.*,boutique.denomination as boutique_denomination from dashboarddata d left join boutique on d.boutique_id = boutique.id