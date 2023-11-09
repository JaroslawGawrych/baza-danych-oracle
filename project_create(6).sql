-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-25 21:36:35.764

-- tables
-- Table: klient
CREATE TABLE klient (
    id_klient integer  NOT NULL,
    CONSTRAINT klient_pk PRIMARY KEY (id_klient)
) ;

-- Table: marka
CREATE TABLE marka (
    id_marka varchar2(30)  NOT NULL,
    marka varchar2(30)  NOT NULL,
    CONSTRAINT marka_pk PRIMARY KEY (id_marka)
) ;

-- Table: miasto
CREATE TABLE miasto (
    id_miasto integer  NOT NULL,
    miasto varchar2(30)  NOT NULL,
    CONSTRAINT miasto_pk PRIMARY KEY (id_miasto)
) ;

-- Table: model
CREATE TABLE model (
    id_model integer  NOT NULL,
    model varchar2(30)  NOT NULL,
    rocznik integer  NOT NULL,
    id_marka varchar2(30)  NOT NULL,
    CONSTRAINT model_pk PRIMARY KEY (id_model)
) ;

-- Table: osoba
CREATE TABLE osoba (
    id_osoba integer  NOT NULL,
    imie varchar2(30)  NOT NULL,
    nazwisko varchar2(30)  NOT NULL,
    id_miasto integer  NOT NULL,
    CONSTRAINT osoba_pk PRIMARY KEY (id_osoba)
) ;

-- Table: pracownik
CREATE TABLE pracownik (
    id_pracownik integer  NOT NULL,
    pensja integer  NOT NULL,
    id_przelozony integer  NULL,
    CONSTRAINT pracownik_pk PRIMARY KEY (id_pracownik)
) ;

-- Table: samochod
CREATE TABLE samochod (
    id_samochod integer  NOT NULL,
    kolor varchar2(30)  NOT NULL,
    przebieg integer  NOT NULL,
    id_model integer  NOT NULL,
    CONSTRAINT samochod_pk PRIMARY KEY (id_samochod)
) ;

-- Table: wypozyczenie
CREATE TABLE wypozyczenie (
    id_wypozyczenie integer  NOT NULL,
    data date  NOT NULL,
    id_samochod integer  NOT NULL,
    id_klient integer  NOT NULL,
    id_pracownik integer  NOT NULL,
    CONSTRAINT wypozyczenie_pk PRIMARY KEY (id_wypozyczenie)
) ;

-- foreign keys
-- Reference: klient_osoba (table: klient)
ALTER TABLE klient ADD CONSTRAINT klient_osoba
    FOREIGN KEY (id_klient)
    REFERENCES osoba (id_osoba);

-- Reference: model_marka (table: model)
ALTER TABLE model ADD CONSTRAINT model_marka
    FOREIGN KEY (id_marka)
    REFERENCES marka (id_marka);

-- Reference: osoba_miasto (table: osoba)
ALTER TABLE osoba ADD CONSTRAINT osoba_miasto
    FOREIGN KEY (id_miasto)
    REFERENCES miasto (id_miasto);

-- Reference: pracownik_osoba (table: pracownik)
ALTER TABLE pracownik ADD CONSTRAINT pracownik_osoba
    FOREIGN KEY (id_pracownik)
    REFERENCES osoba (id_osoba);

-- Reference: pracownik_pracownik (table: pracownik)
ALTER TABLE pracownik ADD CONSTRAINT pracownik_pracownik
    FOREIGN KEY (id_przelozony)
    REFERENCES pracownik (id_pracownik);

-- Reference: samochod_model (table: samochod)
ALTER TABLE samochod ADD CONSTRAINT samochod_model
    FOREIGN KEY (id_model)
    REFERENCES model (id_model);

-- Reference: wypozyczenie_klient (table: wypozyczenie)
ALTER TABLE wypozyczenie ADD CONSTRAINT wypozyczenie_klient
    FOREIGN KEY (id_klient)
    REFERENCES klient (id_klient);

-- Reference: wypozyczenie_pracownik (table: wypozyczenie)
ALTER TABLE wypozyczenie ADD CONSTRAINT wypozyczenie_pracownik
    FOREIGN KEY (id_pracownik)
    REFERENCES pracownik (id_pracownik);

-- Reference: wypozyczenie_samochod (table: wypozyczenie)
ALTER TABLE wypozyczenie ADD CONSTRAINT wypozyczenie_samochod
    FOREIGN KEY (id_samochod)
    REFERENCES samochod (id_samochod);

-- End of file.

