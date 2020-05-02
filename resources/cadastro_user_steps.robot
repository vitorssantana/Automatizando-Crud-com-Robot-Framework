*** Settings ***
Library  SeleniumLibrary
Library    Collections
Variables  ../pom/locator.py

*** Variables ***
${URL}      https://www.jeasyui.com/tutorial/app/crud/index.html
${BROWSER}  Chrome

*** Keywords ***
#### HOOKS
Entrando na tela de cadastro
    Open Browser    ${URL}  ${BROWSER}
    #List_User_Elements
    Click Element    ${btn_new_user}

Fechando browser
    Close Browser

#### STEPS
Tento cadastrar o user "${FIRST_NAME}", "${LAST_NAME}", "${PHONE}", "${EMAIL}"
    Input Text  ${input_first_name}  ${FIRST_NAME}
    Input Text  ${input_last_name}  ${LAST_NAME}
    Input Text  ${input_phone}  ${phone}
    Input Text  ${input_email}  ${EMAIL}
    Click Element   ${btn_save}

Devo ver mensagem "${MESSAGE}"
    Page Should Contain     ${MESSAGE}

Devo ver o user "${FIRSTNAME}", "${LASTNAME}", "${PHONE}", "${EMAIL}" cadastrado na lista
    #List_User_Elements
    Select From List By Label    ${select_pagination}    50
    Input Text  ${input_pagination}     9999
    Press Keys  ${input_pagination}     ENTER
    Page Should Contain     ${FIRSTNAME}
    Page Should Contain     ${LASTNAME}
    Page Should Contain     ${PHONE}
    Page Should Contain     ${EMAIL}