-- CREATE DATABASE ${DB_NAME};
-- CREATE USER ${DB_USERNAME} WITH PASSWORD ${DB_PASSWORD};
-- GRANT ALL PRIVILEGES ON DATABASE ${DB_NAME} to ${DB_USERNAME};

<<<<<<< HEAD


=======
>>>>>>> a99e1122646bb53c4f86ee423ec21ae9a453acf5
\set subdir_parts ./parts

-- TYPE creation
\ir :subdir_parts/init_db_type.sql



-- TABLE creation
\ir :subdir_parts/init_db_table.sql



-- INSERT samples
\ir :subdir_parts/init_db_insert.sql



-- CREATE roles (groups / users)
\ir :subdir_parts/init_db_role.sql