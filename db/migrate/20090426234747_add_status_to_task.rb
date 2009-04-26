class AddStatusToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :task_status_id, :integer
  end

  def self.down
    remove_column :tasks, :task_status_id
  end
end
