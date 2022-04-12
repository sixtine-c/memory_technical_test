class Customer < ApplicationRecord
  has_many :orders
  has_many :order_products, through: :orders

  validates :customer_reference, presence: true, uniqueness: true
  validates :country, presence: true

  COUNTRIES = ['France', 'United Kingdom']
end
