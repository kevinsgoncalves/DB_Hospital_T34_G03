/* DQL - CONSULTAS DA PROVA ESCRITO NO VSCODE POR PROBLEMAS QUE TIVE COM A FORMATAÇÃO ENTRE
 * LETRAS MAISCULAS E MINUSCULAS */

/* Médicos e Especialidades */
/* Quais são os nomes e telefones de todos os médicos da especialidade “Cardiologia”? */

SELECT nome, telefone
FROM medico
WHERE espec_medico = 'cardiologista';

/* Pacientes e Planos de Saúde */
/* Liste o nome e o CPF de todos os pacientes que possuem o plano de saúde “Unimed”? */

SELECT p.nome, p.cpf
FROM paciente p
JOIN atendimento a ON p.cpf = a.cpf_paciente
JOIN credenciamento c ON a.crm_medico = c.nome_plano
WHERE c.nome_plano = 'unimed';

/* Exames Pendentes */
/* Quais exames ainda não têm resultado (data_resultado IS NULL) e foram solicitados no 
mês atual? */
 
SELECT id_exame, tipo_exame, data_pedido
FROM exame
WHERE data_pedido >= date_trunc('month', current_date)
AND data_pedido < date_trunc('month', current_date) + interval '1 month'
AND data_resultado IS NULL;

/* Quantidade de exames por laboratório */

SELECT l.nome, COUNT(e.id_exame) AS total_exames
FROM laboratorio l
LEFT JOIN exame e ON l.id_lab = e.id_lab
GROUP BY l.nome;

/* Internações Ativas */
/* Liste o nome do paciente, o número do leito e a data de entrada para todas as 
internações ativas (data_saida IS NULL). */
 
SELECT p.nome, l.num_leito, i.data_entrada
FROM internacao i
JOIN paciente p ON i.cpf_paciente = p.cpf
JOIN leito l ON i.id_leito = l.id_leito
WHERE i.data_saida IS NULL;

/* Atendimentos por Médico */
/* Quantos atendimentos cada médico realizou no último mês? Apresente o nome do 
médico e a quantidade. */
 
select m.nome, count(a.id_atendimento) as total_atendimentos
from medico m
left join atendimento a on m.crm = a.crm_medico
where a.data_hora_inicio >= (current_date - interval '1 month')
group by m.nome;

/* Qual médico com maior número de atendimentos? */

select m.nome, count(a.id_atendimento) as total
from medico m
join atendimento a on m.crm = a.crm_medico
group by m.nome
order by total desc
limit 1;

/* Ocupação de Leitos por Ala */
/* Qual a porcentagem de leitos ocupados em cada ala? Apresente o nome da ala e a 
porcentagem. */

select 
    al.nome_tipo,
    round((count(case when lei.status = 'ocupado' then 1 end)::numeric / count(lei.id_leito) * 100), 2) || '%' as porcentagem_ocupacao
from ala al
join leito lei on al.id_ala = lei.id_ala
group by al.nome_tipo;


/* Faturamento por Plano de Saúde */
/* Qual o valor total faturado para cada plano de saúde no ano de 2026? Apresente o nome 
do plano e o valor total. */


select forma_pagamento as plano, sum(valor) as valor_total
from faturamento
where extract(year from data_emissao) = 2026
group by forma_pagamento;

/* Prescrições de Medicamentos */
/* Quais são os dois medicamentos mais prescritos no hospital? Apresente o nome do 
medicamento e a quantidade de prescrições. */

SELECT m.nome, COUNT(p.id_prescricao) AS total_prescricoes
FROM medicamento m
JOIN prescricao p ON m.id_medicamento = p.id_medicamento
GROUP BY m.nome
ORDER BY total_prescricoes DESC
LIMIT 2;

/* Médicos e Pacientes por Especialidade */

select m.nome, m.espec_medico, count(distinct a.cpf_paciente) as qtd_pacientes
from medico m
left join atendimento a on m.crm = a.crm_medico
group by m.nome, m.espec_medico;


/* Liste o nome do médico, a especialidade e a quantidade de pacientes atendidos por 
cada médico. */

SELECT m.nome, m.espec_medico, COUNT(DISTINCT a.cpf_paciente) AS total_pacientes
FROM medico m
JOIN atendimento a ON m.crm = a.crm_medico
GROUP BY m.nome, m.espec_medico
ORDER BY total_pacientes DESC;

/* Leitos com Internações Prolongadas */
/* Quais leitos estão ocupados há mais de 15 dias? Apresente o número do leito, o nome 
do paciente e a data de entrada.*/

SELECT l.num_leito, p.nome, i.data_entrada
FROM internacao i
JOIN leito l ON i.id_leito = l.id_leito
JOIN paciente p ON i.cpf_paciente = p.cpf
WHERE i.data_saida IS NULL
AND i.data_entrada < current_date - interval '15 days';
--precisa de ajustes no povoamento pra retornar o resultado esperado.

/* Faturamento por Tipo de Atendimento */
/* Qual o valor total faturado por tipo de atendimento (consulta, exame, internação)  */

SELECT a.tipo_atendimento, SUM(f.valor) AS total_faturado
FROM atendimento a
JOIN faturamento f ON a.id_atendimento = f.id_atendimento
GROUP BY a.tipo_atendimento;

select 
    case 
        when id_atendimento is not null and id_exame is null and id_internacao is null then 'consulta'
        when id_exame is not null then 'exame'
        when id_internacao is not null then 'internação'
        else 'outros'
    end as tipo_faturamento,
    sum(valor) as total_faturado
from faturamento
group by tipo_faturamento;
