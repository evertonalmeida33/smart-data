class LoginModels
  attr_accessor :usuario, :senha

  def to_hash
    {
      usuario: @usuario,
      senha: @senha,
    }
  end
end