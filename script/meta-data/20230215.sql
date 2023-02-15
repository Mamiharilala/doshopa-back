--SELECT encode(sha256('foo'::bytea), 'hex');
ALTER TABLE boutique
ADD COLUMN date_expired DATE not null default CURRENT_DATE;

