# 🏥 BANCO DE DADOS HOSPITALAR

Este projeto consiste no desenvolvimento de um banco de dados completo para um ambiente hospitalar, abrangendo desde a infraestrutura física e pessoal até o fluxo de atendimentos, exames e faturamento. este é o projeto final da disciplina de **banco de dados**.

## 👥 COLABORADORES

* [Kevin Gonçalves](https://github.com/kevinsgoncalves)
* [Pedro Reis](https://github.com/PHDReis)
* [Simone Bromer](https://github.com/SimoneBromer)
* [Gabriel Mendonça](https://github.com/AscendedGabriel)
* [Leonan Nogueira](https://github.com/LeonamNgr)
* [Danielle Carvalho](https://github.com/DanielleCarvalho-26)

## 🛠️ FERRAMENTAS

* **[brModelo](https://www.sis4.com)**: Utilizado para a criação do modelo conceitual (der) que também possui versão [Online](https://www.brmodeloweb.com).
* **[dBeaver](https://dbeaver.com)**: Ferramenta de gerenciamento e execução de scripts sql.
* **[Postgresql](https://www.postgresql.org)**: Sistema de gerenciamento de banco de dados relacional (sgbd).

## 🗂️ estrutura do projeto

O projeto está dividido em três fases principais de modelagem:

1.  **modelo conceitual**: representação das entidades e relacionamentos através do brmodelo.
2.  **modelo lógico**: tradução do der para a estrutura de tabelas, chaves primárias e estrangeiras.
3.  **modelo físico (ddl/dml)**: scripts sql para criação da estrutura e inserção de dados de teste.

## 🚀 Como executar o projeto

1.  certifique-se de ter o **postgresql** instalado em sua máquina.
2.  crie um novo banco de dados (ex: `hospital_db`).
3.  abra o **dBeaver** e conecte-se ao banco criado.
4.  execute primeiro o script contido em `MODELO FISICO` para gerar as tabelas.

## 📋 requisitos implementados

* **auto-relacionamento**: hierarquia de enfermeiras (chefe/subordinada).
* **relacionamento n:n**: prescrições de medicamentos e credenciamento de planos.
* **restrições de integridade**: controle de internações ativas e tipos enumerados (enums).
* **faturamento**: integração de custos de atendimentos, exames e internações.

---

### 📄 LICENÇA

Este projeto foi desenvolvido para fins acadêmicos.

---
