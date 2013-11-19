class CreateStorefront < ActiveRecord::Migration
  def change
    create_table :storefronts do |t|

      t.timestamps
    end
  end
end
