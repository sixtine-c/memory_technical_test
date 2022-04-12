class CreateOrderDates < ActiveRecord::Migration[6.1]
  def change
    create_table :order do |t|
      t.integer :order_reference
      t.datetime :date
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
