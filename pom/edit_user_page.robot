Documentation     Padrao Page Object do modal de Edicao de User
Library  SeleniumLibrary

*** Variables ***
${input_first_name}=    css:#_easyui_textbox_input1
${input_last_name}=     css:#_easyui_textbox_input2
${input_phone}=     css:#_easyui_textbox_input3
${input_email}=     css:#_easyui_textbox_input4
${btn_save}=    xpath://div[@id="dlg-buttons"]/a[1]
${btn_cancel_add_user}=     xpath://div[@id="dlg-buttons"]/a[2]

*** Keywords ***
Preencher First Name
    [Arguments]    ${first_name}
    Input Text  ${input_first_name}  ${first_name}

Preencher Last Name
    [Arguments]    ${last_name}
    Input Text  ${input_last_name}  ${last_name}

Preencher Phone
    [Arguments]    ${phone}
    Input Text  ${input_phone}  ${phone}

Preencher Email
    [Arguments]    ${email}
    Input Text  ${input_email}  ${email}

Salvar Novo User
    Click Element   ${btn_save}