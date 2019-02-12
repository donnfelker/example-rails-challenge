class AddCurrencyAndCreatedToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :currency, :string
    add_column :charges, :created, :datetime
  end
end
