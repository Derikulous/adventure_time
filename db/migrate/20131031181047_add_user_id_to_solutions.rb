class AddUserIdToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :user_id, :integer
  end
end
