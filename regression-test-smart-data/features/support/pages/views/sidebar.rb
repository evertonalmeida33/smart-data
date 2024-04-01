require_relative '../base_page'

class Sidebar < BasePage
  attr_reader :logo

  def initialize
    super
    @logo = EL['logo']
  end

  def cat_logo
    find(@logo).visible?
  end
end
