*** Settings ***
Documentation   O usuario informa os dados de um user e os submete no formulario para cadastra-lo no sistema
Resource    ../resources/cadastro_user_steps.robot

Test Setup  Entrando na tela de cadastro
Test Teardown  Fechando browser

*** Test Cases ***
Nao preenchimento do firstname
    Tento cadastrar o user "", "Santana", "99999999", "vitor@robot.com"
    Devo ver mensagem "This field is required."

Nao preenchimento do lastname
    Tento cadastrar o user "Vitor", "", "99999999", "vitor@robot.com"
    Devo ver mensagem "This field is required."

Nao preenchimento do phone
    Tento cadastrar o user "Vitor", "Santana", "", "vitor@robot.com"
    Devo ver mensagem "This field is required."

Nao preenchimento do campo email
    Tento cadastrar o user "Vitor", "Santana", "99999999", ""
    Devo ver mensagem "This field is required."

Preenchimento de email invalido
    [Template]  Preenchimento de email online
    # EMAIL
    vitorsantana@robotcom
    vitorsantana.robot.com
    545454545454545465667
    @robot.com
    
Cadastrar user com sucesso
    Tento cadastrar o user "Vitor", "Santana", "99999999", "vitor@robot.com"
    Devo ver o user "Vitor", "Santana", "99999999", "vitor@robot.com" cadastrado na lista

*** Keywords ***
Preenchimento de email online
    [Arguments]  ${EMAIL}
    Tento cadastrar o user "Vitor", "Santana", "99999999", "${EMAIL}"
    Devo ver mensagem "Please enter a valid email address."