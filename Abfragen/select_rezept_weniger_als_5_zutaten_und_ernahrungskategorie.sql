# Gibt die Rezepte zurück, die weniger als 5 Zutaten haben und Erährungskategorie X erfüllen
SELECT REZEPTNAME, KALORIENGES, ALLERGIENR, ERNAEHRUNGNR, COUNT(rezeptzutat.ZUTATENNR) AS ANZAHL_ZUTATEN FROM rezepte
JOIN rezeptzutat ON rezeptzutat.REZEPTNR = rezepte.REZEPTNR
WHERE rezepte.ERNAEHRUNGNR = 2
GROUP BY rezepte.REZEPTNR
HAVING COUNT(rezeptzutat.ZUTATENNR) < 5;