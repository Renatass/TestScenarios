*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variable ***
${HOST}         https://api.petfinder.com/v2/animals
${APP_KEY}      vhK0ycQCrHVtY09bmoHHfXX1KRpgbAhrCB7gl26YTWHQ8vku4F
${APP_SECRET}   IPo7Gh0KFNfodF6uankARwidpEi4m23qKNh0eeLi
${url}         https://api.petfinder.com/v2/animals

*** Keywords ***
#### STEPS
Conecta ao WebService
    Create Session      consultaID     ${url}    disable_warnings=True

Realiza a requisição do ID  
    [Arguments]         ${ID_DESEJADO}
    Create Session    petfinder  https://api.petfinder.com/v2/animals
    ${headers}=    Create Dictionary  Content-Type=application/json  Authorization=Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJ2aEsweWNRQ3JIVnRZMDlibW9ISGZYWDFLUnBnYkFockNCN2dsMjZZVFdIUTh2a3U0RiIsImp0aSI6Ijg4Njc5YjMzOGRkYWQ1MzE1ZjkxMmM4ZDdjMmRhN2VhNTYwODZiYjMyMDMwNjZjMTgzMjEyMTIyODEwOWFhYTA0ZDlkNjExOWZmZWIzYmY1IiwiaWF0IjoxNjQ5NzczMjU2LCJuYmYiOjE2NDk3NzMyNTYsImV4cCI6MTY0OTc3Njg1Niwic3ViIjoiIiwic2NvcGVzIjpbXX0.kABywcfLAMXlmx2RjuqAT_xPNZoW82j0aYz1ggaEyxltMLU_Nsdo76YMJ0L9y6zIIzTzPqMc8g704OljzHy63zRyW9thmlXFKFHu2_dO1EvgQH4jukzXA4xcB2KVatB4lUzTkxGG8Bf82T0MXmXFPwP073yYDNDShvcoJPyV5oL5hVtuwdza7tV19nVI-LlMOfF-Dj0NpCqgfr64pvuYOpgg-n8-pbpv1p2VS8kg0MEUUDSyC1wGidt3o4S2rIFNcswS0Y9QElXlgFPNaFoFlZ7VxVefD7CvF_6ovyFikszhV1U2iP9qmLf7m-wQR2xrbHq8pSziAE1HUgl76g9fpQ
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