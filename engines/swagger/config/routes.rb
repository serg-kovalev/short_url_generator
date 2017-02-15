Swagger::Engine.routes.draw do
  get '/' => 'swagger/apidocs#index'
end
