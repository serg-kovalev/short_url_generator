class AddCounterCacheToTrackedLinks < ActiveRecord::Migration
  def change
    add_column :tracked_links, :visits_count, :integer, null: false, default: 0

    TrackedLink.find_each do |tl|
      TrackedLink.reset_counters(tl.id, :tracked_link_audits)
    end
  end
end
