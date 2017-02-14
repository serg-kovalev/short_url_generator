class CreateTrackedLinks < ActiveRecord::Migration
  def change
    create_table :tracked_links do |t|
      t.string :tracked_url
      t.references :destination_link, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tracked_links, :tracked_url, unique: true
  end
end
