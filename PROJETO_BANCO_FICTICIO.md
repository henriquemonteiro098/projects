# Projeto de banco de dados bancário fictício

> Documento de estudo para usar com o GitHub Copilot no VS Code.
>
> Este projeto é **fictício e educacional**. Ele não processa dinheiro real, não substitui um sistema bancário e não deve ser usado em produção sem revisão de segurança, privacidade, auditoria e regras regulatórias.

## 1. Objetivo

Transformar os conceitos do material sobre o valor do dinheiro no tempo em um banco de dados PostgreSQL simples, permitindo cadastrar clientes, contas, valores guardados e transferências.

O sistema deve ajudar a estudar:

- inflação, poder de compra e rentabilidade real;
- diferença entre poupar e usar um produto financeiro;
- juros simples e compostos em simulações;
- saldo, entradas, saídas e transferências;
- integridade referencial e transações SQL;
- boas práticas básicas de segurança.

O sistema **não** fará recomendação personalizada de investimento, não informará “o melhor investimento” e não usará taxas reais como promessa de rendimento.

## 2. Escopo inicial

### Cadastro obrigatório do usuário

- `nome`
- `email`
- `senha` — armazenada somente como hash, nunca em texto puro

### Dados financeiros fictícios

- conta bancária vinculada ao usuário;
- `valor_guardado`, representado pelo saldo da conta;
- histórico de depósitos e retiradas;
- histórico de transferências entre contas;
- descrição e status de cada operação;
- simulação opcional de juros compostos, separada do saldo real fictício.

## 3. Decisões de modelagem

1. Um usuário pode ter uma ou mais contas.
2. O saldo não deve ser alterado diretamente por uma tela: ele deve ser atualizado por operações registradas em uma transação.
3. Uma transferência possui conta de origem e conta de destino.
4. Transferência para a mesma conta deve ser proibida.
5. O valor de qualquer operação deve ser maior que zero.
6. Senha não será armazenada diretamente. O campo deve receber um hash produzido pela aplicação, por exemplo com Argon2 ou bcrypt.
7. `NUMERIC(14,2)` será usado para valores monetários, evitando `FLOAT`.
8. O banco usará `CHECK`, `UNIQUE`, chaves estrangeiras e transações para proteger os dados.
9. As tabelas de movimentação serão históricas: uma transferência não deve ser apagada para “corrigir” o saldo. Em um sistema real, seria usado estorno e auditoria.

## 4. Modelo de relacionamento

```text
usuarios 1 ─── N contas
contas   1 ─── N movimentacoes
contas   1 ─── N transferencias como origem
contas   1 ─── N transferencias como destino
usuarios 1 ─── N simulacoes_juros
```

## 5. Estrutura do banco de dados

Crie um arquivo chamado `01_schema.sql` e execute-o em um PostgreSQL local.

```sql
CREATE DATABASE banco_ficticio;
```

Depois de conectar ao banco `banco_ficticio`, execute:

```sql
CREATE TABLE usuarios (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(254) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    atualizado_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT ck_usuario_nome CHECK (length(trim(nome)) >= 2),
    CONSTRAINT ck_usuario_email CHECK (position('@' IN email) > 1)
);

CREATE TABLE contas (
    id BIGSERIAL PRIMARY KEY,
    usuario_id BIGINT NOT NULL REFERENCES usuarios(id) ON DELETE RESTRICT,
    numero VARCHAR(20) NOT NULL UNIQUE,
    tipo VARCHAR(20) NOT NULL DEFAULT 'corrente',
    saldo NUMERIC(14,2) NOT NULL DEFAULT 0,
    moeda CHAR(3) NOT NULL DEFAULT 'BRL',
    ativa BOOLEAN NOT NULL DEFAULT TRUE,
    criada_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT ck_conta_tipo CHECK (tipo IN ('corrente', 'poupanca', 'estudo')),
    CONSTRAINT ck_conta_saldo CHECK (saldo >= 0),
    CONSTRAINT ck_conta_moeda CHECK (moeda = 'BRL')
);

CREATE TABLE movimentacoes (
    id BIGSERIAL PRIMARY KEY,
    conta_id BIGINT NOT NULL REFERENCES contas(id) ON DELETE RESTRICT,
    tipo VARCHAR(20) NOT NULL,
    valor NUMERIC(14,2) NOT NULL,
    saldo_apos NUMERIC(14,2) NOT NULL,
    descricao VARCHAR(255),
    criado_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT ck_movimentacao_tipo CHECK (tipo IN ('deposito', 'retirada', 'transferencia_entrada', 'transferencia_saida')),
    CONSTRAINT ck_movimentacao_valor CHECK (valor > 0),
    CONSTRAINT ck_movimentacao_saldo CHECK (saldo_apos >= 0)
);

CREATE TABLE transferencias (
    id BIGSERIAL PRIMARY KEY,
    conta_origem_id BIGINT NOT NULL REFERENCES contas(id) ON DELETE RESTRICT,
    conta_destino_id BIGINT NOT NULL REFERENCES contas(id) ON DELETE RESTRICT,
    valor NUMERIC(14,2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'concluida',
    descricao VARCHAR(255),
    criada_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    concluida_em TIMESTAMPTZ,
    CONSTRAINT ck_transferencia_contas_diferentes CHECK (conta_origem_id <> conta_destino_id),
    CONSTRAINT ck_transferencia_valor CHECK (valor > 0),
    CONSTRAINT ck_transferencia_status CHECK (status IN ('pendente', 'concluida', 'cancelada'))
);

CREATE TABLE simulacoes_juros (
    id BIGSERIAL PRIMARY KEY,
    usuario_id BIGINT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    valor_inicial NUMERIC(14,2) NOT NULL,
    taxa_mensal NUMERIC(8,5) NOT NULL,
    quantidade_meses INTEGER NOT NULL,
    regime VARCHAR(12) NOT NULL,
    valor_final NUMERIC(14,2) NOT NULL,
    criada_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT ck_simulacao_valor CHECK (valor_inicial > 0),
    CONSTRAINT ck_simulacao_taxa CHECK (taxa_mensal >= 0),
    CONSTRAINT ck_simulacao_meses CHECK (quantidade_meses > 0),
    CONSTRAINT ck_simulacao_regime CHECK (regime IN ('simples', 'compostos')),
    CONSTRAINT ck_simulacao_valor_final CHECK (valor_final >= valor_inicial)
);

CREATE INDEX idx_contas_usuario_id ON contas(usuario_id);
CREATE INDEX idx_movimentacoes_conta_id_data ON movimentacoes(conta_id, criado_em DESC);
CREATE INDEX idx_transferencias_origem ON transferencias(conta_origem_id, criada_em DESC);
CREATE INDEX idx_transferencias_destino ON transferencias(conta_destino_id, criada_em DESC);
CREATE INDEX idx_transferencias_status ON transferencias(status);
CREATE INDEX idx_simulacoes_usuario_id ON simulacoes_juros(usuario_id);
```

## 6. Dados de teste

Crie `02_seed.sql`:

```sql
INSERT INTO usuarios (nome, email, senha_hash)
VALUES
    ('Ana Souza', 'ana@exemplo.test', 'HASH_GERADO_PELA_APLICACAO_ANA'),
    ('Bruno Lima', 'bruno@exemplo.test', 'HASH_GERADO_PELA_APLICACAO_BRUNO'),
    ('Carla Mendes', 'carla@exemplo.test', 'HASH_GERADO_PELA_APLICACAO_CARLA');

INSERT INTO contas (usuario_id, numero, tipo, saldo)
SELECT id, '0001-000001', 'estudo', 1000.00
FROM usuarios WHERE email = 'ana@exemplo.test';

INSERT INTO contas (usuario_id, numero, tipo, saldo)
SELECT id, '0001-000002', 'estudo', 500.00
FROM usuarios WHERE email = 'bruno@exemplo.test';

INSERT INTO contas (usuario_id, numero, tipo, saldo)
SELECT id, '0001-000003', 'estudo', 250.00
FROM usuarios WHERE email = 'carla@exemplo.test';

-- Registre também a entrada inicial no histórico.
INSERT INTO movimentacoes (conta_id, tipo, valor, saldo_apos, descricao)
SELECT id, 'deposito', saldo, saldo, 'Saldo inicial fictício'
FROM contas;
```

> Em uma aplicação real, não insira hashes inventados. Gere o hash no backend usando uma biblioteca segura. Para o exercício SQL, os valores acima são apenas marcadores.

## 7. Operações básicas

### Criar um depósito

```sql
BEGIN;

UPDATE contas
SET saldo = saldo + 200.00
WHERE id = 1 AND ativa = TRUE;

INSERT INTO movimentacoes (conta_id, tipo, valor, saldo_apos, descricao)
SELECT id, 'deposito', 200.00, saldo, 'Depósito de estudo'
FROM contas
WHERE id = 1;

COMMIT;
```

### Criar uma retirada com validação

```sql
BEGIN;

UPDATE contas
SET saldo = saldo - 100.00
WHERE id = 1
  AND ativa = TRUE
  AND saldo >= 100.00;

-- A aplicação deve verificar se uma linha foi atualizada.
-- Se não foi, execute ROLLBACK: saldo insuficiente ou conta inválida.

INSERT INTO movimentacoes (conta_id, tipo, valor, saldo_apos, descricao)
SELECT id, 'retirada', 100.00, saldo, 'Retirada de estudo'
FROM contas
WHERE id = 1;

COMMIT;
```

### Transferência segura entre duas contas

A operação deve ser executada como uma única transação. O backend deve verificar a quantidade de linhas atualizadas em cada `UPDATE`. Se qualquer etapa falhar, faça `ROLLBACK`.

```sql
BEGIN;

-- O bloqueio evita que duas transferências usem o mesmo saldo ao mesmo tempo.
SELECT id, saldo
FROM contas
WHERE id IN (1, 2)
ORDER BY id
FOR UPDATE;

UPDATE contas
SET saldo = saldo - 75.50
WHERE id = 1
  AND ativa = TRUE
  AND saldo >= 75.50;

UPDATE contas
SET saldo = saldo + 75.50
WHERE id = 2
  AND ativa = TRUE;

INSERT INTO transferencias (
    conta_origem_id,
    conta_destino_id,
    valor,
    status,
    descricao,
    concluida_em
)
VALUES (1, 2, 75.50, 'concluida', 'Transferência de estudo', NOW());

INSERT INTO movimentacoes (conta_id, tipo, valor, saldo_apos, descricao)
SELECT id, 'transferencia_saida', 75.50, saldo, 'Transferência para conta 2'
FROM contas WHERE id = 1;

INSERT INTO movimentacoes (conta_id, tipo, valor, saldo_apos, descricao)
SELECT id, 'transferencia_entrada', 75.50, saldo, 'Transferência da conta 1'
FROM contas WHERE id = 2;

COMMIT;
```

## 8. Consultas para praticar

### Usuários e respectivas contas

```sql
SELECT
    u.nome,
    u.email,
    c.numero,
    c.tipo,
    c.saldo,
    c.moeda
FROM usuarios u
JOIN contas c ON c.usuario_id = u.id
WHERE u.ativo = TRUE
ORDER BY u.nome;
```

### Histórico de uma conta

```sql
SELECT
    m.criado_em,
    m.tipo,
    m.valor,
    m.saldo_apos,
    m.descricao
FROM movimentacoes m
WHERE m.conta_id = 1
ORDER BY m.criado_em DESC, m.id DESC;
```

### Transferências enviadas e recebidas

```sql
SELECT
    t.id,
    origem.numero AS conta_origem,
    destino.numero AS conta_destino,
    t.valor,
    t.status,
    t.criada_em,
    t.descricao
FROM transferencias t
JOIN contas origem ON origem.id = t.conta_origem_id
JOIN contas destino ON destino.id = t.conta_destino_id
WHERE t.conta_origem_id = 1
   OR t.conta_destino_id = 1
ORDER BY t.criada_em DESC;
```

### Total guardado por usuário

```sql
SELECT
    u.id,
    u.nome,
    COALESCE(SUM(c.saldo), 0)::NUMERIC(14,2) AS valor_guardado
FROM usuarios u
LEFT JOIN contas c ON c.usuario_id = u.id AND c.ativa = TRUE
GROUP BY u.id, u.nome
ORDER BY valor_guardado DESC;
```

### Conferência de consistência

O total do saldo atual deve ser compatível com as movimentações. Esta consulta ajuda a encontrar contas cujo último `saldo_apos` não coincide com o saldo atual.

```sql
WITH ultima_movimentacao AS (
    SELECT DISTINCT ON (conta_id)
        conta_id,
        saldo_apos
    FROM movimentacoes
    ORDER BY conta_id, criado_em DESC, id DESC
)
SELECT
    c.id,
    c.numero,
    c.saldo AS saldo_da_conta,
    u.saldo_apos AS saldo_da_ultima_movimentacao
FROM contas c
JOIN ultima_movimentacao u ON u.conta_id = c.id
WHERE c.saldo <> u.saldo_apos;
```

## 9. Simulação de juros compostos

A tabela `simulacoes_juros` é didática e não altera o saldo da conta. Para o exemplo do material, com R$ 1.000, taxa de 5% ao mês e 6 meses:

```sql
SELECT
    1000.00 AS valor_inicial,
    1000.00 * POWER(1 + 0.05, 6) AS juros_compostos,
    1000.00 + (1000.00 * 0.05 * 6) AS juros_simples;
```

Resultado aproximado:

- juros simples: `R$ 1.300,00`;
- juros compostos: `R$ 1.340,10`.

Fórmulas:

```text
Juros simples:   M = P × (1 + i × n)
Juros compostos: M = P × (1 + i)^n

P = principal
M = montante
 i = taxa por período em decimal
 n = quantidade de períodos
```

Esses exemplos são matemáticos. Não representam promessa de rendimento, taxa disponível ou recomendação de produto.

## 10. Como usar com o Copilot no VS Code

1. Instale PostgreSQL e uma extensão de banco de dados no VS Code.
2. Crie uma pasta chamada `banco-ficticio`.
3. Crie os arquivos `01_schema.sql`, `02_seed.sql`, `03_consultas.sql` e `README.md`.
4. Cole o esquema neste documento em `01_schema.sql`.
5. Execute primeiro o `CREATE DATABASE` e depois o restante do esquema conectado ao banco criado.
6. Execute o seed.
7. Teste uma consulta por vez.
8. Faça uma alteração pequena, execute, observe o resultado e só então avance.
9. Use o Copilot para explicar o SQL, mas confira cada alteração manualmente.

### Prompts recomendados para o Copilot

```text
Explique este comando SQL linha por linha, sem alterar o código. Diga também quais restrições protegem a integridade dos dados.
```

```text
Revise este esquema PostgreSQL como exercício de iniciante. Procure problemas em chaves estrangeiras, valores monetários, NULL, concorrência e segurança. Não reescreva tudo: liste os problemas por prioridade.
```

```text
Crie uma função PostgreSQL para transferência entre duas contas usando transação, bloqueio FOR UPDATE, validação de saldo e rollback em caso de erro. Explique cada etapa e não use dinheiro real.
```

```text
Crie uma API REST didática em [linguagem escolhida] com endpoints para cadastrar usuário, consultar saldo, depositar, retirar e transferir. Use senha com hash, queries parametrizadas, validação de entrada e tratamento de erros. Não coloque segredos no código.
```

```text
Escreva testes para garantir que: saldo não fique negativo, transferência para a própria conta falhe, transferência sem saldo faça rollback, email seja único e uma transferência gere duas movimentações.
```

```text
Relia sua resposta anterior. Classifique cada afirmação como (F) implementada no código, (I) inferência ou (X) não implementada. Remova ou corrija as afirmações X.
```

## 11. Exercícios progressivos

### Nível 1 — SQL básico

- cadastrar cinco usuários;
- criar uma conta para cada usuário;
- listar contas com saldo acima de R$ 500;
- ordenar usuários pelo valor guardado;
- consultar todas as transferências de uma conta.

### Nível 2 — regras de negócio

- impedir retirada maior que o saldo;
- impedir transferência para conta inativa;
- impedir transferência para a própria conta;
- impedir valores zero ou negativos;
- criar uma consulta de extrato por período.

### Nível 3 — segurança e aplicação

- trocar `senha_hash` fictício por hash real no backend;
- usar queries parametrizadas;
- criar autenticação sem retornar `senha_hash`;
- criar logs de auditoria;
- escrever testes automatizados;
- usar variáveis de ambiente para credenciais;
- criar migrations em vez de editar o banco manualmente.

### Nível 4 — conexão com o tema financeiro

- criar uma tabela de metas de poupança;
- comparar valor nominal e valor corrigido por uma taxa de inflação de exercício;
- simular juros simples e compostos sem misturar a simulação com o saldo real;
- registrar a data, a taxa informada e a fonte de qualquer taxa usada;
- documentar que IPCA, Selic e rentabilidade real são conceitos diferentes.

## 12. Segurança e limites

- Nunca salve senha em texto puro.
- Nunca coloque senha do banco, token ou chave de API no Git.
- Use `CREATE USER` com permissões mínimas para a aplicação.
- Use HTTPS na API real.
- Valide entradas no backend e no banco.
- Use parâmetros, nunca concatene strings SQL com dados do usuário.
- Não exponha `senha_hash` em endpoints ou consultas públicas.
- Considere `NUMERIC`, não `FLOAT`, para dinheiro.
- Não confunda saldo, poupança como ato de guardar e caderneta de poupança como produto.
- Não use este projeto para movimentações reais.

## 13. Checklist de conclusão

- [ ] PostgreSQL instalado e banco `banco_ficticio` criado.
- [ ] Tabelas criadas sem erro.
- [ ] Dados de teste inseridos.
- [ ] Consulta de saldo executada.
- [ ] Depósito registrado em `movimentacoes`.
- [ ] Retirada com saldo insuficiente recusada.
- [ ] Transferência concluída atomicamente.
- [ ] Transferência inválida revertida com `ROLLBACK`.
- [ ] Senha nunca aparece em texto puro.
- [ ] Simulação de juros separada do saldo da conta.
- [ ] Cada mudança foi explicada e testada pelo estudante.

## 14. Relação com o material de referência

O README do projeto usa fontes oficiais para estudar inflação, IPCA, Selic, juros compostos, liquidez, risco e vieses comportamentais. Neste banco fictício, esses conceitos são usados como contexto de aprendizagem:

- `contas.saldo` representa apenas um saldo didático, não uma aplicação real;
- `movimentacoes` mostra como entradas e saídas alteram o saldo;
- `transferencias` representa o fluxo de dinheiro entre contas;
- `simulacoes_juros` permite reproduzir a diferença entre juros simples e compostos;
- `valor_guardado` deve ser entendido como a soma dos saldos de contas ativas;
- nenhuma tabela autoriza recomendação de investimento, previsão de Selic ou promessa de ganho real.

## 15. Próxima etapa sugerida

Comece somente pelo SQL. Depois faça uma pequena API local. Por último, crie uma interface. Em cada etapa, peça ao Copilot explicações e testes, mas mantenha você como responsável por revisar o código, executar os comandos e entender os resultados.
