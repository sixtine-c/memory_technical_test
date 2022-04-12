class Customer < ApplicationRecord
  has_many :orders
  validates :customer_reference, presence: true, uniqueness: true
  validates :country, presence: true
end
