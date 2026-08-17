# Levantamento de Requisitos junto ao Produtor

Sistema de Gestão de Fazenda — Projeto Integrador UNIFEOB

| Campo | Conteúdo |
|---|---|
| Autor da coleta | João Hélio |
| Questionário elaborado por | Diogo — unidade de Modelagem de Dados |
| Revisor | Diogo |
| Coleta | 17/08/2026 — rodada 1, com complementos verbais do mesmo dia |
| Requisito atendido | Levantamento de requisitos junto ao produtor / DER conceitual |
| Evidências anexas | Ficha do Controle de Atividades Agrícolas (03/02/2026); mapa da Área Bela Vista |
| Situação | Coleta contínua — o autor tem acesso diário à propriedade |

> **Aviso de tratamento de dados.** Este documento não contém razão social, CNPJ, nomes de funcionários nem valores comerciais. As evidências físicas fotografadas contêm esses dados e ficam arquivadas fora do Git, conforme a seção 11 das Regras de Tarefas e Revisão.

---

## 1. Nota metodológica

O questionário original tem 16 perguntas; o produtor enviou 15 respostas. A partir da pergunta 2 as respostas ficaram deslocadas uma posição: a resposta enviada como "2" responde à pergunta 3, e assim por diante. O pareamento abaixo foi corrigido por conteúdo, não por numeração.

A pergunta 2 não recebeu resposta escrita do produtor. Foi respondida posteriormente pelo mapa da Área Bela Vista, entregue em 17/08.

Três respostas foram corrigidas ou complementadas verbalmente na mesma data, e a versão corrigida é a que consta abaixo: divisão de volume entre talhões, registro de marca do insumo, e cultura plantada.

---

## 2. Bloco A — Talhão

### P1. Como vocês dividem as áreas da fazenda e como chamam cada pedaço de terra?

**Resposta:** Está anotado tudo do talhão: nome, região e hectares.

*__Leitura para o modelo:__ a propriedade é dividida em áreas, e cada área contém talhões. O nome completo é composto: "Bela Vista Café Velho" significa área Bela Vista, talhão Café Velho. Existe mais de uma área. Portanto Talhão não é entidade raiz — precisa de vínculo com Área, e o nome do talhão é único apenas dentro da sua área.*

### P2. Onde ficam anotados o nome, o número, o tamanho e a localização de cada talhão?

**Resposta:** Sem resposta escrita. Respondida pela evidência: existe mapa impresso por área, com imagem de satélite, perímetro demarcado, marcador por talhão e lista de hectares escrita à mão.

*__Leitura para o modelo:__ a fonte da carga inicial de Talhão é o conjunto de mapas impressos, um por área. Não há planilha nem sistema.*

### P3. Como vocês registram as culturas e aplicações realizadas em cada talhão?

**Resposta:** Aplicações: sim, pelo Controle de Atividades Agrícolas. Culturas: não são registradas — a propriedade é monocultura de café.

*__Leitura para o modelo:__ a entidade Cultura foi descartada: valor constante não segmenta nada e não sustenta indicador. Decisão registrada, não omissão.*

---

## 3. Bloco B — Insumo

### P4. Quais tipos de insumos são utilizados e como identificam cada produto?

**Resposta:** O Controle de Atividades Agrícolas anota o nome do produto e a marca. O tipo de insumo (herbicida, fungicida, adubo) não é anotado no controle — essa informação só existe nas notas fiscais.

*__Leitura para o modelo:__ Insumo tem `nome` e `marca` vindos da ficha, e `tipo` vindo da nota fiscal. Três atributos com duas origens distintas. A carga inicial precisa cruzar as duas fontes.*

### P5. Quais informações são anotadas quando um insumo chega à fazenda?

**Resposta:** Nenhuma informação é anotada na chegada.

*__Leitura para o modelo:__ não existe evento de entrada. Recebimento e NotaEntrada não têm dado de origem.*

### P6. Como diferenciam produtos iguais com lotes, fornecedores ou validades diferentes?

**Resposta:** Não diferenciam produtos de lotes distintos.

*__Leitura para o modelo:__ a entidade Lote foi descartada. Não há rastreabilidade por lote, fornecedor ou validade.*

### P7. Onde são registradas entradas, retiradas, sobras e perdas de cada insumo?

**Resposta:** Nunca sobra. As notas fiscais são a única informação sobre insumos. Não há controle de estoque. Perda ocorre apenas quando um insumo é aplicado e chove logo em seguida — e mesmo assim não é registrada.

*__Leitura para o modelo:__ Estoque, MovimentoEstoque e Perda foram descartados por ausência de dado de origem. Se o sistema passar a controlar estoque, isso é funcionalidade nova e precisa ser declarada como tal — não é digitalização de algo existente. Ver Decisão D3.*

---

## 4. Bloco C — Aplicação

### P8. Como registram uma aplicação de insumo feita na lavoura?

**Resposta:** Pelo Controle de Atividades Agrícolas. Os funcionários informam quantos litros ou quilos aplicaram nos talhões, podendo haver mais de um talhão no mesmo registro.

*__Leitura para o modelo:__ Aplicação é a entidade central, e o dado é auto-declarado pelo operador, não medido.*

### P9. Como ficam registradas quantidade prevista, retirada e aplicada?

**Resposta:** Não há registro de quantidade prevista.

*__Leitura para o modelo:__ o trio previsto / retirado / aplicado se reduz a um único valor. Os campos impressos de Dose e Tanque existem na ficha, mas ficam sempre em branco.*

### P10. Como anotam em qual talhão o produto foi aplicado e quem realizou o trabalho?

**Resposta:** Anotado no Controle de Atividades Agrícolas. O controle registra talhões, nome e marca do produto, nomes dos funcionários que aplicaram, trator usado e quantidade de litros aplicada.

*__Leitura para o modelo:__ confirmado pela ficha: há colunas de Talhão, campo de Produto, campo de Trator e bloco de colaboradores envolvidos.*

### P11. Como são registradas sobras, perdas ou descartes depois de uma aplicação?

**Resposta:** Não há perdas nem descartes por enquanto, e não são anotados.

*__Leitura para o modelo:__ sem status de aplicação e sem entidade de perda no dado histórico.*

### P12. Como anotam uma aplicação que usa vários insumos ou atende mais de um talhão?

**Resposta:** Anota-se um volume único de calda — por exemplo 1900 litros — que engloba várias marcas de produto e, algumas vezes, mais de um talhão. Não há divisão registrada nem por talhão nem por marca. Perguntado diretamente se é possível saber quanto foi aplicado em cada talhão, o produtor respondeu que não.

*__Leitura para o modelo:__ este é o ponto crítico do levantamento. O volume é ambíguo em duas dimensões simultâneas — talhão e produto — e é volume de calda, ou seja, a mistura no tanque, não a quantidade de produto. No dado histórico a decomposição é irrecuperável. A ficha impressa possui coluna de Volume de Calda por talhão, mas ela nunca é preenchida: a limitação é de prática de preenchimento, não de formulário. Ver Decisões D1 e D2.*

---

## 5. Bloco D — Funcionário

### P13. Como cada funcionário é identificado nos registros da fazenda?

**Resposta:** Pelo nome.

*__Leitura para o modelo:__ não existe matrícula na fazenda. Se o sistema adotar matrícula, ela é gerada pelo sistema, não importada. Primeiro nome isolado não serve como chave. Ver Decisão D5.*

### P14. Quais informações são anotadas sobre os funcionários que retiram ou aplicam insumos?

**Resposta:** Apenas nome e hora de chegada e saída.

*__Leitura para o modelo:__ conforme a seção 11 das Regras de Tarefas, o sistema armazena apenas nome, função e matrícula. Sem CPF, endereço ou salário.*

### P15. Como fica registrado qual funcionário retirou um produto do estoque?

**Resposta:** Não existe esse registro.

*__Leitura para o modelo:__ coerente com a P7 — sem estoque, não há retirada.*

### P16. Como anotam os funcionários que participaram de uma mesma aplicação?

**Resposta:** O Controle de Atividades Agrícolas traz o nome de todos os funcionários que participaram da atividade.

*__Leitura para o modelo:__ a ligação Aplicação–Funcionário é N:N sem papel: a ficha lista os participantes em bloco, sem indicar quem fez o quê. Há também um campo de assinatura, que é papel distinto de "participou".*

---

## 6. Evidências coletadas

### 6.1 Ficha do Controle de Atividades Agrícolas

Ficha preenchida em 03/02/2026, fotografada em 17/08/2026. O produtor confirmou que o padrão de preenchimento abaixo é o habitual, não uma exceção daquela ficha.

| Campo impresso | Preenchido | Observação |
|---|---|---|
| Fazenda | Sim | Nome da área |
| Trator | Sim | Identificado por número |
| Implemento | Não | Sempre em branco |
| Data | Sim | — |
| Volume do tanque | Não | Sempre em branco |
| Produto | Sim | Nome e marca |
| Dose / Tanque | Não | Sempre em branco |
| Operação (3 colunas) | Parcial | 1 de 3 colunas preenchida |
| Talhão (3 colunas) | Sim | Pode conter mais de um talhão por coluna |
| Horímetro inicial / final / total | Não | Sempre em branco |
| Volume de calda por talhão | Não | Sempre em branco — campo existe e não é usado |
| Abastecimento (litros) | Sim | Valor único, agregado |
| Colaboradores envolvidos | Sim | Lista de nomes, sem papel individual |
| Assinatura | Sim | Um nome |

### 6.2 Mapas por área

**A propriedade possui várias áreas, e cada uma tem seu próprio mapa impresso.** O mapa da Área Bela Vista, reproduzido abaixo, é uma amostra do padrão: impressão de imagem de satélite datada de 2021, com perímetro demarcado, marcador por talhão e lista de hectares manuscrita ao lado. Os mapas das demais áreas seguem o mesmo formato e serão coletados na sequência.

*__Consequência para a modelagem:__ como existe mais de uma área, Área é entidade obrigatória no modelo, e não um atributo de Talhão. O nome do talhão é único apenas dentro da sua área — nomes como "Casa" ou "Café Velho" podem se repetir em áreas diferentes sem conflito. A chave natural de Talhão é, portanto, composta.*

A ficha do Controle de Atividades Agrícolas confirma o padrão pelo lado oposto: o campo "Fazenda" traz o nome da área, e a coluna de talhão registrou "Inglês (51 + Chicão)" — área Inglês, talhões 51 e Chicão no mesmo lançamento.

**Amostra — Área Bela Vista**

| Talhão | Área |
|---|---|
| 7 A (Cima) | 5,4 ha |
| 7 B (Baixo) | 5,25 ha |
| Caixa D'água | 6,5 ha |
| Tambor | 4,8 ha |
| Casa | 7,00 ha |
| Café Velho | Sem área anotada — pendente de coleta |

O mapa também identifica áreas não produtivas dentro do perímetro: Reserva Legal, APP, nascentes e curso d'água. Elas não recebem aplicação. Ver Decisão D6.

---

## 7. Síntese — impacto no domínio

### 7.1 Entidades descartadas, com justificativa

| Entidade | Motivo do descarte |
|---|---|
| Cultura | Monocultura de café; valor constante, não segmenta nada |
| Lote | A fazenda não diferencia lote, fornecedor ou validade |
| Estoque / MovimentoEstoque | Não existe controle de estoque na propriedade |
| Perda / Descarte | Não ocorre no registro atual e não é anotado |
| QuantidadePrevista | Não é registrada; campos de Dose e Tanque ficam em branco |

### 7.2 Entidades confirmadas e reveladas

| Entidade | Origem |
|---|---|
| Área | Mapa e composição do nome do talhão |
| Talhão | Questionário e mapa |
| Insumo | Ficha (nome, marca) e nota fiscal (tipo) |
| Aplicação | Ficha do Controle de Atividades Agrícolas |
| Funcionário | Ficha, apenas primeiro nome |
| Trator | Ficha — não estava no questionário original |
| Implemento | Campo impresso na ficha, nunca preenchido |
| Operação | Coluna da ficha |
| Abastecimento | Campo da ficha, em litros |

### 7.3 Relacionamentos com atenção

- **Área 1:N Talhão** — nome do talhão é único dentro da área, não globalmente.
- **Aplicação N:N Talhão** — comprovado por lançamento real contendo dois talhões somados.
- **Aplicação N:N Insumo** — um volume de calda engloba várias marcas.
- **Aplicação N:N Funcionário**, sem papel — a ficha lista participantes em bloco.

Nos três relacionamentos N:N a tabela de ligação precisa da coluna de quantidade, ainda que ela fique nula na carga do histórico. O dado novo, capturado pelo sistema, é que a preencherá. Isso deve constar do dicionário de dados, sob risco de a coluna vazia ser interpretada como defeito meses depois.

---

## 8. Pendências de coleta

Itens que não bloqueiam o congelamento do schema, mas precisam de resposta antes da carga de dados:

- Mapas das demais áreas da propriedade — o de Bela Vista é a única amostra coletada até aqui.
- Área em hectares do talhão Bela Vista Café Velho, que ficou sem número no mapa.
- Se o hectare anotado corresponde ao café plantado ou ao polígono inteiro, incluindo APP e reserva.
- Se já houve dois funcionários com o mesmo primeiro nome, e como foram distinguidos.
- Quantas fichas são preenchidas por mês e por quanto tempo ficam arquivadas.
- Formato e acesso às notas fiscais, e se o nome do produto na nota coincide com o escrito na ficha.
- Lista de tratores e implementos, se houver registro.
