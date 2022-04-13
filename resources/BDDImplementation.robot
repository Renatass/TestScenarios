*** Settings ***
Resource  Steps.robot

*** Keywords ***

Dado que esteja conectado no webservice de consulta 
    Conecta ao WebService

Quando o usuário consultar o ID "${ID_CONSULTADO}"
    Realiza a requisição do ID  ${ID_CONSULTADO}

Então deve ser mostrado o tipo do animal "${ANIMAL}"
    Confere o status code           200
    Confere o tipo do animal        ${ANIMAL}


E deve ser mostrada a raça "${RACA}"
    Confere a raça       ${RACA}


E deve ser mostrada a idade "${IDADE}"
    Confere a idade   ${IDADE}

E deve ser mostrada o genero "${GENERO}"
    Confere o genero  ${GENERO}

E deve ser mostrado o nome "${NOME}"
    Confere o nome  ${NOME}

Então nenhum dado deve ser mostrado para o ID "${ID_CONSULTADO}" 
    Confere o status code     200
    Confere Mensagem de Erro  ${ID_CONSULTADO}