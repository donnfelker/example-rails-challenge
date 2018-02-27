class CreditCardCharge < ActiveRecord::Base
  belongs_to :customer

  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
  scope :successfull, -> { where(paid: true, refunded: false) }
end
