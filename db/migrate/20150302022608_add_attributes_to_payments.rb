class AddAttributesToPayments < ActiveRecord::Migration
  def change
  	add_column :payments, :rent_paid, :decimal, precision: 6, scale: 2
  	add_column :payments, :security_paid, :decimal, precision: 6, scale: 2
  end
end
