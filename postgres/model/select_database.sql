SELECT
    "CodigoDoProduto",
    "NomeDoProduto",
    "CodigoDoFornecedor",
    "CodigoDaCategoria",
    "PrecoUnitario"::money::numeric::float8 AS "PrecoUnitario",
    CASE 
        WHEN "UnidadesEmEstoque" < "NivelDeReposicao" THEN TRUE
        ELSE FALSE
    END AS "PrecisaReposicao"
FROM "Produtos"

SELECT * FROM "Pedidos"
SELECT * FROM "Detalhes do Pedido"

SELECT  
        ped."CodigoDoCliente",
        ped."CodigoDoFuncionario",
        ped."DataDoPedido",
        ped."DataDeEntrega",
        ped."DataDeEnvio",
        ped."NumeroDoPedido",
        ped."Frete",
        ped."PaisDeDestino",
        ped."Via",
        dp."CodigoDoProduto",
        dp."PrecoUnitario",
        (prod."PrecoUnitario"::money::numeric::float8 - dp."PrecoUnitario") AS "divergenciaPrecoVenda",
        (ped."DataDeEntrega" - ped."DataDoPedido") AS "diasParaEntrega",
        (ped."DataDeEnvio" - ped."DataDoPedido") AS "diasParaExpedicao",
        dp."Desconto" AS "desconto%",
        (dp."Desconto"*dp."PrecoUnitario") AS "descontoR$",
        (dp."PrecoUnitario" * dp."Quantidade" - dp."Desconto") AS "valorVenda"

FROM "Pedidos" AS ped 
INNER JOIN "Detalhes do Pedido" AS dp ON ped."NumeroDoPedido" = dp."NumeroDoPedido" 
INNER JOIN "Produtos" AS prod ON dp."CodigoDoProduto" = prod."CodigoDoProduto" 