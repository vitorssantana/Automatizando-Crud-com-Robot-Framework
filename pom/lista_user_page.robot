*** Settings ***
Documentation     Padrao Page Object do modal de Lista de User
Library  SeleniumLibrary
Library    Collections

*** Variables ***
${btn_new_user}=    xpath://div[@id="toolbar"]/a[1]
${btn_edit_user}=   xpath://div[@id="toolbar"]/a[2]
${btn_remove_user}=     xpath://div[@id="toolbar"]/a[3]
${select_pagination}=   xpath://select[@class="pagination-page-list"]
${btn_pagination_first}=    xpath://a[@class="l-btn l-btn-small l-btn-plain"]/a[4]
${bt_pagination_prev}=  xpath://a[@class="l-btn l-btn-small l-btn-plain"]/a[5]
${btn_pagination_next}=     xpath://a[@class="l-btn l-btn-small l-btn-plain"]/a[6]
${btn_pagination_last}=     xpath://a[@class="l-btn l-btn-small l-btn-plain"]/a[7]
${btn_pagination_load}=     xpath://a[@class="l-btn l-btn-small l-btn-plain"]/a[8]
${input_pagination}=    xpath://input[@class="pagination-num"]
${list_users}=  xpath://tr[contains(@id, "dg_datagrid-row-r1-2-")]
${firstname_list_user}=     xpath:(//tr[contains(@id, "dg_datagrid-row-r1-2-")]/td[1]/div)
${lastname_list_user}=  xpath:(//tr[contains(@id, "dg_datagrid-row-r1-2-")]/td[2]/div)

*** Keywords ***
Clicar Botao Novo User
    Click Element    ${btn_new_user}

Clicar Botao Editar User
    Click Element    ${btn_edit_user}

Clicar Botao Remover User
    Click Element    ${btn_remove_user}

Inserir Numero Paginacao
    [Arguments]    ${index}
    Input Text  ${input_pagination}     ${index}
    Press Keys  ${input_pagination}     ENTER

Selecionar Quantidade de Registros Mostrados
    [Arguments]    ${index}
    Select From List By Label    ${select_pagination}    ${index}   

Selecionar User Na Lista
    [Arguments]    ${first_name}
    ${list_user_firstname}=    Get WebElements     ${firstname_list_user}
    ${length}=  Get Length  ${list_user_firstname}
    FOR    ${index}   IN RANGE  ${length}
        ${string}=    Get Text    ${list_user_firstname}[${index}]
        Run Keyword If  """${string}""" == """${first_name}"""   Click Element   ${list_user_firstname}[${index}]
    END