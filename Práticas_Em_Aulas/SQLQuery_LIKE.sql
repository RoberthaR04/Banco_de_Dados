--like
-- SELECT * FROM Clientes
-- WHERE ClienteNome LIKE '%e' --caso comece com a letra "e" > '%e' no meio '%e%
-- --colocando WHERE ClienteNome NOT LIKE
--WHERE (ClienteNome LIKE '%a' OR ClienteNome LIKE '%e') ...aparecerá as duas opções terminando em 'A' ou 'E'
--SELECT * FROM ClienteNome, ClienteSexo,
--CASE WHEN ClienteNome LIKE '%a' THEN 'Feminino'
--WHEN ClienteNome LIKE '%e' THEN 'Masculino
SELECT ClienteNome, ClienteBairro,
-- CASE 
-- WHEN ClienteBairro IN ('NOVA BRASILIA', 'FLORESTA') THEN 'ZONA SUL'
CASE 
WHEN ClienteBairro IN ('ATIRADORES', 'SAGUACU') THEN 'CENTRO'
-- WHEN ClienteBairro = 'SANTO ANTONIO' OR
-- ClienteBairro = 'COSTA E SILVA' THEN 'ZONA NORTE'
-- ELSE 'NENHUM' END AS REGIAO
-- FROM Clientes