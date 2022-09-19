--SELECTY WHERE

--1. zwraca komentarze tylko zarejestrowanych uzytkownikow
SELECT * FROM KOMENTARZE 
WHERE ID_Uzytkownika IS NOT NULL

--2. zwraca gry nie zrobione przez Riot Games 
SELECT * FROM GRA 
WHERE STUDIO_DEWELOPERSKIE_ID_STUDIO != (SELECT ID_STUDIO FROM STUDIO_DEWELOPERSKIE WHERE NAZWA_STUDIA = 'Riot Games')

--3. zwraca recenzje gdzie ocena dla danej gry jest wyzsza od 7
SELECT * FROM RECENZJA_GRA
WHERE OCENA_GRY > 7

--4. zwraca gry z gatunku FPS
SELECT * FROM GRA
WHERE GATUNEK_GRY_ID_GARUNEK = (SELECT ID_GATUNEK FROM GATUNEK_GRY WHERE NAZWA_GATUNKU = 'FPS')

--5. zwraca receneztow ktorzy maja m.in RPG jako ulubiony gatunek 
SELECT * FROM RECENZENT
WHERE ULUBIONY_GATUNEK_GRY LIKE '%RPG%'

--6. zwraca uzytkowniko z ranga mid lub senior
SELECT * FROM UZYTKOWNIK 
WHERE Ranga_na_forum = 'MID' OR Ranga_na_forum = 'SENIOR'

--LACZENIA

--1. zwraca tytul gry, tresc recenzji, dane autora
SELECT GRA.TYTUL_GRY, RECENZJA_GRA.RECENZJA, RECENZENT.IMIE,RECENZENT.NAZWISKO
FROM ((GRA INNER JOIN RECENZJA_GRA ON GRA.ID_GRY = RECENZJA_GRA.GRA_ID_GRY) INNER JOIN RECENZENT ON RECENZJA_GRA.ID_RECENZENTA = RECENZENT.ID_RECENZENTA)

--2. zwraca tytul gry, studio deweloperskie, wydawce
SELECT GRA.TYTUL_GRY, STUDIO_DEWELOPERSKIE.NAZWA_STUDIA, WYDAWCA.NAZWA_WYDAWCY
FROM ((STUDIO_DEWELOPERSKIE INNER JOIN GRA ON GRA.STUDIO_DEWELOPERSKIE_ID_STUDIO = STUDIO_DEWELOPERSKIE.ID_STUDIO) INNER JOIN WYDAWCA ON GRA.ID_WYDAWCY = WYDAWCA.ID_WYDAWCY)

--3. zwraca nick, nazwe gry i ocene jaka dal uzytkownik danemu tytulowi
SELECT UZYTKOWNIK.NICK,UZYTKOWNIK.RANGA_NA_FORUM, GRA.TYTUL_GRY, OCENA_SPOLECZNOSCI.OCENA_UZYTKOWNIKA
FROM ((OCENA_SPOLECZNOSCI INNER JOIN GRA ON OCENA_SPOLECZNOSCI .GRA_ID_GRY = GRA.ID_GRY) INNER JOIN UZYTKOWNIK ON UZYTKOWNIK.ID_UZYTKOWNIKA = OCENA_SPOLECZNOSCI.UZYTKOWNIK_ID_UZYTKOWNIKA)

--4. zwraca imie, nazwisko recenzenta, tytul ulubionej gry, date
SELECT RECENZENT.IMIE,RECENZENT.NAZWISKO, GRA.TYTUL_GRY, GRA.DATA_PREMIERY
FROM RECENZENT INNER JOIN GRA ON RECENZENT.ULUBIONA_GRA = GRA.TYTUL_GRY

--5. zwraca tytul gry i komentarze jej dotyczace
SELECT GRA.TYTUL_GRY, KOMENTARZE.KOMENTARZ
FROM GRA INNER JOIN KOMENTARZE ON GRA.ID_GRY = KOMENTARZE.GRA_ID_GRY

-- GROUPY BY, HAVING

--1. zwraca id gier tylko z komentarzami, gry musza posiadac jakis komentarz 

SELECT COUNT(ID_UZYTKOWNIKA), GRA.TYTUL_GRY
FROM KOMENTARZE k INNER JOIN GRA ON k.GRA_ID_GRY = GRA.ID_GRY
GROUP BY GRA.TYTUL_GRY
HAVING COUNT(ID_UZYTKOWNIKA)> 0

--2. zwraca srednia ocene dla danej gry wydana przez recenzentow, pokazywane sa gry ze srednia wieksza niz 7

SELECT AVG(OCENA_GRY), GRA.TYTUL_GRY
FROM RECENZJA_GRA k INNER JOIN GRA ON k.GRA_ID_GRY = GRA.ID_GRY
GROUP BY GRA.TYTUL_GRY
HAVING AVG(OCENA_GRY)> 7

--3. zwraca srednie oceny dla uzytkownika

SELECT AVG(OCENA_UZYTKOWNIKA), UZYTKOWNIK.NICK
FROM OCENA_SPOLECZNOSCI o INNER JOIN UZYTKOWNIK ON o.UZYTKOWNIK_ID_UZYTKOWNIKA = UZYTKOWNIK.ID_UZYTKOWNIKA
GROUP BY (NICK)

--4. zwraca ilosc wydanych gier przez danego wydawce 

SELECT COUNT(GRA.ID_WYDAWCY), WYDAWCA.NAZWA_WYDAWCY
FROM GRA INNER JOIN WYDAWCA ON GRA.ID_WYDAWCY = WYDAWCA.ID_WYDAWCY
GROUP BY (WYDAWCA.NAZWA_WYDAWCY)


--4.1 zwraca ilosc wydanych gier przez danego wydawce  min. ilosc 2 

SELECT COUNT(GRA.ID_WYDAWCY), WYDAWCA.NAZWA_WYDAWCY
FROM GRA INNER JOIN WYDAWCA ON GRA.ID_WYDAWCY = WYDAWCA.ID_WYDAWCY
GROUP BY (WYDAWCA.NAZWA_WYDAWCY)
HAVING COUNT(GRA.ID_WYDAWCY) >= 2

--5. zwraca ilosc zrobionych gier przez dane studio deweloperskie

SELECT COUNT(GRA.STUDIO_DEWELOPERSKIE_ID_STUDIO), STUDIO_DEWELOPERSKIE.NAZWA_STUDIA
FROM GRA INNER JOIN STUDIO_DEWELOPERSKIE ON GRA.STUDIO_DEWELOPERSKIE_ID_STUDIO = STUDIO_DEWELOPERSKIE.ID_STUDIO
GROUP BY (STUDIO_DEWELOPERSKIE.NAZWA_STUDIA)