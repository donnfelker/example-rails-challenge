require 'rails_helper'

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

describe CreditCardCharge, '#successful_charge' do
	it "One for successful charges" do

		# Exercise    
		successful_charge = CreditCardCharge.successful.limit(1)

		# Verify
		expect(successful_charge.count).to eq(1)
	end
end

describe CreditCardCharge, '#failed_charge' do
	it "One for failed charges" do

		# Exercise
		failed_charge = CreditCardCharge.failed.limit(1)

		# Verify
		expect(failed_charge.count).to eq(1)
	end
end

describe CreditCardCharge, '#disputed_charge' do
	it "One for disputed charges" do

		# Exercise
		disputed_charge = CreditCardCharge.disputed.limit(1)

		# Verify
		expect(disputed_charge.count).to eq(1)
	end
end

describe CreditCardCharge, '#successful' do
	it "Verify that in the Successful charges list there are 10 line items" do

		# Exercise
		successful_charge = CreditCardCharge.successful.limit(10)

		# Verify
		expect(successful_charge.count).to eq(10)
	end
end

describe CreditCardCharge, '#failed' do
	it "Verify that in the failed charges list there are 5 line items" do

		# Exercise
		failed_charge = CreditCardCharge.failed.limit(5)

		# Verify
		expect(failed_charge.count).to eq(5)
	end
end

describe CreditCardCharge, '#disputed' do
	it "Verify that in the disputed charges list there are 5 line items" do

		# Exercise
		disputed_charge = CreditCardCharge.disputed.limit(5)

		# Verify
		expect(disputed_charge.count).to eq(5)
	end
end
