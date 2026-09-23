# Repositório de estudos: finanças, dados e banco fictício

Este repositório reúne dois projetos didáticos em desenvolvimento:

1. um caderno temático sobre o valor do dinheiro no tempo;
2. um projeto de banco de dados bancário fictício para aprender SQL, modelagem e uso do GitHub Copilot no VS Code.

A ideia é manter tudo em um mesmo espaço para estudo, consulta e evolução gradual.

---

## 1. Visão geral

O repositório foi estruturado para combinar:

- aprendizado de conceitos financeiros básicos;
- leitura e curadoria de fontes oficiais;
- engenharia de prompts para IA;
- modelagem de banco de dados relacional;
- prática em PostgreSQL;
- criação de projetos fictícios para aprender sem risco real.

O foco principal é o estudo e a prática, não a recomendação de investimento nem a criação de um sistema financeiro real.

---

## 2. Caderno temático — O valor do dinheiro no tempo

O material principal em [`README.md`](README.md) descreve um estudo guiado por fontes oficiais abertas, com foco em:

- inflação;
- IPCA e meta de inflação;
- Selic;
- juros simples e compostos;
- poupança como ato e caderneta como produto;
- liquidez e risco;
- tesouro direto e títulos públicos;
- vieses comportamentais que afetam decisões financeiras;
- prompts para revisão com IA.

Esse estudo também inclui:

- curadoria de fontes;
- prompts testados e cicatrizes;
- miniguia de revisão;
- estrutura para uso no NotebookLM.

O material expandido está em:

- [`MINIGUIA.md`](MINIGUIA.md)

---

## 3. Projeto de banco de dados bancário fictício

Além do caderno financeiro, o repositório inclui um projeto educacional de banco de dados bancários fictícios, documentado em:

- [`PROJETO_BANCO_FICTICIO.md`](PROJETO_BANCO_FICTICIO.md)

Esse documento foi criado para servir como base de estudo e prática com o VS Code e o Copilot. O conteúdo cobre:

- cadastro de usuários;
- e-mail e senha segura;
- contas bancárias;
- saldo e valor guardado;
- movimentações e transferências;
- modelos em PostgreSQL;
- integridade referencial;
- transações;
- validação de saldo;
- consultas SQL;
- simulação de juros simples e compostos;
- exemplos de prompts para o Copilot.

Esse projeto é totalmente fictício e educacional.

---

## 4. Estrutura do repositório

```text
projects/
├── README.md                     ← visão geral do repositório
├── MINIGUIA.md                  ← miniguia ampliado do estudo financeiro
├── PROJETO_BANCO_FICTICIO.md    ← banco de dados bancário fictício
├── fontes/                      ← arquivos e materiais de suporte
│   ├── COMO-SUBIR.md
│   └── ...
└── ...
```

---

## 5. Como usar este repositório

### Para o estudo financeiro

- leia a introdução em [`README.md`](README.md);
- siga os resumos e prompts de revisão;
- use as fontes da pasta [`fontes/`](fontes/);
- teste perguntas com IA usando os prompts do caderno.

### Para o banco de dados fictício

- abra [`PROJETO_BANCO_FICTICIO.md`](PROJETO_BANCO_FICTICIO.md);
- copie o SQL para o PostgreSQL;
- crie o banco localmente;
- execute as consultas e testes;
- use o Copilot para explicar, refatorar e gerar melhorias.

### Como usar no VS Code + Copilot

1. abra a pasta do repositório;
2. crie ou conecte um banco PostgreSQL local;
3. use o arquivo SQL do projeto como base;
4. teste cada comando separadamente;
5. peça ao Copilot para explicar trechos, sugerir consultas e revisar regras de negócio;
6. sempre confirme os resultados antes de considerar o código final.

---

## 6. Observações importantes

- Este repositório é de estudo e aprendizado.
- Os dados financeiros são fictícios e não representam mercado real.
- Os conteúdos de educação financeira não são recomendação de investimento.
- O banco de dados fictício não deve ser usado em produção sem revisão de segurança, auditoria e conformidade.
- Para transações reais, sempre use arquitetura, validação e auditoria adequadas.

---

## 7. Objetivo do repositório

O objetivo geral é unir:

- estudo de finanças pessoais e educação financeira;
- modelagem de dados;
- aprendizado prático de SQL;
- uso de IA como auxiliar de aprendizagem.

Em resumo, este repositório funciona como um ambiente de prática para aprender conceitos de finanças e banco de dados de forma aplicada, com tarefas reais de modelagem e consulta.

---

## 8. Próximos passos possíveis

- expandir o banco fictício com mais tabelas e regras;
- criar uma API para o sistema bancário fictício;
- adicionar testes de integridade;
- incluir consultas mais avançadas;
- conectar o projeto a um front-end simples;
- aprofundar o estudo sobre educação financeira e risco.

---

Se quiser, o próximo passo pode ser:

- transformar este repositório em um projeto mais profissional;
- criar uma estrutura com `sql/`, `docs/`, `api/` e `README` dedicado;
- ou continuar somente com o projeto de banco fictício e deixar o caderno financeiro como material complementar.
