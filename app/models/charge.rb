class Charge < ApplicationRecord
  belongs_to :customer

  scope :successful, ->{ where(paid: true) }
  scope :failed, ->{ where.not(failed_at: nil) }
  scope :disputed, ->{ where.not(disputed_at: nil) }
end
