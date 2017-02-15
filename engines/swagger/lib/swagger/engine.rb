module Swagger
  class Engine < ::Rails::Engine
    # isolate_namespace Swagger
    if Rails.env.development?
      initializer "static assets" do |app|
        app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
      end
    end
  end
end
