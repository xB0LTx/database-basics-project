SELECT R.*, G.Imie, G.Nazwisko, G.Numer_kontaktowy, G.Adres_email
FROM Recenzja R
JOIN Gosc G ON  G.Id = R.Autor
WHERE R.Autor IS NOT NULL
ORDER BY R.Autor;
