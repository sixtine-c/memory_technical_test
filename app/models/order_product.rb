class OrderProduct < ApplicationRecord
  belongs_to :order

  def revenues
    quantity * unit_price
  end
end
