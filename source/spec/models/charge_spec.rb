require 'rails_helper'

RSpec.describe Charge, type: :model do

  let(:customer) { Customer.create(first_name: 'Jose', last_name: 'Corcuera') }
  let(:required_params) { {amount_in_cents: 100, customer: customer} }

  describe "required attributes" do

    let(:charge) { Charge.new(required_params) }

    it 'requires amount_in_cents' do
      charge.amount_in_cents = nil
      expect(charge.valid?).to be false
      expect(charge.errors[:amount_in_cents]).to be_present
    end

  end

  describe "successful charge" do

    let(:successful_charge) { Charge.successful.new(required_params) }

    it 'should be paid and not refunded' do
      expect(successful_charge.paid).to be true
      expect(successful_charge.refunded).to be false
    end

  end

  describe "failed charge" do

    let(:failed_charge) { Charge.failed.new(required_params) }

    it 'should not be paid and not refunded' do
      expect(failed_charge.paid).to be false
      expect(failed_charge.refunded).to be false
    end

  end

  describe "disputed charge" do

    let(:disputed_charge) { Charge.disputed.new(required_params) }

    it 'should be paid and refunded' do
      expect(disputed_charge.paid).to be true
      expect(disputed_charge.refunded).to be true
    end

  end

end
