class CreateUtilityCharges < ActiveRecord::Migration
  def change
    create_table :utility_charges do |t|
      t.string :utility_name
      t.decimal :utility_charge, precision: 6, scale: 2
      t.string :utility_charge_date
      t.references :property, index: true

      t.timestamps
    end
  end
end
