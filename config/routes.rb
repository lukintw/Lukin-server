Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'api/home#index'
  namespace :api do
    resources :home
    resources :players
  end
  get 'privacy' => 'public#privacy'
  get 'service' => 'public#service'

end
