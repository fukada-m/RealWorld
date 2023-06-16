Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "api/articles", to: "articles#create"
  get "api/articles/:slug", to: "articles#show"
  # Defines the root path route ("/")
  # root "articles#index"
end
