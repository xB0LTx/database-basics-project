SELECT *
FROM Kapital_Pieniezny
WHERE Saldo > ALL (SELECT Saldo FROM Kapital_Pieniezny WHERE Data = '2023-12-01');
