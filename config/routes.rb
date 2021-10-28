Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :'api/v1' do
    resources :photos
    resources :users, only: %w[index show]
  end

  devise_for :users, 
    path: 'api/v1', 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'sign_up'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
end
