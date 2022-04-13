*** Settings ***

Library  SeleniumLibrary


*** Variables ***
#Dados do teste

${EmailUsuario}  rehsousa.24@gmail.com 
${SenhaUsuario}  senhateste123    

#Variáveis de Configuração
${URL}      https://www.linkedin.com/login

${Browser}      chrome

#Elementos
${Input_Email}  //input[@id="username"]
${Input_Senha}  //input[@id="password"]
${Button_Entrar}  //*[@id="organic-div"]/form/div[3]/button
${Verifica_Erro}  //*[@id="error-for-password"]

*** Keywords ***

Dado que eu acesse a página de login do Linkedin
  Open Browser  ${URL}  ${Browser}

E preencho incorretamente o campo senha
    Input Text  ${Input_Email}  ${EmailUsuario}
    Input Password  ${Input_Senha}  ${SenhaUsuario}

Quando eu clicar em entrar
    Click Button  ${Button_Entrar} 

Então uma mensagem de erro deve ser exibida
    Wait Until Element Is Visible  ${Verifica_Erro}

E o site deverá ser fechado
    Close Browser