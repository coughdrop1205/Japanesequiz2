class CreateSubgenres < ActiveRecord::Migration[6.0]
  def change
    create_table :subgenres do |t|
      t.integer :sub_id, null: false
      t.text :subgenre, null: true
      t.integer :third_id, null: false
      t.text :thirdgenre, null: true

      t.timestamps
    end
  end
end
