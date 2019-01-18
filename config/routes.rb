# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", sign_in: 'admins/login', sign_out: 'admins/logout', password: 'admins/secret', confirmation: 'admins/verification', unlock: 'admins/unblock', registration: 'admins/register', sign_up: 'admins/cmon_let_me_in' }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", sign_in: 'users/login', sign_out: 'users/logout', password: 'users/secret', confirmation: 'users/verification', unlock: 'users/unblock', registration: 'users/register', sign_up: 'users/cmon_let_me_in' }
  get 'home/index'
  get 'home/private'
  root 'administration/items#index'

  get '/home', to: 'home#landing_page'

  namespace 'administration' do
    get '/', to: 'items#index'

    resources :items
  end
end
