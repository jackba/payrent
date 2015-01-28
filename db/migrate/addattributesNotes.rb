class AddAttributesToUser < ActiveRecord::Migration
  def change
  	add_column :users, :unit_id, :integer
  	add_column :users, 


  	add_index :users, :unit_id
  end
end
rails g migration AddAttributesToUser for above......
property has_many units
proprty has_many utility_charges
property has address, image(s)

utility_charges belongs_to property, has date of charge, and charge amount, charge name (power, water, etc)

unit belongs_to property
unit has_one user
unit has fields for rent, security deposit, description

user belongs_to unit, stripe stuff

payments belongs_to user, belongs_to unit, belongs_to utility_charges