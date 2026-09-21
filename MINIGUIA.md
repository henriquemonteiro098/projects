# Miniguia de estudo — O valor do dinheiro no tempo

Caderno temático para o NotebookLM. Cinco fontes oficiais abertas. Objetivo: usar a IA como ferramenta de aprendizagem ativa, não como atalho para “a resposta certa”.

**Como isto foi feito.** As fontes foram baixadas em 20/09/2026. Os testes de prompt abaixo foram respondidos contra esses textos (o mesmo recorte que o NotebookLM receberá). O caderno no Google ainda precisa ser criado na sua conta: envie os arquivos de `fontes/` e rode de novo os prompts para conferir as citações automáticas.

---

## 1. Tema e por que estas fontes

Tema introdutório: **inflação, juros compostos e o primeiro investimento seguro**.

A pergunta que organiza o caderno não é “onde investir agora”. É: *por que o mesmo real de hoje não compra a mesma coisa amanhã, e o que isso muda na decisão de poupar, endividar-se ou emprestar ao governo?*

Critério de curadoria:

- órgão público com mandato de educação, regulação ou transparência
- texto ou PDF aberto, sem paywall
- linguagem acessível a quem está começando
- recorte que se cruza (pessoal + comportamento + política + produto)

Ficaram de fora: blogs de corretora, ranking de rentabilidade do dia, “melhor CDB”, e qualquer fonte que dê ordem de compra.

| # | Fonte | Tipo | Papel no caderno |
|---|---|---|---|
| 1 | Banco Central, *Caderno de Educação Financeira* | PDF | Juros simples vs. compostos, poupança vs. caderneta, liquidez, risco, “pagar-se primeiro” |
| 2 | CVM, *Vieses do Poupador* vol. 2 (2016) | PDF | Por que a gente adia poupar mesmo entendendo a conta |
| 3 | Banco Central, política monetária + boxes do RPM jun/2026 | texto oficial | Selic, meta de inflação, IPCA, por que inflação alta acerta mais o pobre |
| 4 | Tesouro Transparente, página Tesouro Direto | texto oficial | O que é o programa, tipos de rentabilidade, liquidez, menor risco de mercado |
| 5 | Portal do Investidor (gov.br), *Títulos Públicos* | texto oficial | Selic / prefixado / IPCA+, marcação a mercado, reserva vs. longo prazo |

URLs:

1. https://www.bcb.gov.br/content/cidadaniafinanceira/documentos_cidadania/Cuidando_do_seu_dinheiro_Gestao_de_Financas_Pessoais/caderno_cidadania_financeira.pdf
2. https://www.gov.br/investidor/pt-br/educacional/publicacoes-educacionais/cvm-comportamental/volume-2-vieses-do-poupador.pdf
3. https://www.bcb.gov.br/controleinflacao — boxes em https://www.bcb.gov.br/content/ri/relatorioinflacao/202606/rpm202606p.pdf
4. https://www.tesourotransparente.gov.br/temas/divida-publica-federal/tesouro-direto
5. https://www.gov.br/investidor/pt-br/investir/tipos-de-investimentos/titulos-publicos

---

## 2. Objetivos de estudo

Ao terminar o caderno, você deve conseguir, **sem abrir a IA**:

1. Distinguir **inflação**, **IPCA**, **meta de inflação** e **Selic**.
2. Calcular, no papel ou na Calculadora do Cidadão, a diferença entre juros simples e compostos no exemplo de R$ 1.000 a 5% a.m. por 6 meses.
3. Explicar o exemplo Helena × Marta: por que começar dez anos antes muda o quanto precisa sair do bolso.
4. Separar **ato de poupar** de **caderneta de poupança**.
5. Ligar um objetivo de vida a um tipo de título (reserva → Tesouro Selic; longo prazo com proteção de poder de compra → Tesouro IPCA+), e dizer o que acontece se vender antes do vencimento.
6. Nomear dois vieses que sabotam a poupança (crescimento exponencial e viés do presente) e uma tática concreta contra cada um.
7. Dizer o que as fontes **não** autorizam: recomendação personalizada, timing de mercado, “é hora de comprar”.

---

## 3. Perguntas estratégicas

Estas perguntas vêm antes dos prompts. São o que você quer *pensar*, não o que quer *gerar*.

1. Se inflação é aumento contínuo e generalizado de preços, o que significa “rentabilidade real”?
2. Por que o BC trata a Selic como instrumento, e não como “o rendimento da poupança”?
3. No exemplo Helena × Marta, o mistério é a taxa ou o tempo de capitalização?
4. Por que a CVM diz que calcular juros compostos “no olho” em linha reta faz a pessoa poupar menos e se endividar mais?
5. Reserva de emergência pede liquidez e pouca oscilação. Longo prazo pede proteção contra inflação. Qual título cada fonte aponta — e o que nenhuma delas garante se você vender no meio do caminho?
6. O Caderno do BC de 2025 e o volume da CVM de 2016 discordam em algum ponto, ou só falam camadas diferentes do mesmo problema?
7. Onde a IA costuma inventar: taxa do dia, “melhor título agora”, isenção que mudou, conselho de quanto guardar.

---

## 4. Resumos estruturados

### 4.1 Inflação e o poder de compra

O BC liga estabilidade de preços a planejamento: família consegue estimar o mês; empresa consegue investir. Inflação alta, instável ou imprevisível encurta o horizonte e **acerta primeiro quem tem menos instrumento para se proteger**. A meta contínua, desde janeiro de 2025, é 3% no IPCA, com intervalo de 1,5% a 4,5%. O Copom usa a **meta da Selic** para puxar a inflação nessa direção; a Selic efetiva é a média das operações de um dia com títulos públicos no Selic.

O próprio Caderno de Educação Financeira lembra a **memória inflacionária**: até o Plano Real (1994), gastar o salário no mesmo dia era racional. Esse reflexo ainda compete com o hábito de poupar quando a inflação já não é hiperinflação.

### 4.2 Juros: o aluguel do dinheiro — e o efeito no tempo

O BC trata juros como aluguel do dinheiro. **Simples**: só sobre o principal. **Compostos**: juros entram no saldo e passam a render. No exemplo oficial, R$ 1.000 a 5% a.m. por 6 meses vira R$ 1.300 no regime simples e R$ 1.340,10 no composto. O caderno avisa: na vida real, o composto é a regra — nas aplicações **e** nas dívidas.

Helena deposita R$ 150/mês por 10 anos a 0,5% a.m., para aos 30 e deixa render até os 60: R$ 148.786,58, com R$ 18 mil saídos do bolso. Marta começa aos 30 e deposita os mesmos R$ 150 por 30 anos: saldo parecido, mas R$ 54 mil do bolso. A chave não é “ser rica cedo”; é **tempo de capitalização**. O BC fez as contas na Calculadora do Cidadão.

### 4.3 Poupar não é “a poupança”

Poupança, no caderno, é a sobra entre receita e despesa, aplicada em algum investimento. Caderneta de poupança é **um** produto, com aniversário mensal e cobertura do FGC (limite citado no caderno: R$ 250 mil por CPF por instituição, jun/2025). “Pagar-se primeiro” é a regra operacional: a sobra planejada sai no dia do salário, não no que restar no dia 30.

Liquidez é converter em dinheiro a preço justo. Risco é chance de perda. Títulos públicos no Tesouro Direto, **carregados até o vencimento**, entram no caderno como exemplo de menor risco ao lado da caderneta.

### 4.4 O primeiro investimento seguro (sem ordem de compra)

O Tesouro Direto (2002, Tesouro Nacional + B3) vende títulos públicos a pessoa física. Rentabilidades: prefixada, atrelada à inflação ou à Selic. O Portal do Investidor amarra o produto ao objetivo:

- **Tesouro Selic** — reserva de emergência; pouca oscilação diária; rendimento segue a Selic.
- **Tesouro Prefixado** — você sabe o valor no vencimento; venda antecipada depende do preço do dia.
- **Tesouro IPCA+** — IPCA + taxa fixa; protege o poder de compra se levado ao vencimento; longo prazo.
- Cupom semestral antecipa IR e enfraquece juros sobre juros se a meta for só acumular.

**Marcação a mercado:** o extrato oscila. A garantia da rentabilidade contratada vale para quem **segura até o vencimento**. Vender no meio é outro contrato.

Nota de atualidade: o Portal menciona **Tesouro Reserva** em fase de testes. Tratar como fato consolidado seria erro de fonte.

### 4.5 A cabeça que recusa a conta

A CVM descreve o **viés do crescimento exponencial**: a pessoa lineariza o composto, subestima o ganho de poupar cedo e o custo da dívida. Recomenda simulador, começar pequeno, não acumular fatura e rotativo.

O **viés do presente** / desconto hiperbólico privilegia o agora. Tática oficial: guardar no recebimento, investimento automático, objetivo visível, limite no cartão.

O **viés do otimismo** pede reserva de 6 a 12 meses de despesa em aplicação de baixo risco e alta liquidez — e, para aposentadoria, ganho real acima da inflação, abrindo mão de liquidez.

Status quo: ficar na caderneta “porque já conheço” pode perder para a inflação mesmo com saldo nominal subindo.

---

## 5. Glossário

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
| Tesouro Direto | Programa de venda de títulos da União a PF | Fundo de renda fixa com taxa alta |
| Tesouro Selic | Pós-fixado na Selic; reserva | Longo prazo com meta de ganho real |
| Tesouro IPCA+ | IPCA + taxa fixa; longo prazo | Reserva que você pode precisar amanhã |
| Marcação a mercado | Preço diário oscila com juros | Pânico no extrato vermelho |
| Viés do crescimento exponencial | Subestimar composto | “Juros de fatura não é tão grave” |
| Viés do presente | Preferir o agora | Planejar poupar “a partir de segunda” |
| CET | Custo efetivo total do crédito | Comparar só a prestação |

---

## 6. Teste de variações de prompt

Método: mesma pergunta, quatro desenhos. Registrar o que a IA fez com as fontes e o que inventaria se o prompt fosse frouxo.

### 6.1 Prompt frouxo

> Me explica juros.

**O que acontece.** Texto genérico, sem exemplo numérico oficial, sem separar simples de composto, sem citar BC. Serve para aula nenhuma: não dá para auditar.

### 6.2 Prompt ancorado (definição + conta)

> Use apenas as fontes deste caderno. Defina juros simples e juros compostos. Reproduza o exemplo oficial de R$ 1.000 a 5% ao mês por 6 meses nos dois regimes. Diga qual é a regra na vida real. Cite a fonte e o trecho.

**Resposta grounded.** Juros simples incidem só sobre o principal; compostos incorporam os juros ao saldo a cada período. No exemplo do Caderno do BC: simples → R$ 1.300; composto → R$ 1.340,10 (mês a mês: 1.050 → 1.102,50 → 1.157,63 → 1.215,51 → 1.276,28 → 1.340,10). O caderno afirma que simples quase não existe nas transações reais.

**Referência:** BC, *Caderno de Educação Financeira*, módulo de crédito, “Poder dos juros no tempo”.

### 6.3 Prompt comparativo (duas fontes)

> Compare o exemplo Helena e Marta (Banco Central) com o viés do crescimento exponencial (CVM). O que uma fonte calcula e a outra explica? Não invente números.

**Resposta grounded.** O BC mostra o efeito: Helena tira R$ 18 mil do bolso e chega perto de R$ 149 mil aos 60; Marta tira R$ 54 mil para saldo semelhante porque começou dez anos depois. A CVM explica o erro cognitivo: quem lineariza o composto subestima o ganho futuro, adia o início e prefere prazo curto; no crédito, perde o controle porque a dívida cresce mais depressa do que a intuição. As duas fontes se encaixam: uma é a conta, a outra é por que a conta não entra na decisão.

**Referências:** BC, exemplos Helena/Marta; CVM, cap. 3, *Viés do Crescimento Exponencial*.

### 6.4 Prompt de aplicação (produto × objetivo)

> Com base só nestas fontes, qual título público as páginas oficiais associam à reserva de emergência e qual ao longo prazo com proteção contra inflação? O que acontece se eu vender antes do vencimento? Liste o que as fontes não dizem.

**Resposta grounded.** Portal do Investidor: Tesouro Selic → reserva (pouca oscilação diária, segue a Selic). Tesouro IPCA+ → longo prazo, IPCA + taxa fixa, protege poder de compra **se mantido até o vencimento**. Marcação a mercado: o extrato pode ficar abaixo do esperado; a rentabilidade contratada é para quem carrega até o fim. Tesouro Transparente: programa de menor risco de mercado, com liquidez diária e três lógicas de rentabilidade.

**As fontes não dizem:** qual título comprar hoje, qual taxa está na tela, se “está caro”, quanto da sua renda destinar, se Tesouro Reserva já está disponível para todo mundo (o Portal marca fase de testes).

**Referências:** Portal do Investidor, *Títulos Públicos*; Tesouro Transparente, resumo do programa; BC caderno, risco de títulos públicos até o vencimento.

### 6.5 Prompt crítico (o que falta)

> Onde estas cinco fontes são insuficientes para uma decisão real de investimento? Responda em lista. Proíba conselho.

**Resposta grounded.** Não há perfil do leitor, horizonte pessoal, IR efetivo da operação, taxa da instituição, FGC vs. risco soberano lado a lado com CDB, nem dado de mercado do dia. O volume da CVM é de 2016: os vieses continuam; produtos e alíquotas citados no Portal precisam ser conferidos na página atual. O Caderno do BC desconsidera inflação no exercício Helena/Marta (o próprio gabarito pede isso). Nenhuma fonte substitui simulador oficial + leitura da lâmina do título.

### 6.6 O que mudou entre os prompts

| Desenho | Risco | Uso |
|---|---|---|
| Frouxo | Alucinação, tom de guru | Não usar |
| Ancorado | Baixo, se exigir trecho | Definir conceito |
| Comparativo | Médio (costura demais) | Só depois de 6.2 |
| Aplicação | Alto se pedir “o que eu faço” | Amarrar objetivo a produto, com “não dizem” |
| Crítico | Baixo | Fechar toda sessão |

Regra prática: **toda pergunta operacional termina com “o que as fontes não cobrem”.**

---

## 7. Banco de prompts reutilizáveis

Copiar no NotebookLM. Trocar só o trecho entre colchetes.

### Revisão conceitual

> Resuma em 8 linhas o que as fontes dizem sobre [conceito]. Cada frase precisa de uma fonte. Se não estiver no material, escreva “não consta”.

### Ficha de conceito

> Monte uma ficha: definição nas fontes; exemplo numérico se houver; o oposto do conceito; uma pergunta de prova. Conceito: [X].

### Quiz ativo

> Elabore 5 questões de múltipla escolha só com este caderno. Uma delas deve usar o exemplo Helena/Marta. Depois da lista, dê o gabarito com citação.

### Mapa objetivo → produto

> Dado o objetivo “[reserva de 6 meses / aposentadoria / compra daqui a 8 anos]”, o que as fontes associam em termos de liquidez, risco e tipo de título? Não recomende marca, corretora ou hora de comprar.

### Detector de viés

> Estou prestes a [adiar a poupança / parcelar no rotativo / não olhar a fatura]. Qual viés da CVM se aplica e qual tática o texto sugere? Cite o capítulo.

### Auditoria da IA

> Relia sua resposta anterior. Marque cada afirmação com: (F) está na fonte, (I) inferência razoável, (X) não consta. Apague os X.

### Contraste de data

> A CVM é de 2016 e o Portal do Investidor foi capturado em 2026. O que pode ter envelhecido (produto, taxa, isenção) e o que é mecanismo estável (viés, composto, marcação a mercado)?

### Proibido

Não usar: “qual o melhor investimento”, “monte minha carteira”, “está barato?”, “me dê uma taxa”. Isso empurra a IA para fora das fontes.

---

## 8. Roteiro de revisão (7 sessões curtas)

1. Subir as 5 fontes. Objetivo 1: inflação, IPCA, meta, Selic. Prompt de ficha.
2. Conta do R$ 1.000. Recalcular na Calculadora do Cidadão (bcb.gov.br/meubc/calculadoradocidadao).
3. Helena × Marta. Explicar em voz alta sem olhar. Quiz.
4. Poupança vs. caderneta; liquidez; FGC. Prompt crítico.
5. Tesouro Selic vs. IPCA+. Marcação a mercado. Lista do que não consta.
6. Três vieses da CVM + uma tática cada. Detector de viés com um hábito seu.
7. Auditoria da IA em qualquer resposta antiga do caderno. Reescrever o glossário de memória.

---

## 9. Limites — pensamento crítico

- **Isto não é recomendação de investimento.** É treino de leitura de fonte pública.
- Números oficiais de exemplo (Helena, R$ 1.000) **não** são projeção da sua vida: o exercício do BC desconsidera inflação.
- Selic e IPCA do relatório de conjuntura mudam. No caderno, o que permanece é o *mecanismo*.
- Cobertura do FGC não se aplica a título público da União (risco soberano). Não misturar as duas garantias.
- NotebookLM cita página; ainda assim, abra o PDF. Citação errada é falha comum.

Entrega do desafio: fontes curadas, objetivos, perguntas, testes de prompt com referência, glossário e prompts para voltar ao material sem recomeçar do zero.
