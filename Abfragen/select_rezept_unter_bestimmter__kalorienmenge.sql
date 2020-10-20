# Gibt die Rezepte zurück, die eine bestimmte Kalorienmenge nicht überschreiten
SELECT rezepte.REZEPTNR, rezepte.REZEPTNAME, SUM(zutat.KALORIEN * rezeptzutat.MENGE) AS KALORIEN_GES FROM rezepte
JOIN rezeptzutat ON rezepte.REZEPTNR = rezeptzutat.REZEPTNR
JOIN zutat ON rezeptzutat.ZUTATENNR = zutat.ZUTATENNR
GROUP BY rezepte.REZEPTNR
HAVING SUM(zutat.KALORIEN * rezeptzutat.MENGE) < 3500;