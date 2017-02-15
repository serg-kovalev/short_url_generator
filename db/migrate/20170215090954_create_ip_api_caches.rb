class CreateIpApiCaches < ActiveRecord::Migration
  def change
    create_table :ip_api_caches do |t|
      t.string :ip_address
      t.string :city
      t.string :country
      t.string :country_code
      t.string :isp
      t.string :lat
      t.string :lon
      t.string :org
      t.string :region
      t.string :region_name
      t.string :timezone
      t.string :zip

      t.timestamps null: false
    end
    add_index :ip_api_caches, :ip_address, unique: true
  end
end
