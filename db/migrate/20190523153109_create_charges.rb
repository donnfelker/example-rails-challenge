class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false
      t.integer :amount
      t.string :currency, default: 'usd'
      t.boolean :refunded, default: false
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
