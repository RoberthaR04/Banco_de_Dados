SELECT FUN.nome_funcionario, GER.id_funcionario
CASE WHENGER.nome_funcionario IS NULL THEN 'Dono' --para adicionar o nome do funcionario que faltava, ou estava null
ELSE GER.nome_funcionario END AS nome_funcionario
FROM funcionarios AS FUN ---'as' serve para apilidar
    LEFT JOIN funcionarios AS GER
        on (FUN.id_gerente=GER.id_funcionario) --faça o relacionamento na esquerda, onde um tem que ser igual ao outro

        