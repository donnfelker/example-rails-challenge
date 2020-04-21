# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'charges/index', type: :view do
  include RSpecHtmlMatchers

  let(:success_charges) do
    charges = []
    10.times { charges.push FactoryBot.create(:charge) }
    charges
  end
  let(:failed_charges) do
    charges = []
    5.times { charges.push FactoryBot.create(:charge) }
    charges
  end
  let(:disputed_charges) do
    charges = []
    5.times { charges.push FactoryBot.create(:charge) }
    charges
  end

  before :each do
    assign(:success_charges, success_charges)
    assign(:failed_charges, failed_charges)
    assign(:disputed_charges, disputed_charges)

    render
  end

  describe 'charges/index' do
    it 'displays 3 lists' do
      expect(rendered).to have_tag('ul', count: 3)
    end

    describe "success charges" do
      it "renders 10 items" do
        expect(rendered).to have_tag('ul.success-list') do
          with_tag('li', count: 10)
        end
      end
    end

    describe "failed charges" do
      it "renders 5 items" do
        expect(rendered).to have_tag('ul.failed-list') do
          with_tag('li', count: 5)
        end
      end
    end

    describe "disputed charges" do
      it "renders 5 items" do
        expect(rendered).to have_tag('ul.disputed-list') do
          with_tag('li', count: 5)
        end
      end
    end
  end
end
