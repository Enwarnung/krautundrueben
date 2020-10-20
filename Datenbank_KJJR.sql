-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für krautundrueben
CREATE DATABASE IF NOT EXISTS `krautundrueben` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `krautundrueben`;

-- Exportiere Struktur von Tabelle krautundrueben.allergien
CREATE TABLE IF NOT EXISTS `allergien` (
  `ALLERGIENR` int(11) NOT NULL AUTO_INCREMENT,
  `ALLERGIENAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ALLERGIENR`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.allergien: ~17 rows (ungefähr)
DELETE FROM `allergien`;
/*!40000 ALTER TABLE `allergien` DISABLE KEYS */;
INSERT INTO `allergien` (`ALLERGIENR`, `ALLERGIENAME`) VALUES
	(1, 'Laktose'),
	(2, 'Nussallergie'),
	(4, 'Glutenunverträglichkeit'),
	(5, 'Eiallergie'),
	(6, 'Laktoseunverträglichkeit'),
	(8, 'Sojaallergie'),
	(11, 'Ernussallergie'),
	(12, 'Fischallergie'),
	(13, 'Krustentierallergie'),
	(14, 'Lupinenallergie'),
	(15, 'Schalenfrüchteallergie'),
	(16, 'Schwefeldioxidallergie'),
	(17, 'Sellerieallergie'),
	(18, 'Senfallergie'),
	(19, 'Sesamsamenallergie'),
	(20, 'Weichtierallergie'),
	(21, 'Keine');
/*!40000 ALTER TABLE `allergien` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.bestellung
CREATE TABLE IF NOT EXISTS `bestellung` (
  `BESTELLNR` int(11) NOT NULL AUTO_INCREMENT,
  `KUNDENNR` int(11) DEFAULT NULL,
  `BESTELLDATUM` date DEFAULT NULL,
  `RECHNUNGSBETRAG` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`BESTELLNR`),
  KEY `KUNDENNR` (`KUNDENNR`),
  CONSTRAINT `bestellung_ibfk_1` FOREIGN KEY (`KUNDENNR`) REFERENCES `kunde` (`KUNDENNR`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.bestellung: ~12 rows (ungefähr)
DELETE FROM `bestellung`;
/*!40000 ALTER TABLE `bestellung` DISABLE KEYS */;
INSERT INTO `bestellung` (`BESTELLNR`, `KUNDENNR`, `BESTELLDATUM`, `RECHNUNGSBETRAG`) VALUES
	(1, 2001, '2020-07-01', 6.21),
	(2, 2002, '2020-07-08', 32.96),
	(3, 2003, '2020-08-01', 24.08),
	(4, 2004, '2020-08-02', 19.90),
	(5, 2005, '2020-08-02', 6.47),
	(6, 2006, '2020-08-10', 6.96),
	(7, 2007, '2020-08-10', 2.41),
	(8, 2008, '2020-08-10', 13.80),
	(9, 2009, '2020-08-10', 8.67),
	(10, 2007, '2020-08-15', 17.98),
	(11, 2005, '2020-08-12', 8.67),
	(12, 2003, '2020-08-13', 20.87),
	(13, 2003, '2020-09-19', 186.70),
	(14, 2001, '2020-10-19', 123.75);
/*!40000 ALTER TABLE `bestellung` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.bestellungrezept
CREATE TABLE IF NOT EXISTS `bestellungrezept` (
  `BESTELLNR` int(11) NOT NULL,
  `REZEPTNR` int(11) NOT NULL,
  `MENGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`BESTELLNR`,`REZEPTNR`),
  KEY `REZEPTNR` (`REZEPTNR`),
  CONSTRAINT `bestellungrezept_ibfk_1` FOREIGN KEY (`BESTELLNR`) REFERENCES `bestellung` (`BESTELLNR`),
  CONSTRAINT `bestellungrezept_ibfk_2` FOREIGN KEY (`REZEPTNR`) REFERENCES `rezepte` (`REZEPTNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.bestellungrezept: ~2 rows (ungefähr)
DELETE FROM `bestellungrezept`;
/*!40000 ALTER TABLE `bestellungrezept` DISABLE KEYS */;
INSERT INTO `bestellungrezept` (`BESTELLNR`, `REZEPTNR`, `MENGE`) VALUES
	(13, 5, 5),
	(14, 6, 3);
/*!40000 ALTER TABLE `bestellungrezept` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.bestellungzutat
CREATE TABLE IF NOT EXISTS `bestellungzutat` (
  `BESTELLNR` int(11) NOT NULL,
  `ZUTATENNR` int(11) NOT NULL,
  `MENGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`BESTELLNR`,`ZUTATENNR`),
  KEY `FK_bestellungzutat_zutat` (`ZUTATENNR`),
  CONSTRAINT `FK_bestellungzutat_zutat` FOREIGN KEY (`ZUTATENNR`) REFERENCES `zutat` (`ZUTATENNR`),
  CONSTRAINT `bestellungzutat_ibfk_1` FOREIGN KEY (`BESTELLNR`) REFERENCES `bestellung` (`BESTELLNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.bestellungzutat: ~26 rows (ungefähr)
DELETE FROM `bestellungzutat`;
/*!40000 ALTER TABLE `bestellungzutat` DISABLE KEYS */;
INSERT INTO `bestellungzutat` (`BESTELLNR`, `ZUTATENNR`, `MENGE`) VALUES
	(1, 9002, 5),
	(1, 9003, 3),
	(1, 9005, 3),
	(1, 9007, 2),
	(2, 9004, 4),
	(2, 9006, 5),
	(2, 9020, 10),
	(2, 9021, 5),
	(3, 9015, 5),
	(3, 9023, 15),
	(4, 9017, 2),
	(4, 9019, 7),
	(5, 9002, 5),
	(5, 9003, 4),
	(5, 9005, 5),
	(6, 9011, 5),
	(7, 9010, 9),
	(8, 9009, 7),
	(8, 9013, 5),
	(9, 9008, 4),
	(9, 9013, 5),
	(10, 9012, 7),
	(10, 9018, 7),
	(11, 9013, 5),
	(11, 9019, 2),
	(12, 9011, 15);
/*!40000 ALTER TABLE `bestellungzutat` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.ernaehrung
CREATE TABLE IF NOT EXISTS `ernaehrung` (
  `ERNAEHRUNGNR` int(11) NOT NULL AUTO_INCREMENT,
  `ERNAEHRUNGNAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ERNAEHRUNGNR`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.ernaehrung: ~6 rows (ungefähr)
DELETE FROM `ernaehrung`;
/*!40000 ALTER TABLE `ernaehrung` DISABLE KEYS */;
INSERT INTO `ernaehrung` (`ERNAEHRUNGNR`, `ERNAEHRUNGNAME`) VALUES
	(1, 'Vegan'),
	(2, 'Vegetarisch'),
	(3, 'Frutarisch'),
	(4, 'ohne Gentechnik'),
	(6, 'Kannibalismus'),
	(7, 'Pescetarisch');
/*!40000 ALTER TABLE `ernaehrung` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.kunde
CREATE TABLE IF NOT EXISTS `kunde` (
  `KUNDENNR` int(11) NOT NULL,
  `NACHNAME` varchar(50) DEFAULT NULL,
  `VORNAME` varchar(50) DEFAULT NULL,
  `GEBURTSDATUM` date DEFAULT NULL,
  `STRASSE` varchar(50) DEFAULT NULL,
  `HAUSNR` varchar(6) DEFAULT NULL,
  `PLZ` varchar(5) DEFAULT NULL,
  `ORT` varchar(50) DEFAULT NULL,
  `TELEFON` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`KUNDENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.kunde: ~9 rows (ungefähr)
DELETE FROM `kunde`;
/*!40000 ALTER TABLE `kunde` DISABLE KEYS */;
INSERT INTO `kunde` (`KUNDENNR`, `NACHNAME`, `VORNAME`, `GEBURTSDATUM`, `STRASSE`, `HAUSNR`, `PLZ`, `ORT`, `TELEFON`, `EMAIL`) VALUES
	(2001, 'Wellensteyn', 'Kira', '1990-05-05', 'Eppendorfer Landstrasse', '104', '20249', 'Hamburg', '040/443322', 'k.wellensteyn@yahoo.de'),
	(2002, 'Foede', 'Dorothea', '2000-03-24', 'Ohmstraße', '23', '22765', 'Hamburg', '040/543822', 'd.foede@web.de'),
	(2003, 'Leberer', 'Sigrid', '1989-09-21', 'Bilser Berg', '6', '20459', 'Hamburg', '0175/1234588', 'sigrid@leberer.de'),
	(2004, 'Soerensen', 'Hanna', '1974-04-03', 'Alter Teichweg', '95', '22049', 'Hamburg', '040/634578', 'h.soerensen@yahoo.de'),
	(2005, 'Schnitter', 'Marten', '1964-04-17', 'Stübels', '10', '22835', 'Barsbüttel', '0176/447587', 'schni_mart@gmail.com'),
	(2006, 'Maurer', 'Belinda', '1978-09-09', 'Grotelertwiete', '4a', '21075', 'Hamburg', '040/332189', 'belinda1978@yahoo.de'),
	(2007, 'Gessert', 'Armin', '1978-01-29', 'Küstersweg', '3', '21079', 'Hamburg', '040/67890', 'armin@gessert.de'),
	(2008, 'Haessig', 'Jean-Marc', '1982-08-30', 'Neugrabener Bahnhofstraße', '30', '21149', 'Hamburg', '0178-67013390', 'jm@haessig.de'),
	(2009, 'Urocki', 'Eric', '1999-12-04', 'Elbchaussee', '228', '22605', 'Hamburg', '0152-96701390', 'urocki@outlook.de');
/*!40000 ALTER TABLE `kunde` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.lieferant
CREATE TABLE IF NOT EXISTS `lieferant` (
  `LIEFERANTENNR` int(11) NOT NULL,
  `LIEFERANTENNAME` varchar(50) DEFAULT NULL,
  `STRASSE` varchar(50) DEFAULT NULL,
  `HAUSNR` varchar(6) DEFAULT NULL,
  `PLZ` varchar(5) DEFAULT NULL,
  `ORT` varchar(50) DEFAULT NULL,
  `TELEFON` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LIEFERANTENNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.lieferant: ~3 rows (ungefähr)
DELETE FROM `lieferant`;
/*!40000 ALTER TABLE `lieferant` DISABLE KEYS */;
INSERT INTO `lieferant` (`LIEFERANTENNR`, `LIEFERANTENNAME`, `STRASSE`, `HAUSNR`, `PLZ`, `ORT`, `TELEFON`, `EMAIL`) VALUES
	(101, 'Bio-Hof Müller', 'Dorfstraße', '74', '24354', 'Weseby', '04354-9080', 'mueller@biohof.de'),
	(102, 'Obst-Hof Altes Land', 'Westerjork 74', '76', '21635', 'Jork', '04162-4523', 'info@biohof-altesland.de'),
	(103, 'Molkerei Henning', 'Molkereiwegkundekunde', '13', '19217', 'Dechow', '038873-8976', 'info@molkerei-henning.de');
/*!40000 ALTER TABLE `lieferant` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.rezepte
CREATE TABLE IF NOT EXISTS `rezepte` (
  `REZEPTNR` int(11) NOT NULL AUTO_INCREMENT,
  `REZEPTNAME` varchar(100) NOT NULL,
  PRIMARY KEY (`REZEPTNR`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.rezepte: ~0 rows (ungefähr)
DELETE FROM `rezepte`;
/*!40000 ALTER TABLE `rezepte` DISABLE KEYS */;
INSERT INTO `rezepte` (`REZEPTNR`, `REZEPTNAME`) VALUES
	(5, 'Lachslasagne'),
	(6, 'Thaicurry mit Hähnchen'),
	(7, 'Kartoffelsuppe');
/*!40000 ALTER TABLE `rezepte` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.rezeptzutat
CREATE TABLE IF NOT EXISTS `rezeptzutat` (
  `REZEPTNR` int(11) NOT NULL,
  `ZUTATENNR` int(11) NOT NULL,
  `MENGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`REZEPTNR`,`ZUTATENNR`),
  KEY `FK_rezeptzutat_zutat` (`ZUTATENNR`),
  CONSTRAINT `FK_rezeptzutat_zutat` FOREIGN KEY (`ZUTATENNR`) REFERENCES `zutat` (`ZUTATENNR`),
  CONSTRAINT `rezeptzutat_ibfk_1` FOREIGN KEY (`REZEPTNR`) REFERENCES `rezepte` (`REZEPTNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.rezeptzutat: ~32 rows (ungefähr)
DELETE FROM `rezeptzutat`;
/*!40000 ALTER TABLE `rezeptzutat` DISABLE KEYS */;
INSERT INTO `rezeptzutat` (`REZEPTNR`, `ZUTATENNR`, `MENGE`) VALUES
	(5, 9015, 1),
	(5, 9017, 1),
	(5, 9022, 1),
	(5, 9024, 1),
	(5, 9026, 1),
	(5, 9027, 1),
	(5, 9028, 1),
	(5, 9029, 1),
	(5, 9030, 1),
	(5, 9031, 1),
	(5, 9032, 1),
	(5, 9033, 1),
	(6, 9010, 1),
	(6, 9032, 1),
	(6, 9034, 2),
	(6, 9035, 1),
	(6, 9036, 1),
	(6, 9037, 1),
	(6, 9038, 2),
	(6, 9039, 1),
	(6, 9040, 1),
	(6, 9041, 1),
	(7, 9003, 1),
	(7, 9006, 1),
	(7, 9007, 5),
	(7, 9013, 1),
	(7, 9019, 2),
	(7, 9022, 1),
	(7, 9032, 1),
	(7, 9033, 1),
	(7, 9042, 1),
	(7, 9043, 1);
/*!40000 ALTER TABLE `rezeptzutat` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.zutat
CREATE TABLE IF NOT EXISTS `zutat` (
  `ZUTATENNR` int(11) NOT NULL AUTO_INCREMENT,
  `BEZEICHNUNG` varchar(50) DEFAULT NULL,
  `EINHEIT` varchar(25) DEFAULT NULL,
  `NETTOPREIS` decimal(10,2) DEFAULT NULL,
  `BESTAND` int(11) DEFAULT NULL,
  `LIEFERANT` int(11) DEFAULT NULL,
  `KALORIEN` int(11) DEFAULT NULL,
  `KOHLENHYDRATE` decimal(10,2) DEFAULT NULL,
  `PROTEIN` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ZUTATENNR`),
  KEY `LIEFERANT` (`LIEFERANT`),
  CONSTRAINT `zutat_ibfk_1` FOREIGN KEY (`LIEFERANT`) REFERENCES `lieferant` (`LIEFERANTENNR`)
) ENGINE=InnoDB AUTO_INCREMENT=9044 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.zutat: ~40 rows (ungefähr)
DELETE FROM `zutat`;
/*!40000 ALTER TABLE `zutat` DISABLE KEYS */;
INSERT INTO `zutat` (`ZUTATENNR`, `BEZEICHNUNG`, `EINHEIT`, `NETTOPREIS`, `BESTAND`, `LIEFERANT`, `KALORIEN`, `KOHLENHYDRATE`, `PROTEIN`) VALUES
	(9002, 'Zucchini', 'Stück', 0.89, 100, 101, 19, 2.00, 1.60),
	(9003, 'Zwiebel', 'Stück', 0.15, 50, 101, 28, 4.90, 1.20),
	(9004, 'Tomate', 'Stück', 0.45, 50, 101, 18, 2.60, 1.00),
	(9005, 'Schalotte', 'Stück', 0.20, 500, 101, 25, 3.30, 1.50),
	(9006, 'Karotte', 'Stück', 0.30, 500, 101, 41, 10.00, 0.90),
	(9007, 'Kartoffel', 'Stück', 0.15, 1500, 101, 71, 14.60, 2.00),
	(9008, 'Rucola', 'Bund', 0.90, 10, 101, 27, 2.10, 2.60),
	(9009, 'Lauch', 'Stück', 1.20, 35, 101, 29, 3.30, 2.10),
	(9010, 'Knoblauch', 'Stück', 0.25, 250, 101, 141, 28.40, 6.10),
	(9011, 'Basilikum', 'Bund', 1.30, 10, 101, 41, 5.10, 3.10),
	(9012, 'Süßkartoffel', 'Stück', 2.00, 200, 101, 86, 20.00, 1.60),
	(9013, 'Schnittlauch', 'Bund', 0.90, 10, 101, 28, 1.00, 3.00),
	(9014, 'Apfel', 'Stück', 1.20, 750, 102, 54, 14.40, 0.30),
	(9015, 'Vollmilch. 3.5%', 'Liter', 1.50, 50, 103, 65, 4.70, 3.40),
	(9016, 'Mozzarella', 'Packung', 3.50, 20, 103, 241, 1.00, 18.10),
	(9017, 'Butter', 'Stück', 3.00, 50, 103, 741, 0.60, 0.70),
	(9018, 'Ei', 'Stück', 0.40, 300, 102, 137, 1.50, 11.90),
	(9019, 'Wiener Würstchen', 'Paar', 1.80, 40, 101, 331, 1.20, 9.90),
	(9020, 'Tofu-Würstchen', 'Stück', 1.80, 20, 103, 252, 7.00, 17.00),
	(9021, 'Couscous', 'Packung', 1.90, 15, 102, 351, 67.00, 12.00),
	(9022, 'Gemüsebrühe', 'Würfel', 0.20, 4000, 101, 1, 0.50, 0.50),
	(9023, 'Kichererbsen', 'Dose', 1.00, 400, 103, 150, 21.20, 9.00),
	(9024, 'Lasagneplatten', 'Packung', 0.89, 200, 101, 356, 71.00, 4.00),
	(9025, 'Spinat', 'Bund', 1.24, 180, 102, 16, 2.00, 12.00),
	(9026, 'Lachs', 'Stück', 8.99, 99, 102, 400, 80.00, 42.00),
	(9027, 'Käse', 'Stück', 3.22, 300, 103, 421, 4.00, 25.00),
	(9028, 'Mehl', 'Packung', 0.99, 1200, 101, 398, 9.00, 40.00),
	(9029, 'Sahne', 'Liter', 1.29, 540, 103, 298, 3.00, 2.00),
	(9030, 'Parmesan', 'Packung', 8.99, 420, 103, 374, 4.00, 35.00),
	(9031, 'Zitrone', 'Stück', 0.74, 560, 102, 80, 7.00, 1.00),
	(9032, 'Pfeffer', 'Packung', 2.54, 2100, 101, 190, 1.00, 8.00),
	(9033, 'Muskat', 'Packung', 4.99, 700, 101, 401, 65.00, 12.00),
	(9034, 'Hähnchenbrustfilet', 'Packung', 5.00, 100, 101, 392, 40.00, 80.00),
	(9035, 'Reis', 'Packung', 0.90, 1720, 101, 398, 90.00, 20.00),
	(9036, 'Sojasauße', 'Liter', 2.90, 412, 101, 324, 20.00, 4.00),
	(9037, 'Zucker', 'Packung', 1.12, 809, 102, 710, 52.00, 1.00),
	(9038, 'Gemüse Mix', 'Packung', 4.20, 69, 101, 310, 40.00, 30.00),
	(9039, 'Bambussporossen', 'Packung', 2.90, 80, 101, 400, 70.00, 90.00),
	(9040, 'Kokosmilch', 'Liter', 8.99, 100, 103, 770, 40.00, 8.00),
	(9041, 'Currypaste', 'Packung', 3.25, 88, 101, 458, 70.00, 12.00),
	(9042, 'Petersilie', 'Bund', 2.49, 102, 101, 36, 6.00, 3.00),
	(9043, 'Majoran', 'Glas', 4.49, 50, 101, 272, 61.00, 13.00);
/*!40000 ALTER TABLE `zutat` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.zutatallergie
CREATE TABLE IF NOT EXISTS `zutatallergie` (
  `ZUTATENNR` int(11) NOT NULL,
  `ALLERGIENR` int(11) NOT NULL,
  PRIMARY KEY (`ZUTATENNR`,`ALLERGIENR`),
  KEY `FK_zutatallergie_allergien` (`ALLERGIENR`),
  CONSTRAINT `FK1` FOREIGN KEY (`ZUTATENNR`) REFERENCES `zutat` (`ZUTATENNR`),
  CONSTRAINT `FK_zutatallergie_allergien` FOREIGN KEY (`ALLERGIENR`) REFERENCES `allergien` (`ALLERGIENR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.zutatallergie: ~39 rows (ungefähr)
DELETE FROM `zutatallergie`;
/*!40000 ALTER TABLE `zutatallergie` DISABLE KEYS */;
INSERT INTO `zutatallergie` (`ZUTATENNR`, `ALLERGIENR`) VALUES
	(9003, 21),
	(9004, 21),
	(9005, 21),
	(9006, 21),
	(9007, 21),
	(9008, 21),
	(9009, 21),
	(9010, 21),
	(9011, 21),
	(9012, 21),
	(9013, 21),
	(9014, 21),
	(9015, 1),
	(9016, 1),
	(9017, 21),
	(9018, 5),
	(9019, 21),
	(9020, 21),
	(9021, 21),
	(9022, 21),
	(9023, 21),
	(9024, 21),
	(9025, 21),
	(9026, 12),
	(9027, 1),
	(9028, 21),
	(9029, 21),
	(9030, 21),
	(9031, 21),
	(9032, 21),
	(9033, 21),
	(9034, 21),
	(9035, 21),
	(9036, 8),
	(9037, 21),
	(9038, 21),
	(9039, 21),
	(9040, 21),
	(9041, 21),
	(9042, 21),
	(9043, 21);
/*!40000 ALTER TABLE `zutatallergie` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle krautundrueben.zutatkategorie
CREATE TABLE IF NOT EXISTS `zutatkategorie` (
  `ZUTATENNR` int(11) NOT NULL,
  `ERNAEHRUNGNR` int(11) NOT NULL,
  PRIMARY KEY (`ZUTATENNR`,`ERNAEHRUNGNR`),
  KEY `ERNAEHRUNGNR` (`ERNAEHRUNGNR`),
  CONSTRAINT `FK_zutatkategorie_zutat` FOREIGN KEY (`ZUTATENNR`) REFERENCES `zutat` (`ZUTATENNR`),
  CONSTRAINT `zutatkategorie_ibfk_2` FOREIGN KEY (`ERNAEHRUNGNR`) REFERENCES `ernaehrung` (`ERNAEHRUNGNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle krautundrueben.zutatkategorie: ~155 rows (ungefähr)
DELETE FROM `zutatkategorie`;
/*!40000 ALTER TABLE `zutatkategorie` DISABLE KEYS */;
INSERT INTO `zutatkategorie` (`ZUTATENNR`, `ERNAEHRUNGNR`) VALUES
	(9002, 2),
	(9002, 3),
	(9002, 4),
	(9002, 7),
	(9003, 1),
	(9003, 2),
	(9003, 4),
	(9003, 7),
	(9004, 1),
	(9004, 2),
	(9004, 3),
	(9004, 4),
	(9004, 7),
	(9005, 1),
	(9005, 2),
	(9005, 4),
	(9005, 7),
	(9006, 1),
	(9006, 2),
	(9006, 4),
	(9006, 7),
	(9007, 1),
	(9007, 2),
	(9007, 4),
	(9007, 7),
	(9008, 1),
	(9008, 2),
	(9008, 4),
	(9008, 7),
	(9009, 1),
	(9009, 2),
	(9009, 4),
	(9009, 7),
	(9010, 1),
	(9010, 2),
	(9010, 4),
	(9010, 7),
	(9011, 1),
	(9011, 2),
	(9011, 3),
	(9011, 4),
	(9011, 7),
	(9012, 1),
	(9012, 2),
	(9012, 4),
	(9012, 7),
	(9013, 1),
	(9013, 2),
	(9013, 4),
	(9013, 7),
	(9014, 1),
	(9014, 2),
	(9014, 4),
	(9014, 7),
	(9015, 2),
	(9015, 4),
	(9015, 7),
	(9016, 2),
	(9016, 4),
	(9016, 7),
	(9017, 2),
	(9017, 4),
	(9017, 7),
	(9018, 2),
	(9018, 4),
	(9018, 7),
	(9019, 2),
	(9019, 4),
	(9020, 1),
	(9020, 2),
	(9020, 4),
	(9020, 7),
	(9021, 1),
	(9021, 2),
	(9021, 3),
	(9021, 4),
	(9021, 7),
	(9022, 1),
	(9022, 2),
	(9022, 3),
	(9022, 4),
	(9022, 7),
	(9023, 1),
	(9023, 2),
	(9023, 3),
	(9023, 4),
	(9023, 7),
	(9024, 1),
	(9024, 2),
	(9024, 4),
	(9024, 7),
	(9025, 1),
	(9025, 2),
	(9025, 4),
	(9025, 7),
	(9026, 4),
	(9026, 7),
	(9027, 2),
	(9027, 4),
	(9027, 7),
	(9028, 1),
	(9028, 2),
	(9028, 4),
	(9028, 7),
	(9029, 2),
	(9029, 4),
	(9029, 7),
	(9030, 2),
	(9030, 4),
	(9030, 7),
	(9031, 1),
	(9031, 2),
	(9031, 3),
	(9031, 4),
	(9031, 7),
	(9032, 1),
	(9032, 2),
	(9032, 3),
	(9032, 4),
	(9032, 7),
	(9033, 1),
	(9033, 2),
	(9033, 3),
	(9033, 4),
	(9033, 7),
	(9034, 4),
	(9034, 7),
	(9035, 1),
	(9035, 2),
	(9035, 4),
	(9035, 7),
	(9036, 1),
	(9036, 2),
	(9036, 4),
	(9036, 7),
	(9037, 1),
	(9037, 2),
	(9037, 4),
	(9037, 7),
	(9038, 1),
	(9038, 2),
	(9038, 4),
	(9038, 7),
	(9039, 1),
	(9039, 2),
	(9039, 4),
	(9039, 7),
	(9040, 1),
	(9040, 2),
	(9040, 3),
	(9040, 4),
	(9040, 7),
	(9041, 2),
	(9041, 4),
	(9041, 7),
	(9042, 1),
	(9042, 2),
	(9042, 4),
	(9042, 7),
	(9043, 1),
	(9043, 2),
	(9043, 4),
	(9043, 7);
/*!40000 ALTER TABLE `zutatkategorie` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
