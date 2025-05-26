--cliente e suas movimentações
SELECT Clientes.ClienteNome, 
    Contas.ContaNumero,
    Movimentos.MovimentoValor, CartaoCredito.CartaoCodigo,
    CASE
        WHEN CartaoCredito.CartaoCodigo 
            IS NULL THEN Clientes.ClienteTelefone ELSE CartaoCodigo
            END AS 'Contatar'
           
FROM Clientes 

    INNER JOIN Contas 
        on (Clientes.ClienteCodigo=Contas.ClienteCodigo) --parenteses opcional
    INNER JOIN Movimentos
        on (Contas.ContaNumero=Movimentos.ContaNumero) 
        ---somente com igualdade, caso um cliente não tenha feito uma movimentação
        --Não irá aparecer na pesquisa
        -- v = v irá aparecer, porém se for v = F não irá aparecer
    LEFT JOIN CartaoCredito 
    --com a possibilidade de nãohaver registros o LEFT serve para levar todo o conjunto de dados,
    --caso não encontre, o que não tiver correspondente, aparecerá vazio
        on (Clientes.ClienteCodigo=CartaoCredito.ClienteCodigo) 

