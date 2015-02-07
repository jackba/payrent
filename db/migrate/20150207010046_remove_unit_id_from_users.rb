class RemoveUnitIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :unit_id, :integer
  end
end
