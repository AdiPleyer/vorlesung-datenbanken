--- Table with vectors
--- see also: https://github.com/pgvector/pgvector 

CREATE TABLE items (
    id bigserial PRIMARY KEY, 
    embedding vector(3)
    );

--- Non-First-Normal-Form approach - only if you do not have vectors in database

CREATE TABLE items (
    id bigserial PRIMARY KEY, 
    embedding string
    );

--- 123, '453.6, 6345.5, 75643.0'


--- purely relational approach - not really useful...

CREATE TABLE items (
    id bigserial PRIMARY KEY, 
    );

--- 123, ....

CREATE TABLE vectorpositions (
    id bigserial,
    idv int,
    vectorposition double,
    PRIMARY KEY: id, idv
    );

--- 123, 1, 453.6
--- 123, 2, 6345.5
--- 123, 3, 75643.0

