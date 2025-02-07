SELECT *
FROM Pracownik
WHERE EXISTS (SELECT * FROM Praca WHERE Pracownik.Id = Praca.Id_pracownika AND Praca.Data = '2023-12-08');
