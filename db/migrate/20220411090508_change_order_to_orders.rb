class ChangeOrderToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_table :order, :orders
  end
end
