-- Criação do Banco de Dados (opcional, caso ainda não tenha criado)
CREATE DATABASE IF NOT EXISTS autogestor_db;
USE autogestor_db;

-- 1. Tabela de Clientes
-- Armazena os dados pessoais e endereço atomizado (Normalizado)
CREATE TABLE tb_clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE, -- CPF deve ser único no sistema
    email VARCHAR(100) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL, -- Ex: SP, RJ
    cep CHAR(8) NOT NULL
);

-- 2. Tabela de Telefones
-- Separação para atender a 1FN (evitar campos multivalorados)
CREATE TABLE tb_telefones (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    numero_telefone VARCHAR(20) NOT NULL,
    tipo VARCHAR(20), -- Ex: Celular, Fixo, Comercial
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

-- 3. Tabela de Produtos
-- Catálogo de peças e acessórios
CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_tabela DECIMAL(10, 2) NOT NULL, -- DECIMAL é melhor para dinheiro que FLOAT
    qtd_estoque INT NOT NULL DEFAULT 0
);

-- 4. Tabela de Vendas
-- Cabeçalho da venda (quem comprou e quando)
CREATE TABLE tb_vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numero_nota_fiscal VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

-- 5. Tabela de Itens da Venda (Associativa)
-- Resolve a relação N:N entre Vendas e Produtos
CREATE TABLE tb_itens_venda (
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario_aplicado DECIMAL(10, 2) NOT NULL, -- Preço no momento da venda
    PRIMARY KEY (id_venda, id_produto), -- Chave Composta
    FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)
);