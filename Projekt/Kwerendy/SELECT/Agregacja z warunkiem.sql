SELECT s.Id, s.Tytul, s.Data_spektaklu, COUNT(k.Id_goscia) AS Liczba_biletow
FROM Spektakl s
JOIN Kupione_bilety k ON s.Id = k.Id_spektaklu
GROUP BY s.Id, s.Tytul, s.Data_spektaklu
HAVING COUNT(k.Id_goscia) > 3;

