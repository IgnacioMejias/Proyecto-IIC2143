class AddStateToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :state, :integer
  end
end
