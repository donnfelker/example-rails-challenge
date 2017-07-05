require 'rails_helper'

describe "credit_card_charges/index.html.erb", type: :feature do
	before do
		Rails.application.load_seed
		visit "/charges"
	end

	# Verify that there are three lists on the screen.

	it "displays successfull charges lists" do
		expect(page).to have_selector('table#successful')
	end

	it "displays failed charges lists" do
		expect(page).to have_selector('table#failed')
	end

	it "displays disputed charges lists" do
		expect(page).to have_selector('table#disputed')
	end

	it "Verify that in the Successful charges list there are 10 line items." do
		within('table#successful tbody') do
			expect(page).to have_xpath(".//tr", count: 10)
		end
	end

	it "Verify that in the failed charges list there are 5 line items." do
		within('table#failed tbody') do
			expect(page).to have_xpath(".//tr", count: 5)
		end
	end

	it "Verify that in the disputed charges list there are failed charges." do
		within('table#disputed tbody') do
			expect(page).to have_xpath(".//tr[id='failed']", count: 0)
		end
	end
end
