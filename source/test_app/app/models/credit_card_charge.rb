class CreditCardCharge < ActiveRecord::Base
  belongs_to :customer
  scope :failed,     -> { where(paid: false, refunded: false) }
  scope :successful, -> { where(paid: true,  refunded: false) }
  scope :disputed,   -> { where(paid: true,  refunded: true) }
end
