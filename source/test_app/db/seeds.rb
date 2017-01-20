# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Customer 1:
#   First Name: Johny
#   Last Name: Flow

# Customer 2:
#   First Name: Raj
#   Last Name: Jamnis

# Customer 3:
#   First Name: Andrew
#   Last Name: Chung

# Customer 4:
#   First Name: Mike
#   Last Name: Smith
first_customer = Customer.create(first_name: 'Johny', last_name: 'Flow');
second_customer = Customer.create(first_name: 'Raj', last_name: 'Jamnis');
third_customer = Customer.create(first_name: 'Andrew', last_name: 'Chung');
fourth_customer = Customer.create(first_name: 'Mike', last_name: 'Smith');

rand = Random.new

# Seed transactions

# successful charges

5.times do
  first_customer.credit_card_charges.successful.create(
    created: Time.now.to_i,
    amount: rand(1000...50000),
    currency: 'usd',
  )
end

3.times do
  second_customer.credit_card_charges.successful.create(
    created: Time.now.to_i,
    amount: rand(1000...50000),
    currency: 'usd',
  )
end

third_customer.credit_card_charges.successful.create(
  created: Time.now.to_i,
  amount: rand(1000...50000),
  currency: 'usd',
)

fourth_customer.credit_card_charges.successful.create(
  created: Time.now.to_i,
  amount: rand(1000...50000),
  currency: 'usd',
)

# failed transactions

3.times do
  third_customer.credit_card_charges.failed.create(
    created: Time.now.to_i,
    amount: rand(1000...50000),
    currency: 'usd',
  )
end

2.times do
  fourth_customer.credit_card_charges.failed.create(
    created: Time.now.to_i,
    amount: rand(1000...50000),
    currency: 'usd',
  )
end

# disputed transactions

3.times do
  first_customer.credit_card_charges.disputed.create(
    created: Time.now.to_i,
    amount: rand(1000...50000),
    currency: 'usd',
  )
end

2.times do
  second_customer.credit_card_charges.disputed.create(
    created: Time.now.to_i,
    amount: rand(1000...50000),
    currency: 'usd',
  )
end
