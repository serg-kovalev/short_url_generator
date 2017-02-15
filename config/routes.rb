Rails.application.routes.draw do
  get 's/:short_url', as: :short_link, to: 'short_url#show', constraints: { short_url: /[a-zA-Z]{7}/ }

  devise_for :users

  namespace :api, defaults: {format: 'json'} do
    api_version(module: 'V1', path: {value: 'v1'}) do
      resources :url_generator
      get :dashboard, to: 'url_generator#dashboard'
      get 'link_details/:tracked_url', as: :tracked_link_details, to: 'url_generator#tracked_link_details',
          constraints: { tracked_url: /[a-zA-Z]{7}/ }
    end
  end

  root 'url_generator#dashboard'
  resources :url_generator
  get :dashboard, to: 'url_generator#dashboard'
  get 'link_details/:tracked_url', as: :tracked_link_details, to: 'url_generator#tracked_link_details',
      constraints: { tracked_url: /[a-zA-Z]{7}/ }

  if Rails.env.development?
    mount Swagger::Engine => 'swagger'
  end
end
