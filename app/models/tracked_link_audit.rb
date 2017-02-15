class TrackedLinkAudit < ActiveRecord::Base
  belongs_to :tracked_link, counter_cache: :visits_count
  has_one :ip_api_cache, foreign_key: 'ip_address', primary_key: 'ip_address'

  scope :with_ip_api, -> {
    includes(:ip_api_cache)
  }
end
