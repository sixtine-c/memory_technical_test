class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.string :product_code
      t.string :product_description
      t.integer :quantity
      t.float :unit_price
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
