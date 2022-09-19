--DML STUDIO DEWELOPERSKIE
INSERT INTO STUDIO_DEWELOPERSKIE (Id_Studio, Nazwa_Studia)
VALUES(1, 'Infinity Ward');

INSERT INTO STUDIO_DEWELOPERSKIE (Id_Studio, Nazwa_Studia)
VALUES(2, 'CDP Red');

INSERT INTO STUDIO_DEWELOPERSKIE (Id_Studio, Nazwa_Studia)
VALUES(3, 'Treyarch');

INSERT INTO STUDIO_DEWELOPERSKIE (Id_Studio, Nazwa_Studia)
VALUES(4, 'Riot Games');

INSERT INTO STUDIO_DEWELOPERSKIE (Id_Studio, Nazwa_Studia)
VALUES(5, 'Valve');

--DML WYDAWCA

INSERT INTO WYDAWCA (Id_Wydawcy, Nazwa_Wydawcy)
VALUES (1, 'EA Games');

INSERT INTO WYDAWCA (Id_Wydawcy, Nazwa_Wydawcy)
VALUES(2, 'CD Projekt');

INSERT INTO WYDAWCA (Id_Wydawcy, Nazwa_Wydawcy)
VALUES(3, 'Steam');

INSERT INTO WYDAWCA (Id_Wydawcy, Nazwa_Wydawcy)
VALUES(4, 'Blizzard');
 
INSERT INTO WYDAWCA (Id_Wydawcy, Nazwa_Wydawcy)
VALUES(5, 'Riot Games');

--DML Gatunek Gry

INSERT INTO Gatunek_Gry(Id_Gatunek, Nazwa_Gatunku)
VALUES (1, 'FPS');

INSERT INTO Gatunek_Gry(Id_Gatunek, Nazwa_Gatunku)
VALUES (2, 'MOBA');

INSERT INTO Gatunek_Gry(Id_Gatunek, Nazwa_Gatunku)
VALUES (3, 'RPG');

--DML GRA


INSERT INTO GRA (Id_Gry, Tytul_Gry, Gatunek_Gry_id_Garunek, Data_Premiery, Id_Wydawcy, Studio_Deweloperskie_Id_Studio)
        VALUES (1, 'Wiedzmin 3', (SELECT id_Gatunek FROM Gatunek_Gry WHERE Nazwa_Gatunku = 'RPG'), '2015-05-18', 
            (SELECT ID_WYDAWCY FROM WYDAWCA WHERE Nazwa_Wydawcy = 'CD Projekt'), (SELECT Id_Studio FROM Studio_Deweloperskie WHERE Nazwa_Studia = 'CDP Red'));
        
    INSERT INTO GRA (Id_Gry, Tytul_Gry, Gatunek_Gry_id_Garunek, Data_Premiery, Id_Wydawcy, Studio_Deweloperskie_Id_Studio)
        VALUES (2, 'League of Legends', (SELECT id_Gatunek FROM Gatunek_Gry WHERE Nazwa_Gatunku = 'MOBA'), '2010-01-01',
         (SELECT ID_WYDAWCY FROM WYDAWCA WHERE Nazwa_Wydawcy = 'Riot Games'), (SELECT Id_Studio FROM Studio_Deweloperskie WHERE Nazwa_Studia = 'Riot Games'));
         
         
    INSERT INTO GRA (Id_Gry, Tytul_Gry, Gatunek_Gry_id_Garunek, Data_Premiery, Id_Wydawcy, Studio_Deweloperskie_Id_Studio)
        VALUES (3, 'CS:GO', (SELECT id_Gatunek FROM Gatunek_Gry WHERE Nazwa_Gatunku = 'FPS'), '2012-04-03', 
         (SELECT ID_WYDAWCY FROM WYDAWCA WHERE Nazwa_Wydawcy = 'Steam'), (SELECT Id_Studio FROM Studio_Deweloperskie WHERE Nazwa_Studia = 'Valve'));
		 
	INSERT INTO GRA (Id_Gry, Tytul_Gry, Gatunek_Gry_id_Garunek, Data_Premiery, Id_Wydawcy, Studio_Deweloperskie_Id_Studio)
        VALUES (4, 'Call of Duty', (SELECT id_Gatunek FROM Gatunek_Gry WHERE Nazwa_Gatunku = 'FPS'), '2019-10-10', 
         (SELECT ID_WYDAWCY FROM WYDAWCA WHERE Nazwa_Wydawcy = 'Blizzard'), (SELECT Id_Studio FROM Studio_Deweloperskie WHERE Nazwa_Studia = 'Infinity Ward'));
		 
		 
--DML UZYTKOWNIK

INSERT INTO Uzytkownik(ID_uzytkownika, Nick, Ranga_na_forum, Data_dolaczenia)
VALUES (1, 'habek', 'JUNIOR','2018-10-20');

INSERT INTO Uzytkownik(ID_uzytkownika, Nick, Ranga_na_forum, Data_dolaczenia)
VALUES (2, 'faraon1', 'MID', '2019-08-20');

INSERT INTO Uzytkownik(ID_uzytkownika, Nick, Ranga_na_forum, Data_dolaczenia)
VALUES (3, 'BigChungus', 'SENIOR', '2019-12-25');

INSERT INTO Uzytkownik(ID_uzytkownika, Nick, Ranga_na_forum, Data_dolaczenia)
VALUES (4, 'smORC', 'SENIOR', '2007-03-21');


--DML RECENZENT

--recenzent 0 jest uzywany w komntarzach jesli komentarza nie pisze recenzent

INSERT INTO Recenzent(Id_Recenzenta, Imie, Nazwisko, Stanowisko, Ulubiona_gra, Ulubiony_gatunek_gry)
VALUES (0, '-', '-', '-', '-', '-');

INSERT INTO Recenzent(Id_Recenzenta, Imie, Nazwisko, Stanowisko, Ulubiona_gra, Ulubiony_gatunek_gry)
VALUES (1, 'Jerzy', 'Brzeczek', 'Gracz', 'Wiedzmin 3', 'RPG');

INSERT INTO Recenzent(Id_Recenzenta, Imie, Nazwisko, Stanowisko, Ulubiona_gra, Ulubiony_gatunek_gry)
VALUES (2, 'Jan', 'Kopara', 'Redaktor naczelny', 'Need For Speed: Carbon', 'scigalki');

INSERT INTO Recenzent(Id_Recenzenta, Imie, Nazwisko, Stanowisko, Ulubiona_gra, Ulubiony_gatunek_gry)
VALUES (3, 'Klocuch', 'Bebsztyk', 'Social Media Menager', 'Battlefield 3', 'FPS, RPG');

INSERT INTO Recenzent(Id_Recenzenta, Imie, Nazwisko, Stanowisko, Ulubiona_gra, Ulubiony_gatunek_gry)
VALUES (4, 'Karol', 'Chomiak', 'Korektor', 'Crusider Kings', 'RTS');


--DML Recnezja_gra

INSERT INTO Recenzja_gra(id_recenzja, id_recenzenta,recenzja, ocena_gry, gra_id_gry)
VALUES(1, 1, 'fajna gra', 10, (SELECT Id_Gry FROM Gra WHERE tytul_gry = 'Wiedzmin 3'));

INSERT INTO Recenzja_gra(id_recenzja, id_recenzenta,recenzja, ocena_gry, gra_id_gry)
VALUES(2, (SELECT ID_RECENZENTA FROM Recenzent WHERE Stanowisko = 'Redaktor naczelny'), 
    'bardzo przyjemnie sie gra, choc czasem potrafi zdenerwoac. Rozaczorwuje brak aktywnego wsparcia tytulu wydawcy', 8, (SELECT Id_Gry FROM Gra WHERE tytul_gry = 'CS:GO'));
	
	INSERT INTO Recenzja_gra(id_recenzja, id_recenzenta,recenzja, ocena_gry, gra_id_gry)
VALUES(3, (SELECT ID_RECENZENTA FROM Recenzent WHERE Stanowisko = 'Korektor'), 
    'fajne, choc co jakis czas wkradana sie pewna powtarzalnosc i trzeba robic sobie dluzsza przerwe', 7, (SELECT Id_Gry FROM Gra WHERE tytul_gry = 'League of Legends'));


--DML Komentarze

INSERT INTO Komentarze (id_komentarza, komentarz, gra_id_gry, id_recenzenta, id_uzytkownika)
VALUES(1, 'u mnie zbugowane', (SELECT Id_Gry FROM Gra WHERE tytul_gry = 'Wiedzmin 3'), 0, (SELECT uzytkownik.id_uzytkownika FROM Uzytkownik WHERE Nick = 'smORC'));


INSERT INTO Komentarze (id_komentarza, komentarz, gra_id_gry, id_recenzenta, id_uzytkownika)
VALUES(2, 'troche sie zawidolem', (SELECT Id_Gry FROM Gra WHERE tytul_gry = 'Call of Duty'), 0, (SELECT uzytkownik.id_uzytkownika FROM Uzytkownik WHERE Nick = 'habek'));

INSERT INTO Komentarze (id_komentarza, komentarz, gra_id_gry, id_recenzenta, id_uzytkownika)
VALUES(3, 'kiedy urf???', (SELECT Id_Gry FROM Gra WHERE tytul_gry = 'League of Legends'), 0, (SELECT uzytkownik.id_uzytkownika FROM Uzytkownik WHERE Nick = 'faraon1'));

INSERT INTO Komentarze (id_komentarza, komentarz, gra_id_gry, id_recenzenta, id_uzytkownika)
VALUES(4, 'troche nudne', (SELECT Id_Gry FROM Gra WHERE tytul_gry = 'CS:GO'), (SELECT id_recenzenta FROM Recenzent WHERE Stanowisko = 'Redaktor Naczelny'), NULL);


--DML Ocena spolecznosci

INSERT INTO Ocena_Spolecznosci(gra_id_gry,uzytkownik_id_uzytkownika, ocena_uzytkownika)
VALUES((SELECT Id_Gry FROM Gra WHERE gra.tytul_gry = 'CS:GO'), (SELECT ID_uzytkownika FROM Uzytkownik WHERE uzytkownik.nick = 'faraon1'), 9);

INSERT INTO Ocena_Spolecznosci(gra_id_gry,uzytkownik_id_uzytkownika, ocena_uzytkownika)
VALUES((SELECT Id_Gry FROM Gra WHERE gra.tytul_gry = 'League of Legends'), (SELECT ID_uzytkownika FROM Uzytkownik WHERE uzytkownik.nick = 'faraon1'), 10);

INSERT INTO Ocena_Spolecznosci(gra_id_gry,uzytkownik_id_uzytkownika, ocena_uzytkownika)
VALUES((SELECT Id_Gry FROM Gra WHERE gra.tytul_gry = 'Wiedzmin 3'), (SELECT ID_uzytkownika FROM Uzytkownik WHERE uzytkownik.nick = 'faraon1'), 10);

INSERT INTO Ocena_Spolecznosci(gra_id_gry,uzytkownik_id_uzytkownika, ocena_uzytkownika)
VALUES((SELECT Id_Gry FROM Gra WHERE gra.tytul_gry = 'CS:GO'), (SELECT ID_uzytkownika FROM Uzytkownik WHERE uzytkownik.nick = 'habek'), 1);

INSERT INTO Ocena_Spolecznosci(gra_id_gry,uzytkownik_id_uzytkownika, ocena_uzytkownika)
VALUES((SELECT Id_Gry FROM Gra WHERE gra.tytul_gry = 'League of Legends'), (SELECT ID_uzytkownika FROM Uzytkownik WHERE uzytkownik.nick = 'habek'), 1);

INSERT INTO Ocena_Spolecznosci(gra_id_gry,uzytkownik_id_uzytkownika, ocena_uzytkownika)
VALUES((SELECT Id_Gry FROM Gra WHERE gra.tytul_gry = 'Wiedzmin 3'), (SELECT ID_uzytkownika FROM Uzytkownik WHERE uzytkownik.nick = 'habek'), 1);




