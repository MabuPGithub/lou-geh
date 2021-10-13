class AddDetailsToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :quantity, :integer
    add_column :items, :cost, :decimal
  end
end
