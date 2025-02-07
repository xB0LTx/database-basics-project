SELECT K.Id_pracownika, P.Imie, P.Nazwisko, K.Id, K.Data, K.Saldo, K.Dochody, K.Wydatki, K.Ilosc_zgodna
FROM Pracownik P
JOIN Kapital_Pieniezny K ON P.Id = K.Id_pracownika
ORDER BY K.Data DESC;
