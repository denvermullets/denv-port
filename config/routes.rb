Rails.application.routes.draw do
  # overriding default revise_auth routes so that i can disable paths
  # Registration
  # get 'sign_up', to: 'revise_auth/registrations#new', as: :sign_up
  # post 'sign_up', to: 'revise_auth/registrations#create'

  # Login
  get 'login', to: 'revise_auth/sessions#new'
  post 'login', to: 'revise_auth/sessions#create'

  # Profile management
  # get 'profile', to: 'revise_auth/registrations#edit'
  # patch 'profile', to: 'revise_auth/registrations#update'
  # delete 'profile', to: 'revise_auth/registrations#destroy'

  # Update email and password
  # patch 'profile/email', to: 'revise_auth/email#update'
  # patch 'profile/password', to: 'revise_auth/password#update'

  # Password resets
  # get 'password_resets/new', to: 'revise_auth/password_resets#new', as: :new_password_reset
  # post 'password_resets', to: 'revise_auth/password_resets#create'
  # get 'password_resets/:token/edit', to: 'revise_auth/password_resets#edit', as: :edit_password_reset
  # patch 'password_resets/:token', to: 'revise_auth/password_resets#update'

  # Email confirmation
  get 'profile/email', to: 'revise_auth/email#show'

  # Logout
  delete 'logout', to: 'revise_auth/sessions#destroy'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'projects#index'
  resources :projects
  get '/blog/*file_path', to: 'blog#show', as: :blog
end
