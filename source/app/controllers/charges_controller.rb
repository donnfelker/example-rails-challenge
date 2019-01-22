class ChargesController < ApplicationController
  def index
    scope = Charge.includes(:customer)
    @disputed = scope.disputed
    @failed = scope.failed
    @successful = scope.successful
  end
end
