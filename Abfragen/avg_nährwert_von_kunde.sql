SELECT bestellung.KUNDENNR AS 'Kunde',
SUM(zutat.KALORIEN * bestellungzutat.MENGE) / SUM(bestellungzutat.MENGE) AS Kalorien_Schnitt,
SUM(zutat.KOHLENHYDRATE * bestellungzutat.MENGE) / SUM(bestellungzutat.MENGE) AS Kohlenhydrate_Schnitt,
SUM(zutat.PROTEIN * bestellungzutat.MENGE) / SUM(bestellungzutat.MENGE) AS Protein_Schnitt
FROM zutat
JOIN bestellungzutat ON zutat.ZUTATENNR=bestellungzutat.ZUTATENNR
JOIN bestellung ON bestellungzutat.BESTELLNR=bestellung.BESTELLNR
#WHERE bestellung.KUNDENNR='2003';			/*Diese Zeile wenn für spezifischen Kunden*/
GROUP BY bestellung.KUNDENNR;					/*Diese Zeile wenn für alle Kunden*/