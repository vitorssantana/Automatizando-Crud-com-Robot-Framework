*** Settings ***
Documentation   O usuario editz os dados de um user e os submete no formulario para atualizar os dados no sistema
Resource    ../resources/edit_user_steps.robot

Suite Setup     Criando massa de dados
Test Setup  Entrando na tela de edicao
Test Teardown  Fechando browser

*** Test Cases ***
Nao preenchimento do firstname
    Tento alterar o user com dados "", "Santana", "99999999", "vitor@robot.com"
    Devo ver mensagem "This field is required."

Nao preenchimento do lastname
    Tento alterar o user com dados "Vitor", "", "99999999", "vitor@robot.com"
    Devo ver mensagem "This field is required."

Nao preenchimento do phone
    Tento alterar o user com dados "Vitor", "Santana", "", "vitor@robot.com"
    Devo ver mensagem "This field is required."

Nao preenchimento do campo email
    Tento alterar o user com dados "Vitor", "Santana", "99999999", ""
    Devo ver mensagem "This field is required."

Preenchimento de email invalido
    [Template]  Preenchimento de email online
    # Examples:
    # EMAIL
    vitorsantana@robotcom
    vitorsantana.robot.com
    545454545454545465667
    @robot.com
    
Cadastrar user com sucesso
    Tento alterar o user com dados "Kervelim", "Araujo", "99999999", "kervelim@robot.com"
    Devo ver o user "Kervelim", "Araujo", "99999999", "kervelim@robot.com" cadastrado na lista

*** Keywords ***
Preenchimento de email online
    [Arguments]  ${EMAIL}
    Tento alterar o user com dados "Vitor", "Santana", "99999999", "${EMAIL}"
    Devo ver mensagem "Please enter a valid email address."
