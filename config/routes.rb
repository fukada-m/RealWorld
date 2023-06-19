Rails.application.routes.draw do
  post 'api/articles', to: 'articles#create'
  get 'api/articles/:slug', to: 'articles#show'
  put 'api/articles/:slug', to: 'articles#update'
  delete 'api/articles/:slug', to: 'articles#destroy'
end
