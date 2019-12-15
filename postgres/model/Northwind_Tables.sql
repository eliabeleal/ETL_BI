-- Adminer 4.7.5 PostgreSQL dump

CREATE TABLE "public"."Categorias" (
    "CodigoDaCategoria" integer NOT NULL,
    "NomeDaCategoria" character(15),
    "Descricao" character(300),
    CONSTRAINT "CATPK" PRIMARY KEY ("CodigoDaCategoria")
) WITH (oids = false);


CREATE TABLE "public"."Clientes" (
    "CodigoDoCliente" character(5) NOT NULL,
    "NomeDaEmpresa" character(40),
    "NomeDoContato" character(30),
    "CargoDoContato" character(30),
    "Endereco" character(60),
    "Cidade" character(15),
    "Regiao" character(15),
    "CEP" character(10),
    "Pais" character(15),
    "Telefone" character(24),
    "Fax" character(24),
    "Obs" character varying(4)[],
    "PaisISO" character(10)
) WITH (oids = false);

CREATE TABLE "public"."Fornecedores" (
    "CodigoDoFornecedor" integer NOT NULL,
    "NomeDaEmpresa" character(40),
    "NomeDoContato" character(30),
    "CargoDoContato" character(30),
    "Endereco" character(60),
    "Cidade" character(15),
    "Regiao" character(15),
    "CEP" character(10),
    "Pais" character(15),
    "Telefone" character(24),
    "Fax" character(24),
    "HomePage" character(300),
    CONSTRAINT "FORPK" PRIMARY KEY ("CodigoDoFornecedor")
) WITH (oids = false);

CREATE TABLE "public"."Funcionarios" (
    "CodigoDoFuncionario" integer NOT NULL,
    "Sobrenome" character(20),
    "Nome" character(10),
    "Cargo" character(30),
    "Tratamento" character(30),
    "DataDeNascimento" date,
    "DataDeContratacao" date,
    "Endereco" character(60),
    "Cidade" character(15),
    "Regiao" character(15),
    "CEP" character(10),
    "Pais" character(15),
    "TelefoneResidencial" character(24),
    "Ramal" character(4),
    "Foto" character(255),
    "Observacoes" character(600),
    "Supervisor" integer,
    CONSTRAINT "FUNPK" PRIMARY KEY ("CodigoDoFuncionario")
) WITH (oids = false);

CREATE TABLE "public"."Transportadoras" (
    "CodigoDaTransportadora" integer NOT NULL,
    "NomeDaEmpresa" character(40),
    "Telefone" character(24),
    CONSTRAINT "TRASK" PRIMARY KEY ("CodigoDaTransportadora")
) WITH (oids = false);

CREATE TABLE "public"."Pedidos" (
    "NumeroDoPedido" integer NOT NULL,
    "CodigoDoCliente" character(5),
    "CodigoDoFuncionario" integer,
    "DataDoPedido" date,
    "DataDeEntrega" date,
    "DataDeEnvio" date,
    "Via" integer,
    "Frete" numeric(14,2),
    "NomeDoDestinatario" character(40),
    "EnderecoDoDestinatario" character(60),
    "CidadeDeDestino" character(15),
    "RegiaoDeDestino" character(15),
    "CEPdeDestino" character(10),
    "PaisDeDestino" character(15),
    CONSTRAINT "PEDPK" PRIMARY KEY ("NumeroDoPedido"),
    CONSTRAINT "PEDFUN" FOREIGN KEY ("CodigoDoFuncionario") REFERENCES "Funcionarios"("CodigoDoFuncionario") NOT DEFERRABLE,
    CONSTRAINT "PEDTRA" FOREIGN KEY ("Via") REFERENCES "Transportadoras"("CodigoDaTransportadora") NOT DEFERRABLE
) WITH (oids = false);


CREATE TABLE "public"."Produtos" (
    "CodigoDoProduto" integer NOT NULL,
    "NomeDoProduto" character(40),
    "CodigoDoFornecedor" integer,
    "CodigoDaCategoria" integer,
    "QuantidadePorUnidade" character(25),
    "PrecoUnitario" money,
    "UnidadesEmEstoque" smallint,
    "UnidadesPedidas" smallint,
    "NivelDeReposicao" smallint,
    "Descontinuado" character(10),
    CONSTRAINT "PRODPK" PRIMARY KEY ("CodigoDoProduto"),
    CONSTRAINT "PRODCAT" FOREIGN KEY ("CodigoDaCategoria") REFERENCES "Categorias"("CodigoDaCategoria") NOT DEFERRABLE,
    CONSTRAINT "PRODFOR" FOREIGN KEY ("CodigoDoFornecedor") REFERENCES "Fornecedores"("CodigoDoFornecedor") NOT DEFERRABLE
) WITH (oids = false);


CREATE TABLE "public"."Detalhes do Pedido" (
    "NumeroDoPedido" integer NOT NULL,
    "CodigoDoProduto" integer NOT NULL,
    "PrecoUnitario" numeric(14,2),
    "Quantidade" smallint,
    "Desconto" numeric(14,2),
    CONSTRAINT "DETPK" PRIMARY KEY ("NumeroDoPedido", "CodigoDoProduto"),
    CONSTRAINT "DETPEDPRO" FOREIGN KEY ("CodigoDoProduto") REFERENCES "Produtos"("CodigoDoProduto") NOT DEFERRABLE
) WITH (oids = false);



-- 2019-12-14 19:46:23.417163+00
