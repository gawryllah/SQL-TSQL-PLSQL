
--jesli recenzent juz zrecenzowal dany tytul to podniesie sie blad
CREATE PROCEDURE proc1
(@idRec INT, @idRecGry INT, @ocenaRec INT, @trescRec VARCHAR)
AS
BEGIN
    DECLARE @czyJest INT;

    SELECT @czyJest = COUNT(1) FROM Recenzja_gra WHERE @idRec = id_recenzenta AND gra_id_gry = @idRecGry;
    
    IF @czyJest > 0 BEGIN
        raiserror('-20010 Recenzent juz zrecenzowal dany tytul', 16, 1);
    END
    ELSE BEGIN
        INSERT INTO Recenzja_gra(id_recenzja, id_recenzenta,recenzja, ocena_gry, gra_id_gry)
         VALUES(((SELECT COUNT(1) FROM Recenzja_gra)+1), @idRec, @trescRec, @ocenaRec, @idRecGry);
    END 
    
END;


--test

EXEC proc1 2, 3, 5, 'test procedury'; --blad 
EXEC proc1 2, 2, 5, 'test procedury'; - dopiszee


--wypisuje nicki i rangi uzytkownikow zarejestrowanych danego roku

CREATE PROCEDURE proc2
(@rokRejestracji INT)
AS
BEGIN
    DECLARE cur1 CURSOR FOR SELECT nick, ranga_na_forum FROM Uzytkownik
    WHERE YEAR(Data_Dolaczenia) = @rokRejestracji;
    DECLARE @vNick VARCHAR(100);
    DECLARE @vRanga VARCHAR(100);
 
    OPEN cur1;
    print 'Uzytkownicy zarejestrowani w roku ' + CAST(@rokRejestracji AS VARCHAR) + ':';
	FETCH NEXT FROM cur1 INTO @vNick, @vRanga
    WHILE @@FETCH_STATUS = 0
    BEGIN
        print (@vNick) + ' , ranga: ' + (@vRanga);
		FETCH NEXT FROM cur1 INTO @vNick, @vRanga;
    END;
    CLOSE cur1;
    DEALLOCATE cur1;
END;

--TEST

EXEC proc2 2019;