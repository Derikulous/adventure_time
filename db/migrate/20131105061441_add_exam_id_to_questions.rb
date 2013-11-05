class AddExamIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :exam_id, :integer
    remove_column :questions, :test_id, :integer
  end
end
