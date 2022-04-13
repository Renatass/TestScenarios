*** Settings ***
Documentation       Desafio 1 do testCase
Resource            ../resources/StepsLogin.robot           
  
  
*** Test Cases ***

Cenário 1: Login com credencial incorreta
    Dado que eu acesse a página de login do Linkedin
    E preencho incorretamente o campo senha
    Quando eu clicar em entrar
    Então uma mensagem de erro deve ser exibida
    E o site deverá ser fechado