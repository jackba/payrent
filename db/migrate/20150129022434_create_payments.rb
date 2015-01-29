class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user, index: true
      t.references :unit, index: true
      t.references :utility_charge, index: true
      t.decimal :total_paid, precision: 6, scale: 2

      t.timestamps
    end
  end
end
