require 'test_helper'

class TaskTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TaskType.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TaskType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TaskType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to task_type_url(assigns(:task_type))
  end
  
  def test_edit
    get :edit, :id => TaskType.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TaskType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TaskType.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TaskType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TaskType.first
    assert_redirected_to task_type_url(assigns(:task_type))
  end
  
  def test_destroy
    task_type = TaskType.first
    delete :destroy, :id => task_type
    assert_redirected_to task_types_url
    assert !TaskType.exists?(task_type.id)
  end
end
