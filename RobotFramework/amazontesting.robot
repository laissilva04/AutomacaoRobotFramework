*** Settings ***
Documentation    Essa suite testa o site da amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***     
Caso de Teste 01 -Acesso ao menu "Livros"
    [Documentation]   Esse teste verifica o menu Games do site da amazon.com.br
    ...               E verifica a categoria Computadorese Informática
    [Tags]            menus     categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    Verificar se aparece o Livro
    Acessar o produto
    Comprar Agora

Caso de Teste 02 - Pesquisa de um produto 
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             Busca de produtos    lista da busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome do produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    

    