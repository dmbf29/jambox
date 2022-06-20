class AddOmniAuthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime
    add_column :users, :provider, :string
    add_column :users, :picture_url, :string
    add_column :users, :country, :string
    add_column :users, :spotify_id, :bigint
  end
end
