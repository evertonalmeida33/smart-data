class SetorModels
  attr_accessor :nomeSetor, :codIntegracao

  def to_hash
    {
      nomeSetor: @nomeSetor,
      codIntegracao: @codIntegracao,
    }
  end
end
