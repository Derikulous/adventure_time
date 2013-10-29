class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :difficulty
      t.boolean :random

      t.timestamps
    end
  end
end
