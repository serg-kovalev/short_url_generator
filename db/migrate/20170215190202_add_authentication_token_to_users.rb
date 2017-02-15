class AddAuthenticationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string, limit: 30
    add_index :users, :authentication_token, unique: true

    User.find_each do |u|
      u.update(authentication_token: nil) # forcing token regeneration
    end
  end
end
