class CreateTaskTypes < ActiveRecord::Migration
  def self.up
    create_table :task_types do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :task_types
  end
end
