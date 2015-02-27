class ChangeAttributeInPaidRents < ActiveRecord::Migration
  def change
  	remove_column :paid_rents, :paid
  	add_column :paid_rents, :paid, :boolean, default: false, null: false
  end
end
