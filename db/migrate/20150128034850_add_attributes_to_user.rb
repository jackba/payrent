class AddAttributesToUser < ActiveRecord::Migration
  def change
  	add_column :users, :unit_id, :integer
  	add_column :users, :admin, :boolean, null: false, default: false
  	add_column :users, :stripe_pub_key, :string
  	add_column :users, :stripe_secret_key, :string

  	add_index :users, :unit_id
  end
end
