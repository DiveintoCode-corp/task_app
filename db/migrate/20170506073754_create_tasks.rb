class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.datetime :deadline
      t.integer :auther_id
      t.integer :charge_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
