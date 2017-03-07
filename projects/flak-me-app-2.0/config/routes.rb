Rails.application.routes.draw do
  # resources :profiles
  devise_for :users
  # get 'users/:id', to: "users#show", as: "profile"
  get 'groups/:slug/modify', to: 'groups#modify', as: "modify_group"
  delete 'groups/:slug', to: 'groups#destroy'
  resources :groups, param: :slug, only: [:new, :create, :show, :index]

  resources :slides, param: :slidee, only: [:index, :create, :show], as: "slide_on_in"
  resources :profiles, param: :user_id, only: [:show, :edit, :update]

  mount ActionCable.server => '/cable'

  root 'profiles#dashboard'
end
