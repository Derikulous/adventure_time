class SolutionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :load_question

  def index
    @solutions = @question.solutions.all
  end

  def show
    @solution = @question.solutions.find(params[:id])
  end

  def new
    # if current_user.life == 0
    #   redirect_to root_path
    #   flash[:danger] = "GAME OVER"
    # end
    @solution = @question.solutions.new
  end

  def edit
  end

  def update
  end

  def create
    @solution = @question.solutions.new(solution_params)

    if @solution.save
      if @solution.check_answer(params[:answer])
        flash[:notice] = "Oh, that's unexpected. That's the correct answer."
      else
        flash[:danger] = "Try again, sucker! Mwahaha!"
        @solution.user.life -= 1
        @solution.user.save
      end
      if @question.exam.next_question(current_user)
        redirect_to new_question_solution_path([@question.exam.next_question(current_user)])
      else
        @solution.user.experience += @solution.question.exam.generate_experience(current_user)
        @solution.user.save
        render 'win'
      end
    end
  end

  private
  def solution_params
    params.require(:solution).permit(:id, :question_id, :correct, :user_id, :question_attributes => [ :content, :question_id ] )
  end

  def load_question
    @question = Question.find(params[:question_id])
  end
end
