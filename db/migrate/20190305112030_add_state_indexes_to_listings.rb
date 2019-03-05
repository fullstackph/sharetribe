class AddStateIndexesToListings < ActiveRecord::Migration[5.1]
  def change
    add_index :listings, [:community_id, :open, :state, :deleted, :valid_until, :sort_date], name: 'listings_homepage_query'
    add_index :listings, [:community_id, :open, :state, :deleted, :valid_until, :updates_email_at, :created_at], name: 'listings_updates_email'
  end
end
