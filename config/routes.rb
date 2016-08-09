Rails.application.routes.draw do
  root "restaurants#index"
  devise_for :user
  resources :restaurants do
    resources :reviews
  end

end
