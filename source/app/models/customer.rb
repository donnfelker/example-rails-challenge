class Customer < ActiveRecord::Base

  has_many :charges, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

end
