class DestinationLink < ActiveRecord::Base
  belongs_to :user
  has_many :tracked_links

  scope :by_user, -> (user) {
    where(user_id: user)
  }
  scope :with_tracked_links, -> {
    includes(:tracked_links)
  }

  validates_presence_of :user_id, :url
end
