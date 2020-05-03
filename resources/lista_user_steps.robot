*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../pom/cadastro_user_page.robot
Resource    ../pom/lista_user_page.robot
Resource    ../pom/remocao_user_page.robot

*** Variables ***
${URL}      https://www.jeasyui.com/tutorial/app/crud/index.html
${BROWSER}  Chrome

*** Keywords ***
#### HOOKS
Criando massa de dados
    Open Browser    ${URL}  ${BROWSER}
    Clicar Botao Novo User
    Preencher First Name  TESTELISTAGEM
    Preencher Last Name     SISTEMA
    Preencher Phone  99999999
    Preencher Email     TESTE@ROBOT.COM
    Salvar Novo User    
    Close Browser

Entrando no jeasuyi
    Open Browser    ${URL}  ${BROWSER}
    
Fechando browser
    Close Browser

Tento criar um novo user
    Clicar Botao Novo User

Devo ver o modal de cadastro de user
    Page Should Contain Element     ${input_first_name}
    Page Should Contain Element     ${input_last_name}
    Page Should Contain Element     ${input_phone}
    Page Should Contain Element     ${input_email}
    Page Should Contain Element     ${btn_save}
    Page Should Contain Element     ${btn_cancel_add_user}

Tento editar user sem seleciona-lo
    Clicar Botao Editar User

Tento remover user sem seleciona-lo
    Clicar Botao Remover User

Devo continuar vendo a listagem
    Page Should Contain Element     ${btn_new_user}
    Page Should Contain Element     ${btn_edit_user}
    Page Should Contain Element     ${btn_remove_user}
    Page Should Contain Element     ${select_pagination}
    Page Should Contain Element     ${input_pagination}
    ${count} =  Get Element Count   ${list_users}
    Should Be True  ${count} > 0

Tento editar user o selecionando antes
    Selecionar Quantidade de Registros Mostrados    50
    sleep   1
    Inserir Numero Paginacao    9999
    sleep   1
    Selecionar User Na Lista    TESTELISTAGEM
    Clicar Botao Editar User

Devo ver o modal de edicao de user
    Page Should Contain Element     ${input_first_name}
    Page Should Contain Element     ${input_last_name}
    Page Should Contain Element     ${input_phone}
    Page Should Contain Element     ${input_email}
    Page Should Contain Element     ${btn_save}
    Page Should Contain Element     ${btn_cancel_add_user}

Tento remover user o selecionando antes
    Selecionar Quantidade de Registros Mostrados    50
    sleep   1
    Inserir Numero Paginacao
    sleep   1
    Selecionar User Na Lista    TESTELISTAGEM
    Clicar Botao Remover User

Devo recever solicitacao de confirmacao de remocao
    Page Should Contain     Are you sure you want to destroy this user?
    Page Should Contain Element     ${btn_ok}
    Page Should Contain Element     ${btn_cancel}