*** Settings ***
Library  SeleniumLibrary
Library    Collections
Variables  ../pom/locator.py

*** Variables ***
${URL}      https://www.jeasyui.com/tutorial/app/crud/index.html
${BROWSER}  Chrome

*** Keywords ***
#### HOOKS
Criando massa de dados
    Open Browser    ${URL}  ${BROWSER}
    #List_User_Elements
    Click Element    ${btn_new_user}
    #Cadastro_User_Elements
    Input Text  ${input_first_name}  TESTELISTAGEM
    Input Text  ${input_last_name}  SISTEMA
    Input Text  ${input_phone}  99999999
    Input Text  ${input_email}  TESTE@ROBOT.COM
    Click Element   ${btn_save}
    Close Browser

Entrando no jeasuyi
    Open Browser    ${URL}  ${BROWSER}
    
Fechando browser
    Close Browser

Tento criar um novo user
    Click Element   ${btn_new_user}

Devo ver o modal de cadastro de user
    Page Should Contain Element     ${input_first_name}
    Page Should Contain Element     ${input_last_name}
    Page Should Contain Element     ${input_phone}
    Page Should Contain Element     ${input_email}
    Page Should Contain Element     ${btn_save}
    Page Should Contain Element     ${btn_cancel}

Tento editar user sem seleciona-lo
    Click Element   ${btn_edit_user}

Tento remover user sem seleciona-lo
    Click Element   ${btn_remove_user}

Devo continuar vendo a listagem
    Page Should Contain Element     ${btn_new_user}
    Page Should Contain Element     ${btn_edit_user}
    Page Should Contain Element     ${btn_remove_user}
    Page Should Contain Element     ${select_pagination}
    Page Should Contain Element     ${input_pagination}
    ${count} =  Get Element Count   ${list_users}
    Should Be True  ${count}    >   0

Tento editar user o selecionando antes
    Select From List By Label    ${select_pagination}    50
    sleep   1
    Input Text  ${input_pagination}     9999
    Press Keys  ${input_pagination}     ENTER
    sleep   1
    ${list_user_firstname}=    Get WebElements     ${firstname_list_user}
    ${length}=  Get Length  ${list_user_firstname}
    FOR    ${index}   IN RANGE  ${length}
        ${string}=    Get Text    ${list_user_firstname}[${index}]
        Run Keyword If  '${string}'=='TESTELISTAGEM'   Click Element   ${list_user_firstname}[${index}]
    END
    Click Element   ${btn_edit_user}

Devo ver o modal de edicao de user
    Page Should Contain Element     ${input_first_name}
    Page Should Contain Element     ${input_last_name}
    Page Should Contain Element     ${input_phone}
    Page Should Contain Element     ${input_email}
    Page Should Contain Element     ${btn_save}
    Page Should Contain Element     ${btn_cancel}

Tento remover user o selecionando antes
    Select From List By Label    ${select_pagination}    50
    sleep   1
    Input Text  ${input_pagination}     9999
    Press Keys  ${input_pagination}     ENTER
    sleep   1
    ${list_user_firstname}=    Get WebElements     ${firstname_list_user}
    ${length}=  Get Length  ${list_user_firstname}
    FOR    ${index}   IN RANGE  ${length}
        ${string}=    Get Text    ${list_user_firstname}[${index}]
        Run Keyword If  '${string}'=='TESTELISTAGEM'   Click Element   ${list_user_firstname}[${index}]
    END
    Click Element   ${btn_remove_user}

Devo recever solicitacao de confirmacao de remocao
    Page Should Contain     Are you sure you want to destroy this user?
    Page Should Contain Element     btn_ok
    Page Should Contain Element     btn_cancel