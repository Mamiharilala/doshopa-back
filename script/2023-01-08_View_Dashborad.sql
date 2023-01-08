-- view for retrieving basic data to be displayed on dashboard
CREATE OR REPLACE VIEW public.dashboarddata
AS
select 
	b.id Boutique_id, 
	(select count(*) 
		from 
			commande_fille cf2
		where cf2.article_id 
			in 
			(select id from article a4 where a4.boutique_id = b.id) and cf2.etat > 0 and cf2.etat < 14
	) as Commande_en_cours,
	(select count(*) 
		from 
			commande_fille cf3
		where cf3.article_id 
			in 
			(select id from article a4 where a4.boutique_id = b.id) and cf3.est_payer
	) as Quantite_vente,
	(select coalesce(sum(quantite * pu), 0) 
		from 
			commande_fille cf 
		where cf.article_id 
			in 
			(select id from article a3 where a3.boutique_id = b.id) and cf.est_payer
	) as Chiffre_affaires,
	b."views" Total_views,
	(select count(*) 
		from 
			article a 
		where 
			a.boutique_id=b.id and etat > 0
	) as Total_articles,
	(select count(*) 
		from 
			article_promotion ap 
		where 
			ap.article_id 
			in 
			(select id from article a2  where a2.boutique_id = b.id) and ap.etat>0
	) as Total_promotions,
	(select count(*) 
		from 
			boutique_blog bb 
		where 
			bb.boutique_id=b.id and bb.etat > 0
	) as Total_blog
from
	boutique b 
group by
	b.id;