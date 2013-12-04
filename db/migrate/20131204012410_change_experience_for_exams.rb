class ChangeExperienceForExams < ActiveRecord::Migration
  def change
    remove_column :exams, :experience, :integer
    add_column :exams, :experience, :integer
  end
end
