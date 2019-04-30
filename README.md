# doctor_register_api

INSTRUÇÕES

1. Clonar o projeto;
2. Executar o comando 'docker-compose up';
3. O projeto ficará exposto em 'localhost:4000' por padrão;
4. Executar o comando 'docker exec doctor_register_api rake db:create' para criar as bases de dados da aplicação;
5. Executar o comando 'docker exec doctor_register_api rake db:migrate' para gerar as tabelas do banco de dados da aplicação;
6. Executar o comando 'docker exec doctor_register_api rake db:seed' para popular a tabela de especialidades;

Sua aplicação está configurada!
