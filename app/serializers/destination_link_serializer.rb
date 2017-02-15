class DestinationLinkSerializer < ActiveModel::Serializer
  attributes :id, :url, :user_id, :created_at, :updated_at
end