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
    if current_user.life <= 0
      render 'gameover'
    end
    @progress = @question.exam.generate_progress(current_user)
    @solution = @question.solutions.new
  end

  def edit
  end

  def update
  end

  def create
    @solution = @question.solutions.new(solution_params)

    if @solution.save
      if current_user.life > 0
        if @solution.check_answer(params[:answer])
          flash[:notice] = "Oh, that's unexpected. You're correct."
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
          generate_victory_message
          if @solution.user.update_level
            flash[:notice] = "You have gained a level"
            @level = "Level Gained! You are now level: " + @solution.user.level.to_s
          end
          render 'win'
        end
      else
        render 'gameover'
      end
    end
  end

  private
  def solution_params
    params.require(:solution).permit(:id, :question_id, :correct, :user_id,
      :question_attributes => [ :content, :question_id ] )
  end

  def load_question
    @question = Question.find(params[:question_id])
  end

  def generate_victory_message
    @score = @solution.question.exam.generate_score(current_user)
    @experience = @solution.question.exam.generate_experience(current_user)
    if @score == 100
      @victory = 'Perfect Victory!'
    elsif @score > 80
      @victory = 'Good Victory!'
    elsif @score == 0
      @victory = 'Barely Made It!'
    else
      @victory = 'Close Victory!'
    end
  end
end
