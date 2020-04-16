# ETL Northwind

## About this Project

Data integration on the Northwind dataset. Conducted in the Business Intelligence discipline.

## Getting Started

### Installing

1. Clone this repository

1. Up the docker

    `
    docker-compose up -d
    `
1. Create the transactional database (Northwind)

    `
    localhost:8081
    `
    
    `
    Sistema: Postgres
    `
    
    `
    Servidor: db_postgres
    `
    
    `
    Usuário: postgres
    `
    
    `
    Senha: root
    `
1. Restore the backup
    
    `
    cat ./postgres/dump/Northwind\ -\ POSTGRES.backup  | docker exec -i pdi_db_postgres_1 pg_restore -v -h localhost -U postgres -d Northwind 
    `
1. Create the dimensional database (DM_Northwind)

1. Run the SQL

    `
    cat ./postgres/model/modelo\ dimensional_postgre.sql | docker exec -i pdi_db_postgres_1 psql -U postgres -d DM_Northwind -a 
    `
