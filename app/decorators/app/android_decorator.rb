class App::AndroidDecorator < Draper::Decorator
  delegate_all

  def type
    helpers.fa_icon('android', text: 'Android')
  end
end
