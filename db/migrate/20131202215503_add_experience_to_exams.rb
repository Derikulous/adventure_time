class AddExperienceToExams < ActiveRecord::Migration
  def change
    add_column :exams, :experience, :integer
  end
end
