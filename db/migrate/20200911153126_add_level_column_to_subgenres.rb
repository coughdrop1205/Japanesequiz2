class AddLevelColumnToSubgenres < ActiveRecord::Migration[6.0]
  def change
    add_column :subgenres, :level, :int, null: false
  end
end
