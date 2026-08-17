# Decisões Pendentes de Modelagem

Pauta para consulta aos professores orientadores — Sistema de Gestão de Fazenda, PI UNIFEOB

| Campo | Conteúdo |
|---|---|
| Data | 17/08/2026 |
| Autor | João Hélio |
| Base | `1_diogo_resposta.md` — Levantamento de Requisitos junto ao Produtor |
| Prazo de decisão | 06/09/2026 — congelamento do schema |
| Unidades afetadas | Modelagem de Dados, POO/Backend, Dart/Lógica, Business Intelligence |

---

## Por que este documento existe

O levantamento junto ao produtor está completo: as 16 perguntas foram respondidas e há evidência física de duas fontes — a ficha do Controle de Atividades Agrícolas e o mapa de área com hectares por talhão.

O que resta não são perguntas ao produtor. São decisões de projeto que o time precisa tomar, e que em parte extrapolam o que um aluno de modelagem pode resolver sozinho, porque envolvem escopo do sistema e critério de avaliação do PI.

**Dependência estrutural:** a Modelagem de Dados tem um único integrante, e as frentes de POO/Backend e Business Intelligence dependem do schema. Enquanto estas decisões não forem tomadas, elas são o caminho crítico do projeto inteiro.

---

## Resumo das decisões

| # | Decisão | Afeta | Urgência |
|---|---|---|---|
| D1 | Como tratar o volume de calda que não se decompõe por talhão nem por produto | Modelagem, Backend, BI | Antes de 06/09 |
| D2 | Tornar obrigatórios no sistema campos que a fazenda nunca preenche no papel | Modelagem, Backend | Antes de 06/09 |
| D3 | Incluir ou não controle de estoque, que hoje não existe na propriedade | Escopo geral | Antes de 06/09 |
| D4 | Como sustentar os indicadores de BI sem histórico com a granularidade necessária | BI, Modelagem | Antes de 12/09 |
| D5 | Identificação de funcionário: matrícula gerada pelo sistema ou apenas nome | Modelagem, Backend | Antes de 06/09 |
| D6 | Representar ou não as áreas não produtivas — Reserva Legal, APP, nascentes | Modelagem, BI | Antes de 06/09 |
| D7 | Qual hectare entra no denominador do custo por hectare | BI | Antes de 12/09 |
| D8 | Visibilidade do repositório diante de dados pessoais e comerciais de terceiros | Geral | **Imediata** |
| D9 | Quem transcreve os mapas impressos em dado estruturado | Coleta, Modelagem, Backend | Antes de 06/09 |

---

## D1. Volume de calda sem decomposição

**Situação.** O Controle de Atividades Agrícolas registra um volume único de calda — por exemplo 1900 litros. Esse número engloba várias marcas de produto misturadas no tanque e, algumas vezes, mais de um talhão. Não há divisão registrada em nenhuma das duas dimensões. Além disso, calda é a mistura com água, não a quantidade de produto: a dose, que permitiria reconstituir o produto, existe como campo impresso na ficha e nunca é preenchida.

No dado histórico a decomposição é irrecuperável. Não é questão de aproximação: a informação nunca foi registrada.

**Opções.**

- **A** — A tabela de ligação guarda apenas o volume agregado da aplicação. Fiel ao dado real, mas nenhum indicador por talhão é calculável.
- **B** — O sistema passa a exigir volume por talhão e por produto no cadastro de novas aplicações. A coluna existe desde a carga inicial e fica nula no histórico.
- **C** — Rateio proporcional à área do talhão, aplicado ao histórico. Produz número calculável, mas inventado.

**Recomendação para discussão.** A opção C fabrica dado que não existe e compromete a auditabilidade do sistema. A opção B é a que transforma a limitação em entrega: o ganho do projeto passa a ser justamente registrar o que o papel não registra. Se C for adotada por qualquer motivo, o valor rateado precisa ficar em coluna separada, marcada como estimativa, nunca misturado ao valor declarado.

**Pergunta ao professor.** É aceitável, para fins de avaliação do PI, que o sistema entregue estrutura de dados que o histórico da propriedade não consegue preencher — ou espera-se que o sistema opere sobre o dado existente?

---

## D2. Campos obrigatórios que a fazenda nunca preenche

**Situação.** A ficha impressa tem campos de Volume de Calda por talhão, Horímetro inicial e final, Dose, Tanque, Implemento e Volume do Tanque. O produtor confirmou que deixá-los em branco é o padrão, não exceção da ficha analisada. O formulário foi desenhado para capturar esses dados; a prática de preenchimento é que não os usa.

**Opções.**

- **A** — Campos opcionais no sistema. Adoção fácil, mas o sistema reproduz a lacuna do papel e não entrega nada de novo.
- **B** — Campos obrigatórios. O sistema força a captura, e é aí que reside o ganho real do projeto — ao custo de mudar a rotina de quem preenche.
- **C** — Obrigatoriedade seletiva: apenas volume por talhão e por produto, que são os que sustentam indicador. Os demais ficam opcionais.

**Consideração.** Campo que ninguém preencheu em papel durante anos tende a não ser preenchido no aplicativo. Obrigatoriedade sem justificativa clara para o operador gera preenchimento com valor qualquer, o que é pior que campo vazio.

**Pergunta ao professor.** O PI avalia a aderência do sistema à realidade do beneficiário ou a completude do modelo? As duas coisas apontam para respostas opostas aqui.

---

## D3. Controle de estoque

**Situação.** A propriedade não controla estoque. Não anota nada na chegada do insumo, não registra retirada, não diferencia lote, não tem sobra e não registra perda. As notas fiscais são a única informação sobre insumos. Consequentemente, as entidades Estoque, MovimentoEstoque e Perda foram descartadas do modelo por ausência de dado de origem.

**Opções.**

- **A** — Manter fora do escopo. O sistema cobre apenas o que a fazenda registra hoje: aplicação.
- **B** — Incluir como funcionalidade nova, declarada como tal. Amplia o escopo e o esforço das frentes de Backend e Modelagem.

**Consideração.** A opção B tem apelo acadêmico — mais entidades, mais relacionamentos, mais espaço para demonstrar normalização e regras de negócio. Mas cria um módulo sem usuário: ninguém na fazenda registra entrada de insumo hoje, e nada indica que passariam a registrar.

**Pergunta ao professor.** Ampliar o escopo para além do que o beneficiário utiliza é valorizado como iniciativa, ou penalizado como perda de foco no problema real?

---

## D4. Indicadores de BI sem histórico adequado

**Situação.** O indicador previsto de custo por hectare por talhão exige três números: quantidade de cada produto, preço do produto e hectares do talhão.

| Componente | Disponível | Origem |
|---|---|---|
| Preço do produto | Sim | Notas fiscais |
| Hectares do talhão | Sim | Mapas por área |
| Quantidade por produto | **Não** | Nunca registrada |
| Quantidade por talhão | **Não** | Nunca registrada |

Dois dos quatro componentes não existem no histórico. O indicador só é calculável sobre dado que o sistema ainda vai coletar — e a entrega é 01/11/2026, sem safra registrada até lá em volume suficiente.

**Opções.**

- **A** — Seeds sintéticos gerados no banco, com a regra de geração documentada e a natureza sintética declarada em texto. O arquivo `.pbix` continua conectado ao banco do projeto, atendendo ao Definition of Done da frente de BI.
- **B** — Trocar os indicadores por outros que o histórico sustente: número de aplicações por talhão, produtos mais utilizados, distribuição de mão de obra, frequência de operações.
- **C** — Combinar as duas: indicadores reais onde há dado, indicadores demonstrativos sobre seeds, com separação visual explícita.

**Alerta de prazo.** Esta decisão precisa chegar à frente de BI logo após o congelamento do schema. Descobrir em outubro que os indicadores planejados não são calculáveis inviabiliza a entrega do Power BI.

**Pergunta ao professor.** Painel construído sobre dados sintéticos declarados atende ao requisito de "Power BI conectado ao banco, com KPIs e interpretação crítica", ou a interpretação crítica precisa incidir sobre dado real do beneficiário?

---

## D5. Identificação de funcionário

**Situação.** A fazenda identifica funcionários apenas pelo primeiro nome. Não existe matrícula, crachá ou numeração. A ficha lista os participantes de uma aplicação em bloco, sem indicar quem fez o quê, e traz separadamente um campo de assinatura.

As Regras de Tarefas do projeto determinam que o sistema armazene apenas nome, função e matrícula — sem CPF, endereço ou salário, por se tratar de dado pessoal de terceiros.

**Questões abertas.**

- A matrícula é gerada pelo sistema, já que não existe na fazenda? Em caso afirmativo, ela é chave interna sem correspondência no mundo real.
- Como tratar homônimos na carga inicial, se houver? Ainda não verificado.
- A ligação Aplicação–Funcionário precisa de atributo de papel, para separar quem operou de quem assinou o registro?

**Pergunta ao professor.** Há orientação da instituição sobre tratamento de dado pessoal de terceiros em projeto acadêmico, além do termo de anuência já assinado pela propriedade?

---

## D6. Áreas não produtivas

**Situação.** O mapa da área identifica, dentro do mesmo perímetro dos talhões, Reserva Legal, APP, nascentes e curso d'água. Essas áreas não recebem aplicação de insumo, mas ocupam hectares e têm relevância legal e ambiental.

**Opções.**

- **A** — Fora do modelo. O sistema representa apenas talhões produtivos.
- **B** — Representadas como tipo de talhão, com um atributo que distingue produtivo de não produtivo. Custo baixo, e permite que o mapa completo seja reproduzido no sistema.
- **C** — Entidade separada, com atributos próprios de licenciamento ambiental. Escopo consideravelmente maior.

**Observação de escala.** A propriedade tem várias áreas, cada uma com seu mapa e suas faixas de reserva e APP. A decisão se multiplica por todas elas.

**Consideração.** A opção B é barata e evita um erro silencioso: se o denominador do custo por hectare usar a área total do perímetro em vez da área de café, o indicador sai errado sem que nada acuse. Ver D7.

---

## D7. Base do hectare no cálculo de custo

**Situação.** Os hectares anotados no mapa — 5,4 ha, 6,5 ha, 7,00 ha e assim por diante — podem se referir ao café efetivamente plantado ou ao polígono demarcado, que inclui carreadores e faixas não plantadas. Ainda não foi confirmado com o produtor.

**Impacto.** Custo por hectare calculado sobre polígono é menor que o calculado sobre área plantada. A diferença não é detectável olhando o resultado — o número parece plausível nos dois casos. Qualquer conclusão do BI herda o erro silenciosamente.

**Encaminhamento.** Confirmar com o produtor e registrar a definição no dicionário de dados, junto ao atributo de área. Se a resposta for ambígua, adotar uma definição e declará-la explicitamente no painel.

---

## D8. Visibilidade do repositório

**Situação.** As evidências coletadas contêm dados de terceiros: razão social da propriedade, número de identificação de máquinas, nomes de funcionários e, nas notas fiscais, valores comerciais de compra de insumos.

As Regras de Tarefas do projeto determinam, na seção 11, que termo de anuência, comprovante de CNPJ, dados de custo e dados pessoais de funcionários não sejam versionados em repositório público.

**Encaminhamento.**

- Confirmar a visibilidade atual do repositório do projeto.
- Se público, tornar privado e adicionar o professor como colaborador — resolve o problema sem perda de auditabilidade.
- Configurar exclusão das pastas de amostras no controle de versão, com arquivo de referência indicando onde o material físico está guardado.
- Verificar se alguma imagem com dado sensível já entrou no histórico de commits. Material commitado em repositório público permanece recuperável mesmo após remoção.

**Urgência.** Esta é a única decisão da lista que não pode aguardar a conversa com os professores. As fotos já foram tiradas e a coleta continua diariamente.

---

## D9. Responsabilidade pela transcrição dos mapas

**Situação.** Os talhões existem hoje apenas em mapas impressos, um por área, com hectares manuscritos. Transformar isso em dado no banco envolve três etapas distintas, que pertencem a unidades acadêmicas diferentes e não podem ser confundidas com uma só tarefa.

| Etapa | Unidade | Produto |
|---|---|---|
| Transcrever os mapas em lista estruturada | Levantamento / coleta | Planilha ou CSV com área, talhão e hectares |
| Modelar e popular o banco | Modelagem de Dados | Tabelas `area` e `talhao`; script de carga versionado |
| Ler e gravar esses dados na aplicação | POO / Backend | Repositórios, serviços e cadastro |

**Risco.** A primeira etapa não pertence a nenhuma unidade de forma óbvia e, por isso, tende a ficar sem dono. Foto de mapa não é dado — alguém precisa digitar. Enquanto essa lista não existir, a Modelagem não tem o que carregar e o Backend não tem o que exibir.

**Encaminhamento.** Atribuir a transcrição a uma pessoa nomeada, com prazo, e tratar o arquivo resultante como entregável auditável no repositório — não como material de apoio.

---

## O que já está decidido

Para que a conversa não retome pontos fechados, estas decisões já foram tomadas com base em evidência e não estão em aberto:

| Decisão | Fundamento |
|---|---|
| Cultura fora do modelo | Monocultura de café confirmada pelo produtor |
| Lote fora do modelo | A propriedade não diferencia lote, fornecedor ou validade |
| Área como entidade | Confirmado que a propriedade tem várias áreas; o nome do talhão é único apenas dentro da área, e a chave natural é composta |
| Aplicação N:N Talhão | Lançamento real com dois talhões somados no mesmo registro |
| Aplicação N:N Insumo | Um volume de calda engloba várias marcas |
| Insumo com nome, marca e tipo | Nome e marca vêm da ficha; tipo vem da nota fiscal |
