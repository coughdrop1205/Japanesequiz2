class ChangeGenreIdToText < ActiveRecord::Migration[6.0]
  def change
    change_column :quizzes, :genre_id, :text
  end
end
