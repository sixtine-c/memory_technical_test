class OrdersController < ApplicationController
  def dashboard
    @countries = create_country_list
    @country = params[:query]

    if @country.nil?
      @orders = Customer.includes(:orders).map { |customer| customer.orders }.flatten
      @order_products = Customer.includes(:order_products).map { |customer| customer.order_products }.flatten
    else
      @orders = Customer.includes(:orders).where(country: @country).map { |customer| customer.orders }.flatten
      @order_products = Customer.includes(:order_products).where(country: @country).map { |customer| customer.order_products }.flatten
    end

    @number_of_customers = calculate_number_of_customers.fdiv(1_000)
    @total_revenues = calculate_total_revenues.fdiv((1_000).round(0))
    @average_revenue = (@total_revenues / @orders.count).round(1)
  end

  private

  def create_country_list
    countries = []
    Customer.all.each do |customer|
      countries << customer.country unless countries.include?(customer.country)
    end
    countries
  end

  def calculate_number_of_customers
    if @country.nil?
      @number_of_customers = Customer.count
    else
      @number_of_customers = Customer.where(country: @country).count
    end
  end

  def calculate_total_revenues
    total_revenue = 0
    @order_products.each do |item|
      total_revenue += item.quantity * item.unit_price
    end
    total_revenue
  end

  # def calculate_monthly_revenue(order)
  #   Order.includes(:order_products).where(id: order.id).sum{|i|i.quantity*i.unit_price}
  # end
end
