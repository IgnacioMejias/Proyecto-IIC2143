class AddQuantityToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :quantity, :integer
  end
end
