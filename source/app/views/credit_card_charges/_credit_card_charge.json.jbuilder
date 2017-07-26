json.extract! credit_card_charge, :id, :paid, :amount, :currency, :refunded,
              :customer_id
json.created credit_card_charge.created_at
