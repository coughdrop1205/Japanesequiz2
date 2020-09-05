class AddImageColumnToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :image_name, :text, null: false
  end
end
