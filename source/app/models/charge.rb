class Charge < ActiveRecord::Base
  belongs_to :customer, dependent: :destroy

  validates :amount_in_cents, presence: true

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
end
