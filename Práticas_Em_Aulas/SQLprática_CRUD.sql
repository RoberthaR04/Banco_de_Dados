CREATE OR ALTER TRIGGER trgINSERT_CARTAO
ON Clientes
FOR INSERT
AS 
BEGIN
DECLARE @ClienteCodigo INT
SET @ClienteCodigo = (SELECT ClienteCodigo FROM INSERTD)
    INSERT CartaoCredito (ClienteCodigo, CartaoCodigo)
    VALUES (@ClienteCodigo, 'AAAA-BBBB-CCCC-DDDD')
END

INSERT Clientes (ClienteNome) VALUES ('Dornel')

SELECT * FROM CartaoCredito

SELECT * FROM Clientes WHERE ClienteNome = 'Dornel'

