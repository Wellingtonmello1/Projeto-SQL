alter session set "_ORACLE_SCRIPT" = true;

-- criando conexao de usuario e dando espaco padrao para o usario

create user Wellington identified by wells default tablespace users;


-- dando privilegios de acesso 

grant connect, RESOURCE to Wellington;

GRANT ALL PRIVILEGES TO Wellington;
