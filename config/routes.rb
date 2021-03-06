Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'links#index', as: 'links'

  post '/', to: 'links#create', as: 'create_link'

  post '/login', to: 'sessions#create', as: 'create_login'

  get '/login', to: 'sessions#new', as: 'login'

  get '/sign_up', to: "users#new", as: 'sign_up'

  post '/users', to: "users#create", as: 'users'

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/:id/edit', to: 'links#edit', as: 'edit_link'

  patch '/:id', to: 'links#update', as: 'update_link'

  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
      put '/links/:id', to: 'links#update', as: 'update_link'
      put '/tags/:id', to: 'tags#update', as: 'update_tags'
      delete '/tags/:id', to: 'tags#delete', as: 'delete_tag'
      delete '/all-tags/:id', to: 'all_tags#delete'
    end
  end
end
