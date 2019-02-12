class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :amount_in_cents, presence: true
  validates :currency, presence: true
  validates :created, presence: true

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  def amount
    self.amount_in_cents.to_f / 100
  end
end
