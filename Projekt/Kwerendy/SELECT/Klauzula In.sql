SELECT *
FROM Pracownik
WHERE Id IN (SELECT Id_przelozonego FROM Pracownik WHERE Stanowisko = 'Pracownik baru');
