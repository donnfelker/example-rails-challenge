require 'rails_helper'

RSpec.describe 'credit_card_charges/index', type: :view do
  before do
    assign(:failed, CreditCardCharge.failed)
    assign(:disputed, CreditCardCharge.disputed)
    assign(:successfull, CreditCardCharge.successfull)
  end

  it 'check 3 lists' do
    render

    expect(rendered).to match(/table id='failed'/)
    expect(rendered).to match(/table id='disputed'/)
    expect(rendered).to match(/table id='successfull'/)
  end
  
end
