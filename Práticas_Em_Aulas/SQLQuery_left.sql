SELECT id_funcionario, nome_funcionario, funcionarios.id_departamento,
departamentos.nome_departamento 
    FROM funcionarios LEFT JOIN departamentos
        ON (funcionario.id_departamento=departamento.id_departamento)