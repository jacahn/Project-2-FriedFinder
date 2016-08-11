Rails.application.routes.draw do
  devise_for :views
  root "restaurants#index"
  devise_for :user
  resources :restaurants do
    resources :reviews
  end

end
