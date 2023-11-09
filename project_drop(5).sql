-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-25 21:36:35.764

-- foreign keys
ALTER TABLE klient
    DROP CONSTRAINT klient_osoba;

ALTER TABLE model
    DROP CONSTRAINT model_marka;

ALTER TABLE osoba
    DROP CONSTRAINT osoba_miasto;

ALTER TABLE pracownik
    DROP CONSTRAINT pracownik_osoba;

ALTER TABLE pracownik
    DROP CONSTRAINT pracownik_pracownik;

ALTER TABLE samochod
    DROP CONSTRAINT samochod_model;

ALTER TABLE wypozyczenie
    DROP CONSTRAINT wypozyczenie_klient;

ALTER TABLE wypozyczenie
    DROP CONSTRAINT wypozyczenie_pracownik;

ALTER TABLE wypozyczenie
    DROP CONSTRAINT wypozyczenie_samochod;

-- tables
DROP TABLE klient;

DROP TABLE marka;

DROP TABLE miasto;

DROP TABLE model;

DROP TABLE osoba;

DROP TABLE pracownik;

DROP TABLE samochod;

DROP TABLE wypozyczenie;

-- End of file.

