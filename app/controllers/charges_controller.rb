class ChargesController < ApplicationController
  def index
    @successful_transaction = Transaction.successful
    @failed_transaction = Transaction.failed
    @disputed_transaction = Transaction.disputed
  end
end
