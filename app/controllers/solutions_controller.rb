class SolutionsController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @solutions = @question.solutions.all
  end

  def show
    @question = Question.find(params[:question_id])
    @solution = @question.solutions.find(params[:id])
    binding.pry
  end

  def new
    @question = Question.find(params[:question_id])
    @solution = @question.solutions.new
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
      binding.pry
      if params[:answer] == correct_answer.to_s
        @solution.correct = true
        @solution.save

      end
      binding.pry
      redirect_to [@question, @solution]

    end
  end

  private
    def solution_params
      params.require(:solution).permit(:id, :question_id, :correct, :question_attributes => [ :content, :question_id ] )
    end

end
