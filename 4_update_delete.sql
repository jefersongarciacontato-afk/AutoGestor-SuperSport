-- === COMANDOS UPDATE ===

-- 1. Atualização de Preço
-- Aumentar o preço do 'Filtro de Ar Esportivo' em 10% devido à inflação
UPDATE tb_produtos 
SET preco_tabela = preco_tabela * 1.10
WHERE id_produto = 2;

-- 2. Correção de Endereço
-- O cliente João mudou de número
UPDATE tb_clientes 
SET numero = '101', logradouro = 'Rua das Bielas Novas'
WHERE id_cliente = 1;

-- 3. Atualização de Estoque (Simulação de Baixa)
-- Diminuir o estoque do produto 1 (Óleo) em 10 unidades
UPDATE tb_produtos 
SET qtd_estoque = qtd_estoque - 10 
WHERE id_produto = 1;


-- === COMANDOS DELETE ===

-- 1. Excluir um telefone antigo
-- O cliente Carlos não usa mais o telefone cadastrado
DELETE FROM tb_telefones 
WHERE id_cliente = 3 AND numero_telefone = '(21) 97777-6666';

-- 2. Excluir um item de venda (Erro de lançamento)
-- Imagine que lançamos errado o item 3 na venda 3
DELETE FROM tb_itens_venda 
WHERE id_venda = 3 AND id_produto = 3;

-- 3. Excluir uma venda cancelada
-- (Cuidado: Em bancos reais, deletaríamos os itens primeiro ou usaríamos CASCADE)
-- Vamos deletar a venda 3 (que agora está vazia pois deletamos o item acima)
DELETE FROM tb_vendas 
WHERE id_venda = 3;