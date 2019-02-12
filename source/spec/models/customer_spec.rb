require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe "required attributes" do

    let(:customer) { Customer.new(first_name: 'Jose', last_name: 'Corcuera') }

    it 'requires first_name' do
      customer.first_name = nil
      expect(customer.valid?).to be false
      expect(customer.errors[:first_name]).to be_present
    end

    it 'requires last_name' do
      customer.last_name = nil
      expect(customer.valid?).to be false
      expect(customer.errors[:last_name]).to be_present
    end

  end

  describe "customer seed" do
    before do
      Rails.application.load_seed
    end

    it { expect(Customer.count).to be 4 }
  end

end
