class Commom < BasePage
  attr_reader :toast, :spanError, :tabs

  def initialize
    @toast      = EL['toast']
    @span_error = EL['spanError']
    @tabs       = EL['tabs']
  end

  def message_toast
    find(@toast).text
  end

  def message_span_error
    find(@span_error).text
  end

  def tab_select(tab_name)
    find(@tabs, text: tab_name).click
  end
end
