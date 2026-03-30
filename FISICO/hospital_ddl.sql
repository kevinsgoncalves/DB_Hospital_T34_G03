/*DDL - CRIANDO TABELAS - FEITA PARCIALMENTE NO DISCORD */

/* TODOS OS ENUMS */
create type turno_enfermeira as enum ('manhã', 'tarde', 'noite');
create type cobertura_plano as enum ('regional', 'nacional');
create type cargo_enfermeira as enum ('subordinada', 'chefe');
create type espec_medico as enum ('clinico geral', 'pediatra', 'cardiologista', 'ortopedista', 'outro');
create type status_leito as enum ('ocupado', 'livre', 'em manutenção');
create type atendimento_tipo as enum ('consulta', 'emergência', 'revisão');
create type status_atendimento as enum ('realizado', 'cancelado', 'agendado');
create type laboratorio_tipo as enum ('interno', 'externo');
create type exame_tipo as enum ('sangue', 'imagem', 'urina', 'fezes');
create type status_fatura as enum ('pendente', 'pago', 'cancelado', 'em análise');
create type resultado_exame as enum ('normal', 'alterado', 'crítico');

/* INFRAESTRUTUTRA */
create table hospital (
    cnpj varchar(18) primary key, 
    nome varchar(100) not null
);

create table plano_saude (
    nome_plano varchar(50) primary key, 
    telefone varchar(20),
    cobertura cobertura_plano
);

create table credenciamento (
    data_credenciamento date not null,
    cnpj_hospital varchar(18) references hospital(cnpj), 
    nome_plano varchar(50) references plano_saude(nome_plano),
    primary key (cnpj_hospital, nome_plano)
);

create table ala (
    id_ala serial primary key, 
    nome_tipo varchar(50), 
    num_leitos_total int,
    num_leitos_disponiveis int, 
    cnpj_hospital varchar(18) references hospital(cnpj)
);

/* FUNCIONARIOS */ 
create table enfermeira (
    cre varchar(20) primary key, 
    nome varchar(50) not null,
    turno turno_enfermeira not null, 
    cargo cargo_enfermeira,
    id_ala int references ala(id_ala),
    cre_chefe varchar(20) references enfermeira(cre) -- -> AUTO RELACIONAMENTO
);


alter table ala add column cre_responsavel varchar(20) references enfermeira(cre);

create table medico (
    crm varchar(20) primary key, 
    nome varchar(100) not null, 
    telefone varchar(20),
    espec_medico espec_medico default 'clinico geral'
);

create table paciente (
    cpf varchar(14) primary key, 
    nome varchar(100) not null,
    telefone varchar(20),
    data_nascimento date not null, 
    endereco varchar(100),
    info_clinica text
);

/* FUNCIONAMENTO INTERNO / EXTRERNO */
create table leito (
    id_leito serial primary key, 
    num_leito varchar(10) unique not null,
    status status_leito default 'livre',
    id_ala int references ala(id_ala)
);

create table atendimento (
    id_atendimento serial primary key,
    data_hora_inicio timestamp not null, 
    tipo_atendimento atendimento_tipo not null,
    status_atendimento status_atendimento not null, 
    observacoes_clinicas text,
    cpf_paciente varchar(14) references paciente(cpf),
    crm_medico varchar(20) references medico(crm)
);

create table internacao (
    id_internacao serial primary key, 
    data_entrada timestamp not null, 
    data_saida timestamp,
    id_leito int references leito(id_leito),
    id_atendimento int references atendimento(id_atendimento),
    cpf_paciente varchar(14) references paciente(cpf),
    constraint check_data_saida check (data_saida > data_entrada)
);

-- regra: um paciente não pode ter duas internações ativas simultaneamente, NÃO FOI PASSADO AINDA.
create unique index idx_internacao_ativa on internacao (cpf_paciente) where (data_saida is null);

create table laboratorio (
    id_lab serial primary key, 
    nome varchar(100), 
    tipo laboratorio_tipo not null
);

create table exame (
    id_exame serial primary key, 
    tipo_exame exame_tipo not null, 
    custo decimal(10,2) not null,
    laudo text, 
    data_pedido timestamp not null,
    data_resultado timestamp, 
    resultado resultado_exame,
    arquivo_referencia varchar(255), -- referência para o pdf/imagem
    id_atendimento int references atendimento(id_atendimento),
    id_lab int references laboratorio(id_lab),
    cpf_paciente varchar(14) references paciente(cpf),
    crm_medico varchar(20) references medico(crm)
);

create table medicamento (
    id_medicamento serial primary key, 
    nome varchar(100) not null
);

create table prescricao (
    id_prescricao serial primary key, 
    data_prescricao date not null,
    dosagem varchar(100), 
    id_atendimento int references atendimento(id_atendimento),
    id_medicamento int references medicamento(id_medicamento)
);

/* FINANCEIRO INTERNO */
create table faturamento (
    id_fatura serial primary key, 
    valor decimal(10,2) not null,
    status status_fatura default 'pendente', 
    forma_pagamento varchar(50), 
    data_emissao date not null,
    data_vencimento date not null,
    id_atendimento int references atendimento(id_atendimento),
    id_exame int references exame(id_exame),
    id_internacao int references internacao(id_internacao)
);

/* PESQUISA DE QUALIDADE */
create table pesquisa (
    id_pesquisa serial primary key,
    data_resposta timestamp default current_timestamp,
    nota_geral int check (nota_geral between 1 and 5), 
    comentario text, 
    recomendaria boolean,
    tempo_espera_avaliacao int check (tempo_espera_avaliacao between 1 and 5),
    id_atendimento int unique references atendimento(id_atendimento)
);
