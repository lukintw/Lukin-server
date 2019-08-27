Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'api/home#index'
  mount ActionCable.server => '/cable'
  namespace :api do
    resources :home do
      collection do
        post :auth
      end
    end
    resources :players do
      collection do
        get :strangers
        post :filter_friends
      end
    end
    resources :player_grades do
      collection do
        post :answer
        get :grade
      end
    end
    resources :friends
    resources :datum do
      collection do 
        post :update_data
      end
    end
    resources :chats do
      collection do
        post :say_hello
        get :chat_info
        post :update_match_value
      end
    end
    resources :pets
  end
  get 'privacy' => 'public#privacy'
  get 'service' => 'public#service'

end
