class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.integer :user_id, null:false
      t.integer :quiz_id, null:false

      t.timestamps
    end
  end
end
