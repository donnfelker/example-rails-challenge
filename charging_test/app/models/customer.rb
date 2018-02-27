class Customer < ActiveRecord::Base
  has_many :charges, class_name: 'CreditCardCharge'

  def full_name
    [first_name, last_name].join(' ')
  end
end
