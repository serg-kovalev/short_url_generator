class DestinationLink < ActiveRecord::Base
  belongs_to :user
  has_many :tracked_links, dependent: :destroy

  attr_accessor :new_tracked_link

  validates_presence_of :user_id, :url

  scope :by_user, -> (user) {
    where(user_id: user)
  }
  scope :with_tracked_links, -> {
    includes(:tracked_links)
  }
end
