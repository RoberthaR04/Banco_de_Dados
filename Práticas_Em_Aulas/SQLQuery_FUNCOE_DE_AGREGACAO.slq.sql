--funçoes de agregação
--SUM AVG COUNT DISTINCT MIN MAX
--GROUP BY
--HAVING

SELECT ClienteBairro, SUM(ClienteRendaAnual) AS Total, 
AVG(ClienteRendaAnual) AS Media
FROM Clientes --faz a somatória da renda total
GROUP BY ClienteBairro--para colunas que não estão usando função de agregação, fazo agrupamento

ORDER BY Total DESC


