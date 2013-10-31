class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :test_id
      t.integer :user_id
      t.string :grade_float

      t.timestamps
    end
  end
end
