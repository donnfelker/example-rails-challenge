require 'rails_helper'

RSpec.describe CreditCardCharge, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'checks 10 successfull lines' do
    CreditCardCharge.successfull.count.should eql 10
  end

  it 'checks 5 failed lines' do
    CreditCardCharge.failed.count.should eql 5
  end

  it 'checks failed count eql disputed' do
    CreditCardCharge.failed.count.should eql CreditCardCharge.disputed.count
  end
end
