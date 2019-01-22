class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :created, null: false
      t.boolean :paid, default: false
      t.decimal :amount, null: false
      t.string :currency, null: false
      t.boolean :refunded, default: false
      t.integer :customer_id, index: true, null: false
    end
  end
end
