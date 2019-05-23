json.extract! charge, :id, :paid, :amount, :currency, :refunded, :customer_id, :created_at, :updated_at
json.url charge_url(charge, format: :json)
