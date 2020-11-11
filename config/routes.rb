Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "restaurants/:restaurant_id/reviews/new", to: "reviews#new", as: :new_review
  # post "restaurants/:restaurant_id/reviews/", to: "reviews#create", as: :create_review
  resources :restaurants do
    resources :reviews, except: :new
  end
end
