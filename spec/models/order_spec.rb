require 'rails_helper'

RSpec.describe Order, type: :model do
  customer = Customer.create!(customer_reference: 1, country: 'France')
  it 'has a order_reference' do
    order = Order.new(
      order_reference: '',
      date: Time.now,
      customer_id: 1
    )
    expect(order).to_not be_valid
    order.order_reference = '33B'
    expect(order).to be_valid
  end

  it 'has a date' do
    order = Order.new(
      order_reference: '33B',
      date: '',
      customer_id: 1
    )
    expect(order).to_not be_valid
    order.date = Time.now
    expect(order).to be_valid
  end

  it 'has a customer_id' do
    order = Order.new(
      order_reference: '33B',
      date: Time.now,
      customer_id: ''
    )
    expect(order).to_not be_valid
    order.customer_id = 1
    expect(order).to be_valid
  end
end
