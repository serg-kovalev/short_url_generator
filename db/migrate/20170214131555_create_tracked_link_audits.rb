class CreateTrackedLinkAudits < ActiveRecord::Migration
  def change
    create_table :tracked_link_audits do |t|
      t.references :tracked_link, index: true, foreign_key: true
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
