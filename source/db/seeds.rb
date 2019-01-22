customers = [{
    first_name:  'Johny',
    last_name: 'Flow'
  },{
    first_name:  'Raj',
    last_name: 'Jamnis'
  },{
    first_name:  'Andrew',
    last_name: 'Chung'
  },{
    first_name:  'Mike',
    last_name: 'Smith'
  }].map {|attrs| Customer.create!(attrs) }

TRANSACTION_PARAMS = {
  successful: {
    paid: true,
    refunded: false
  },
  failed: {
    paid: false,
    refunded: false
  },
  disputed: {
    paid: true,
    refunded: true
  }
}

def create_transaction(customer, key = :successful)
  Charge.create!({
      customer: customer,
      amount: (rand * 1000).round(2),
      created: Time.zone.now.to_i,
      currency: Charge::DEFAULT_CURRENCY
    }.merge(TRANSACTION_PARAMS[key])
  )
end

5.times { create_transaction(customers[0]) }
3.times { create_transaction(customers[1]) }
1.times { create_transaction(customers[2]) }
1.times { create_transaction(customers[3]) }
3.times { create_transaction(customers[2], :failed) }
2.times { create_transaction(customers[3], :failed) }
3.times { create_transaction(customers[0], :disputed) }
2.times { create_transaction(customers[1], :disputed) }
