SELECT rezepte.REZEPTNAME AS Rezept_mit_Lachs
FROM rezepte
INNER JOIN rezeptzutat ON rezepte.REZEPTNR=rezeptzutat.REZEPTNR
INNER JOIN zutat ON rezeptzutat.ZUTATENNR=zutat.ZUTATENNR
WHERE zutat.BEZEICHNUNG='Lachs';