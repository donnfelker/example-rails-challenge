require 'spec_helper'

describe 'credit_card_charges/index.haml', type: :feature do
  before do
    visit '/'
  end

  it 'displays 3 charge lists' do
    expect(page).to have_css('.list', count: 3)
  end

  it 'displays all successful charges' do
    successful_charges_count = CreditCardCharge.successful.size
    expect(page).to have_css(
      '.successful-charges .charge-item',
      count: successful_charges_count
    )
  end
end