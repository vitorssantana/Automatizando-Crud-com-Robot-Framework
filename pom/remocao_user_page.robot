*** Settings ***
Documentation     Padrao Page Object do modal de Remocao de User
Library  SeleniumLibrary
Library    Collections

*** Variables ***
${btn_ok}=  xpath://div[@class="dialog-button messager-button"]/a[1]
${btn_cancel}=  xpath://div[@class="dialog-button messager-button"]/a[2]

*** Keywords ***
Clicar Botao Ok
    Click Element   ${btn_ok}

Clicar Botao Cancel Remocao
    Click Element   ${btn_cancel}