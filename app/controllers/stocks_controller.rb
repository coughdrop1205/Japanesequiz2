class StocksController < ApplicationController
  def create
    @quiz = Quiz.find_by(id: params[:quiz_id])
    if user_signed_in?
      @stock = Stock.new(
        user_id: current_user.id,
        quiz_id: params[:quiz_id]
      )
      @stocks = Stock.where(user_id: current_user.id)
      if @stocks.length < 30
        @stock.save
        if @quiz.road = 0
          redirect_to("/quizes/#{@quiz.genre_id}/#{@quiz.subgenre_id}/#{@quiz.level}/#{@quiz.id}")
        else
          redirect_to("/quizes/#{@quiz.level}/#{@quiz.road}")
        end
      else
        if @quiz.road = 0
          flash[:notice] = "Sorry, you cannot have more than 30 favorites!"
          redirect_to("/quizes/#{@quiz.genre_id}/#{@quiz.subgenre_id}/#{@quiz.level}/#{@quiz.id}")
        else
          flash[:notice] = "Sorry, you cannot have more than 30 favorites!"
          redirect_to("/quizes/#{@quiz.level}/#{@quiz.road}")
        end
      end
    else
      flash[:notice] = "Please log in to stock the quiz"
      redirect_to("/users/sign_in")
    end  
  end

  def destroy
    @quiz = Quiz.find_by(id: params[:quiz_id])
    @stock = Stock.find_by(
      user_id: current_user.id,
      quiz_id: params[:quiz_id]
    )
    @stock.destroy
    if @quiz.road = 0
      redirect_to("/quizes/#{@quiz.genre_id}/#{@quiz.subgenre_id}/#{@quiz.level}/#{@quiz.id}")
    else
      redirect_to("/quizes/#{@quiz.level}/#{@quiz.road}")
    end
  end

  def destroy2
    @quiz = Quiz.find_by(id: params[:quiz_id])
    @stock = Stock.find_by(
      user_id: current_user.id,
      quiz_id: params[:quiz_id]
    )
    @stock.destroy
    redirect_to("/pages/show")
  end
end
