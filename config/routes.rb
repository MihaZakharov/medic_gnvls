Rails.application.routes.draw do
  resources :gnvls
  root 'gnvls#index'
  post 'gnvls/searching', to: 'gnvls#searching'
  post 'gnvls/search', to: 'gnvls#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
