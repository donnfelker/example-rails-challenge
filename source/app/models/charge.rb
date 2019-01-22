class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :disputed, -> { where(paid: true, refunded: true) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :successful, -> { where(paid: true, refunded: false) }

  DEFAULT_CURRENCY = 'usd'
end
