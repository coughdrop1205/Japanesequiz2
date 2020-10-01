class AddAudioColumnToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :audio, :text, null: true, after: :image_name
  end
end
