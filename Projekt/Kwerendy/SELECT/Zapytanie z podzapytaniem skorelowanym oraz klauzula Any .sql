SELECT *
FROM Kapital_Pieniezny
WHERE Saldo > ANY (SELECT Saldo FROM Kapital_Pieniezny WHERE Data = '2023-12-01');
