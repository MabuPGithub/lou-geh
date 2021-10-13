class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :product_description

      t.timestamps
    end
  end
end
