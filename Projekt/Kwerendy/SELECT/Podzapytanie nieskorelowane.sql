SELECT Id, Imie, Nazwisko
FROM Aktor
WHERE Id IN (SELECT Id_aktora FROM Spektakl_aktor WHERE Id_spektaklu = 1);
