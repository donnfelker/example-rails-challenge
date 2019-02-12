=begin
Seed 4 Customers into the system:
Customer 1:
  First Name: Johny
  Last Name: Flow

Customer 2:
  First Name: Raj
  Last Name: Jamnis

Customer 3:
  First Name: Andrew
  Last Name: Chung

Customer 4:
  First Name: Mike
  Last Name: Smith
=end

def setup_customers
  return Customer.all if Customer.exists?

  customers_data = [
    { first_name: 'Johny', last_name: 'Flow' },
    { first_name: 'Raj', last_name: 'Jamnis' },
    { first_name: 'Andrew', last_name: 'Chung' },
    { first_name: 'Mike', last_name: 'Smith' }
  ]

  Customer.create(customers_data)
end

=begin
Seed 20 transactions (charges) into the system:
10 Should be successful transactions:
  - 5 Should be linked to Customer 1
  - 3 Should be linked to Customer 2
  - 1 Should be linked to Customer 3
  - 1 Should be linked to Customer 4

5 Should be transactions that failed:
  - 3 Should be linked to Customer 3
  - 2 Should be linked to Customer 4

5 should be disputed:
  - 3 should be linked to Customer 1
  - 2 should be linked to customer 2
=end

def create_charge(customer, type)
  customer.charges.send(type).create(
    amount_in_cents: rand(1_00..9999_00),
    currency: 'usd',
    created: rand(360).days.ago
  )
end

def setup_successful_charges(customers)
  return if Charge.successful.exists?

  5.times { create_charge(customers[0], :successful) }
  3.times { create_charge(customers[1], :successful) }
  create_charge(customers[2], :successful)
  create_charge(customers[3], :successful)
end

def setup_failed_charges(customers)
  return if Charge.failed.exists?

  3.times { create_charge(customers[2], :failed) }
  2.times { create_charge(customers[3], :failed) }
end

def setup_disputed_charges(customers)
  return if Charge.disputed.exists?

  3.times { create_charge(customers[0], :disputed) }
  2.times { create_charge(customers[1], :disputed) }
end

customers = setup_customers
setup_successful_charges(customers)
setup_failed_charges(customers)
setup_disputed_charges(customers)
