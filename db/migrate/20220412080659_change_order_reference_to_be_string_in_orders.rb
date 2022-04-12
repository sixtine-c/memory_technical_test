class ChangeOrderReferenceToBeStringInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :order_reference, :string
  end
end
