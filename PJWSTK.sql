INSERT INTO miasto VALUES (0, 'WARSZAWA');
INSERT INTO miasto VALUES (1, 'POZNAN');
INSERT INTO miasto VALUES (2, 'KIELCE');
INSERT INTO miasto VALUES (3, 'KATOWICE');
INSERT INTO miasto VALUES (4, 'GDANSK');
INSERT INTO miasto VALUES (5, 'GDYNIA');

INSERT INTO osoba VALUES (0, 'JAN', 'KOWALSKI', 0);
INSERT INTO osoba VALUES (1, 'PIOTR', 'TOKYO', 1);
INSERT INTO osoba VALUES (2, 'JAKUB', 'PIETROWSKI', 2);
INSERT INTO osoba VALUES (3, 'FILIP', 'WALENSKI', 3);
INSERT INTO osoba VALUES (4, 'JULIA', 'JANIK', 4);
INSERT INTO osoba VALUES (5, 'JAROSLAW', 'JANKOWSKI', 5);
INSERT INTO osoba VALUES (6, 'MAGDA', 'MALINA', 0);
INSERT INTO osoba VALUES (7, 'WIKTORIA', 'TRUSKAWKA', 1);
INSERT INTO osoba VALUES (8, 'ADAM', 'PIOTRKOWSKI', 2);
INSERT INTO osoba VALUES (9, 'MATEUSZ', 'HELSKI', 3);
INSERT INTO osoba VALUES (10, 'BARTOSZ', 'SZYBKI', 4);
INSERT INTO osoba VALUES (11, 'PIOTR', 'SLIWA', 5);

INSERT INTO klient VALUES (0);
INSERT INTO klient VALUES (1);
INSERT INTO klient VALUES (2);
INSERT INTO klient VALUES (3);
INSERT INTO klient VALUES (4);
INSERT INTO klient VALUES (5);
INSERT INTO klient VALUES (7);
INSERT INTO klient VALUES (9);

INSERT INTO pracownik VALUES (0, 5000, NULL);
INSERT INTO pracownik VALUES (2, 2000, 0);
INSERT INTO pracownik VALUES (4, 1000, 2);
INSERT INTO pracownik VALUES (6, 500, 2);
INSERT INTO pracownik VALUES (8, 1500, 2);

INSERT INTO marka VALUES (0, 'AUDI');
INSERT INTO marka VALUES (1, 'BMW');
INSERT INTO marka VALUES (2, 'OPEL');
INSERT INTO marka VALUES (3, 'CITROEN');
INSERT INTO marka VALUES (4, 'HONDA');

INSERT INTO model VALUES (0, 'A6', 2014, 0);
INSERT INTO model VALUES (1, 'E36', 1996, 1);
INSERT INTO model VALUES (2, 'E46', 1998, 1);
INSERT INTO model VALUES (3, 'ASTRA', 2001, 2);
INSERT INTO model VALUES (4, 'C3', 1982, 3);
INSERT INTO model VALUES (5, 'C4', 1985, 3);
INSERT INTO model VALUES (6, 'CIVIC', 2004, 4);

INSERT INTO samochod VALUES (0, 'CZERWONY', 39921, 2);
INSERT INTO samochod VALUES (1, 'NIEBIESKI', 34105, 5);
INSERT INTO samochod VALUES (2, 'CZERWONY', 435123, 3);
INSERT INTO samochod VALUES (3, 'CZARNY', 65331, 3);
INSERT INTO samochod VALUES (4, 'BIALY', 23461, 1);
INSERT INTO samochod VALUES (5, 'FIOLETOWY', 234654, 0);
INSERT INTO samochod VALUES (6, 'ZIELONY', 20349, 4);
INSERT INTO samochod VALUES (7, 'SZARY', 345083, 6);

INSERT INTO wypozyczenie VALUES (0, TO_DATE('19/04/2005', 'DD/MM/YYYY'), 0, 5, 4);
INSERT INTO wypozyczenie VALUES (1, TO_DATE('12/12/2012', 'DD/MM/YYYY'), 5, 4, 2);
INSERT INTO wypozyczenie VALUES (2, TO_DATE('18/05/2021', 'DD/MM/YYYY'), 2, 2, 2);
INSERT INTO wypozyczenie VALUES (3, TO_DATE('18/05/2014', 'DD/MM/YYYY'), 3, 0, 8);
INSERT INTO wypozyczenie VALUES (4, TO_DATE('16/09/2007', 'DD/MM/YYYY'), 3, 3, 6);
INSERT INTO wypozyczenie VALUES (5, TO_DATE('24/01/2009', 'DD/MM/YYYY'), 4, 1, 6);
INSERT INTO wypozyczenie VALUES (6, TO_DATE('12/04/2016', 'DD/MM/YYYY'), 1, 7, 2);
INSERT INTO wypozyczenie VALUES (7, TO_DATE('01/06/2011', 'DD/MM/YYYY'), 7, 7, 4);
INSERT INTO wypozyczenie VALUES (8, TO_DATE('15/11/2011', 'DD/MM/YYYY'), 6, 2, 0);
INSERT INTO wypozyczenie VALUES (9, TO_DATE('20/11/2013', 'DD/MM/YYYY'), 4, 9, 0);

--1 id, marka i model czerwonych samochodow
SElECT id_samochod, kolor, marka, model
FROM samochod
INNER JOIN model
ON samochod.id_model = model.id_model
INNER JOIN marka
ON model.id_marka = marka.id_marka
WHERE kolor = 'CZERWONY';

--2 imiona i nazwiska klientow, ktorzy wypozyczyli samochod w 2011 roku
SELECT data, imie imie_klienta, nazwisko nazwisko_klienta
FROM wypozyczenie
INNER JOIN osoba
ON osoba.id_osoba = wypozyczenie.id_klient
WHERE data LIKE '11/%';

--3 imiona i nazwiska pracownikow i ich przelozonych
SELECT o1.imie imie_pracownika, o1.nazwisko nazwisko_pracownika, o2.imie imie_przelozonego, o2.nazwisko nazwisko_przelozonego
FROM osoba o1
INNER JOIN pracownik
ON id_pracownik = o1.id_osoba
LEFT OUTER JOIN osoba o2
ON id_przelozony = o2.id_osoba;

--4 imiona i nazwiska klientow ktorzy sa pracownikami
SELECT imie, nazwisko
FROM osoba, pracownik, klient
WHERE id_osoba = id_pracownik AND id_pracownik = id_klient;

--5 imiona, nazwiska oraz pensje pracownikow posortowane malejaco
SELECT imie, nazwisko, pensja
FROM osoba, pracownik
WHERE id_osoba = id_pracownik
ORDER BY pensja DESC;

--6 id, marka i model samochodow z przebiegiem ponizej 100000 posortowane rosnaco
SELECT id_samochod, marka, model, przebieg
FROM samochod
INNER JOIN model
ON model.id_model = samochod.id_model
INNER JOIN marka
ON marka.id_marka = model.id_marka
WHERE przebieg < 100000
ORDER BY przebieg ASC;

--7 id, marka i model samochodu z najwiekszym przebiegiem
SELECT id_samochod, marka, model, przebieg
FROM samochod
INNER JOIN model
ON model.id_model = samochod.id_model
INNER JOIN marka
ON marka.id_marka = model.id_marka
WHERE przebieg = (SELECT MAX(przebieg) FROM samochod);

--8 imie i nazwisko klienta którego imie jest pierwsze w kolejnosci alfabetycznej
SELECT imie, nazwisko
FROM osoba, klient
WHERE osoba.id_osoba = klient.id_klient
ORDER BY imie ASC
FETCH FIRST 1 ROW ONLY;

--9 imiona, nazwiska osob, ktore sa z miast na litere 'K'
SELECT imie, nazwisko, miasto
FROM osoba
INNER JOIN klient
ON osoba.id_osoba = klient.id_klient
INNER JOIN miasto
ON miasto.id_miasto = osoba.id_miasto
WHERE miasto LIKE 'K%';

--10 id, marka i model samochodow ktorych rocznik modelowy jest po 2000 roku, posortowane rosnaco wdlug rocznika modelowego
SELECT id_samochod, marka, model, rocznik
FROM samochod
INNER JOIN model
ON model.id_model = samochod.id_model
INNER JOIN marka
ON marka.id_marka = model.id_marka
WHERE rocznik > 2000
ORDER BY rocznik ASC;