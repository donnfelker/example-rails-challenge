class CreditCardCharge < ActiveRecord::Base
  enum currency: { usd: 0, eur: 1, rur: 2 }

  belongs_to :customer

  scope :failed, lambda { where paid: false }
  scope :disputed, lambda { where refunded: true }
  scope :successful, lambda { where paid: true, refunded: false }

  def self.currencies_for_select
    currencies.map { |c, _| c }
  end
end
