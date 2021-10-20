Rails.application.routes.draw do

devise_for(
    :users,
    path: 'users',
    module: 'users',
    skip: :all
    )

 devise_scope :user do
    get '/users/sign_up' => 'users/registrations#new', as: :new_user_registration
    post '/users' => 'users/registrations#create', as: :user_registration

    get '/users/sign_in' => 'users/sessions#new', as: :new_user_session
    post '/users/sign_in' => 'users/sessions#create', as: :user_session
    delete '/users/sign_out' => 'users/sessions#destroy', as: :destroy_user_session
 end

 devise_for(
    :admins,
    path: 'admin',
    module: 'admins',
    skip: :all
   )

  devise_scope :admin do
    get '/admin/sign_up' => 'admins/registrations#new', as: :new_admin_registration
    post '/admin' => 'admins/registrations#create', as: :admin_registration

    get '/admin/sign_in' => 'admins/sessions#new', as: :new_admin_session
    post '/admin/sign_in' => 'admins/sessions#create', as: :admin_session
    delete '/admin/sign_out' => 'admins/sessions#destroy', as: :destroy_admin_session
  end

# 管理者

  namespace :admin do
    root "homes#top"

    resources :movies, only:[:index, :create, :new, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :users, only:[:index, :show, :edit, :update]
    resources :applications, only:[:show, :update]
    resources :application_details, only:[:update]
  end

# ユーザー

  root to: "homes#top"

  get "users/withdraw" => "users#withdraw"
  patch "users/unsubscribe" => "users#unsubscribe"
  delete "cart_movies/destroy_all" => "cart_movies#destroy_all"
  post "applications/info" => "applications#info"
  get "applications/thanks" => "applications#thanks"

  resources :movies, only:[:index, :show]
  resources :users, only:[:show, :edit, :update]
  resources :cart_movies, only:[:index, :update, :destroy, :create]
  resources :applications, only:[:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
