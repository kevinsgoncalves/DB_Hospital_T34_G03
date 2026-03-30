/* DML - POVOAMENTO DAS TABELAS GERADOS POR IA */

-- HOSPITAIS
insert into hospital (cnpj, nome) values 
('11.111.111/0001-01', 'hospital santa rita'),
('22.222.222/0001-02', 'hospital central'),
('33.333.333/0001-03', 'hospital da criança'),
('44.444.444/0001-04', 'hospital memorial'),
('55.555.555/0001-05', 'hospital do coração'),
('66.666.666/0001-06', 'hospital metropolitano'),
('77.777.777/0001-07', 'hospital adventista'),
('88.888.888/0001-08', 'hospital são luiz'),
('99.999.999/0001-09', 'hospital universitário'),
('00.000.000/0001-00', 'hospital das clínicas');

-- PLANOS DE SAUDE
insert into plano_saude (nome_plano, telefone, cobertura) values 
('unimed', '(11) 3333-4444', 'nacional'),
('bradesco saude', '(11) 2222-3333', 'nacional'),
('sulamerica', '(21) 4444-5555', 'nacional'),
('amil', '(11) 5555-6666', 'regional'),
('hapvida', '(85) 3333-2222', 'regional'),
('porto seguro', '(11) 1111-2222', 'nacional'),
('golden cross', '(21) 9999-8888', 'regional'),
('intermédica', '(11) 7777-6666', 'regional'),
('allianz', '(11) 8888-9999', 'nacional'),
('care plus', '(11) 4444-1111', 'nacional');


INSERT INTO paciente_plano (cpf_paciente, nome_plano) VALUES
('123.456.789-01', 'unimed'),
('234.567.890-12', 'bradesco saude'),
('345.678.901-23', 'sulamerica'),
('456.789.012-34', 'amil'),
('567.890.123-45', 'hapvida'),
('678.901.234-56', 'porto seguro'),
('789.012.345-67', 'unimed'),
('890.123.456-78', 'intermédica'),
('901.234.567-89', 'unimed'),
('012.345.678-90', 'care plus');

-- CREDENCIAMENTO
insert into credenciamento (cnpj_hospital, nome_plano, data_credenciamento) values 
('11.111.111/0001-01', 'unimed', '2020-01-10'),
('11.111.111/0001-01', 'bradesco saude', '2021-05-20'),
('22.222.222/0001-02', 'sulamerica', '2019-03-15'),
('33.333.333/0001-03', 'amil', '2022-08-01'),
('44.444.444/0001-04', 'unimed', '2018-12-12'),
('55.555.555/0001-05', 'bradesco saude', '2023-01-05'),
('66.666.666/0001-06', 'hapvida', '2020-11-11'),
('77.777.777/0001-07', 'porto seguro', '2021-02-28'),
('88.888.888/0001-08', 'allianz', '2019-07-14'),
('99.999.999/0001-09', 'care plus', '2024-03-01');

-- MÉDICOS
insert into medico (crm, nome, telefone, espec_medico) values 
('crm-101', 'dr. marcos silva', '(11) 9999-1111', 'cardiologista'),
('crm-102', 'dra. ana beatriz', '(11) 9999-2222', 'pediatra'),
('crm-103', 'dr. ricardo oliveira', '(11) 9999-3333', 'ortopedista'),
('crm-104', 'dra. juliana costa', '(11) 9999-4444', 'clinico geral'),
('crm-105', 'dr. felipe santos', '(11) 9999-5555', 'cardiologista'),
('crm-106', 'dra. camila lima', '(11) 9999-6666', 'outro'),
('crm-107', 'dr. bruno matos', '(11) 9999-7777', 'clinico geral'),
('crm-108', 'dra. fernanda gomes', '(11) 9999-8888', 'pediatra'),
('crm-109', 'dr. gustavo faria', '(11) 9999-9999', 'outro'),
('crm-110', 'dra. larissa souza', '(11) 9999-0000', 'clinico geral');

-- PACIENTES
insert into paciente (cpf, nome, telefone, data_nascimento, endereco, info_clinica) values 
('123.456.789-01', 'joão pereira', '(11) 91111-2222', '1985-04-12', 'rua a, 10', 'hipertenso'),
('234.567.890-12', 'maria santos', '(11) 92222-3333', '1992-07-25', 'rua b, 20', 'alérgica a dipirona'),
('345.678.901-23', 'pedro rocha', '(21) 93333-4444', '1978-11-05', 'av c, 30', 'diabético tipo 2'),
('456.789.012-34', 'lucas souza', '(31) 94444-5555', '2015-01-30', 'rua d, 40', 'nenhuma'),
('567.890.123-45', 'carla lima', '(41) 95555-6666', '1960-03-14', 'rua e, 50', 'asma'),
('678.901.234-56', 'roberto dias', '(51) 96666-7777', '1988-09-21', 'av f, 60', 'obeso'),
('789.012.345-67', 'patricia mello', '(61) 97777-8888', '2000-12-01', 'rua g, 70', 'gestante'),
('890.123.456-78', 'andreia nunes', '(71) 98888-9999', '1995-02-10', 'rua h, 80', 'anêmica'),
('901.234.567-89', 'fernando silva', '(81) 99999-0000', '1955-06-18', 'av i, 90', 'cardiopata'),
('012.345.678-90', 'beatriz farias', '(91) 90000-1111', '2010-05-05', 'rua j, 100', 'nenhuma');

-- ALAS DO HOSPITAL
insert into ala (nome_tipo, num_leitos_total, num_leitos_disponiveis, cnpj_hospital) values 
('uti', 10, 5, '11.111.111/0001-01'),
('pediatria', 15, 10, '11.111.111/0001-01'),
('enfermaria', 30, 20, '11.111.111/0001-01'),
('cardiologia', 10, 8, '11.111.111/0001-01'),
('ortopedia', 20, 12, '11.111.111/0001-01'),
('obstetrícia', 10, 6, '11.111.111/0001-01'),
('neurologia', 8, 4, '11.111.111/0001-01'),
('emergência', 20, 15, '11.111.111/0001-01'),
('isolamento', 5, 3, '11.111.111/0001-01'),
('oncologia', 10, 7, '11.111.111/0001-01');

-- ENFERMEIRAS
insert into enfermeira (cre, nome, turno, cargo, id_ala, cre_chefe) values 
('cre-001', 'elaine silva', 'manhã', 'chefe', 1, null),
('cre-002', 'marta gomes', 'tarde', 'subordinada', 1, 'cre-001'),
('cre-003', 'lucia matos', 'noite', 'chefe', 2, null),
('cre-004', 'renata dias', 'manhã', 'subordinada', 2, 'cre-003'),
('cre-005', 'sandra lima', 'tarde', 'chefe', 3, null),
('cre-006', 'claudia faria', 'noite', 'subordinada', 3, 'cre-005'),
('cre-007', 'juliana souza', 'manhã', 'chefe', 4, null),
('cre-008', 'marina costa', 'tarde', 'subordinada', 4, 'cre-007'),
('cre-009', 'paula nunes', 'noite', 'chefe', 5, null),
('cre-010', 'fernanda farias', 'manhã', 'subordinada', 5, 'cre-009');

-- ENFERMEIRAS CHEFE
update ala set cre_responsavel = 'cre-001' where id_ala = 1;
update ala set cre_responsavel = 'cre-003' where id_ala = 2;
update ala set cre_responsavel = 'cre-005' where id_ala = 3;
update ala set cre_responsavel = 'cre-007' where id_ala = 4;
update ala set cre_responsavel = 'cre-009' where id_ala = 5;

-- LEITOS
insert into leito (num_leito, status, id_ala) values 
('l-101', 'ocupado', 1),
('l-102', 'livre', 1),
('l-201', 'ocupado', 2),
('l-202', 'em manutenção', 2),
('l-301', 'livre', 3),
('l-302', 'ocupado', 3),
('l-401', 'livre', 4),
('l-402', 'livre', 4),
('l-501', 'ocupado', 5),
('l-601', 'livre', 6);

-- ATENDIMENTOS
insert into atendimento (data_hora_inicio, tipo_atendimento, status_atendimento, observacoes_clinicas, cpf_paciente, crm_medico) values 
('2026-03-01 08:30:00', 'consulta', 'realizado', 'paciente com dor de cabeça leve', '123.456.789-01', 'crm-104'),
('2026-03-05 14:00:00', 'emergência', 'realizado', 'suspeita de fratura no braço', '345.678.901-23', 'crm-103'),
('2026-03-10 10:15:00', 'revisão', 'realizado', 'acompanhamento pós-cirúrgico', '234.567.890-12', 'crm-101'),
('2026-03-12 09:00:00', 'consulta', 'cancelado', 'paciente não compareceu', '567.890.123-45', 'crm-109'),
('2026-03-15 11:45:00', 'emergência', 'realizado', 'crise asmática aguda', '567.890.123-45', 'crm-110'),
('2026-03-20 16:30:00', 'consulta', 'agendado', 'rotina pediátrica', '456.789.012-34', 'crm-102'),
('2026-03-22 13:00:00', 'consulta', 'realizado', 'exame de rotina ginecológica', '789.012.345-67', 'crm-107'),
('2026-03-25 08:00:00', 'revisão', 'realizado', 'verificação de pressão arterial', '901.234.567-89', 'crm-105'),
('2026-03-27 15:20:00', 'emergência', 'realizado', 'reação alérgica forte', '234.567.890-12', 'crm-104'),
('2026-03-28 10:00:00', 'consulta', 'realizado', 'avaliação dermatológica', '890.123.456-78', 'crm-109');

-- INTERNAÇÕES
insert into internacao (data_entrada, data_saida, id_leito, id_atendimento, cpf_paciente) values 
('2026-03-05 15:00:00', '2026-03-10 10:00:00', 3, 2, '345.678.901-23'),
('2026-03-15 12:00:00', '2026-03-18 09:30:00', 1, 5, '567.890.123-45'),
('2026-03-20 08:00:00', null, 9, 8, '901.234.567-89'),
('2026-03-10 11:00:00', '2026-03-12 14:00:00', 6, 3, '123.456.789-01'),
('2026-03-25 10:00:00', null, 1, 9, '234.567.890-12'),
('2026-02-10 09:00:00', '2026-02-25 10:00:00', 5, 1, '012.345.678-90'),
('2026-03-01 07:00:00', '2026-03-05 08:00:00', 9, 1, '678.901.234-56'),
('2026-03-12 15:00:00', '2026-03-15 10:00:00', 3, 5, '789.012.345-67'),
('2026-03-18 20:00:00', '2026-03-22 11:00:00', 1, 7, '890.123.456-78'),
('2026-01-01 08:00:00', '2026-01-20 18:00:00', 5, 2, '567.890.123-45');

-- LABORATÓRIO
insert into laboratorio (nome, tipo) values 
('lab clinico central', 'interno'),
('laboratório x', 'externo'),
('diagnósticos s.a.', 'externo'),
('bioanálise interna', 'interno'),
('imagem e vida', 'externo'),
('laboratório municipal', 'externo'),
('unilab', 'interno'),
('lab saúde total', 'externo'),
('análises clínicas s.j.', 'interno'),
('laboratório precisão', 'externo');

-- EXAMES
insert into exame (tipo_exame, custo, laudo, data_pedido, data_resultado, resultado, arquivo_referencia, id_atendimento, id_lab, cpf_paciente, crm_medico) values 
('sangue', 50.00, 'hemograma normal', '2026-03-01 09:00:00', '2026-03-02 10:00:00', 'normal', 'laudo_001.pdf', 1, 1, '123.456.789-01', 'crm-104'),
('imagem', 250.00, 'fratura em rádio', '2026-03-05 14:15:00', '2026-03-05 16:00:00', 'alterado', 'img_002.jpg', 2, 5, '345.678.901-23', 'crm-103'),
('urina', 30.00, 'ausência de bactérias', '2026-03-10 10:30:00', '2026-03-11 08:00:00', 'normal', 'laudo_003.pdf', 3, 4, '234.567.890-12', 'crm-101'),
('sangue', 80.00, 'glicemia elevada', '2026-03-15 12:00:00', '2026-03-16 09:00:00', 'crítico', 'laudo_004.pdf', 5, 7, '567.890.123-45', 'crm-110'),
('imagem', 500.00, 'exame pendente', '2026-03-20 16:45:00', null, null, null, 6, 2, '456.789.012-34', 'crm-102'),
('sangue', 120.00, 'colesterol estável', '2026-03-22 13:15:00', '2026-03-23 14:00:00', 'normal', 'laudo_006.pdf', 7, 9, '789.012.345-67', 'crm-107'),
('urina', 45.00, 'exame pendente', '2026-03-25 08:30:00', null, null, null, 8, 1, '901.234.567-89', 'crm-105'),
('imagem', 150.00, 'feto saudável', '2026-03-27 15:45:00', '2026-03-27 17:00:00', 'normal', 'img_008.jpg', 7, 3, '789.012.345-67', 'crm-107'),
('sangue', 60.00, 'ferro baixo', '2026-03-28 10:15:00', '2026-03-29 11:00:00', 'alterado', 'laudo_009.pdf', 10, 10, '890.123.456-78', 'crm-109'),
('fezes', 25.00, 'exame pendente', '2026-03-28 10:30:00', null, null, null, 10, 6, '890.123.456-78', 'crm-109');

-- MEDICAMENTOS
insert into medicamento (nome) values 
('dipirona 500mg'),
('paracetamol 750mg'),
('amoxicilina 500mg'),
('omeprazol 20mg'),
('losartana 50mg'),
('salbutamol spray'),
('ibuprofeno 600mg'),
('metformina 850mg'),
('rivaroxabana 15mg'),
('dexametasona 4mg');

-- PRESCRIÇÃO
insert into prescricao (data_prescricao, dosagem, id_atendimento, id_medicamento) values 
('2026-03-01', '1 comprimido de 6 em 6 horas', 1, 1),
('2026-03-05', 'aplicação única via intra-venosa', 2, 7),
('2026-03-10', '1 cápsula em jejum diariamente', 3, 4),
('2026-03-15', '2 jatos em caso de falta de ar', 5, 6),
('2026-03-22', '1 comprimido ao dia', 7, 10),
('2026-03-25', '1 comprimido 12/12 horas', 8, 5),
('2026-03-27', 'injeção muscular imediata', 9, 10),
('2026-03-28', 'uso tópico conforme necessidade', 10, 8),
('2026-03-01', 'gotas para dor', 1, 2),
('2026-03-05', 'pomada no local', 2, 3);

INSERT INTO paciente_plano (cpf_paciente, nome_plano) VALUES
('123.456.789-01', 'unimed'),
('234.567.890-12', 'bradesco saude'),
('345.678.901-23', 'sulamerica'),
('456.789.012-34', 'amil'),
('567.890.123-45', 'hapvida'),
('678.901.234-56', 'porto seguro'),
('789.012.345-67', 'unimed'),
('890.123.456-78', 'intermédica'),
('901.234.567-89', 'unimed'),
('012.345.678-90', 'care plus');

-- FATURAMENTO
insert into faturamento (valor, status, forma_pagamento, data_emissao, data_vencimento, id_atendimento, id_exame, id_internacao) values 
(150.00, 'pago', 'cartão de crédito', '2026-03-01', '2026-03-31', 1, null, null),
(50.00, 'pago', 'plano de saúde', '2026-03-02', '2026-04-02', null, 1, null),
(1200.00, 'pendente', 'fatura hospitalar', '2026-03-10', '2026-04-10', null, null, 1),
(250.00, 'pago', 'dinheiro', '2026-03-05', '2026-04-05', null, 2, null),
(300.00, 'em análise', 'plano de saúde', '2026-03-15', '2026-04-15', 5, null, null),
(800.00, 'pendente', 'plano de saúde', '2026-03-18', '2026-04-18', null, null, 2),
(30.00, 'pago', 'débito', '2026-03-11', '2026-04-11', null, 3, null),
(200.00, 'pago', 'pix', '2026-03-22', '2026-04-22', 7, null, null),
(80.00, 'cancelado', 'não informado', '2026-03-16', '2026-04-16', null, 4, null),
(1500.00, 'pendente', 'plano de saúde', '2026-02-25', '2026-03-25', null, null, 6);

-- PESQUISA
insert into pesquisa (data_resposta, nota_geral, comentario, recomendaria, tempo_espera_avaliacao, id_atendimento) values 
('2026-03-01 10:00:00', 5, 'atendimento excelente e rápido', true, 5, 1),
('2026-03-05 18:00:00', 4, 'médico atencioso, mas sala fria', true, 4, 2),
('2026-03-10 12:00:00', 3, 'demorou muito para ser atendido', true, 2, 3),
('2026-03-15 14:00:00', 5, 'equipe de enfermagem nota 10', true, 5, 5),
('2026-03-22 15:00:00', 2, 'espera excessiva na recepção', false, 1, 7),
('2026-03-25 09:30:00', 4, 'instalações muito limpas', true, 4, 8),
('2026-03-27 19:00:00', 5, 'salvou minha vida no pronto socorro', true, 5, 9),
('2026-03-28 11:30:00', 4, 'médico muito pontual', true, 5, 10); 
