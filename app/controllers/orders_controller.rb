class OrdersController < ApplicationController
  def dashboard

    # def total_revenues
    # @orders = Customer.includes(:orders).where(country: 'United Kingdom').map { |customer| customer.orders }.flatten
    # @order_products = []
    # @orders.each do |order|
    #   @order_product = Order.includes(:order_products).where(id: order.id).map { |o| o.order_products }.flatten
    #   @order_products << @order_product
    # end

    #calculate total revenues
    @order_products = Customer.includes(:order_products).where(country: 'United Kingdom').map { |customer| customer.order_products }.flatten
    @total_revenue = 0
    @order_products.each do |item|
      @total_revenue += item.quantity * item.unit_price
    end

    #calculate number of customers.
    @number_of_customers = Customer.where(country: "United Kingdom").count

    #calculate average revenue per order
    @average_revenue = @total_revenue / Customer.includes(:orders).where(country: 'United Kingdom').map { |customer| customer.orders }.flatten.count

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

  # private

end
