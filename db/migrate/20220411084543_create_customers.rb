class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.integer :customer_reference
      t.string :country

      t.timestamps
    end
  end
end
