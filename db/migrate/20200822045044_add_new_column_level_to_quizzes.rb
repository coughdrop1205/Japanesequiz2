class AddNewColumnLevelToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :level, :int, null: false
  end
end
