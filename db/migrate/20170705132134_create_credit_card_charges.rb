class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded, default: false
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
