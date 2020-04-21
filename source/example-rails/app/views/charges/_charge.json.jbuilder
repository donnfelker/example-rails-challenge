json.extract! charge, :id, :created, :paid, :amount, :currency, :refunded, :customer, :created_at, :updated_at
json.url charge_url(charge, format: :json)
