Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/show'
  resources :users

end
