Rails.application.routes.draw do
  root 'profiles#dashboard'
  # resources :profiles

  devise_for :users, controllers: {sessions: "sessions"}


  # get 'users/:id', to: "users#show", as: "profile"
  get 'groups/:slug/modify', to: 'groups#modify', as: "modify_group"
  delete 'groups/:slug', to: 'groups#destroy'
  resources :groups, param: :slug, only: [:new, :create, :show, :index] do
    resources :events, only: [:create]
    get '/events/:id/rsvp', to: 'events#rsvp', as: 'rsvp'
  end

  resources :slides, param: :slidee, only: [:index, :create, :show], as: "slide_on_in"
  get '/flashes/:slidee', to: 'slides#flash', as: 'flash_me'
  post '/flashes', to: 'slides#sendflash', as: 'flash'
  resources :profiles, param: :user_id, only: [:show, :edit, :update] do
    collection do
     get 'autocomplete'
    end
  end

  mount ActionCable.server => '/cable'
  get '/dashboard', to: 'profiles#dashboard'
end
