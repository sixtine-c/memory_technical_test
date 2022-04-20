class OrdersController < ApplicationController
  def dashboard
    @countries = create_country_list
    @country = params[:query]

    if @country.nil? || @country == 'All'
      @customers = Customer.all
      @orders = Customer.includes(:orders).map(&:orders).flatten
    else
      @customers = Customer.where(country: @country)
      @orders = Customer.includes(:orders).where(country: @country).map(&:orders).flatten
    end

    @number_of_customers = calculate_number_of_customers.round(0)
    @total_revenues = calculate_total_revenues.fdiv(1_000_000).round(1)
    @average_revenue = (@total_revenues * 1_000_000 / @orders.count).round(1)


  end
  private

  def create_country_list
    countries = ['All']
    Customer.select(:country).distinct.order(:country).each{|c|countries<<c.country}
    countries
  end

  def calculate_number_of_customers
    @country.nil? || @country == 'All' ? Customer.count : Customer.where(country: @country).count
  end

  def calculate_total_revenues
    if @country.nil? || @country == 'All'
      total_revenue = OrderProduct.sum('quantity * unit_price')
    else
      total_revenue = Customer.includes(:order_products).where(country: @country).sum('quantity * unit_price')
    end
    total_revenue
  end



end
