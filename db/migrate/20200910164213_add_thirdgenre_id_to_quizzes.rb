class AddThirdgenreIdToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :thirdgenre_id, :int, null: false
  end
end
