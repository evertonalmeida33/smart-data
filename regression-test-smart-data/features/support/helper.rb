# frozen_string_literal: true

module Helper
  def screenshot(nome_arquivo, resultado)
    caminho_arquivo = "report/screenshots/test_#{resultado}"
    imagem = "#{caminho_arquivo}/#{nome_arquivo}.png"
    page.save_screenshot(imagem)
    attach(imagem, 'image/png')
  end

  def token_get
    js_script = 'return document.cookie;'
    cookie = page.execute_script(js_script)
    cookie.match(/accessToken=.*?;/).to_s
  end

  def clear_field(field)
    find(field).set ''
  end

  def upload_imagem(locator, nome_imagem)
    file = File.join(Dir.pwd, "features/support/fixtures/#{nome_imagem}")
    attach_file(locator, file, make_visible: true)
  end
end
