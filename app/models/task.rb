class Task < ActiveRecord::Base
  belongs_to :task_type
  belongs_to :task_status

  validates_presence_of :title, :description, :priority
end
