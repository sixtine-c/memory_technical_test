module ApplicationHelper
  def revenue_month(date)
    Order.includes(:order_products).where(customer_id: @customers).year(date.year).month(date.month).sum('unit_price * quantity')
  end
end
