class AllowImageNameNotNil < ActiveRecord::Migration[6.0]
  def change
    change_column_null :quizzes, :image_name, :text, null: true
  end
end
