class TaskStatusesController < ApplicationController
  def index
    @task_statuses = TaskStatus.all
  end
  
  def show
    @task_status = TaskStatus.find(params[:id])
  end
  
  def new
    @task_status = TaskStatus.new
  end
  
  def create
    @task_status = TaskStatus.new(params[:task_status])
    if @task_status.save
      flash[:notice] = "Successfully created taskstatus."
      redirect_to @task_status
    else
      render :action => 'new'
    end
  end
  
  def edit
    @task_status = TaskStatus.find(params[:id])
  end
  
  def update
    @task_status = TaskStatus.find(params[:id])
    if @task_status.update_attributes(params[:task_status])
      flash[:notice] = "Successfully updated taskstatus."
      redirect_to @task_status
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @task_status = TaskStatus.find(params[:id])
    @task_status.destroy
    flash[:notice] = "Successfully destroyed taskstatus."
    redirect_to task_statuses_url
  end
end
