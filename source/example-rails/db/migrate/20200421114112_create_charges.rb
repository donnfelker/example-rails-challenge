class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid, default: false
      t.integer :amount
      t.string :currency
      t.boolean :refunded, default: false
      t.references :customer

      t.timestamps
    end
  end
end
