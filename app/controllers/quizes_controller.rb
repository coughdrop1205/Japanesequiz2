class QuizesController < ApplicationController
  def show
    @quizes = Quiz.where(genre_id: params[:genre_id]).where(subgenre_id: params[:subgenre_id]).where(thirdgenre_id: params[:thirdgenre_id]).where(level: params[:level])
    @quiz = Quiz.find_by(genre_id: params[:genre_id], subgenre_id: params[:subgenre_id], thirdgenre_id: params[:thirdgenre_id], level: params[:level], id: params[:id])
    #if @quiz.blank?
      #redirect_to "/quizes/#{params[:genre_id]}/#{params[:subgenre_id]}/#{params[:thirdgenre_id]}/#{params[:level]}/#{next_id}"
    #end
    #@quizes_array = @quizes.ids
    #@quiz_number = @quizes_array.index{|num| num == params[:id].to_i}.to_i+1
    #@last_quiz = @quizes.last
  end

  def road
    @quizes = Quiz.where(level: params[:level]).where(theme: params[:theme])
    @quiz = Quiz.find_by(level: params[:level], theme: params[:theme], road: params[:road])
    #if @quiz.blank?
      #redirect_to "/quizes/#{params[:level]}/#{params[:theme]}/#{next_id}"
    #end
    #@quizes_array = Array.new
    #@quizes.each do |num|
      #@quizes_array.push(num.road.to_i)
    #end
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(content: params[:content], a: params[:answer_a], b: params[:answer_b], c: params[:answer_c], correct_answer: params[:correct_answer], explanation: params[:explanation], genre_id: params[:genre_id], subgenre_id: params[:subgenre_id], road: params[:road], level: params[:level])
    if params[:image_name]
      @quiz.image_name = "#{@quiz.id}.png"
      image = params[:image_name]
      File.binwrite("public/quizes_image/#{@quiz.image_name}", image.read)
    end
    if @quiz.save
      redirect_to("/")
      flash[:notice] = "Success posting!!"
    else
      render("quizes/new")
    end
  end

  def edit
    @quiz = Quiz.find_by(id: params[:id])
  end

  def update
    @quiz = Quiz.find_by(id: params[:id])
    @quiz.content = params[:content]
    if params[:image_name]
      @quiz.image_name = "#{@quiz.id}.png"
      image = params[:image_name]
      File.binwrite("public/quizes_image/#{@quiz.image_name}", image.read)
    end
    @quiz.a = params[:answer_a]
    @quiz.b = params[:answer_b]
    @quiz.c = params[:answer_c]
    @quiz.correct_answer = params[:correct_answer]
    @quiz.explanation = params[:explanation]
    @quiz.genre_id = params[:genre_id]
    @quiz.subgenre_id = params[:subgenre_id]
    @quiz.road = params[:road]
    @quiz.level = params[:level]
    if @quiz.save
      flash[:notice] = "Success editing!!"
      redirect_to("/")
    else
      render("quizes/edit")
    end
  end

  def destroy
    @quiz = Quiz.find_by(id: params[:id])
    @quiz.destroy
    flash[:notice] = "Success deleting!!"
    redirect_to("/")
  end

  def answer
    @quiz = Quiz.find_by(id: params[:id])
    @chosen_answer = params[:a]
    @correct = 0
    if @quiz.correct_answer != @chosen_answer
       @correct = 1
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end