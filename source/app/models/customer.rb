class Customer < ActiveRecord::Base
  has_many :charges
end
