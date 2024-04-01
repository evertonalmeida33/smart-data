Dado('que acesse a pagina de cadastro de setor') do
  @page.call(CadastrarSetor).go
end

Quando('cadastrar o setor {string}') do |cod_setor|
  hash_setor = FactoryBot.build(cod_setor).to_hash
  @page.call(CadastrarSetor).cadastrar_setor(hash_setor)
end

Então('devo ver a mensagem {string}') do |msg_sucesso_setor|
  expect(page).to have_content msg_sucesso_setor
end

