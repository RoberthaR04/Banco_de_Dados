SELECT Clientes.ClienteCodigo, Clientes.ClienteNome, Clientes.ClienteSobrenome, Contas.ContaNumero,Movimentos.MovimentoValor
FROM Clientes, Contas, Movimentos --NOME DAS TABELAS
WHERE Clientes.ClienteCodigo=Contas.ClienteCodigo --CONDIÇÕES
AND Contas.ContaNumero=Movimentos.ContaNumero
AND Clientes.ClienteBairro = 'BOM RETIRO'
ORDER BY 5 DESC, 2 --ORDENA DE ACORDO COM A ORDEM DAS COLUNAS, 5 COLUNA DE MOVIMENTOS, 2 ORDENA PELO NOME
-- PARA ORDENAR PELO VALOR MENOR COLOCA-SE SOMENTE ORDER BY E O NOME DA COLUNA
-- PODE CHAMAR PELO NOME DO CAMPO, EXEMPLO, ORDER BY ClienteNome
