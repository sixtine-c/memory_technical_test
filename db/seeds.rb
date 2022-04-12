
puts "deleting the previous DB"
OrderProduct.destroy_all
Order.destroy_all
Customer.destroy_all
puts "DB deleted"

puts "creating the new DB"
require 'csv'

filepath = 'db/data/memory-tech-challenge-data.csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

CSV.foreach(filepath, csv_options) do |row|
  #creating unique customers
  Customer.create!(customer_reference: row['customer_id'], country: row['country']) unless Customer.find_by(customer_reference: row['customer_id'])

  #creating unique orders
  customer = Customer.find_by(customer_reference: row['customer_id'])
  Order.create!(order_reference: row['order_id'], date: row['date'], customer_id: customer.id) unless Order.find_by(order_reference: row['order_id'])

  # creating order_products
  order = Order.find_by(order_reference: row['order_id'])
  OrderProduct.create!(product_code: row['product_code'], product_description: row['product_description'], quantity: row['quantity'], unit_price: row['unit_price'], order_id: order.id)
end

puts "seed done, creating #{Customer.count} customers, #{Order.count} orders and #{OrderProduct.count} orders products"
