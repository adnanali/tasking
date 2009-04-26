require 'test_helper'

class TaskStatusesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TaskStatus.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TaskStatus.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TaskStatus.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to task_status_url(assigns(:task_status))
  end
  
  def test_edit
    get :edit, :id => TaskStatus.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TaskStatus.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TaskStatus.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TaskStatus.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TaskStatus.first
    assert_redirected_to task_status_url(assigns(:task_status))
  end
  
  def test_destroy
    task_status = TaskStatus.first
    delete :destroy, :id => task_status
    assert_redirected_to task_statuses_url
    assert !TaskStatus.exists?(task_status.id)
  end
end
