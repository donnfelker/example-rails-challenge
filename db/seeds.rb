# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed 4 Customers
customer_one = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer_two = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer_three = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer_four = Customer.create(first_name: 'Mike', last_name: 'Smith')

# Seed 10 transactions (charges) successful
[3000,3500,4000,4500,5000].each do |amount|
	CreditCardCharge.create(paid: true, amount: amount, customer: customer_one, currency: "usd")
end

[3000,3500,4000].each do |amount|
	CreditCardCharge.create(paid: true, amount: amount, customer: customer_two, currency: "usd")
end

CreditCardCharge.create(paid: true, amount: 5000, customer: customer_three, currency: "usd")
CreditCardCharge.create(paid: true, amount: 5500, customer: customer_four, currency: "usd")

# Seed 5 transactions (charges) failed
[3000,3500,4000].each do |amount|
	CreditCardCharge.create(paid: false, amount: amount, customer: customer_three, currency: "usd")
end

[5000, 5500].each do |amount|
	CreditCardCharge.create(paid: false, amount: amount, customer: customer_four, currency: "usd")
end

# Seed 5 transactions (charges) disputed
[3000,3500,4000].each do |amount|
	CreditCardCharge.create(paid: true, amount: amount, customer: customer_one, currency: "usd", refunded: true)
end

[5000, 5500].each do |amount|
	CreditCardCharge.create(paid: true, amount: amount, customer: customer_two, currency: "usd", refunded: true)
end
