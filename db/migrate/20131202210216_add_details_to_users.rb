class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :experience, :integer
    add_column :users, :level, :integer
    add_column :users, :life, :integer
  end
end
