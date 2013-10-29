class AddTopicToTests < ActiveRecord::Migration
  def change
    add_column :tests, :topic, :string
    remove_column :tests, :type, :string
  end
end
