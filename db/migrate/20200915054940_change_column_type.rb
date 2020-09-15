class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :quizzes, :subgenre_id, :int, null: false
    change_column :quizzes, :thirdgenre_id, :int, null: false
    change_column :quizzes, :level, :int, null: false
    change_column :quizzes, :theme, :int, null: false
    change_column :quizzes, :road, :int, null: false
    change_column :subgenres, :level, :int, null: false
  end
end
