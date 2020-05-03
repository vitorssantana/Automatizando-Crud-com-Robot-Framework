*** Settings ***
Documentation   O usuario visualiza a lista de users cadastrados e pode adicionar um novo ou editar/excluir um ja existente
Resource    ../resources/lista_user_steps.robot

Suite Setup     Criando massa de dados
Test Setup  Entrando no jeasuyi
Test Teardown  Fechando browser

*** Test Cases ***
Entar na tela de cadastro de user
    Tento criar um novo user
    Devo ver o modal de cadastro de user

Entrar na tela de editar sem selecionar user
    Tento editar user sem seleciona-lo
    Devo continuar vendo a listagem

Entrar na tela de editar selecionando user
    Tento editar user o selecionando antes
    Devo ver o modal de edicao de user

Tentar remover selecionando user
    Tento remover user sem seleciona-lo
    Devo continuar vendo a listagem

Tentar remover nao selecionando user
    Tento remover user o selecionando antes
    Devo recever solicitacao de confirmacao de remocao