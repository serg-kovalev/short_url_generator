require 'securerandom'

class TrackedLink < ActiveRecord::Base
  belongs_to :destination_link
  has_many :tracked_link_audits, dependent: :destroy

  validates_presence_of :destination_link_id, :tracked_url
  validates_uniqueness_of :tracked_url

  before_validation :generate_tracked_url

  scope :with_destination_link, -> {
    includes(:destination_link)
  }

  def visit_event(options = {})
    tracked_link_audits << TrackedLinkAudit.new(options)
  end

  private

  def generate_tracked_url
    return self.tracked_url if self.tracked_url.present?
    self.tracked_url = loop do
      token = SecureRandom.urlsafe_base64.gsub(/[^a-zA-Z]/, '')[0..6] # first 7 letters
      break token unless TrackedLink.where(tracked_url: token).any?
    end
  end
end
