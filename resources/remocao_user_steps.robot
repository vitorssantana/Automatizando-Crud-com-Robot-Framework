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
    Click Element    ${btn_new_user}
    Input Text  ${input_first_name}  TESTEREMOCAO
    Input Text  ${input_last_name}  LEIGO
    Input Text  ${input_phone}  88888888
    Input Text  ${input_email}  TESTEREMOCAO@ROBOT.COM
    Click Element   ${btn_save}
    Close Browser

Entrando na tela de remocao
    Open Browser    ${URL}  ${BROWSER}
    Select From List By Label    ${select_pagination}    50
    sleep   1
    Input Text  ${input_pagination}     9999
    Press Keys  ${input_pagination}     ENTER
    sleep   1
    ${list_user_firstname}=    Get WebElements     ${firstname_list_user}
    ${length}=  Get Length  ${list_user_firstname}
    FOR    ${index}   IN RANGE  ${length}
        ${string}=    Get Text    ${list_user_firstname}[${index}]
        Run Keyword If  '${string}'=='TESTEREMOCAO'   Click Element   ${list_user_firstname}[${index}]
    END
    Click Element   ${btn_remove_user}

Fechando browser
    Close Browser

#### STEPS
Cancelo a remocao do user
    Click Element   ${btn_cancel}

Devo ver a lista de users com o user ainda listado
    Select From List By Label    ${select_pagination}    50
    sleep   1
    Input Text  ${input_pagination}     9999
    Press Keys  ${input_pagination}     ENTER
    Page Should Contain     TESTEREMOCAO
    Page Should Contain     LEIGO
    Page Should Contain     88888888
    Page Should Contain     TESTEREMOCAO@ROBOT.COM

Confirmo a remocao do user
    Click Element   ${btn_ok}

Devo ver a lista de users sem o user removido
    Select From List By Label    ${select_pagination}    50
    sleep   1
    Input Text  ${input_pagination}     9999
    Press Keys  ${input_pagination}     ENTER
    Page Should Not Contain     TESTEREMOCAO
    Page Should Not Contain     LEIGO
    Page Should Not Contain     88888888
    Page Should Not Contain     TESTEREMOCAO@ROBOT.COM