class AddPayTypeToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :pay_type, :string
  end
end
