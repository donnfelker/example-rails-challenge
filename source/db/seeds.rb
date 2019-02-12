
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

customers = setup_customers
