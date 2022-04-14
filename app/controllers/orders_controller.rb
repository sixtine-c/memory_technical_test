class OrdersController < ApplicationController
  def dashboard
    @countries = create_country_list
    @country = params[:query]

    if @country.nil? || @country == 'All'
      @orders = Customer.includes(:orders).map(&:orders).flatten
      @order_products = Customer.includes(:order_products).map(&:order_products).flatten
    else
      @orders = Customer.includes(:orders).where(country: @country).map(&:orders).flatten
      @order_products = Customer.includes(:order_products).where(country: @country).map(&:order_products).flatten
    end

    @number_of_customers = calculate_number_of_customers.round(0)
    @total_revenues = calculate_total_revenues.fdiv(1_000_000).round(1)
    @average_revenue = (@total_revenues * 1_000_000 / @orders.count).round(1)
  end

  private

  def create_country_list
    countries = ['All']
    Customer.all.each do |customer|
      countries << customer.country unless countries.include?(customer.country)
    end
    countries
  end

  def calculate_number_of_customers
    @country.nil? || @country == 'All' ? Customer.count : Customer.where(country: @country).count
  end

  def calculate_total_revenues
    total_revenue = 0
    @order_products.each { |item| total_revenue += item.revenues }
    total_revenue
  end
end
