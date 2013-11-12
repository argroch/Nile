class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :unit_price
      t.text :description
      t.integer :quantity
      t.string :sku
      t.string :brand
      t.string :model_num

      t.timestamps
    end
  end
end
