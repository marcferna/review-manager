class App::IosDecorator < Draper::Decorator
  decorates App::Ios
  delegate_all

  def type
    helpers.fa_icon('apple', text: 'iOS')
  end
end
