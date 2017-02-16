module Swagger::V1
  class UrlGeneratorController < Swagger::ApplicationController
    include Swagger::Blocks

    swagger_path '/v1/dashboard' do
      operation :get do
        key :description, 'Returns a collection of active Tracked Links if the user has an access'
        key :tags, [
            'Dashboard (only active Tracked Links)'
        ]
        response 200 do
          key :description, 'Dashboard response'
          # schema do
          #   key :'$ref', :TrackedLink
          # end
        end
        response :default do
          key :description, 'unexpected error'
        end
      end
    end

    swagger_path '/v1/tracked_links' do
      operation :get do
        key :description, 'Returns a collection of all Tracked Links if the user has an access'
        key :tags, [
            'Tracked Links List (all)'
        ]
        response 200 do
          key :description, 'Tracked Links List response'
          # schema do
          #   key :'$ref', :TrackedLink
          # end
        end
        response :default do
          key :description, 'unexpected error'
        end
      end
    end

    swagger_path '/v1/url_generator' do
      operation :get do
        key :description, 'Returns a collection of Destination Links if the user has an access'
        key :tags, [
            'Destination Links List'
        ]
        response 200 do
          key :description, 'Destination Links response'
          # schema do
          #   key :'$ref', :DestinationLink
          # end
        end
        response :default do
          key :description, 'unexpected error'
        end
      end
    end

    swagger_path '/v1/url_generator/{id}' do
      operation :get do
        key :description, 'Returns a single Destination Link if the user has an access'
        key :tags, [
            'Get Destination Link'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of Destination Link to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        response 200 do
          key :description, 'Destination Link response'
          # schema do
          #   key :'$ref', :DestinationLink
          # end
        end
        response :default do
          key :description, 'unexpected error'
        end
      end
    end

    swagger_path '/v1/url_generator/{id}' do
      operation :put do
        key :description, 'Updates a single Destination Link if the user has an access'
        key :tags, [
            'Update Destination Link'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of Destination Link to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter do
          key :name, :destination_link
          key :in, 'body'
          key :required, true
          schema do
            key :'$ref', :DestinationLinkInput
          end
        end
        response 200 do
          key :description, 'Update Destination Link response'
          schema do
            key :'$ref', :DestinationLink
          end
        end
        response :default do
          key :description, 'unexpected error'
        end
      end
    end
  end
end
