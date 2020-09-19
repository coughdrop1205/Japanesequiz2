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
    @quiz1_1 = Quiz.find_by(level:1, theme: 1, road:1)
    @quiz1_2 = Quiz.find_by(level:1, theme: 2, road:1)
    @quiz1_3 = Quiz.find_by(level:1, theme: 3)
    @quiz2_1 = Quiz.find_by(level:2, theme: 1, road:1)
  end

  def modern
    @genre1 = Subgenre.where(sub_id: 1)
    @genre2 = Subgenre.where(sub_id: 2)
    @genre4 = Subgenre.where(sub_id: 4)
    @genre5 = Subgenre.where(sub_id: 5)
    @genre6 = Subgenre.where(sub_id: 6)
    @genre7_1 = Subgenre.where(sub_id: 7, third_id: 1)
    @genre7_2 = Subgenre.where(sub_id: 7, third_id: 2)
    @genre8 = Subgenre.where(sub_id: 8)
    @genre9 = Subgenre.where(sub_id: 9)
    @genre13 = Subgenre.where(sub_id: 13)
  end
end