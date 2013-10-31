class SolutionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @question = Question.find(params[:question_id])
    @solutions = @question.solutions.all
  end

  def show
    @question = Question.find(params[:question_id])
    @solution = @question.solutions.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @solution = @question.solutions.new

    unless current_user.try(:admin?)
      flash[:alert] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def create
    @question = Question.find(params[:question_id])
    @solution = @question.solutions.new(solution_params)
    if @solution.save
      correct_answer = 0
      count = 1
      @question.answers.each do |answer|
        if answer.correct
          correct_answer = count
        else
          count+=1
        end
      end
      if params[:answer] == correct_answer.to_s
        @solution.correct = true
        @solution.save
      end
      if @question.test.next_question(current_user) != nil
        redirect_to new_question_solution_path([@question.test.next_question(current_user)])
      else
        redirect_to root_path
      end
    end
  end

  private
  def solution_params
    params.require(:solution).permit(:id, :question_id, :correct, :user_id, :question_attributes => [ :content, :question_id ] )
  end
end
