require 'rails_helper'

RSpec.describe "charges/index.html.erb", type: :view do

  before do
    Rails.application.load_seed
    assign(:successful_charges, Charge.successful)
    assign(:failed_charges, Charge.failed)
    assign(:disputed_charges, Charge.disputed)
    render
  end

  it 'should list 10 successful charges' do
    expect(rendered).to have_css('.successful.charges tbody tr', count: 10)
  end

  it 'should list 5 failed charges' do
    expect(rendered).to have_css('.failed.charges tbody tr', count: 5)
  end

  it 'should list 5 disputed charges' do
    expect(rendered).to have_css('.disputed.charges tbody tr', count: 5)
  end

end
