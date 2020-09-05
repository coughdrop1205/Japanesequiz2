class AddColumnTheme < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :theme, :int, null: false
  end
end
