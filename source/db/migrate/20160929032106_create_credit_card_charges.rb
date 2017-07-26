class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.boolean :paid, null: false, default: false
      t.boolean :refunded, null: false, default: false
      t.integer :amount, null: false, default: 0
      t.integer :currency, null: false, default: 0
      t.references :customer, index: true

      t.timestamps null: false
    end
    add_index :credit_card_charges, :paid
    add_index :credit_card_charges, :refunded
  end
end
