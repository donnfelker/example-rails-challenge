require 'rails_helper'

RSpec.describe 'credit_card_charges/index', type: :view do
  before(:each) do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    customer_3 = create(:customer)
    customer_4 = create(:customer)

    5.times { create(:credit_card_charge, paid: true, customer: customer_1) }
    3.times { create(:credit_card_charge, paid: true, customer: customer_2) }
    1.times { create(:credit_card_charge, paid: true, customer: customer_3) }
    1.times { create(:credit_card_charge, paid: true, customer: customer_4) }

    3.times { create(:credit_card_charge, customer: customer_3) }
    3.times { create(:credit_card_charge, customer: customer_4) }

    3.times { create(:credit_card_charge, paid: true, refunded: true, customer: customer_1) }
    2.times { create(:credit_card_charge, paid: true, refunded: true, customer: customer_2) }

    render
  end

  it 'displays Failed Charges' do
    expect(rendered).to match /Failed Charges/
  end

  it 'displays Disputed Charges' do
    expect(rendered).to match /Disputed Charges/
  end

  it 'displays Successful Charges' do
    expect(rendered).to match /Successful Charges/
  end

  it 'has 10 Successful Charges' do
    within('tbody.successful_charges') do
      expect(rendered).to have_selector('tr', count: 10)
    end
  end

  it 'has 5 Failed Charges' do
    within('tbody.failed_charges') do
      expect(rendered).to have_selector('tr', count: 5)
    end
  end

  it 'has 10 Disputed Charges' do
    within('tbody.disputed_charges') do
      expect(rendered).to have_selector('tr', count: 5)
    end
  end
end
