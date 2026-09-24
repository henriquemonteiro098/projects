-- Database schema for travel system (travel-db)
-- Initial relational structure in PostgreSQL

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    tipo VARCHAR(30) NOT NULL DEFAULT 'cliente',
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    usuario_id INT UNIQUE REFERENCES usuarios(id) ON DELETE CASCADE,
    cpf VARCHAR(14),
    telefone VARCHAR(30),
    data_nascimento DATE,
    cidade VARCHAR(100),
    estado VARCHAR(80),
    pais VARCHAR(80),
    criado_em TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE destinos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    estado VARCHAR(100),
    cidade VARCHAR(100),
    descricao TEXT,
    continente VARCHAR(80),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE hoteis (
    id SERIAL PRIMARY KEY,
    destino_id INT NOT NULL REFERENCES destinos(id) ON DELETE CASCADE,
    nome VARCHAR(150) NOT NULL,
    categoria VARCHAR(30),
    endereco VARCHAR(255),
    estrelas SMALLINT CHECK (estrelas BETWEEN 1 AND 5),
    avaliacao_media DECIMAL(3,2) DEFAULT 0,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE acomodacoes (
    id SERIAL PRIMARY KEY,
    hotel_id INT NOT NULL REFERENCES hoteis(id) ON DELETE CASCADE,
    nome VARCHAR(120) NOT NULL,
    descricao TEXT,
    capacidade_pessoas SMALLINT NOT NULL DEFAULT 2,
    valor_diaria DECIMAL(10,2) NOT NULL,
    disponivel BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE pacotes (
    id SERIAL PRIMARY KEY,
    destino_id INT NOT NULL REFERENCES destinos(id) ON DELETE CASCADE,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    preco DECIMAL(10,2) NOT NULL,
    disponibilidade INT NOT NULL DEFAULT 0,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE pacote_inclusoes (
    id SERIAL PRIMARY KEY,
    pacote_id INT NOT NULL REFERENCES pacotes(id) ON DELETE CASCADE,
    item VARCHAR(150) NOT NULL,
    descricao TEXT
);

CREATE TABLE reservas (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL REFERENCES clientes(id) ON DELETE CASCADE,
    pacote_id INT REFERENCES pacotes(id) ON DELETE SET NULL,
    hotel_id INT REFERENCES hoteis(id) ON DELETE SET NULL,
    acomodacao_id INT REFERENCES acomodacoes(id) ON DELETE SET NULL,
    data_reserva TIMESTAMP NOT NULL DEFAULT NOW(),
    data_ida DATE,
    data_volta DATE,
    quantidade_pessoas SMALLINT NOT NULL DEFAULT 1,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'pendente',
    observacoes TEXT
);

CREATE TABLE pagamentos (
    id SERIAL PRIMARY KEY,
    reserva_id INT NOT NULL UNIQUE REFERENCES reservas(id) ON DELETE CASCADE,
    metodo_pagamento VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status_pagamento VARCHAR(30) NOT NULL DEFAULT 'pendente',
    codigo_transacao VARCHAR(150),
    data_pagamento TIMESTAMP,
    criado_em TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE passagens (
    id SERIAL PRIMARY KEY,
    reserva_id INT NOT NULL REFERENCES reservas(id) ON DELETE CASCADE,
    companhia VARCHAR(100) NOT NULL,
    origem VARCHAR(100) NOT NULL,
    destino VARCHAR(100) NOT NULL,
    data_partida TIMESTAMP,
    data_chegada TIMESTAMP,
    valor DECIMAL(10,2) NOT NULL,
    numero_voo VARCHAR(50)
);

CREATE TABLE avaliacoes (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL REFERENCES clientes(id) ON DELETE CASCADE,
    destino_id INT REFERENCES destinos(id) ON DELETE CASCADE,
    hotel_id INT REFERENCES hoteis(id) ON DELETE CASCADE,
    nota SMALLINT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    criado_em TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE noticias (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    conteudo TEXT NOT NULL,
    categoria VARCHAR(80),
    publicado_em TIMESTAMP NOT NULL DEFAULT NOW(),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE promocoes (
    id SERIAL PRIMARY KEY,
    pacote_id INT REFERENCES pacotes(id) ON DELETE CASCADE,
    titulo VARCHAR(150) NOT NULL,
    percentual_desconto DECIMAL(5,2) NOT NULL DEFAULT 0,
    data_inicio DATE,
    data_fim DATE,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

-- Indexes for frequent queries
CREATE INDEX idx_clientes_usuario_id ON clientes(usuario_id);
CREATE INDEX idx_hoteis_destino_id ON hoteis(destino_id);
CREATE INDEX idx_acomodacoes_hotel_id ON acomodacoes(hotel_id);
CREATE INDEX idx_pacotes_destino_id ON pacotes(destino_id);
CREATE INDEX idx_reservas_cliente_id ON reservas(cliente_id);
CREATE INDEX idx_reservas_pacote_id ON reservas(pacote_id);
CREATE INDEX idx_reservas_status ON reservas(status);
CREATE INDEX idx_pagamentos_status ON pagamentos(status_pagamento);
CREATE INDEX idx_avaliacoes_cliente_id ON avaliacoes(cliente_id);
CREATE INDEX idx_promocoes_pacote_id ON promocoes(pacote_id);

-- Sample basic queries
-- SELECT * FROM destinos WHERE ativo = TRUE;
-- SELECT * FROM pacotes WHERE data_inicio >= CURRENT_DATE ORDER BY preco;
-- SELECT r.*, p.status_pagamento FROM reservas r LEFT JOIN pagamentos p ON p.reserva_id = r.id WHERE r.cliente_id = 1;
