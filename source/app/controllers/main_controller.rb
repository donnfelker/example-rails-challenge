class MainController < ApplicationController
  def index
    @failed_charges   = Charge.where(:paid => false)
    @dispute_charges  = Charge.where(:paid => true, :refunded => true)
    @success_charges  = Charge.where(:paid => true, :refunded => false)
  end
end
