Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'projects#index'

  # overriding default revise_auth routes so that i can disable paths
  # Registration
  # get 'sign_up', to: 'revise_auth/registrations#new', as: :sign_up
  # post 'sign_up', to: 'revise_auth/registrations#create'

  get 'login', to: 'revise_auth/sessions#new'
  post 'login', to: 'revise_auth/sessions#create'
  delete 'logout', to: 'revise_auth/sessions#destroy'

  authenticated do
    resources :projects, only: %i[new create edit update destroy show]
    resources :urls
    resources :tags
  end

  resources :projects, only: %i[index]

  get '/blog/*file_path', to: 'blog#show', as: :blog
end
