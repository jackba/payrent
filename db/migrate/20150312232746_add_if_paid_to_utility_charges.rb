class AddIfPaidToUtilityCharges < ActiveRecord::Migration
  def change
    add_column :utility_charges, :is_paid, :boolean, null: false, default: false
  end
end
