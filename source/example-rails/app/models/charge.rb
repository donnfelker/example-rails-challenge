class Charge < ApplicationRecord
  belongs_to :customer

  before_save :set_created

  scope :success, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  def format_created
    Time.at(created).strftime("%Y-%m-%d")
  end

  private

  def set_created
    self.created = DateTime.current.to_i
  end
end
