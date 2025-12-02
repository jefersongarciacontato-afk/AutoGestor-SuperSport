-- 1. Inserindo Clientes
INSERT INTO tb_clientes (nome_completo, cpf, email, logradouro, numero, bairro, cidade, estado, cep) VALUES
('João da Silva', '12345678901', 'joao.silva@email.com', 'Rua das Bielas', '100', 'Centro', 'São Paulo', 'SP', '01001000'),
('Maria Oliveira', '98765432100', 'maria.auto@email.com', 'Av. dos Pistões', '500', 'Jardim Motor', 'Campinas', 'SP', '13000123'),
('Carlos Souza', '45678912300', 'carlos.souza@email.com', 'Travessa do Turbo', '25', 'Vila Veloz', 'Rio de Janeiro', 'RJ', '20000000');

-- 2. Inserindo Telefones (Vincular ao ID do Cliente recém-criado)
-- Assumindo que João é ID 1, Maria ID 2, Carlos ID 3
INSERT INTO tb_telefones (id_cliente, numero_telefone, tipo) VALUES
(1, '(11) 99999-1111', 'Celular'),
(1, '(11) 3333-2222', 'Fixo'),
(2, '(19) 98888-7777', 'Celular'),
(3, '(21) 97777-6666', 'Celular');

-- 3. Inserindo Produtos (Catálogo)
INSERT INTO tb_produtos (nome_produto, descricao, preco_tabela, qtd_estoque) VALUES
('Óleo Sintético 5W30', 'Óleo de alta performance para motores modernos', 45.90, 100),
('Filtro de Ar Esportivo', 'Filtro lavável de alto fluxo', 120.00, 30),
('Kit Pastilha de Freio', 'Pastilhas cerâmicas dianteiras', 250.00, 15),
('Pneu Sport 205/55 R16', 'Pneu de alta aderência para pista seca e molhada', 450.00, 40),
('Aditivo de Radiador', 'Aditivo orgânico concentrado', 25.00, 50);

-- 4. Inserindo Vendas (Cabeçalho da venda)
INSERT INTO tb_vendas (id_cliente, data_venda, numero_nota_fiscal) VALUES
(1, '2023-10-01 10:30:00', 'NF-001'), -- Venda para João
(2, '2023-10-02 14:00:00', 'NF-002'), -- Venda para Maria
(1, '2023-10-05 09:15:00', 'NF-003'); -- Outra venda para João

-- 5. Inserindo Itens da Venda (Detalhes: O que foi vendido em cada venda)
-- Venda 1 (João): Comprou 4 Óleos e 1 Filtro
INSERT INTO tb_itens_venda (id_venda, id_produto, quantidade, valor_unitario_aplicado) VALUES
(1, 1, 4, 45.90), -- 4x Óleo
(1, 2, 1, 120.00); -- 1x Filtro

-- Venda 2 (Maria): Comprou 2 Pneus
INSERT INTO tb_itens_venda (id_venda, id_produto, quantidade, valor_unitario_aplicado) VALUES
(2, 4, 2, 440.00); -- Note que demos um desconto, preço tabela era 450

-- Venda 3 (João): Comprou 1 Kit Pastilha
INSERT INTO tb_itens_venda (id_venda, id_produto, quantidade, valor_unitario_aplicado) VALUES
(3, 3, 1, 250.00);