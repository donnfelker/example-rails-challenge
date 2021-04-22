class Transaction < ActiveRecord::Base
  belongs_to :customer

  scope :disputed,   -> { where(paid: true, refunded: true) }
  scope :failed,     -> { where(paid: false) }
  scope :successful, -> { where(paid: true, refunded: false) }

  def dollars_amount
    amount / 100.0
  end

  def created_date
    Time.at(created).strftime("%m/%d/%Y at %I:%M%p")
  end
end
