SELECT P.Imie, P.Nazwisko, PR.*
FROM Pracownik P
RIGHT JOIN Praca PR ON P.Id = PR.Id_pracownika;
