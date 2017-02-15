Rails.application.routes.draw do
  mount Swagger::Engine => "/swagger"
end
