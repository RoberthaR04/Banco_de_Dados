SELECT CartaoCodigo,  ClienteNome
    FROM CartaoCredito RIGHT JOIN Clientes
    ON (CartaoCredito.ClienteCodigo=Clientes.ClienteCodigo)