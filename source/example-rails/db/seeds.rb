Customer.delete_all
Charge.delete_all


## Seed Customers ##
first_names = %w(Johny Raj Andrew Mike)
last_names = %w(Flow Jamnis Chung Smith)
customers = []
4.times do |i|
  customers << Customer.create(first_name: first_names[i], last_name: last_names[i])
end


## Seed Successfull Charges ##
customer_success_transactions = { 1 => 5, 2 => 3, 3 => 1, 4 => 1 } # In a format of { customer_order => number_of_transactions }
customer_success_transactions.keys.each do |customer_number|
  customer_success_transactions[customer_number].times do
    Charge.create(
      customer: customers[customer_number - 1],
      paid: true,
      amount: rand(3000..5000),
      currency: "usd"
    )
  end
end

## Seed Failed Charges ##
customer_failed_transactions = { 3 => 3, 4 => 2 }
customer_failed_transactions.keys.each do |customer_number|
  customer_failed_transactions[customer_number].times do |i|
    Charge.create(
      customer: customers[customer_number - 1],
      paid: false,
      amount: rand(3000..5000),
      currency: "usd"
    )
  end
end

## Seed Disputed Charges ##
customer_disputed_transactions = { 1 => 3, 2 => 2 }
customer_disputed_transactions.keys.each do |customer_number|
  customer_disputed_transactions[customer_number].times do |i|
    Charge.create(
      customer: customers[customer_number - 1],
      paid: true,
      refunded: true,
      amount: rand(3000..5000),
      currency: "usd"
    )
  end
end
