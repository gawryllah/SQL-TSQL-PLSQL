--po dodaniu danych do tabeli recenzji gry zostanie wydrukowana informacja ile dany recenzent zrealizowal recenzji

CREATE TRIGGER trig1 
ON RECENZJA_GRA
FOR INSERT 
AS
BEGIN
	DECLARE @iloscR INT
	DECLARE @vImie VARCHAR
	DECLARE @vNazwisko VARCHAR
	
	SELECT @vImie = (SELECT Imie FROM Recenzent WHERE Id_Recenzenta = (SELECT Id_Recenzenta FROM INSERTED))
	SELECT @vNazwisko = (SELECT Nazwisko FROM Recenzent WHERE Id_Recenzenta = (SELECT Id_Recenzenta FROM INSERTED))

	SELECT @iloscR = COUNT(1) FROM Recenzja_gra WHERE Id_Recenzenta = (SELECT Id_Recenzenta FROM INSERTED)

	
	PRINT('Recenzent : ' + @vImie + ' ' + @vNazwisko + ' napisal ' + CAST(@iloscR AS VARCHAR) + ' recenzji');
END;


--nie mozna kasowac komentazry
CREATE TRIGGER tr2
ON Komentarze
FOR DELETE
AS
BEGIN
	ROLLBACK;
END;

--np dla
DELETE FROM Komentarze WHERE Id_Komentarza = 2;