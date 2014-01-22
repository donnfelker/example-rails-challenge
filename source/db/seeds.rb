# predefined Customers
Customer.create(firstname: "Johny",   lastname: "Flow")
Customer.create(firstname: "Raj",     lastname: "Jamnis")
Customer.create(firstname: "Andrew",  lastname: "Chung")
Customer.create(firstname: "Mike",    lastname: "Smith")



# 10 Should be successful transactions:
#   - 5 Should be linked to Customer 1
Charge.create(paid: true, amount: 10,   currency: "usd", refunded: false, customer_id: 1)
Charge.create(paid: true, amount: 518,  currency: "usd", refunded: false, customer_id: 1)
Charge.create(paid: true, amount: 10,   currency: "usd", refunded: false, customer_id: 1)
Charge.create(paid: true, amount: 518,  currency: "usd", refunded: false, customer_id: 1)
Charge.create(paid: true, amount: 111,  currency: "usd", refunded: false, customer_id: 1)
#   - 3 Should be linked to Customer 2
Charge.create(paid: true, amount: 24,   currency: "usd", refunded: false, customer_id: 2)
Charge.create(paid: true, amount: 4,    currency: "usd", refunded: false, customer_id: 2)
Charge.create(paid: true, amount: 28,   currency: "usd", refunded: false, customer_id: 2)
#   - 1 Should be linked to Customer 3
Charge.create(paid: true, amount: 37,   currency: "usd", refunded: false, customer_id: 3)
#   - 1 Should be linked to Customer 4
Charge.create(paid: true, amount: 113,  currency: "usd", refunded: false, customer_id: 4)



# 5 Should be transactions that failed:
#   - 3 Should be linked to Customer 3
Charge.create(paid: false, amount: 184, currency: "usd", refunded: false, customer_id: 3)
Charge.create(paid: false, amount: 741, currency: "usd", refunded: false, customer_id: 3)
Charge.create(paid: false, amount: 20,  currency: "usd", refunded: false, customer_id: 3)
#   - 2 Should be linked to Customer 4
Charge.create(paid: false, amount: 100, currency: "usd", refunded: false, customer_id: 4)
Charge.create(paid: false, amount: 222, currency: "usd", refunded: false, customer_id: 4)



# 5 should be disputed:
#   - 3 should be linked to Customer 1
Charge.create(paid: true, amount: 33,   currency: "usd", refunded: true, customer_id: 1)
Charge.create(paid: true, amount: 44,   currency: "usd", refunded: true, customer_id: 1)
Charge.create(paid: true, amount: 227,  currency: "usd", refunded: true, customer_id: 1)
#   - 2 should be linked to customer 2
Charge.create(paid: true, amount: 100,  currency: "usd", refunded: true, customer_id: 2)
Charge.create(paid: true, amount: 99,   currency: "usd", refunded: true, customer_id: 2)
