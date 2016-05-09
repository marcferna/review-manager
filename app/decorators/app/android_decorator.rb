class App::AndroidDecorator < Draper::Decorator
  decorates App::Android
  delegate_all

  def type
    helpers.fa_icon('android', text: 'Android')
  end
end
