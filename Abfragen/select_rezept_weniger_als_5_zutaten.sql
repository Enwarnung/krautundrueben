# Gibt die Rezepte zurück, die weniger als 5 Zutaten haben
SELECT rezepte.REZEPTNR, rezepte.REZEPTNAME, COUNT(rezeptzutat.ZUTATENNR) AS ANZAHL_ZUTATEN FROM rezepte
JOIN rezeptzutat ON rezeptzutat.REZEPTNR = rezepte.REZEPTNR
GROUP BY rezepte.REZEPTNR
HAVING COUNT(rezeptzutat.ZUTATENNR) < 5;