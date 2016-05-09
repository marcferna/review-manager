class App::IosDecorator < Draper::Decorator
  delegate_all

  def type
    helpers.fa_icon('apple', text: 'iOS')
  end
end
