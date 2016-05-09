Rails.application.routes.draw do
  controller :pages do
    get '/' => :home
  end

  devise_for :users
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
end
