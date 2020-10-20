SELECT SUM(zutat.NETTOPREIS * rezeptzutat.MENGE) AS RezeptPreis
	FROM zutat
	JOIN rezeptzutat ON zutat.ZUTATENNR=rezeptzutat.ZUTATENNR
	WHERE rezeptzutat.REZEPTNR = 5;