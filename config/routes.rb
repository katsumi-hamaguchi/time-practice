Rails.application.routes.draw do
  
  root "homes#top"
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }#各モデルのコントローラを個別に指定できるように変更
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }#各モデルのコントローラを個別に指定できるように変更
  resources :users do
  	resources :time_cards
  end
  resources :admins
  

  namespace :admin do
  	root "homes#top"
    resources :admins
  end

  namespace :user do
  	root "homes#top"
  end
end
