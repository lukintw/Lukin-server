Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'api/home#index'
  namespace :api do
    resources :home
    resources :players
    resources :friends
    resources :datum do
      collection do 
        post :update_data
      end
    end
    resources :chats do
      collection do
        post :say_hello
      end
    end
    resources :pets
  end
  get 'privacy' => 'public#privacy'
  get 'service' => 'public#service'

end
