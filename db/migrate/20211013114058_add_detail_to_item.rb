class AddDetailToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :delivered_by, :string
  end
end
