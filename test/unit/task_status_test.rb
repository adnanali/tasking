require 'test_helper'

class TaskStatusTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TaskStatus.new.valid?
  end
end
