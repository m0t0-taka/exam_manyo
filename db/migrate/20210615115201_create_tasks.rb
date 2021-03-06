class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name, index:true, null: false
      t.text :details, null: false
      t.date :deadline, null: false
      t.timestamps
    end
  end
end
