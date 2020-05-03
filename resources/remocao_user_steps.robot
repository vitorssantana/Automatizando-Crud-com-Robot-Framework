*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../pom/remocao_user_page.robot
Resource    ../pom/cadastro_user_page.robot
Resource    ../pom/lista_user_page.robot

*** Variables ***
${URL}      https://www.jeasyui.com/tutorial/app/crud/index.html
${BROWSER}  Chrome

*** Keywords ***
#### HOOKS
Criando massa de dados
    Open Browser    ${URL}  ${BROWSER}
    Clicar Botao Novo User
    Preencher First Name  TESTEREMOCAO    
    Preencher Last Name     LEIGO
    Preencher Phone     88888888
    Preencher Email     TESTEREMOCAO@ROBOT.COM
    Salvar Novo User
    Close Browser

Entrando na tela de remocao
    Open Browser    ${URL}  ${BROWSER}
    Selecionar Quantidade de Registros Mostrados    50
    sleep   1
    Inserir Numero Paginacao    9999
    sleep   1
    Selecionar User Na Lista    TESTEREMOCAO
    Clicar Botao Remover User

Fechando browser
    Close Browser

Cancelo a remocao do user
    Clicar Botao Cancel Remocao

Devo ver a lista de users com o user ainda listado
    Selecionar Quantidade de Registros Mostrados    50
    sleep   1
    Inserir Numero Paginacao    9999
    sleep   1
    Page Should Contain     TESTEREMOCAO
    Page Should Contain     LEIGO
    Page Should Contain     88888888
    Page Should Contain     TESTEREMOCAO@ROBOT.COM

Confirmo a remocao do user
    Clicar Botao Ok

Devo ver a lista de users sem o user removido
    Selecionar Quantidade de Registros Mostrados    50
    sleep   1
    Inserir Numero Paginacao    9999
    sleep   1
    Page Should Not Contain     TESTEREMOCAO
    Page Should Not Contain     LEIGO
    Page Should Not Contain     88888888
    Page Should Not Contain     TESTEREMOCAO@ROBOT.COM