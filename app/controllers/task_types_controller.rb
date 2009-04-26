class TaskTypesController < ApplicationController
  def index
    @task_types = TaskType.all
  end
  
  def show
    @task_type = TaskType.find(params[:id])
  end
  
  def new
    @task_type = TaskType.new
  end
  
  def create
    @task_type = TaskType.new(params[:task_type])
    if @task_type.save
      flash[:notice] = "Successfully created tasktype."
      redirect_to @task_type
    else
      render :action => 'new'
    end
  end
  
  def edit
    @task_type = TaskType.find(params[:id])
  end
  
  def update
    @task_type = TaskType.find(params[:id])
    if @task_type.update_attributes(params[:task_type])
      flash[:notice] = "Successfully updated tasktype."
      redirect_to @task_type
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @task_type = TaskType.find(params[:id])
    @task_type.destroy
    flash[:notice] = "Successfully destroyed tasktype."
    redirect_to task_types_url
  end
end
