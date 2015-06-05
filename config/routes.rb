Rails.application.routes.draw do

  # Use devise for authentication
  devise_for :users

  # Keepalive monitoring
  get 'keepalive', to: 'keepalive#keepalive'

  # Changing locale
  get 'change_locale', to: 'application#change_locale'

  scope '(:locale)' do
    get 'about', to: 'about#index'
    get 'sysinfo', to: 'sysinfo#index'

    resources :users
    resources :accounts, only: [:index, :show, :edit] do
      resources :mutations, only: [:index, :show]
    end
    resources :transfers, only: [:new, :create]
  end

  root 'welcome#index'

  authenticated :user, -> user { user.admin? } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

end
