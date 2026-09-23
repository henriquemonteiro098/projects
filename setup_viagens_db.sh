#!/usr/bin/env bash
set -euo pipefail
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

mkdir -p \
  database/schema \
  database/constraints \
  database/seed \
  database/migration \
  docs \
  diagrams

# Files
: > README.md
: > database/schema/001_usuarios.sql
: > database/schema/002_destinos.sql
: > database/schema/003_reservas.sql
: > database/constraints/foreign_keys.sql
: > database/constraints/indexes.sql
: > database/migration/001_initial_schema.sql
: > docs/dicionario_dados.md
: > docs/modelo_relacional.md
: > docs/melhorias_recomendadas.md
: > diagrams/MER.md

if [ ! -d .git ]; then
  git init
fi

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")"
if [ "$CURRENT_BRANCH" != "estrutura-banco" ]; then
  if git show-ref --verify --quiet refs/heads/estrutura-banco; then
    git checkout estrutura-banco
  else
    git checkout -b estrutura-banco
  fi
fi

if ! git diff --quiet --cached --exit-code >/dev/null 2>&1 || ! git diff --quiet --exit-code >/dev/null 2>&1; then
  git add .
  git commit -m "Estrutura inicial do banco viagens" || true
fi

printf '\nSetup concluído em %s\n' "$PROJECT_DIR"
