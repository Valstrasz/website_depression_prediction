-- -- Creation of 'GROUPs'
-- -- Creation of 'GROUPs'
-- -- Creation of 'GROUPs'
-- -- group_superuser
-- CREATE ROLE
--     group_superuser
-- WITH
--     SUPERUSER;

-- GRANT
--     ALL PRIVILEGES
--         ON DATABASE
--             database_depression, postgres
-- TO
--     group_superuser;
-- GRANT
--     -- CONNECT, SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, REFERENCES
--     ALL PRIVILEGES
--         ON ALL TABLES IN SCHEMA public
-- TO
--     group_superuser;


-- -- group_admin
-- CREATE ROLE
--     group_admin
-- WITH
--     NOSUPERUSER
--     CREATEDB
--     NOCREATEROLE;

-- GRANT
--     ALL PRIVILEGES
--         ON DATABASE
--             database_depression
-- TO
--     group_admin;
-- GRANT
--     ALL PRIVILEGES
--         ON TABLE
--             prediction, sample
-- TO
--     group_admin;


-- -- group_engineer
-- CREATE ROLE
--     group_engineer
-- WITH
--     NOSUPERUSER
--     NOCREATEDB
--     NOCREATEROLE;

-- GRANT
--     CONNECT
--         ON DATABASE
--             database_depression
-- TO
--     group_engineer;
-- GRANT
--     SELECT, INSERT, UPDATE, DELETE
--         ON TABLE
--             prediction, sample
-- TO
--     group_engineer;


-- -- group_analyst
-- CREATE ROLE
--     group_analyst
-- WITH
--     NOSUPERUSER
--     NOCREATEDB
--     NOCREATEROLE;

-- GRANT
--     CONNECT
--         ON DATABASE
--             database_depression
-- TO
--     group_analyst;
-- GRANT
--     SELECT
--         ON TABLE
--             prediction, sample
-- TO
--     group_analyst;



-- Creation of 'USERs'
-- Creation of 'USERs'
-- Creation of 'USERs'
-- superuser
CREATE ROLE
    superuser
WITH
    LOGIN
    PASSWORD 'Root_M3!'
    SUPERUSER;

GRANT
    ALL PRIVILEGES
        ON DATABASE
            database_depression, postgres
TO
    superuser;
GRANT
    -- CONNECT, SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, REFERENCES
    ALL PRIVILEGES
        ON ALL TABLES IN SCHEMA public
TO
    superuser;


-- admin
CREATE ROLE
    admin
WITH
    LOGIN
    PASSWORD '123cba'
    NOSUPERUSER
    CREATEDB
    NOCREATEROLE;

GRANT
    ALL PRIVILEGES
        ON DATABASE
            database_depression
TO
    admin;
GRANT
    ALL PRIVILEGES
        ON TABLE
            prediction, sample
TO
    admin;


-- engineer_a
CREATE ROLE
    engineer_a
WITH
    LOGIN
    PASSWORD 'pwd_engineer_a'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE;

GRANT
    CONNECT
        ON DATABASE
            database_depression
TO
    engineer_a;
GRANT
    SELECT, INSERT, UPDATE, DELETE
        ON TABLE
            prediction, sample
TO
    engineer_a;


-- engineer_b
CREATE ROLE
    engineer_b
WITH
    LOGIN
    PASSWORD 'pwd_engineer_b'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE;

GRANT
    CONNECT
        ON DATABASE
            database_depression
TO
    engineer_b;
GRANT
    SELECT, INSERT, UPDATE, DELETE
        ON TABLE
            prediction, sample
TO
    engineer_b;


-- analyst_a
CREATE ROLE
    analyst_a
WITH
    LOGIN
    PASSWORD 'pwd_analyst_a'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE;

GRANT
    CONNECT
        ON DATABASE
            database_depression
TO
    analyst_a;
GRANT
    SELECT
        ON TABLE
            prediction, sample
TO
    analyst_a;


-- analyst_b
CREATE ROLE
    analyst_b
WITH
    LOGIN
    PASSWORD 'pwd_analyst_b'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE;

GRANT
    CONNECT
        ON DATABASE
            database_depression
TO
    analyst_b;
GRANT
    SELECT
        ON TABLE
            prediction, sample
TO
    analyst_b;