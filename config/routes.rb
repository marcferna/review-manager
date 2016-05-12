Rails.application.routes.draw do
  controller :pages do
    get '/' => :home
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    authenticated :user do
      root 'apps#index', as: :authenticated_root
    end

    unauthenticated do
      root 'pages#home', as: :unauthenticated_root
    end
  end

  resources :apps do
    resources :reviews
  end
  resources :integrations, only: [:index]
  resources :slack_integrations, only: [:new, :create, :edit, :update, :delete]
end
