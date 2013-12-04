class AddLevelToExams < ActiveRecord::Migration
  def change
    add_column :exams, :level, :integer
    add_column :exams, :experience, :integer
  end
end
