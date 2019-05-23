class AddDatesToCharges < ActiveRecord::Migration[5.2]
  def change
    add_column :charges, :disputed_at, :datetime
    add_column :charges, :failed_at, :datetime
  end
end
