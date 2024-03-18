*** Settings ***
Library        SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${url}               http://www.amazon.com.br
${Menu_livros}      //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${Header_Livros}    //h2[contains(.,'Loja de Livros')]
${Texto_Livros}     Loja de Livros

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser 
Acessar a home page do site Amazon.com.br
    Go To    url=${url}
    Wait Until Element Is Visible    locator=${Menu_livros}
Entrar no menu "Livros"
    Click Element    locator=${Menu_livros}
Verificar se aparece a frase "Loja de Livros"
    Wait Until Page Contains    text=${Texto_Livros}
    Wait Until Element Is Visible    locator=${Header_Livros}
Verificar se aparece o Livro
    Wait Until Element Is Visible    locator=//img[contains(@alt,'A espada da justiça')]
Acessar o produto
    Click Element    locator=//img[contains(@alt,'A espada da justiça')]
Comprar Agora
    Click Element    locator=//input[contains(@name,'submit.buy-now')]
Digitar o nome do produto "${Produto}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${Produto}
Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button
Verificar o resultado da pesquisa se está listando o produto ${Produto}
    Wait Until Element Is Enabled    locator=//span[@class='a-size-medium a-color-base a-text-normal'][contains(., ${Produto})]
    Log To Console    message= "deu bom"