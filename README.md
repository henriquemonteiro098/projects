# Study repository: finance, data modeling, and relational databases

This repository gathers personal study projects focused on two main tracks:

1. A study notebook on the time value of money, based on public Brazilian financial education sources.
2. A hands-on database project for learning SQL, relational data modeling, and practical coding with AI tools like GitHub Copilot in VS Code.

Keeping these materials in one place makes it easier to review concepts, experiment, and track progress over time.

---

## 1. Overview

This workspace combines several learning goals:

- Understanding core personal finance and monetary concepts.
- Reviewing and citing public reference sources (such as the Central Bank of Brazil, CVM, and Tesouro Direto).
- Testing AI prompts for structured study and active recall.
- Designing relational database schemas in PostgreSQL.
- Practicing SQL queries, constraints, and transactions in a safe sandbox.

The focus is strictly educational. It does not provide investment advice or serve as a production banking system.

---

## 2. Study notebook: the time value of money

The finance study track explores foundational concepts through official public documentation, focusing on:

- Inflation and official inflation targets (IPCA).
- The basic interest rate (Selic) and monetary policy.
- Simple vs. compound interest.
- Personal saving habits vs. financial savings products.
- Liquidity, credit risk, and government bonds (Tesouro Direto).
- Behavioral biases that influence money decisions.
- Prompts designed for reviewing materials with NotebookLM or other LLMs.

For the full study notes and curated sources, see [`STUDY_GUIDE.md`](STUDY_GUIDE.md).

---

## 3. Mock banking database project

Alongside the financial notes, the repository contains a practical relational database project documented in [`MOCK_BANK_PROJECT.md`](MOCK_BANK_PROJECT.md).

This exercise serves as a sandbox for writing SQL with VS Code and GitHub Copilot, covering:

- User records and secure password hashing concepts.
- Bank accounts, balances, and reserve values.
- Transactions, deposits, withdrawals, and transfers.
- Foreign keys, constraints, and referential integrity.
- Atomic transactions (`BEGIN ... COMMIT`) to prevent balance inconsistencies.
- Analytical queries and interest simulations.
- Prompt examples to test code generation and query explanations.

Note: an expanded version of this project with a Node.js dashboard and interactive frontend lives in its dedicated repository: [`banco-ficticio`](https://github.com/henriquemonteiro098/banco-ficticio).

---

## 4. Repository structure

```text
projects/
├── README.md                     # Overview of the study workspace
├── STUDY_GUIDE.md                # Detailed study guide on finance and curated sources
├── MOCK_BANK_PROJECT.md          # Schema notes and design for the mock bank database
└── travel_database.sql           # Initial SQL schema draft for travel management
```

---

## 5. How to use this repository

### For the financial study notes

- Read the overview in [`README.md`](README.md).
- Follow the summaries, question prompts, and source references in [`STUDY_GUIDE.md`](STUDY_GUIDE.md).
- Test study prompts with an AI assistant to check comprehension.

### For the database project

- Open [`MOCK_BANK_PROJECT.md`](MOCK_BANK_PROJECT.md).
- Review the SQL tables and test scripts.
- Run queries against a local PostgreSQL instance.
- Use VS Code with GitHub Copilot to explore query explanations, refactoring, and edge cases.
- For additional schema modeling practice, see [`travel_database.sql`](travel_database.sql).

---

## 6. Important notes

- All financial figures, customer names, and account numbers are fictional.
- Content here is for personal learning and is not financial or investment advice.
- The SQL scripts are designed for learning and testing. They are not intended for production systems.

---

## 7. Next steps

- Add more tables, foreign key constraints, and business rules to the schema.
- Write automated tests to verify transaction rollbacks and balance validation.
- Explore deeper analytics queries (monthly spending trends, average account activity).
- Continue building out companion web interfaces and API endpoints.
