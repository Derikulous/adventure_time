class ChangeLevelForUsers < ActiveRecord::Migration
  def change
    remove_column :users, :level, :integer
    add_column :users, :level, :integer, :default => 1
  end
end
