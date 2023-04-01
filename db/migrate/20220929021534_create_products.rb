class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :name
      t.float :review
      t.string :sport
      t.integer :price
      t.integer :stock
      t.float :size

      t.timestamps
    end
  end
end
