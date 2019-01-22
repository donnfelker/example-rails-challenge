require 'spec_helper'

describe ::ChargesController do

  describe '#index' do
    before { visit charges_path }

    context 'page has all required lists' do
      it 'should three lists' do
        expect(page).to have_selector('table', count: 3)
      end

      it 'should have failed charges list' do
        expect(page).to have_css('table.table-failed')
      end

      it 'should have disputed charges list' do
        expect(page).to have_css('table.table-disputed')
      end

      it 'should have successful charges list' do
        expect(page).to have_css('table.table-disputed')
      end
    end

    context 'lists have valid rows count' do
      it 'should display 10 successful charges' do
        expect(page).to have_selector('tr.success', count: 10)
      end

      it 'should display 5 disputed charges' do
        expect(page).to have_selector('tr.warning', count: 5)
      end

      it 'should display 5 failed charges' do
        expect(page).to have_selector('tr.danger', count: 5)
      end
    end
  end
end
