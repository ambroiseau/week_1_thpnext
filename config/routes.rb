# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", sign_in: 'admins/login', sign_out: 'admins/logout', password: 'admins/secret', confirmation: 'admins/verification', unlock: 'admins/unblock', registration: 'admins/register', sign_up: 'admins/cmon_let_me_in' }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
  get 'home/index'
  get 'home/private'
  root 'administration/items#index'

  get '/home', to: 'home#landing_page'

  namespace 'administration' do
    get '/', to: 'items#index'

    resources :items
  end
end
