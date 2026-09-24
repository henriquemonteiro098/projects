# Study guide: the time value of money

A thematic notebook designed for NotebookLM, based on five open public sources. Objective: use AI as an active learning partner rather than a shortcut for quick answers.

**Context and methodology.** The source materials were gathered in September 2026. The prompt tests below were validated against these documents (the same scope NotebookLM receives). To set up your notebook in Google NotebookLM, upload the reference files from `fontes/` and run the prompt queries to verify automatic citations.

---

## 1. Topic and reference sources

Introductory topic: **inflation, compound interest, and the first safe investment**.

The central question behind this notebook is not "where should I invest right now." Instead, it asks: *why does a unit of currency today buy less in the future, and how does that reality shape decisions to save, borrow, or lend to the government?*

Curatorial criteria:

- Public institutions with an explicit mandate for financial education, market regulation, or transparency.
- Open documentation or PDFs without paywalls.
- Clear language suitable for beginners.
- Cross-cutting perspectives connecting personal habits, behavioral science, public policy, and financial products.

Excluded materials: brokerage blogs, daily yield rankings, promotional articles, and any source giving purchase orders.

| # | Source | Format | Role in the notebook |
|---|---|---|---|
| 1 | Central Bank of Brazil, *Financial Education Notebook* | PDF | Simple vs. compound interest, saving habits vs. savings passbooks, liquidity, risk, "paying yourself first" |
| 2 | CVM (Securities and Exchange Commission of Brazil), *Saver Biases* vol. 2 (2016) | PDF | Why people delay saving even after understanding the math |
| 3 | Central Bank of Brazil, monetary policy and Inflation Report boxes | Official text | Selic policy rate, inflation targeting, IPCA index, why high inflation impacts lower-income households first |
| 4 | Tesouro Transparente, Tesouro Direto portal | Official text | Program structure, yield models, liquidity, baseline sovereign risk |
| 5 | Portal do Investidor (gov.br), *Public Bonds* | Official text | Treasury Selic, fixed-rate, and IPCA+ bonds, mark-to-market mechanics, emergency reserves vs. long-term goals |

Reference links:

1. Central Bank: https://www.bcb.gov.br/content/cidadaniafinanceira/documentos_cidadania/Cuidando_do_seu_dinheiro_Gestao_de_Financas_Pessoais/caderno_cidadania_financeira.pdf
2. CVM: https://www.gov.br/investidor/pt-br/educacional/publicacoes-educacionais/cvm-comportamental/volume-2-vieses-do-poupador.pdf
3. Central Bank Inflation Control: https://www.bcb.gov.br/controleinflacao
4. Tesouro Transparente: https://www.tesourotransparente.gov.br/temas/divida-publica-federal/tesouro-direto
5. Portal do Investidor: https://www.gov.br/investidor/pt-br/investir/tipos-de-investimentos/titulos-publicos

---

## 2. Learning objectives

After working through this notebook, you should be able to do the following **without consulting an AI tool**:

1. Distinguish between **inflation**, the **IPCA** index, **inflation targets**, and the **Selic** policy rate.
2. Calculate the numerical difference between simple and compound interest on R$ 1,000 at 5% monthly over 6 months.
3. Explain the Helena vs. Marta case study: why starting ten years earlier dramatically reduces total out-of-pocket contributions.
4. Separate the **act of saving** from the **savings passbook** (caderneta de poupança) as a specific banking product.
5. Match a life goal to an appropriate bond structure (emergency reserves to Treasury Selic; long-term purchasing power protection to Treasury IPCA+), and explain what happens if you sell prior to maturity.
6. Identify two cognitive biases that undermine saving habits (exponential growth bias and present bias) along with one practical strategy against each.
7. Recognize what public reference sources do **not** support: personalized investment recommendations, market timing, or buy signals.

---

## 3. Strategic questions

Read and reflect on these questions before writing prompts. They guide deliberate thinking rather than automated text generation.

1. If inflation is a sustained, widespread rise in prices, what does "real return" actually mean?
2. Why does the Central Bank treat the Selic rate as a policy tool rather than a guaranteed yield for personal savings?
3. In the Helena and Marta case study, is the deciding factor the interest rate or the compounding timeframe?
4. Why does the CVM point out that estimating compound interest in a linear fashion causes people to under-save and over-borrow?
5. Emergency reserves demand immediate liquidity and low volatility. Long-term goals demand protection against inflation. Which bond type does each source recommend, and what risks occur if you sell early?
6. Do the Central Bank materials and the CVM behavioral guide contradict each other, or do they simply address different layers of the same challenge?
7. Where do language models commonly introduce hallucinations: daily rates, "best bond today", changing tax exemptions, or subjective advice on how much to save?

---

## 4. Structured summaries

### 4.1 Inflation and purchasing power

The Central Bank links price stability to economic planning: families can budget predictably, and businesses can commit to long-term investments. High, volatile inflation shortens planning horizons and **first hits households with fewer resources to protect themselves**. Under continuous targeting, the central goal for the IPCA inflation index is 3%, within a tolerance band of 1.5% to 4.5%. The Monetary Policy Committee (Copom) sets the **Selic target rate** to guide inflation toward that goal; the effective Selic rate represents the weighted average of overnight interbank loans backed by federal government securities.

The Central Bank notebook notes the lingering effect of **inflationary memory**: before the 1994 Real Plan, spending one's paycheck on day one was entirely rational. That deeply ingrained reflex still competes with consistent saving habits today.

### 4.2 Interest: the rent of money, and its effect over time

The Central Bank defines interest as the cost of borrowing money over time. **Simple interest** applies only to the principal balance. **Compound interest** adds earned interest back into the principal, compounding returns in each subsequent cycle. In the official example, R$ 1,000 at 5% monthly over 6 months grows to R$ 1,300 under simple interest and R$ 1,340.10 under compound interest. Real-world financial contracts (both investments and debts) almost universally compound.

In the case study, Helena deposits R$ 150 per month for 10 years at 0.5% monthly, stops at age 30, and lets the balance compound until age 60, ending with roughly R$ 148,786 from an out-of-pocket contribution of R$ 18,000. Marta starts at age 30 and deposits the same R$ 150 monthly for 30 consecutive years, ending with a similar balance but contributing R$ 54,000 out of pocket. The decisive variable is not high early income; it is **compounding duration**.

### 4.3 Saving vs. the savings passbook

Saving, as defined here, is the positive surplus between income and expenses, allocated to a safe asset. The savings passbook (caderneta de poupança) is merely **one specific retail product**, featuring monthly interest crediting dates and credit protection by the FGC (up to R$ 250,000 per tax ID per institution). "Paying yourself first" is the key operational habit: routing planned savings on the day income arrives rather than attempting to save whatever remains at month-end.

Liquidity represents the speed and ease of converting an asset back into cash at fair value. Risk represents the probability of capital loss. Public government bonds held to maturity are presented in official guides alongside savings accounts as baseline low-risk instruments.

### 4.4 The first safe investment (without purchase orders)

The Tesouro Direto program (created in 2002 by the National Treasury and B3) allows individual retail investors to buy federal government bonds. Yield structures include fixed-rate, inflation-linked, and floating rate:

- **Tesouro Selic**: suitable for emergency reserves, with low daily price fluctuation and yield tracking the overnight policy rate.
- **Tesouro Prefixado**: guarantees a predetermined nominal payout at maturity; selling prior to maturity depends on prevailing secondary market prices.
- **Tesouro IPCA+**: pays the IPCA inflation index plus a fixed rate, protecting purchasing power if held to maturity; ideal for long-term horizons.
- Semiannual coupons trigger early income tax deductions and diminish compound accumulation if the sole objective is long-term wealth building.

**Mark-to-market mechanics:** bond account balances fluctuate daily in response to market interest rates. The contracted yield is guaranteed specifically for investors who **hold their bonds until maturity**. Selling early exposes capital to secondary market pricing.

### 4.5 Psychological resistance to the math

The CVM documents **exponential growth bias**: people intuitively estimate interest along a linear path, underestimating both the long-term payoff of early saving and the compounding cost of debt. Recommended countermeasures include using automated financial calculators, starting with small contributions, avoiding rolling credit card balances, and eliminating revolving credit lines.

**Present bias** (hyperbolic discounting) places disproportionate weight on immediate rewards over future stability. Recommended strategies include automated deposits on payday, visual goal tracking, and conservative card credit limits.

**Optimism bias** shows the need to keep 6 to 12 months of living expenses in liquid, low-volatility holdings. For retirement, investors need real returns above inflation, which requires accepting longer lockup periods.

Status quo bias can leave individuals parked in traditional passbook accounts simply out of habit, occasionally losing purchasing power to inflation even as the nominal balance climbs.

---

## 5. Glossary

| Term | Operational definition in reference texts | Common misconception |
|---|---|---|
| Inflation | Loss of purchasing power caused by persistent, widespread price increases | Confusing aggregate inflation with price spikes on a single product |
| IPCA | Official consumer price index used for inflation targeting | Assuming the national index mirrors an individual household basket |
| Inflation target | 3% IPCA target with a 1.5% to 4.5% tolerance band, continuously monitored | Treating 3% as a monthly ceiling |
| Selic | Policy rate based on daily overnight operations in federal government bonds | Assuming it automatically matches personal savings returns |
| Simple interest | Interest calculated solely on original principal | Believing banks use simple interest on credit card debt |
| Compound interest | Interest calculated on principal plus accrued interest | Estimating growth through mental linear math |
| Time value of money | One unit of currency today does not equal one unit a year from now | Delaying savings because initial sums seem small |
| Act of saving | Setting aside income surplus and deploying it into an asset | Treating the act as identical to a retail passbook account |
| Savings passbook | Specific banking product with monthly crediting dates and FGC guarantee | Assuming it is the only safe method to set money aside |
| Liquidity | Ease of converting an asset into cash at fair market value | Confusing immediate withdrawal with exit without capital loss |
| Risk | Probability of partial or total loss | Assuming public bonds never fluctuate in value on daily statements |
| Real yield | Net return after subtracting inflation, fees, and taxes | Looking only at the gross nominal percentage on screen |
| Tesouro Direto | Retail platform for direct purchase of federal government bonds | Mistaking it for a high-fee private fixed-income fund |
| Tesouro Selic | Floating-rate bond indexed to the Selic rate, ideal for reserves | Using it for 20-year horizons with high real return goals |
| Tesouro IPCA+ | Inflation-protected bond with a fixed real coupon, ideal for long horizons | Relying on it for funds that might be needed tomorrow |
| Mark to market | Daily asset price adjustments reflecting current interest rate shifts | Panicking over temporary red figures on statements prior to maturity |
| Exponential growth bias | Human tendency to project exponential curves linearly | Underestimating how quickly high-interest debt compounds |
| Present bias | Cognitive preference for immediate consumption over future benefits | Planning to start saving "next month" indefinitely |
| CET (Total Effective Cost) | Comprehensive total cost of a credit transaction including fees and insurance | Comparing loans solely by monthly installment amounts |

---

## 6. Testing prompt variations

Methodology: evaluate the same question under four different prompt designs, observing how the model grounds itself in official documentation and where loose prompts produce hallucinations.

### 6.1 Loose prompt

> Explain interest to me.

**Result.** Generates broad, generic commentary with no official numerical examples, failing to clearly distinguish simple from compound interest and omitting references to Central Bank sources. Difficult to verify or audit.

### 6.2 Grounded prompt (definition and calculations)

> Rely strictly on the sources in this notebook. Define simple and compound interest. Replicate the official calculation of R$ 1,000 at 5% monthly over 6 months across both regimes. Identify which regime governs real-world transactions. Cite the source and section.

**Grounded output.** Simple interest applies exclusively to principal; compound interest capitalizes accumulated interest each cycle. Based on the Central Bank guide: simple interest yields R$ 1,300.00; compound interest yields R$ 1,340.10 (month by month: 1,050.00, 1,102.50, 1,157.63, 1,215.51, 1,276.28, 1,340.10). The guide confirms simple interest is virtually nonexistent in real transactions.

**Reference:** Central Bank, *Financial Education Notebook*, credit module, "The Power of Interest Over Time".

### 6.3 Comparative prompt (cross-referencing sources)

> Compare the Central Bank case study of Helena and Marta with the CVM analysis of exponential growth bias. What does one source calculate, and what does the other explain? Do not invent numbers.

**Grounded output.** The Central Bank provides the financial outcomes: Helena invests R$ 18,000 out of pocket and reaches roughly R$ 149,000 by age 60; Marta invests R$ 54,000 to reach a comparable balance because she began ten years later. The CVM explains the underlying cognitive blind spot: people who project compounding linearly underestimate long-term outcomes, defer saving, and lose control of compounding debt. The two sources complement each other: one provides the math, the other explains human hesitation.

**References:** Central Bank case study; CVM, chapter 3, *Exponential Growth Bias*.

### 6.4 Application prompt (matching products to goals)

> Based strictly on these reference texts, which federal bonds do official sources link to emergency reserves, and which to long-term purchasing power protection? What happens if an investor sells before maturity? List what the sources do not specify.

**Grounded output.** Portal do Investidor associates Tesouro Selic with emergency reserves due to minimal daily volatility and rate tracking. Tesouro IPCA+ is linked to long-term goals, paying IPCA plus a fixed real rate and protecting purchasing power **when held to maturity**. Mark to market: account values can fluctuate below expectations on early exit; agreed rates apply strictly to bonds held to maturity.

**What the sources do not provide:** specific bond recommendations for today, live real-time rates, whether current pricing is attractive, how much income to allocate, or speculative financial advice.

**References:** Portal do Investidor, *Public Bonds*; Tesouro Transparente summary; Central Bank guide.

### 6.5 Critical prompt (identifying gaps)

> Where are these five reference sources insufficient for a live personal investment decision? Answer in a concise list. Exclude personal advice.

**Grounded output.** The sources do not evaluate the reader's risk tolerance, investment timeline, individual income tax brackets, brokerage account fees, or comparison tables against private bank products (such as CDs). The CVM booklet dates from 2016: psychological mechanisms remain valid, but regulatory tax codes and new products require verification against current official releases. The Central Bank case study ignores inflation in the Helena and Marta exercise. No static text replaces official web simulators and formal bond prospectus sheets.

### 6.6 Prompt design comparison

| Design | Risk | Best use |
|---|---|---|
| Loose | High risk of generic claims and hallucination | Avoid for rigorous study |
| Grounded | Low risk, requires explicit citations | Defining core concepts |
| Comparative | Moderate risk of over-synthesis | Synthesizing related materials |
| Application | High risk if requesting recommendations | Mapping products to goals, paired with explicit omissions |
| Critical | Low risk, focuses on scope boundaries | Concluding study sessions |

Practical rule: **every operational question should conclude with "specify what the sources do not cover."**

---

## 7. Reusable prompt templates

Use these templates in NotebookLM. Replace only bracketed placeholders.

### Conceptual review

> Summarize what the sources state regarding [concept] in 8 lines or fewer. Every sentence must include a specific citation. If the concept is absent from the sources, state "not found in reference text".

### Concept scorecard

> Create a structured concept card: official definition, numerical example if available, the opposite concept, and one test question. Target concept: [X].

### Active retrieval quiz

> Create 5 multiple-choice questions based strictly on this notebook. Include one question covering the Helena and Marta case study. Provide an answer key with source citations following the quiz.

### Goal-to-product mapping

> Given the financial goal "[6-month emergency reserve / retirement in 25 years / major purchase in 8 years]", what do the sources indicate regarding liquidity, risk, and bond category? Do not recommend specific brokerages or timing strategies.

### Cognitive bias check

> I am currently considering [delaying savings / using revolving credit / ignoring monthly statements]. Which CVM cognitive bias applies, and what concrete tactic does the text suggest? Cite the relevant chapter.

### AI response audit

> Review your previous answer. Label every claim as: (F) found in source text, (I) reasonable inference, or (X) not found in source text. Remove all claims marked X.

### Historical context audit

> The CVM text dates from 2016 while the government investor portal was documented in 2026. What elements may have evolved (products, tax rules, rates), and what principles remain constant (biases, compounding mechanics, mark to market)?

### Disallowed queries

Avoid questions like: "what is the best investment right now", "build my portfolio", "is this asset cheap", or "give me today's yield". These push models beyond the bounds of the provided reference sources.

---

## 8. Review roadmap (7 short sessions)

1. Upload the 5 sources. Objective 1: inflation, IPCA, targets, and Selic. Run the concept scorecard prompt.
2. The R$ 1,000 calculation. Recreate the figures using the Central Bank Citizen Calculator (Calculadora do Cidadão).
3. Helena vs. Marta. Explain the mechanics aloud from memory. Complete the quiz.
4. Saving habits vs. passbook accounts; liquidity; FGC coverage. Run the critical prompt.
5. Tesouro Selic vs. Tesouro IPCA+. Mark-to-market dynamics. Generate the list of omissions.
6. Three CVM cognitive biases and one tactic for each. Apply the bias check to personal financial habits.
7. Audit AI outputs from an earlier session. Reconstruct the glossary from memory.

---

## 9. Critical thinking and boundaries

- **This notebook does not constitute investment advice.** It is an exercise in analyzing official public documentation.
- Example figures (Helena, R$ 1,000) are educational baselines, not real-life forecasts; the Central Bank exercise excludes inflation.
- Policy interest rates and monthly inflation indices change continuously. What remains durable in this guide is the **underlying financial mechanism**.
- FGC credit guarantees apply to banking deposits, not federal government sovereign debt. Do not conflate the two protection mechanisms.
- While NotebookLM cites page numbers, verify quotes directly in the source PDFs. Hallucinated citations remain a common risk in LLMs.
