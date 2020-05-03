*** Settings ***
Documentation   O usuario remove o user da lista de users do sistema
Resource    ../resources/remocao_user_steps.robot

Suite Setup  Criando massa de dados
Test Setup  Entrando na tela de remocao
Test Teardown  Fechando browser

*** Test Cases ***
Cancelo a remocao do user
    Cancelo a remocao do user
    Devo ver a lista de users com o user ainda listado

Confirmo a remocao do user
    Confirmo a remocao do user
    Devo ver a lista de users sem o user removido