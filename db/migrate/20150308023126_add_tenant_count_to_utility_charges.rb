class AddTenantCountToUtilityCharges < ActiveRecord::Migration
  def change
    add_column :utility_charges, :tenant_count, :integer
  end
end
