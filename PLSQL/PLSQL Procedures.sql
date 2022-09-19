
--jesli recenzent juz zrecenzowal dany tytul to podniesie sie blad
CREATE OR REPLACE PROCEDURE proc1
(idRec INT, idRecGry INT, ocenaRec INT, trescRec VARCHAR)
AS
    czyJest INT;
BEGIN
    SELECT COUNT(1) INTO czyJest FROM Recenzja_gra WHERE idRec = id_recenzenta AND gra_id_gry = idRecGry;
    
    IF czyjest > 0 THEN
        raise_application_error(-20010, 'Recenzent juz zrecenzowal dany tytul');
    ELSE
        INSERT INTO Recenzja_gra(id_recenzja, id_recenzenta,recenzja, ocena_gry, gra_id_gry)
         VALUES(((SELECT COUNT(1) FROM Recenzja_gra)+1), idRec, trescRec, ocenaRec, idRecGry);
    END IF;
    
END;

--test
CALL proc1(2, 3, 5, 'test procedury'); --BLAD
CALL proc1(2, 1, 5, 'test procedury'); --dopisze
CALL proc1(3, 1, 5, 'test procedury2'); --dopisze


--wypisuje nicki i rangi uzytkownikow z danego roku

CREATE OR REPLACE PROCEDURE proc2
(rokRejestracji INT)
AS
    CURSOR cur1 IS SELECT nick, ranga_na_forum
    FROM Uzytkownik
    WHERE EXTRACT(YEAR FROM Data_Dolaczenia) = rokRejestracji;
    vNick VARCHAR(100);
    vRanga VARCHAR(100);
BEGIN
    OPEN cur1;
    dbms_output.put_line('Uzytkownicy zarejestrowani w roku ' || rokRejestracji || ':');
    LOOP
        FETCH cur1 INTO vNick, vRanga;
        EXIT WHEN cur1%NOTFOUND;
        dbms_output.put_line(vNick || ' , ranga: ' || vRanga);
    END LOOP;
    CLOSE cur1;
END;