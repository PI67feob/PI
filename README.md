# Projeto Integrado · Modelagem e Desenvolvimento de Sistemas

Sistema de controle de insumos agrícolas desenvolvido para o Projeto Integrado do
2º semestre de 2026 — Ciência da Computação, UNIFEOB.

O objetivo é registrar o consumo de insumos por talhão e por aplicação, apontar onde a
propriedade gasta mais do que o previsto e transformar esse histórico em indicadores que
apoiem a decisão. O recorte se conecta ao **ODS 12 — Consumo e Produção Responsáveis**,
tema definido para este módulo.

---

## Frentes de trabalho

O trabalho está dividido em quatro frentes, uma por unidade de estudo:

| Frente | Unidade de estudo | Integrantes | Onde fica |
|---|---|---|---|
| POO / Backend | Programação Orientada a Objetos | João Hélio, Cristiano | `lib/models`, `lib/services`, `lib/repositories`, `lib/exceptions` |
| Modelagem de Dados / DBA | Modelagem de Dados | Diogo | `banco/`, `docs/modelagem` |
| Lógica de Programação | Lógica de Programação (Dart) | Joaquim | `lib/logica`, `docs/fluxograma` |
| Business Intelligence | Business Intelligence | Bruno, Samuel | `bi/` |

O acompanhamento de tarefas é feito no **Caderno de Campo**, painel próprio da equipe:
https://apppi-ten.vercel.app

---

## Quem mexe em quê

Como todos trabalham no mesmo projeto Dart, vale combinar antes onde cada frente escreve.
A regra não é rígida — é para evitar duas pessoas editando o mesmo arquivo na mesma semana
e passar a tarde resolvendo conflito de merge.

### João Hélio e Cristiano · POO / Backend

```
lib/models/          entidades: Insumo, Funcionario, Talhao, Aplicacao, Maquinario
lib/services/        regras de negócio
lib/repositories/    acesso ao banco
lib/exceptions/      exceções próprias do domínio
test/                testes das regras
```

Sendo dois na mesma frente, dividam por entidade e não por camada — um pega Insumo de
ponta a ponta (model, service, repository), o outro pega Funcionário. Se dividirem por
camada, os dois esbarram no mesmo arquivo o tempo todo.

### Diogo · Modelagem de Dados / DBA

```
banco/schema.sql     estrutura das tabelas
banco/triggers.sql   auditoria e rastreabilidade
banco/seeds/         carga inicial com os dados da propriedade
docs/modelagem/      DER conceitual, lógico e físico
```

Você é o gargalo das duas primeiras semanas: POO e BI dependem do schema estar de pé.
Priorize fechar o modelo cedo. Depois disso, mudança de schema precisa ser avisada no
grupo antes de mergear — senão o pessoal dá pull e o código quebra sem motivo aparente.

### Joaquim · Lógica de Programação (Dart)

```
lib/logica/          algoritmos: consumo previsto x real, alerta de estoque mínimo,
                     alerta de vencimento, custo por ordem de serviço
docs/fluxograma/     percurso do dado, da entrada até o BI
```

Sua pasta é separada da POO de propósito, para a unidade de Lógica ter território próprio
na hora da validação. Você vai consumir os models do pessoal de POO — combine a interface
com eles antes de começar, não depois.

### Bruno e Samuel · Business Intelligence

```
bi/dashboard.pbix    o painel
bi/queries/          consultas usadas no Power Query
bi/documentacao/     KPIs escolhidos e justificativa
```

O `.pbix` é binário: **duas pessoas não podem editar ao mesmo tempo**, o Git não sabe
juntar. Combinem quem está com o arquivo, ou dividam em dois `.pbix` e juntem no fim.
E conectem no banco direto, não em CSV exportado — é o que prova a integração entre as
unidades, e é o que a banca vai testar.

### Todos

```
docs/sprints/        relatórios de progresso
docs/reunioes/       atas
README.md
```

---

## Estrutura do repositório

```
.
├── docs/
│   ├── anuencia/        termo assinado pela propriedade + comprovante de CNPJ ativo
│   ├── requisitos/      levantamento feito junto ao produtor
│   ├── modelagem/       modelo conceitual, lógico e físico
│   ├── fluxograma/      percurso do dado, da entrada até o BI
│   ├── sprints/         relatórios de progresso
│   └── reunioes/        atas das reuniões da equipe
├── lib/
│   ├── models/          entidades do domínio
│   ├── services/        regras de negócio
│   ├── repositories/    acesso ao banco
│   ├── exceptions/      exceções próprias do domínio
│   └── logica/          algoritmos de processamento e alertas
├── test/
├── banco/
│   ├── schema.sql
│   ├── triggers.sql     auditoria e rastreabilidade
│   └── seeds/           carga inicial a partir dos dados da propriedade
└── bi/
    ├── dashboard.pbix
    ├── queries/
    └── documentacao/
```

A separação entre `services/` e `repositories/` é proposital: a regra de negócio não
conhece o banco, e a persistência não decide nada. É o que permite testar as regras sem
subir infraestrutura.

---

## Como rodar

Requer Dart SDK 3.x.

```bash
dart pub get
dart run
```

Testes:

```bash
dart test
```

O acesso ao banco depende de variáveis de ambiente. Copie `.env.example` para `.env` e
preencha com os valores combinados pela equipe — **o `.env` não vai para o repositório**.

---

## Modelo de dados

O banco é relacional. A escolha está justificada em `docs/modelagem`, junto do diagrama
entidade-relacionamento e da normalização aplicada.

Duas decisões que atravessam o projeto inteiro:

**Rastreabilidade.** Toda alteração relevante é registrada por trigger em uma tabela de
histórico, com autor e horário. Nada é sobrescrito silenciosamente.

**Integridade.** Chaves estrangeiras, restrições e tipos adequados são definidos no
banco, não apenas na aplicação. O banco é a última linha de defesa contra dado
inconsistente.

---

## Business Intelligence

O Power BI se conecta ao mesmo banco usado pela aplicação — não a arquivos exportados à
parte. É isso que garante que o painel reflete o sistema, e não uma cópia que envelhece.

Os indicadores acompanhados e as escolhas de modelagem estão documentados em
`bi/documentacao`.

---

## Convenções de trabalho

- Uma branch por tarefa; nada entra direto na `main`.
- Commits em português, seguindo Conventional Commits (`feat:`, `fix:`, `docs:`).
- Toda mudança entra por Pull Request, com revisão de alguém de outra frente.
- Quem altera o schema avisa a equipe antes de mergear.
- Arquivos `.pbix` são binários e pesados: evite commits desnecessários.

---

## Beneficiário

O projeto é desenvolvido para uma propriedade rural com CNPJ ativo, mediante termo de
anuência assinado, arquivado em `docs/anuencia`.

Nenhum dado pessoal sensível de funcionários é armazenado — apenas nome, função e
matrícula, o mínimo necessário para identificar quem executou cada aplicação.

---

## Equipe

Bruno · Cristiano · Diogo · João Hélio · Joaquim · Samuel

Ciência da Computação · UNIFEOB · São João da Boa Vista, SP
2º semestre de 2026
