SELECT S.Id_spektaklu, Sp.Tytul, COUNT(S.Id_aktora) AS Liczba_Aktorow
FROM Spektakl_aktor S
LEFT JOIN Spektakl Sp ON S.Id_spektaklu = Sp.Id
GROUP BY S.Id_spektaklu, Sp.Tytul
ORDER BY S.Id_spektaklu;
