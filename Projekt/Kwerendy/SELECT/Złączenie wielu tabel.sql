SELECT G.*, S.Tytul AS Ostatni_odwiedzony_spektakl, S.Gatunek, S.Sala
FROM Kupione_bilety K
JOIN Spektakl S ON K.Id_spektaklu = S.Id
JOIN Gosc G ON K.Id_goscia = G.Id
WHERE S.Data_spektaklu = G.Data_ostatni_bilet
ORDER BY G.Id;
