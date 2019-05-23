require 'rails_helper'

RSpec.describe 'charges', type: :feature do
  let(:customer) { create :customer }

  before do
    @failed_charges = create_list(:charge, 5, :failed, customer: customer)
    @successful_charges = create_list(:charge, 10, :successful, customer: customer)
    @disputed_charges = create_list(:charge, 5, :disputed, customer: customer)
    visit charges_path
  end

  it 'displays lists' do
    expect(page).to have_selector('ul', count: 3)
    expect(page).to have_selector('ul', id: 'disputed-charges')
    expect(page).to have_selector('ul', id: 'successful-charges')
    expect(page).to have_selector('ul', id: 'failed-charges')
  end

  it 'displays failed charges' do
    expect(page).to have_selector('ul#failed-charges li', count: 5)
  end

  it 'displays disputed charges' do
    expect(page).to have_selector('ul#disputed-charges li', count: 5)
  end

  it 'displays successful charges' do
    expect(page).to have_selector('ul#successful-charges li', count: 10)
  end
end
