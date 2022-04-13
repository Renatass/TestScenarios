*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variable ***
${HOST}         https://api.petfinder.com/v2/animals
${APP_KEY}      
${APP_SECRET}   
${url}         https://api.petfinder.com/v2/animals

*** Keywords ***
#### STEPS
Conecta ao WebService
    Create Session      consultaID     ${url}    disable_warnings=True

Realiza a requisição do ID  
    [Arguments]         ${ID_DESEJADO}
    Create Session    petfinder  https://api.petfinder.com/v2/animals
    ${headers}=    Create Dictionary  Content-Type=application/json  Authorization=Bearer 
    ${RESPOSTA}=   GET On Session  petfinder  /${ID_DESEJADO}  headers=${headers}  expected_status=200
    Set Test Variable   ${RESPOSTA}

Confere o status code   
    [Arguments]     ${STATUS_ESPERADO}
    Should Be Equal As Strings   ${RESPOSTA.status_code}  ${STATUS_ESPERADO}
    Log             Status Code Retornado: ${RESPOSTA.status_code} -- Status Code Esperado: ${STATUS_ESPERADO}

Confere o tipo do animal       
    [Arguments]         ${ANIMAL}
    ${type}=    Get From Dictionary  ${RESPOSTA.json()}  type
    Should Be Equal  ${type}  ${ANIMAL} 

Confere a raça       
    [Arguments]         ${RACA}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  raca   ${RACA} 

Confere a idade   
    [Arguments]         ${IDADE}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  idade   ${IDADE}

Confere o genero  
    [Arguments]         ${GENERO}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  genero   ${GENERO}

Confere o nome 
    [Arguments]         ${NOME}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  nome   ${NOME}
   
Confere Mensagem de Erro 
    [Arguments]         ${ERROR_MSG}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  error   ${ERROR_MSG}
