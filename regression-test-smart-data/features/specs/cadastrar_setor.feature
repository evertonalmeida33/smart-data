#language: pt

@setor
Funcionalidade: Cadastro de setor
 
  Contexto: Acessar a pagina de cadastro de setor
    * efetuar o login com o usuario 'login_sucesso'
    Dado que acesse a pagina de cadastro de setor

  Cenario: Cadastrar setor com sucesso
    Quando cadastrar o setor "cadastrar_setor"
    Então devo ver a mensagem "Sucesso: Setor adicionado com sucesso"

