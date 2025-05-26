--funçoes de agregação
--SUM AVG COUNT DISTINCT MIN MAX
--GROUP BY
--HAVING

SELECT ClienteBairro, SUM(ClienteRendaAnual) AS Total
FROM Clientes 
GROUP BY ClienteBairro
HAVING SUM(ClienteRendaAnual) >
        (SELECT AVG(ClienteRendaAnual) AS Media FROM Clientes)
ORDER BY 2 DESC

SELECT AVG(ClienteRendaAnual) AS Media FROM Clientes