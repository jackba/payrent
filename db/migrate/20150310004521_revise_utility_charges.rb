class ReviseUtilityCharges < ActiveRecord::Migration
  def change
    remove_column :utility_charges, :property_id
    remove_column :utility_charges, :tenant_count
    add_column :utility_charges, :unit_id, :integer
    add_index :utility_charges, :unit_id
  end
end
