require 'rails_helper'

RSpec.describe Charge, type: :model do
  describe ".disputed" do
    let!(:disputed_charge) { FactoryBot.create(:charge, refunded: true, paid: true) }
    let!(:success_charge) { FactoryBot.create(:charge, refunded: false, paid: true) }

    it "returns only disputed charges" do
      expect(Charge.disputed).to eq [disputed_charge]
    end
  end
end
