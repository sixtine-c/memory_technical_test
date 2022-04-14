RSpec.describe '/orders', type: :request do
  describe 'GET /dasboard' do
    it 'renders a successful response' do
      customer = Customer.create!(customer_reference: 26, country: 'France')
      order = Order.create(order_reference: '330B', date: Time.now, customer_id: customer.id)
      order_product = OrderProduct.create!(product_code: '15B', product_description: 'description', quantity: 3,
                                           unit_price: 1.5, order_id: order.id)
      get dashboard_orders_url
      expect(response).to be_successful
    end
  end
end
