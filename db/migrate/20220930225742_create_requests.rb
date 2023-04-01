class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.date :request_date
      t.integer :days

      t.timestamps

      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
    end
  end
end