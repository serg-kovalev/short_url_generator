module Swagger
  class DestinationLink < ApplicationRecord
    include Swagger::Blocks

    swagger_schema :DestinationLink do
      key :required, [:url, :user_id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :url do
        key :type, :string
      end
      property :user_id do
        key :type, :integer
      end
    end

    swagger_schema :DestinationLinkInput do
      allOf do
        schema do
          key :type, :object
          property :destination_link do
            key :required, [:url, :user_id]
            property :url do
              key :type, :string
            end
            property :user_id do
              key :type, :integer
              key :format, :int64
            end
            property :new_tracked_link do
              key :type, :boolean
            end
          end
        end
      end
      key :default, {
          destination_link: {
            url: 'http://goo.gl',
            user_id: 1,
            new_tracked_link: true
          }
      }
    end
  end
end
