SELECT Id, Imie, Nazwisko
FROM Pracownik
GROUP BY Id, Nazwisko, Imie, Id_przelozonego
HAVING Id_przelozonego = 4;
