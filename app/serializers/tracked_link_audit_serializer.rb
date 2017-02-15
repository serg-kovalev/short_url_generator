class TrackedLinkAuditSerializer < ActiveModel::Serializer
  attributes :id, :tracked_link_id, :ip_address, :created_at, :updated_at
end