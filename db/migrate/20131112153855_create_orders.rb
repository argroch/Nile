class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :sub_total
      t.decimal :sales_tax
      t.decimal :grand_total
      t.integer :customer_id

      t.timestamps
    end
  end
end
