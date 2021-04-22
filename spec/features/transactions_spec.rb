require 'rails_helper'

RSpec.feature "Transactions" do
  before(:each) { load "#{Rails.root}/db/seeds.rb"}

  scenario 'Check index page for transactions' do
    visit charges_path

    expect(page).to have_content('Failed Charges')
    expect(page).to have_content('Disputed Charges')
    expect(page).to have_content('Successful Charges')

    expect(all('.failed').count).to eq(5)
    expect(all('.disputed').count).to eq(5)
    expect(all('.success').count).to eq(10)
  end
end