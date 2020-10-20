SELECT SUM(zutat.NETTOPREIS * rezeptzutat.MENGE) * bestellungrezept.MENGE AS BestellPreis
FROM zutat
JOIN rezeptzutat ON zutat.ZUTATENNR=rezeptzutat.ZUTATENNR
JOIN rezepte ON rezeptzutat.REZEPTNR=rezepte.REZEPTNR
JOIN bestellungrezept ON rezepte.REZEPTNR=bestellungrezept.REZEPTNR
WHERE rezeptzutat.REZEPTNR = 6 AND bestellungrezept.BESTELLNR = 14;
