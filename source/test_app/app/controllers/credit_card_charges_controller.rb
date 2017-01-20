class CreditCardChargesController < ApplicationController
  def index
    @credit_card_charges = CreditCardCharge.all
  end
end
