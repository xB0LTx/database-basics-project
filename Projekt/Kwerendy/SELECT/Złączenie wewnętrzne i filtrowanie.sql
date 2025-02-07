SELECT *
FROM Gosc
JOIN Kupione_bilety ON Gosc.Id = Kupione_bilety.Id_goscia AND Kupione_bilety.Id_spektaklu = 1
WHERE Kupione_bilety.Id_spektaklu IS NOT NULL;
