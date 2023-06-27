# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'application#hello'
  post 'api/articles', to: 'articles#create'
  get 'api/articles/:slug', to: 'articles#show'
  put 'api/articles/:slug', to: 'articles#update'
  delete 'api/articles/:slug', to: 'articles#destroy'
end
