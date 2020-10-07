class AllowAbcColumnsNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :quizzes, :a, null: true
    change_column_null :quizzes, :b, null: true
    change_column_null :quizzes, :c, null: true
  end
end
