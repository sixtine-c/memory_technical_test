class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  validates :order_reference, presence: true, uniqueness: true
  validates :date, presence: true
  validates :customer_id, presence: true

  def order_revenue
    order_products.sum(&:revenues)
  end

   scope :month, lambda { |month| where('extract(month from date) = ?', month) }
   scope :year, lambda { |year| where('extract(year from date) = ?', year) }
  # scope :year_month, lambda { |year, month| where('extract(year from date) = ? AND extract(month from date) = ?', year, month) }

end
