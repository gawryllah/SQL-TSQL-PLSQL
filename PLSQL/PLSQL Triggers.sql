--recenzent moze zrecenzowac max 1 gre, inaczej podnosci sie blad 

CREATE OR REPLACE TRIGGER trig1
BEFORE INSERT 
ON RECENZJA_GRA
FOR EACH ROW
DECLARE
    czyJest INT := 0;
    vId INT;
BEGIN
    vId := :new.ID_RECENZENTA;
    SELECT COUNT(1) INTO czyJest FROM Recenzent WHERE ID_RECENZENTA = vId;
    IF czyJest > 0 THEN
        raise_application_error(-20100, 'Recenzent nie moze zrecenzowac 2 razy!');
    END IF;
END;

--blad np dla 

INSERT INTO Recenzja_gra(id_recenzja, id_recenzenta,recenzja, ocena_gry, gra_id_gry)
VALUES(1, 1, 'fajna gra', 10, (SELECT Id_Gry FROM Gra WHERE tytul_gry = 'Wiedzmin 3'));


--nie mozna kasowac komentarzy z bazy

CREATE OR REPLACE TRIGGER trig3
BEFORE DELETE
ON Komentarze
BEGIN 
    raise_application_error(-20325, 'Nie wolno usuwać komentarzy!');
END;

--np

DELETE FROM Komentarze WHERE Id_Komentarza = 2;

