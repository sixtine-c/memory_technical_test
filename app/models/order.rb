class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  validates :order_reference, presence: true, uniqueness: true
  validates :date, presence: true
  validates :customer_id, presence: true

  def order_revenue
    order_products.sum(&:revenues)
  end
end
