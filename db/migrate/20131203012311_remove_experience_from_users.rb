class RemoveExperienceFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :experience, :integer
    remove_column :users, :life, :integer
    add_column :users, :experience, :integer, :default => 0
    add_column :users, :life, :integer, :default => 4
  end
end
