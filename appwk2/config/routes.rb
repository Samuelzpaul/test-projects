Rails.application.routes.draw do

  root to: 'pages#home'

  get 'showcase', to: 'pages#showcase'

  get 'gallery', to: 'pages#gallery'

  get 'upcoming', to: 'pages#upcoming'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


