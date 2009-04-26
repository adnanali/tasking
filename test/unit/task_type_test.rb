require 'test_helper'

class TaskTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TaskType.new.valid?
  end
end
