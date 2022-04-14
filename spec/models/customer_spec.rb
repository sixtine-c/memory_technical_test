require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'has a customer_reference' do
    customer = Customer.new(
      customer_reference: '',
      country: 'France'
    )
    expect(customer).to_not be_valid
    customer.customer_reference = 3
    expect(customer).to be_valid
  end

  it 'has a customer_reference' do
    customer = Customer.new(
      customer_reference: 3,
      country: ''
    )
    expect(customer).to_not be_valid
    customer.country = 'France'
    expect(customer).to be_valid
  end
end
