class TrackedLinkSerializer < ActiveModel::Serializer
  attributes :id, :tracked_url, :destination_link_id, :visits_count, :created_at, :updated_at
end