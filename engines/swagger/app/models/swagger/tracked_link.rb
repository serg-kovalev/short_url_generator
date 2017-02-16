module Swagger
  class TrackedLink < ApplicationRecord
    include Swagger::Blocks

    swagger_schema :TrackedLink do
      key :required, [:destination_link_id, :tracked_url]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :tracked_url do
        key :type, :string
      end
      property :destination_link_id do
        key :type, :integer
        key :format, :int64
      end
      property :visits_count do
        key :type, :integer
        key :format, :int64
      end
    end
  end
end
