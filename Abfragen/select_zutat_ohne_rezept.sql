SELECT zutat.ZUTATENNR, zutat.BEZEICHNUNG
FROM zutat
LEFT JOIN rezeptzutat ON zutat.ZUTATENNR = rezeptzutat.ZUTATENNR
WHERE rezeptzutat.ZUTATENNR IS NULL;