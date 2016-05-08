Rails.application.routes.draw do
  devise_for :users
  controller :pages do
    get '/' => :home
  end

  resources :apps
end
