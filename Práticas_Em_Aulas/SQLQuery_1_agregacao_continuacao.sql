SELECT ClienteBairro, SUM(ClienteRendaAnual) AS Total
-- COUNT(ClienteCodigo) AS Qtde_Clientes
-- COUNT(DISTINCT ClienteCodigo) As Qtde_Clientes
FROM Clientes --WHERE ClienteBairro = 'BOM RETIRO'  (operador de comparação linha a linha)
GROUP BY ClienteBairro
ORDER BY 2 DESC

SELECT COUNT(DISTINCT ClienteBairro) FROM Clientes ---38
SELECT COUNT(ClienteBairro) FROM Clientes ---1000


SELECT COUNT(*) FROM Clientes --- o asterístico conta tudo(vazio e completo)
SELECT COUNT(ClienteBairro) FROM Clientes WHERE ClienteBairro IS NULL

SELECT COUNT(ClienteCodigo) FROM Clientes
SELECT COUNT(ClienteBairro) FROM Clientes
