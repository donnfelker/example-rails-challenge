class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :customer, index: true, foreign_key: true
      t.integer :amount_in_cents
      t.boolean :paid
      t.boolean :refunded

      t.timestamps null: false
    end
    add_index :charges, :paid
    add_index :charges, :refunded
  end
end
