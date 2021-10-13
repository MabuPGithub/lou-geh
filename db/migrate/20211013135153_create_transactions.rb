class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :product_description
      t.integer :quantity
      t.decimal :cost
      t.string :customer_name

      t.timestamps
    end
  end
end
