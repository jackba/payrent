class CreatePaidRents < ActiveRecord::Migration
  def change
    create_table :paid_rents do |t|
      t.date :date_due
      t.boolean :paid
      t.references :unit, index: true

      t.timestamps
    end
  end
end
