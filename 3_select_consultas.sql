-- 1. Consulta Simples com WHERE e ORDER BY
-- Listar produtos com estoque baixo (menor que 40), ordenado pelo preço
SELECT nome_produto, qtd_estoque, preco_tabela 
FROM tb_produtos 
WHERE qtd_estoque < 40 
ORDER BY preco_tabela DESC;

-- 2. Consulta com LIMIT
-- Mostrar os 3 produtos mais caros da loja
SELECT nome_produto, preco_tabela 
FROM tb_produtos 
ORDER BY preco_tabela DESC 
LIMIT 3;

-- 3. Consulta com JOIN (Relatório de Vendas)
-- Quem comprou o quê? (Cliente -> Venda -> Item -> Produto)
SELECT 
    c.nome_completo AS Cliente,
    v.numero_nota_fiscal AS NF,
    v.data_venda AS Data,
    p.nome_produto AS Produto,
    i.quantidade AS Qtd,
    i.valor_unitario_aplicado AS Valor_Pago
FROM tb_clientes c
JOIN tb_vendas v ON c.id_cliente = v.id_cliente
JOIN tb_itens_venda i ON v.id_venda = i.id_venda
JOIN tb_produtos p ON i.id_produto = p.id_produto;

-- 4. Consulta com Função de Agregação (Total gasto por cliente)
SELECT 
    c.nome_completo,
    SUM(i.quantidade * i.valor_unitario_aplicado) AS Total_Gasto
FROM tb_clientes c
JOIN tb_vendas v ON c.id_cliente = v.id_cliente
JOIN tb_itens_venda i ON v.id_venda = i.id_venda
GROUP BY c.id_cliente;