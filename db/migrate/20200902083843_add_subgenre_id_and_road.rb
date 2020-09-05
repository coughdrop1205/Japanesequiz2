class AddSubgenreIdAndRoad < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :subgenre_id, :int, null: false
    add_column :quizzes, :road, :int, null: false
  end
end
