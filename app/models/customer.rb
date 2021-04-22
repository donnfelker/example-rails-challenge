class Customer < ActiveRecord::Base
  has_many :transactions
end
