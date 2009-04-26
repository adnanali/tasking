class Task < ActiveRecord::Base
  belongs_to :task_type

  validates_presence_of :title, :description, :priority
end
