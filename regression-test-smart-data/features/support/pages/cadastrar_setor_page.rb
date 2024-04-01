class CadastrarSetor < BasePage
  attr_reader :nomeSetor, :codIntegracao

  def initialize
    @nome_setor           = EL['nomeSetor']
    @cod_integracao       = EL['codIntegracao']
    @btnNovoSetor         = EL['btnNovoSetor']
  end

  def go
    visit 'apps/setor'
  end

  def cadastrar_setor(setor)
    find(@btnNovoSetor).click
    find(@nome_setor).set  setor[:nomeSetor]
    find(@cod_integracao).set setor[:codIntegracao]
    click_button('Adicionar')
  end
end
