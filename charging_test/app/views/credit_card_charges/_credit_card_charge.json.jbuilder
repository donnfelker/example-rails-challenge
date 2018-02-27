json.extract! credit_card_charge, :id, :paid, :amount, :currency, :refunded, :customer_id, :created_at, :updated_at
json.url credit_card_charge_url(credit_card_charge, format: :json)
