class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :description
      t.decimal :rent_charge, precision: 6, scale: 2
      t.decimal :security_charge, precision: 6, scale: 2
      t.boolean :security_paid
      t.integer :user_id, index: true
      t.references :property, index: true

      t.timestamps
    end
  end
end
