*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../pom/edit_user_page.robot
Resource    ../pom/lista_user_page.robot

*** Variables ***
${URL}      https://www.jeasyui.com/tutorial/app/crud/index.html
${BROWSER}  Chrome

*** Keywords ***
#### HOOKS
Criando massa de dados
    Open Browser    ${URL}  ${BROWSER}
    Clicar Botao Novo User
    Preencher First Name  ATESTEEDICAO
    Preencher Last Name     ROBOT
    Preencher Phone  99999999
    Preencher Email     TESTE@ROBOT.COM
    Salvar Novo User
    Close Browser

Entrando na tela de edicao
    Open Browser    ${URL}  ${BROWSER}
    Selecionar Quantidade de Registros Mostrados    50
    sleep   1
    Inserir Numero Paginacao    9999
    sleep   1
    Selecionar User Na Lista    ATESTEEDICAO
    Clicar Botao Editar User

Fechando browser
    Close Browser

Tento alterar o user com dados "${FIRST_NAME}", "${LAST_NAME}", "${PHONE}", "${EMAIL}"
    Preencher First Name    ${FIRST_NAME}
    Preencher Last Name     ${LAST_NAME}
    Preencher Phone     ${PHONE}
    Preencher Email     ${EMAIL}
    Salvar Novo User

Devo ver mensagem "${MESSAGE}"
    Page Should Contain     ${MESSAGE}
 
Devo ver o user "${FIRSTNAME}", "${LASTNAME}", "${PHONE}", "${EMAIL}" cadastrado na lista
    Selecionar Quantidade de Registros Mostrados    50
    sleep   1
    Inserir Numero Paginacao    9999
    sleep   1
    Page Should Contain     ${FIRSTNAME}
    Page Should Contain     ${LASTNAME}
    Page Should Contain     ${PHONE}
    Page Should Contain     ${EMAIL}