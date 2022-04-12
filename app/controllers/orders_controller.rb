class OrdersController < ApplicationController
  def dashboard

    @country = params["country"]

    #calculate total revenues
    # @order_products = Customer.includes(:order_products).where(country: 'United Kingdom').map { |customer| customer.order_products }.flatten


    # #calculate number of customers.
    # @number_of_customers = Customer.where(country: "United Kingdom").count

    # #calculate average revenue per order
    # @average_revenue = @total_revenue / Customer.includes(:orders).where(country: 'United Kingdom').map { |customer| customer.orders }.flatten.count

    #calculate revenues per month
    @orders = Customer.includes(:orders).where(country: 'United Kingdom').map { |customer| customer.orders }.flatten


    #
    # @customers = Customer.includes(country: 'United Kingdom')
    # @orders = []
    # @customers.each do |customer|
    #   order = Order.includes(customer_id: customer.id)
    #   order.each do |o|
    #     @orders << o
    #   end
    # end
    # @total_revenue = 0
    # @orders.each do |order|
    #   order_product = OrderProduct.includes(order_id: order.id)


    # end

    # def average_revenue_per_order
    #   total_revenue / @orders.count
    # end

    # def number_customers
    #   @customers = Customer.where(country: @country).count
    # end
  end

  private

  # def total_revenues
  #   @total_revenue = 0
  #   @order_products.each do |item|
  #     @total_revenue += item.quantity * item.unit_price
  #   end
  # end

end
