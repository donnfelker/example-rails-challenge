class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :created
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.integer :customer_id

      t.timestamps null: false
    end

    add_index :transactions, :customer_id
    add_index :transactions, :refunded
    add_index :transactions, :paid
  end
end
