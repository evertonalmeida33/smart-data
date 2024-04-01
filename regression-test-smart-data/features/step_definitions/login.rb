Quando('efetuar o login com o usuario {string}') do |cod_user|
  @page.call(Login).go
  hash_login = FactoryBot.build(cod_user).to_hash
  @page.call(Login).realizar_login(hash_login)
end

Entao('deve acessar o dashboard de maquinas') do
  expect(@page.call(Sidebar).cat_logo).to eql true
end

Entao('devo ver a mensagem de erro {string}') do |msg_email_invalido|
  expect(@page.call(Login).cat_msgEmailInvalido).to eql msg_email_invalido
end

Entao('o botão Entrar deve ficar inativo') do
  expect(@page.call(Login).validate_btnEntrar_disabled).to eq true
end
