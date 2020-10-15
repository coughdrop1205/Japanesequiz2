class StocksController < ApplicationController
  def create
    @quiz = Quiz.find_by(id: params[:quiz_id])
    if user_signed_in?
      @stock = Stock.new(
        user_id: current_user.id,
        quiz_id: params[:quiz_id]
      )
      @stocks = Stock.where(user_id: current_user.id)
      
      #有料会員でストック数が200未満の時
      if Team.find_by(user_id: current_user.id).stripe_subscription_id.present? && @stocks.length < 200
        @stock.save
        if @quiz.road <= 0
          redirect_to("/quizes/#{@quiz.genre_id}/#{@quiz.subgenre_id}/#{@quiz.thirdgenre_id}/#{@quiz.level}/#{@quiz.id}")
        else
          redirect_to("/quizes/#{@quiz.level}/#{@quiz.theme}/#{@quiz.road}")
        end
      #有料会員でストック数が200以上の時
      elsif Team.find_by(user_id: current_user.id).stripe_subscription_id && @stocks.length >= 200
        if @quiz.road <= 0
          flash[:notice] = "Sorry, you cannot have more than 200 stocks!"
          redirect_to("/quizes/#{@quiz.genre_id}/#{@quiz.subgenre_id}/#{@quiz.thirdgenre_id}/#{@quiz.level}/#{@quiz.id}")
        else
          flash[:notice] = "Sorry, you cannot have more than 200 stocks!"
          redirect_to("/quizes/#{@quiz.level}/#{@quiz.theme}/#{@quiz.road}")
        end
      #無料会員でストック数が30未満の時
      elsif @stocks.length < 30
        @stock.save
        if @quiz.road <= 0
          redirect_to("/quizes/#{@quiz.genre_id}/#{@quiz.subgenre_id}/#{@quiz.thirdgenre_id}/#{@quiz.level}/#{@quiz.id}")
        else
          redirect_to("/quizes/#{@quiz.level}/#{@quiz.theme}/#{@quiz.road}")
        end
      #無料会員でストック数が30以上の時
      else
        if @quiz.road <= 0
          flash[:notice] = "Sorry, you cannot have more than 30 stocks! Please be a patron to stock more quizzes!!"
          redirect_to("/quizes/#{@quiz.genre_id}/#{@quiz.subgenre_id}/#{@quiz.thirdgenre_id}/#{@quiz.level}/#{@quiz.id}")
        else
          flash[:notice] = "Sorry, you cannot have more than 30 stocks! Please be a patron to stock more quizzes!!"
          redirect_to("/quizes/#{@quiz.level}/#{@quiz.theme}/#{@quiz.road}")
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
    if @quiz.road <= 0
      redirect_to("/quizes/#{@quiz.genre_id}/#{@quiz.subgenre_id}/#{@quiz.thirdgenre_id}/#{@quiz.level}/#{@quiz.id}")
    else
      redirect_to("/quizes/#{@quiz.level}/#{@quiz.theme}/#{@quiz.road}")
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
