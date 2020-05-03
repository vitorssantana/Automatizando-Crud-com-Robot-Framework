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
    Input Text  ${input_first_name}  ATESTEEDICAO
    Input Text  ${input_last_name}  ROBOT
    Input Text  ${input_phone}  99999999
    Input Text  ${input_email}  TESTE@ROBOT.COM
    Click Element   ${btn_save}
    Close Browser

Entrando na tela de edicao
    Open Browser    ${URL}  ${BROWSER}
    #List_User_Elements
    Select From List By Label    ${select_pagination}    50
    sleep   1
    Input Text  ${input_pagination}     9999
    Press Keys  ${input_pagination}     ENTER
    sleep   1
    
    ${list_user_firstname}=    Get WebElements     ${firstname_list_user}
    ${length}=  Get Length  ${list_user_firstname}
    FOR    ${index}   IN RANGE  ${length}
        ${string}=    Get Text    ${list_user_firstname}[${index}]
        Run Keyword If  '${string}'=='ATESTEEDICAO'   Click Element   ${list_user_firstname}[${index}]
    END
    Click Element   ${btn_edit_user}

Fechando browser
    Close Browser

#### STEPS
Tento alterar o user com dados "${FIRST_NAME}", "${LAST_NAME}", "${PHONE}", "${EMAIL}"
    Input Text  ${input_first_name}  ${FIRST_NAME}
    Input Text  ${input_last_name}  ${LAST_NAME}
    Input Text  ${input_phone}  ${phone}
    Input Text  ${input_email}  ${EMAIL}
    Click Element   ${btn_save}
    sleep   1

Devo ver mensagem "${MESSAGE}"
    Page Should Contain     ${MESSAGE}

Devo ver o user "${FIRSTNAME}", "${LASTNAME}", "${PHONE}", "${EMAIL}" cadastrado na lista
    Select From List By Label    ${select_pagination}    50
    Input Text  ${input_pagination}     9999
    Press Keys  ${input_pagination}     ENTER
    Page Should Contain     ${FIRSTNAME}
    Page Should Contain     ${LASTNAME}
    Page Should Contain     ${PHONE}
    Page Should Contain     ${EMAIL}