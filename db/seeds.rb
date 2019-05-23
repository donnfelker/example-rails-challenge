customers = Customer.create([
  {
    first_name: 'Johny',
    last_name: 'Flow'
  },
  {
    first_name: 'Raj',
    last_name: 'Jamnis'
  },
  {
    first_name: 'Andrew',
    last_name: 'Chung'
  },
  {
    first_name: 'Mike',
    last_name: 'Smith'
  }
])


# successful transactions
Charge.create([
  {
    paid: true,
    customer: customers[0],
    amount: 11
  },
  {
    paid: true,
    customer: customers[0],
    amount: 12
  },
  {
    paid: true,
    customer: customers[0],
    amount: 13
  },
  {
    paid: true,
    customer: customers[0],
    amount: 14
  },
  {
    paid: true,
    customer: customers[0],
    amount: 15
  },
  {
    paid: true,
    customer: customers[1],
    amount: 16
  },
  {
    paid: true,
    customer: customers[1],
    amount: 17
  },
  {
    paid: true,
    customer: customers[1],
    amount: 18
  },
  {
    paid: true,
    customer: customers[2],
    amount: 19
  },
  {
    paid: true,
    customer: customers[3],
    amount: 20
  }
])

#failed transactions
Charge.create([
  {
    failed_at: Time.current,
    customer: customers[2],
    amount: 21
  },
  {
    failed_at: Time.current,
    customer: customers[2],
    amount: 22
  },
  {
    failed_at: Time.current,
    customer: customers[2],
    amount: 23
  },
   {
    failed_at: Time.current,
    customer: customers[3],
    amount: 24
  },
  {
    failed_at: Time.current,
    customer: customers[3],
    amount: 25
  }
])

#disputed transactions
Charge.create([
  {
    disputed_at: Time.current,
    customer: customers[0],
    amount: 26
  },
  {
    disputed_at: Time.current,
    customer: customers[0],
    amount: 27
  },
  {
    disputed_at: Time.current,
    customer: customers[0],
    amount: 28
  },
   {
    disputed_at: Time.current,
    customer: customers[1],
    amount: 29
  },
  {
    disputed_at: Time.current,
    customer: customers[1],
    amount: 30
  }
])
