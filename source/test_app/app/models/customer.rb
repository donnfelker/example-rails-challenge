class Customer < ActiveRecord::Base
  has_many :credit_card_charges
end
