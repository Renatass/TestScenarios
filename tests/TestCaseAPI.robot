*** Settings ***
Documentation       Documentação da API: https://www.petfinder.com/developers/v2/docs/#using-the-api
Resource            ../resources/BDDImplementation.robot

*** Test Case ***
Cenário 01: Consulta animal existente
    Dado que esteja conectado no webservice de consulta 
    Quando o usuário consultar o ID "55274426"
    Então deve ser mostrado o tipo do animal "Dog"
    E deve ser mostrada a raça "Husky"
    E deve ser mostrada a idade "Adult"
    E deve ser mostrada o genero "Female"
    E deve ser mostrado o nome "Aksana"

Cenário 02: Consulta animal inexistente
    Dado que esteja conectado no webservice de consulta
    Quando o usuário consultar o ID "00000"
    Então nenhum dado deve ser mostrado para o ID "00000"