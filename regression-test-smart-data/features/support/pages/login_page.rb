class Login < BasePage
  attr_reader :email, :senha, :lembrarSenha, :btnEntrar, :msgEmailInvalido, :msgEmailSenhaIncorreta

  def initialize
    @usuario                    = EL['usuario']
    @senha                      = EL['senha']
    @lembra_senha               = EL['lembrarSenha']
    @btn_entrar                 = EL['btnEntrar']
    @msg_email_invalido         = EL['msgEmailInvalido']
    @msg_email_senha_incorreta  = EL['msgEmailSenhaIncorreta']
  end

  def go
    visit ''
  end

  def realizar_login(users)
    find(@usuario).set users[:usuario]
    find(@senha).set users[:senha]
    click_button('Log In') 
  end

  def cat_msgEmailInvalido
    first(@msg_email_invalido).text
  end

  def cat_msgEmailSenhaIncorreta
    find(@msg_email_senha_incorreta).text
  end

  def validate_btnEntrar_disabled
    find(@btn_entrar).disabled? == true
  end
end
