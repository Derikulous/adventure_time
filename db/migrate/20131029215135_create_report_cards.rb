class CreateReportCards < ActiveRecord::Migration
  def change
    create_table :report_cards do |t|
      t.integer :test_id
      t.integer :user_id
      t.float :grade
      t.string :name
      t.boolean :finished
      t.integer :current_question

      t.timestamps
    end
  end
end
