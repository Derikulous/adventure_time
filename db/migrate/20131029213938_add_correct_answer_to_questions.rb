class AddCorrectAnswerToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_one, :string
    add_column :questions, :answer_two, :string
    add_column :questions, :answer_three, :string
    add_column :questions, :answer_four, :string
    add_column :questions, :answer_five, :string
    add_column :questions, :correct_answer, :integer
    remove_column :questions, :answer, :string
  end
end
