class Customer < ActiveRecord::Base

  has_many :charges, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  def fullname
    "#{first_name} #{last_name}"
  end

end
