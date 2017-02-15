module Swagger
  class ApidocsController < ApplicationController
    include Swagger::Blocks
    # skip_before_action :authenticate_user!

    swagger_root do
      key :swagger, '2.0'
      key :swagger_ui, '2.1.5'
      info do
        key :version, '1.0.0'
        key :title, 'Short URL Generator API'
        key :description, 'Tool for testing API'
        # key :termsOfService, 'http://helloreverb.com/terms/'
        # contact do
        #   key :name, 'Wordnik API Team'
        # end
        # license do
        #   key :name, 'MIT'
        # end
      end
      tag do
        # key :name, 'short_url_generator'
        # key :description, 'Pets operations'
        # externalDocs do
        #   key :description, 'Find more info here'
        #   key :url, 'https://swagger.io'
        # end
      end
      key :schemes, ['http']
      key :host, 'http://localhost:3000'
      # key :basePath, '/v1'
      key :consumes, ['application/json']
      key :produces, ['application/json']
    end

    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
      # SwaggerSchema,
      V1::UrlGeneratorController,
      Swagger::TrackedLink,
      self
    ].freeze

    def index
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
  end
end
