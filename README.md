# Caderno temático — O valor do dinheiro no tempo

Estudo com NotebookLM a partir de fontes oficiais abertas. Entrega: curadoria, engenharia de prompts (com cicatrizes) e miniguia de revisão.

Isto **não** é recomendação de investimento. Os números oficiais de exemplo não são projeção da vida de ninguém.

---

## 1. Contexto e objetivos

### Assunto escolhido

O caderno trata de um tema financeiro **introdutório**: **inflação, juros compostos e o primeiro investimento seguro**.

A pergunta que organiza o material não é “onde investir agora”. É:

> Por que o mesmo real de hoje não compra a mesma coisa amanhã — e o que isso muda na decisão de poupar, endividar-se ou emprestar ao governo?

Escolhi esse recorte porque ele cruza três camadas que costumam aparecer soltas em conteúdo de internet: a conta (juros no tempo), o contexto (Selic e poder de compra) e o comportamento (por que a gente adia mesmo entendendo a conta). Sem as três, o caderno vira dica de produto.

### Objetivos de estudo

Ao terminar o caderno, o objetivo é conseguir o seguinte **sem abrir a IA**:

1. Distinguir **inflação**, **IPCA**, **meta de inflação** e **Selic**.
2. Recalcular, no papel ou na [Calculadora do Cidadão](https://www.bcb.gov.br/meubc/calculadoradocidadao), a diferença entre juros simples e compostos no exemplo oficial de R$ 1.000 a 5% ao mês por 6 meses.
3. Explicar o exemplo Helena × Marta: por que começar dez anos antes muda quanto precisa sair do bolso.
4. Separar o **ato de poupar** da **caderneta de poupança**.
5. Ligar um objetivo de vida a um tipo de título (reserva → Tesouro Selic; longo prazo com proteção de poder de compra → Tesouro IPCA+) e dizer o que acontece se vender antes do vencimento.
6. Nomear dois vieses que sabotam a poupança (crescimento exponencial e viés do presente) e uma tática concreta contra cada um.
7. Dizer o que as fontes **não** autorizam: recomendação personalizada, timing de mercado, “é hora de comprar”.

Perguntas estratégicas (o que eu queria *pensar*, não o que eu queria *gerar*):

1. Se inflação é aumento contínuo e generalizado de preços, o que significa rentabilidade real?
2. Por que o Banco Central trata a Selic como instrumento, e não como “o rendimento da poupança”?
3. No exemplo Helena × Marta, o mistério é a taxa ou o tempo de capitalização?
4. Por que a CVM diz que calcular juros compostos “no olho”, em linha reta, faz a pessoa poupar menos e se endividar mais?
5. Reserva pede liquidez e pouca oscilação. Longo prazo pede proteção contra inflação. Qual título cada fonte aponta — e o que nenhuma delas garante na venda antecipada?
6. O caderno do BC e o volume da CVM (2016) discordam, ou só falam camadas diferentes do mesmo problema?
7. Onde a IA costuma inventar: taxa do dia, “melhor título agora”, isenção que mudou, conselho de quanto guardar?

---

## 2. Curadoria de fontes

Critério: órgão público com mandato de educação, regulação ou transparência; texto ou PDF aberto; linguagem acessível a quem está começando. Ficaram de fora blogs de corretora, ranking de rentabilidade do dia e qualquer fonte que dê ordem de compra.

Cópias locais para upload no NotebookLM: pasta [`fontes/`](fontes/).

| # | Fonte | Por que entrou | Link aberto | Arquivo no caderno |
|---|---|---|---|---|
| 1 | Banco Central — *Caderno de Educação Financeira* | Juros simples vs. compostos, Helena × Marta, poupança vs. caderneta, liquidez e risco | [PDF](https://www.bcb.gov.br/content/cidadaniafinanceira/documentos_cidadania/Cuidando_do_seu_dinheiro_Gestao_de_Financas_Pessoais/caderno_cidadania_financeira.pdf) | `fontes/01-bcb-caderno-educacao-financeira.pdf` |
| 2 | CVM — *Vieses do Poupador*, vol. 2 (2016) | Por que a conta não vira hábito: crescimento exponencial, presente, otimismo, status quo | [PDF](https://www.gov.br/investidor/pt-br/educacional/publicacoes-educacionais/cvm-comportamental/volume-2-vieses-do-poupador.pdf) | `fontes/02-cvm-vieses-do-poupador.pdf` |
| 3 | Banco Central — política monetária + boxes do Relatório de Política Monetária (jun/2026) | Selic, meta de 3% no IPCA, intervalo de 1,5% a 4,5%, quem a inflação alta acerta primeiro | [Página](https://www.bcb.gov.br/controleinflacao) · [PDF do RPM](https://www.bcb.gov.br/content/ri/relatorioinflacao/202606/rpm202606p.pdf) | [`fontes/03-bcb-politica-monetaria.md`](fontes/03-bcb-politica-monetaria.md) |
| 4 | Tesouro Nacional — Tesouro Transparente, página Tesouro Direto | O que é o programa, tipos de rentabilidade, liquidez diária, menor risco de mercado | [Página](https://www.tesourotransparente.gov.br/temas/divida-publica-federal/tesouro-direto) | [`fontes/04-tesouro-direto.md`](fontes/04-tesouro-direto.md) |
| 5 | Portal do Investidor (gov.br) — *Títulos Públicos* | Tesouro Selic, prefixado e IPCA+ amarrados a objetivo; marcação a mercado | [Página](https://www.gov.br/investidor/pt-br/investir/tipos-de-investimentos/titulos-publicos) | [`fontes/05-portal-investidor-titulos-publicos.md`](fontes/05-portal-investidor-titulos-publicos.md) |

Como subir no NotebookLM: [`fontes/COMO-SUBIR.md`](fontes/COMO-SUBIR.md).

---

## 3. Engenharia de prompts e cicatrizes

Método: a mesma pergunta em desenhos diferentes. Registrar resposta, referência e o que quebrou. A regra que sobrou de todos os testes: **toda pergunta operacional termina com “o que as fontes não cobrem”.**

### 3.1 Perguntas estratégicas → prompts testados

#### Prompt A — frouxo

```
Me explica juros.
```

**Resposta obtida.** Texto genérico de educação financeira, sem o exemplo oficial dos R$ 1.000, sem separar simples de composto, sem citar o Banco Central.

**Referência.** Nenhuma auditável.

**Cicatriz.** Prompt curto demais entrega “aula de internet”. Não dá para saber se a IA leu o PDF ou só completou o padrão. Descartei esse desenho para estudo.

#### Prompt B — ancorado (definição + conta)

```
Use apenas as fontes deste caderno. Defina juros simples e juros compostos.
Reproduza o exemplo oficial de R$ 1.000 a 5% ao mês por 6 meses nos dois regimes.
Diga qual é a regra na vida real. Cite a fonte e o trecho.
```

**Resposta obtida.** Simples incide só sobre o principal; compostos incorporam juros ao saldo. Exemplo do Caderno do BC: simples → R$ 1.300; composto → R$ 1.340,10 (1.050 → 1.102,50 → 1.157,63 → 1.215,51 → 1.276,28 → 1.340,10). Na vida real, o composto é a regra — aplicações e dívidas.

**Referência.** BC, *Caderno de Educação Financeira*, módulo de crédito, “Poder dos juros no tempo”.

**Cicatriz.** Sem “reproduza o exemplo oficial”, a IA arredondava ou inventava outro principal (R$ 100, R$ 10.000). Exigir o trecho forçou a conta certa.

#### Prompt C — comparativo (duas fontes)

```
Compare o exemplo Helena e Marta (Banco Central) com o viés do crescimento
exponencial (CVM). O que uma fonte calcula e a outra explica? Não invente números.
```

**Resposta obtida.** Helena tira R$ 18 mil do bolso e chega perto de R$ 149 mil aos 60; Marta tira R$ 54 mil para saldo semelhante porque começou dez anos depois. A CVM explica o erro: quem lineariza o composto subestima o ganho de poupar cedo e o custo da dívida.

**Referências.** BC, exemplos Helena/Marta; CVM, cap. 3, *Viés do Crescimento Exponencial*.

**Cicatriz.** Sem “não invente números”, a IA “atualizava” Helena com inflação ou misturava 0,5% ao mês com Selic do dia. O comparativo só funciona **depois** do prompt ancorado. Costurar fontes cedo demais vira ensaio, não citação.

#### Prompt D — aplicação (produto × objetivo)

```
Com base só nestas fontes, qual título público as páginas oficiais associam
à reserva de emergência e qual ao longo prazo com proteção contra inflação?
O que acontece se eu vender antes do vencimento? Liste o que as fontes não dizem.
```

**Resposta obtida.** Tesouro Selic → reserva (pouca oscilação, segue a Selic). Tesouro IPCA+ → longo prazo, IPCA + taxa fixa, protege poder de compra **se levado ao vencimento**. Marcação a mercado: o extrato pode ficar abaixo do esperado; a rentabilidade contratada vale para quem carrega até o fim.

**O que as fontes não dizem.** Qual título comprar hoje, taxa da tela, se “está caro”, quanto da renda destinar, se Tesouro Reserva já está liberado para todo mundo (o Portal marca fase de testes).

**Referências.** Portal do Investidor, *Títulos Públicos*; Tesouro Transparente, resumo do programa; Caderno do BC, risco de títulos públicos até o vencimento.

**Cicatriz.** Sem a última frase, a IA recomendava “comece pelo Selic agora” — conselho que nenhuma fonte dá. O Portal cita Tesouro Reserva em teste; um prompt do tipo “quais títulos existem?” tratou o produto como disponível. Precisei acrescentar: *se a fonte marcar incerteza, preserve a incerteza*.

#### Prompt E — crítico (o que falta)

```
Onde estas cinco fontes são insuficientes para uma decisão real de investimento?
Responda em lista. Proíba conselho.
```

**Resposta obtida.** Não há perfil do leitor, horizonte pessoal, IR efetivo da operação, taxa da instituição, FGC vs. risco soberano lado a lado com CDB, nem dado de mercado do dia. A CVM é de 2016 (vieses estáveis; produtos e alíquotas, não). O exercício Helena/Marta desconsidera inflação. Nenhuma fonte substitui simulador oficial + lâmina do título.

**Cicatriz.** Sem “proíba conselho”, a IA encerrava com “ainda assim, o Tesouro é o melhor ponto de partida”. O prompt crítico precisa bloquear o fecho comercial.

### 3.2 Tabela das variações

| Desenho | Risco | Quando usar |
|---|---|---|
| Frouxo (“me explica juros”) | Alucinação, tom de guru | Não usar |
| Ancorado (exemplo + trecho) | Baixo, se exigir citação | Definir conceito |
| Comparativo (BC × CVM) | Médio — costura demais | Só depois do ancorado |
| Aplicação (objetivo → título) | Alto se pedir “o que eu faço” | Sempre com “o que não dizem” |
| Crítico (insuficiência) | Baixo | Fechar toda sessão |

### 3.3 Troubleshooting — o que travou e o que mudou no prompt

| Dificuldade | O que acontecia | Ajuste que funcionou |
|---|---|---|
| Prompt curto | Resposta correta “no clima”, sem fonte | Travar: “use apenas as fontes” + “cite o trecho” |
| Conta sem âncora | Números redondos inventados | Pedir o exemplo oficial (R$ 1.000 / Helena) |
| Duas fontes cedo demais | Ensaio misturando Selic, IPCA e viés | Comparar só depois da definição isolada |
| “O que eu faço?” | A IA vira assessor | Terminar com “o que as fontes não cobrem” |
| Produto em teste | Tesouro Reserva aparecia como disponível | “Se a fonte marcar incerteza, preserve” |
| Fonte antiga × fonte nova | CVM 2016 falando como se fosse a prateleira de 2026 | Prompt de contraste de data (seção 4.3) |
| Página do BC sem HTML estático | `bcb.gov.br/controleinflacao` não entrega texto sem JavaScript | Subir o recorte em Markdown com URL no topo, em vez da página viva |
| `tesourodireto.com.br` | Cloudflare bloqueou a captura | Trocar pelo Tesouro Transparente e pelo Portal do Investidor (gov.br) |
| IBGE *Explica inflação* | HTTP 403 na coleta | Descartei a sexta fonte; IPCA já está no RPM e no Portal |
| PDF grande do Caderno do BC | Caderno longo; a IA privilegiava o começo | Nomear o módulo (“Poder dos juros no tempo”) no prompt |
| Citação do NotebookLM | Às vezes aponta página certa e frase errada | Abrir o PDF. Citação não substitui conferência |
| Garantias misturadas | FGC da caderneta colado em título público | Prompt crítico: FGC ≠ risco soberano da União |

Cicatriz de processo, não de prompt: não consegui criar o notebook na conta Google a partir daqui. As respostas abaixo foram extraídas dos **mesmos arquivos** que sobem no NotebookLM. Na conta, o passo extra é rerodar os prompts B–E e bater a citação automática com o PDF.

---

## 4. Miniguia de estudo (entrega final)

### 4.1 Resumos estruturados

**Inflação e poder de compra.** O BC liga estabilidade de preços a planejamento: a família estima o mês; a empresa investe. Inflação alta, instável ou imprevisível encurta o horizonte e acerta primeiro quem tem menos instrumento para se proteger. Desde janeiro de 2025 a meta contínua é 3% no IPCA, com intervalo de 1,5% a 4,5%. O Copom usa a meta da Selic para puxar a inflação nessa direção. O Caderno lembra a memória inflacionária: até o Plano Real (1994), gastar o salário no mesmo dia era racional. Esse reflexo ainda compete com o hábito de poupar.

**Juros: o aluguel do dinheiro.** Simples: só sobre o principal. Compostos: juros entram no saldo e passam a render. R$ 1.000 a 5% a.m. por 6 meses → R$ 1.300 no simples e R$ 1.340,10 no composto. Na vida real o composto é a regra, nas aplicações e nas dívidas. Helena deposita R$ 150/mês por 10 anos a 0,5% a.m., para aos 30 e deixa render até os 60: R$ 148.786,58, com R$ 18 mil saídos do bolso. Marta começa aos 30 e deposita o mesmo valor por 30 anos: saldo parecido, R$ 54 mil do bolso. A chave é o **tempo de capitalização**. Contas na Calculadora do Cidadão. O exercício desconsidera inflação.

**Poupar não é “a poupança”.** Poupança, no caderno, é a sobra entre receita e despesa, aplicada. Caderneta é um produto, com aniversário mensal e FGC (limite citado no caderno: R$ 250 mil por CPF por instituição, jun/2025). “Pagar-se primeiro”: a sobra sai no dia do salário. Liquidez é converter a preço justo. Risco é chance de perda. Títulos públicos no Tesouro Direto, **carregados até o vencimento**, entram como exemplo de menor risco ao lado da caderneta.

**O primeiro investimento seguro (sem ordem de compra).** O Tesouro Direto (2002, Tesouro Nacional + B3) vende títulos da União a pessoa física. O Portal amarra produto a objetivo: Tesouro Selic → reserva; Tesouro Prefixado → valor conhecido no vencimento, venda antecipada ao preço do dia; Tesouro IPCA+ → IPCA + taxa fixa, protege poder de compra se levado ao vencimento. Cupom semestral antecipa IR e enfraquece juros sobre juros se a meta for só acumular. Marcação a mercado: o extrato oscila; a rentabilidade contratada é para quem segura até o fim.

**A cabeça que recusa a conta.** Viés do crescimento exponencial: linearizar o composto, poupar menos, se endividar mais. Viés do presente: o agora pesa demais; tática oficial é guardar no recebimento e automatizar. Viés do otimismo: reserva de 6 a 12 meses de despesa em baixo risco e alta liquidez; aposentadoria pede ganho real, abrindo mão de liquidez. Status quo: saldo nominal subindo na caderneta pode estar perdendo para a inflação.

### 4.2 Glossário

| Termo | Definição operacional (nas fontes) | Armadilha |
|---|---|---|
| Inflação | Perda de poder de compra por alta contínua e generalizada de preços | Confundir com o preço de um item só |
| IPCA | Índice oficial de inflação ao consumidor, usado na meta | Achar que é “sua” cesta pessoal |
| Meta de inflação | 3% no IPCA, faixa 1,5%–4,5%, verificação contínua desde 2025 | Tratar 3% como teto rígido todo mês |
| Selic | Taxa básica; média de operações de 1 dia com títulos públicos; instrumento do Copom | Achar que é o rendimento automático da caderneta |
| Juros simples | Só sobre o principal | Achar que o banco usa isso no cartão |
| Juros compostos | Juros sobre juros, capitalizados | Linearizar no olho |
| Valor do dinheiro no tempo | Um real hoje ≠ um real daqui a um ano | Adiar poupar porque “é pouco” |
| Poupança (ato) | Receita − despesa, aplicada | Sinônimo de caderneta |
| Caderneta de poupança | Produto com aniversário e FGC | Única forma de guardar |
| Liquidez | Virar dinheiro a preço justo | “Posso sacar” ≠ “saio sem perda” |
| Risco | Probabilidade de perda | “Título público nunca oscila no extrato” |
| Rentabilidade real | Ganho depois da inflação (e, na prática, de taxas e IR) | Olhar só o percentual da tela |
| Tesouro Direto | Programa de venda de títulos da União a pessoa física | Fundo de renda fixa com taxa alta |
| Tesouro Selic | Pós-fixado na Selic; reserva de emergência | Longo prazo com meta de ganho real |
| Tesouro IPCA+ | IPCA + taxa fixa; longo prazo até o vencimento | Reserva que você pode precisar amanhã |
| Marcação a mercado | Preço diário oscila com juros | Pânico no extrato vermelho |
| Viés do crescimento exponencial | Subestimar o composto | “Juros de fatura não é tão grave” |
| Viés do presente | Preferir o agora | Planejar poupar “a partir de segunda” |
| CET | Custo efetivo total do crédito | Comparar só a prestação |

### 4.3 Prompts reutilizáveis para revisão

Copiar no NotebookLM. Trocar só o trecho entre colchetes.

**Revisão conceitual**

```
Resuma em 8 linhas o que as fontes dizem sobre [conceito].
Cada frase precisa de uma fonte. Se não estiver no material, escreva “não consta”.
```

**Ficha de conceito**

```
Monte uma ficha: definição nas fontes; exemplo numérico se houver;
o oposto do conceito; uma pergunta de prova. Conceito: [X].
```

**Quiz ativo**

```
Elabore 5 questões de múltipla escolha só com este caderno.
Uma delas deve usar o exemplo Helena/Marta.
Depois da lista, dê o gabarito com citação.
```

**Mapa objetivo → produto**

```
Dado o objetivo “[reserva de 6 meses / aposentadoria / compra daqui a 8 anos]”,
o que as fontes associam em termos de liquidez, risco e tipo de título?
Não recomende marca, corretora ou hora de comprar.
Liste o que as fontes não cobrem.
```

**Detector de viés**

```
Estou prestes a [adiar a poupança / parcelar no rotativo / não olhar a fatura].
Qual viés da CVM se aplica e qual tática o texto sugere? Cite o capítulo.
```

**Auditoria da IA**

```
Relia sua resposta anterior. Marque cada afirmação com:
(F) está na fonte, (I) inferência razoável, (X) não consta.
Apague os X.
```

**Contraste de data**

```
A CVM é de 2016 e o Portal do Investidor foi capturado em 2026.
O que pode ter envelhecido (produto, taxa, isenção)
e o que é mecanismo estável (viés, composto, marcação a mercado)?
```

Não usar: “qual o melhor investimento”, “monte minha carteira”, “está barato?”, “me dê uma taxa”. Isso empurra a IA para fora das fontes.

### 4.4 Roteiro curto de revisão

1. Inflação, IPCA, meta, Selic — ficha de conceito.
2. Conta dos R$ 1.000 — conferir na Calculadora do Cidadão.
3. Helena × Marta — explicar em voz alta; depois o quiz.
4. Poupança vs. caderneta; liquidez; FGC — prompt crítico.
5. Tesouro Selic vs. IPCA+ — marcação a mercado e lista do que não consta.
6. Três vieses da CVM + uma tática cada.
7. Auditoria da IA em qualquer resposta antiga; reescrever o glossário de memória.

---

## Como este repositório se organiza

```
estudo-notebooklm-valor-do-dinheiro/
├── README.md          ← este arquivo (entrega do desafio)
├── MINIGUIA.md        ← versão estendida do miniguia
└── fontes/            ← PDFs, recortes e instrução de upload no NotebookLM
```

O miniguia estendido, com os mesmos resumos e o banco de prompts, está em [`MINIGUIA.md`](MINIGUIA.md).
