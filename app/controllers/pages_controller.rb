class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def index
    @genre_a = Quiz.find_by(genre_id: "a")
    @genre_b = Quiz.find_by(genre_id: "b")
    @genre_c = Quiz.find_by(genre_id: "c")
    @genre_d = Quiz.find_by(genre_id: "d")
    @genre_e = Quiz.find_by(genre_id: "e")
    @genre_f = Quiz.find_by(genre_id: "f")
  end

  def show
    @stocks = Stock.where(user_id: current_user.id)
  end

  def answer
    @explanation = params[:explanation]
    @number = params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def grammar
    @quiz_1 = Quiz.find_by(level:1, theme: 1)
    @quiz_2 = Quiz.find_by(level:1, theme: 2)
    @quiz_3 = Quiz.find_by(level:1, theme: 3)
  end

  def modern
    @quiz_nature = Quiz.find_by(genre_id: "a", subgenre_id: 1, level: 1)
    @quiz_onoma = Quiz.find_by(genre_id: "a", subgenre_id:2, level: 2)
    @quiz_fam = Quiz.find_by(genre_id: "a", subgenre_id:4, level: 1)
    @quiz_date = Quiz.find_by(genre_id: "a", subgenre_id:6, level: 1)
    @quiz_count = Quiz.find_by(genre_id: "a", subgenre_id:7, level: 1)
  end
end