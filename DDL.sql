-- tables
-- Table: Gatunek_Gry
CREATE TABLE Gatunek_Gry (
    id_Gatunek int  NOT NULL,
    Nazwa_Gatunku varchar2(50)  NOT NULL,
    CONSTRAINT Gatunek_Gry_pk PRIMARY KEY (id_Gatunek)
) ;

-- Table: Gra
CREATE TABLE Gra (
    Id_Gry int  NOT NULL,
    Tytul_Gry varchar2(50)  NOT NULL,
    Gatunek_Gry_id_Garunek int  NOT NULL,
    Data_Premiery date  NOT NULL,
    Id_Wydawcy int  NOT NULL,
    Studio_Deweloperskie_Id_Studio int  NOT NULL,
    CONSTRAINT Gra_pk PRIMARY KEY (Id_Gry)
) ;

-- Table: Komentarze
CREATE TABLE Komentarze (
    Id_Komentarza int  NOT NULL,
    Komentarz varchar2(1000)  NOT NULL,
    Gra_Id_Gry int  NOT NULL,
    Id_Recenzenta int  NULL,
    ID_uzytkownika int  NULL,
    CONSTRAINT Komentarze_pk PRIMARY KEY (Id_Komentarza)
) ;

-- Table: Ocena_Spolecznosci
CREATE TABLE Ocena_Spolecznosci (
    Gra_Id_Gry int  NOT NULL,
    Uzytkownik_ID_uzytkownika int  NOT NULL,
    Ocena_uzytkownika float(3)  NOT NULL,
    CONSTRAINT Ocena_Spolecznosci_pk PRIMARY KEY (Gra_Id_Gry,Uzytkownik_ID_uzytkownika)
) ;

-- Table: Recenzent
CREATE TABLE Recenzent (
    Id_Recenzenta int  NOT NULL,
    Imie varchar2(20)  NOT NULL,
    Nazwisko varchar2(20)  NOT NULL,
    Stanowisko varchar2(20)  NOT NULL,
    Ulubiona_gra varchar2(50)  NOT NULL,
    Ulubiony_gatunek_gry varchar2(100)  NOT NULL,
    CONSTRAINT Recenzent_pk PRIMARY KEY (Id_Recenzenta)
) ;

-- Table: Recenzja_gra
CREATE TABLE Recenzja_gra (
    id_recenzja int  NOT NULL,
    Id_Recenzenta int  NOT NULL,
    recenzja varchar2(2000)  NOT NULL,
    Ocena_gry float(3)  NOT NULL,
    Gra_Id_Gry int  NOT NULL,
    CONSTRAINT Recenzja_gra_pk PRIMARY KEY (id_recenzja,Id_Recenzenta)
) ;

-- Table: Studio_Deweloperskie
CREATE TABLE Studio_Deweloperskie (
    Id_Studio int  NOT NULL,
    Nazwa_Studia varchar2(50)  NOT NULL,
    CONSTRAINT Studio_Deweloperskie_pk PRIMARY KEY (Id_Studio)
) ;

-- Table: Uzytkownik
CREATE TABLE Uzytkownik (
    ID_uzytkownika int  NOT NULL,
    Nick varchar2(50)  NOT NULL,
    Ranga_na_forum varchar2(20)  NOT NULL,
    Data_dolaczenia date  NOT NULL,
    CONSTRAINT Uzytkownik_pk PRIMARY KEY (ID_uzytkownika)
) ;

-- Table: Wydawca
CREATE TABLE Wydawca (
    Id_Wydawcy int  NOT NULL,
    Nazwa_Wydawcy varchar2(50)  NOT NULL,
    CONSTRAINT Wydawca_pk PRIMARY KEY (Id_Wydawcy)
) ;

-- foreign keys
-- Reference: Gra_Gatunek_Gry (table: Gra)
ALTER TABLE Gra ADD CONSTRAINT Gra_Gatunek_Gry
    FOREIGN KEY (Gatunek_Gry_id_Garunek)
    REFERENCES Gatunek_Gry (id_Gatunek);

-- Reference: Gra_Studio_Deweloperskie (table: Gra)
ALTER TABLE Gra ADD CONSTRAINT Gra_Studio_Deweloperskie
    FOREIGN KEY (Studio_Deweloperskie_Id_Studio)
    REFERENCES Studio_Deweloperskie (Id_Studio);

-- Reference: Gra_Wydawca (table: Gra)
ALTER TABLE Gra ADD CONSTRAINT Gra_Wydawca
    FOREIGN KEY (Id_Wydawcy)
    REFERENCES Wydawca (Id_Wydawcy);

-- Reference: Komentarze_Gra (table: Komentarze)
ALTER TABLE Komentarze ADD CONSTRAINT Komentarze_Gra
    FOREIGN KEY (Gra_Id_Gry)
    REFERENCES Gra (Id_Gry);

-- Reference: Komentarze_Recenzent (table: Komentarze)
ALTER TABLE Komentarze ADD CONSTRAINT Komentarze_Recenzent
    FOREIGN KEY (Id_Recenzenta)
    REFERENCES Recenzent (Id_Recenzenta);

-- Reference: Komentarze_Uzytkownik (table: Komentarze)
ALTER TABLE Komentarze ADD CONSTRAINT Komentarze_Uzytkownik
    FOREIGN KEY (ID_uzytkownika)
    REFERENCES Uzytkownik (ID_uzytkownika);

-- Reference: Ocena_Spolecznosci_Gra (table: Ocena_Spolecznosci)
ALTER TABLE Ocena_Spolecznosci ADD CONSTRAINT Ocena_Spolecznosci_Gra
    FOREIGN KEY (Gra_Id_Gry)
    REFERENCES Gra (Id_Gry);

-- Reference: Ocena_Spolecznosci_Uzytkownik (table: Ocena_Spolecznosci)
ALTER TABLE Ocena_Spolecznosci ADD CONSTRAINT Ocena_Spolecznosci_Uzytkownik
    FOREIGN KEY (Uzytkownik_ID_uzytkownika)
    REFERENCES Uzytkownik (ID_uzytkownika);

-- Reference: Recenzja_gra_Gra (table: Recenzja_gra)
ALTER TABLE Recenzja_gra ADD CONSTRAINT Recenzja_gra_Gra
    FOREIGN KEY (Gra_Id_Gry)
    REFERENCES Gra (Id_Gry);

-- Reference: Recenzja_gra_Recenzent (table: Recenzja_gra)
ALTER TABLE Recenzja_gra ADD CONSTRAINT Recenzja_gra_Recenzent
    FOREIGN KEY (Id_Recenzenta)
    REFERENCES Recenzent (Id_Recenzenta);

-- End of file.

