def transaction_params
  {
    created: Time.now.to_i,
    amount: Random.rand(100..9_900),
    currency: 'usd'
  }
end

Customer.create(first_name: 'Johny', last_name: 'Flow')
Customer.create(first_name: 'Raj', last_name: 'Jamnis')
Customer.create(first_name: 'Andrew', last_name: 'Chung')
Customer.create(first_name: 'Mike', last_name: 'Smith')

# successful
5.times { Customer.first.transactions << Transaction.successful.create(transaction_params) }
3.times { Customer.second.transactions << Transaction.successful.create(transaction_params) }
Customer.third.transactions << Transaction.successful.create(transaction_params)
Customer.fourth.transactions << Transaction.successful.create(transaction_params)

# failed
3.times { Customer.third.transactions << Transaction.failed.create(transaction_params) }
2.times { Customer.fourth.transactions << Transaction.failed.create(transaction_params) }

# disputed
3.times { Customer.first.transactions << Transaction.disputed.create(transaction_params) }
2.times { Customer.second.transactions << Transaction.disputed.create(transaction_params) }
