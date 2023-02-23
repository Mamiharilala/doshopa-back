ALTER TABLE commande_mere 
ADD COLUMN lieu_livraison varchar(220);
ALTER TABLE commande_mere 
ADD COLUMN contact varchar(50);
ALTER TABLE  commande_mere
ADD COLUMN frais_livraison real DEFAULT 0;