class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :vertical_id
      t.integer :assigned_user_id
      t.integer :creator_user_id
      t.integer :view_type_id
      t.integer :task_type_id
      t.integer :priority
      t.decimal :estimate
      t.string :title
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tasks
  end
end
