class AddColumnToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :content, :text, null: false
    add_column :quizzes, :a, :text, null: false
    add_column :quizzes, :b, :text, null: false
    add_column :quizzes, :c, :text, null: false
    add_column :quizzes, :correct_answer, :text, null: false
    add_column :quizzes, :explanation, :text, null: false
    add_column :quizzes, :genre_id, :int, null: false
  end
end
