Rails.application.routes.draw do
  get '/notes/new', to: 'notes#new'
  post '/notes/create', to: 'notes#create'
  resources :notes, only: [:new, :create]
  root 'notes#new'
end
