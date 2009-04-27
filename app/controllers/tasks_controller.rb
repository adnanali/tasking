class TasksController < ApplicationController
  before_filter :task_extras

  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params[:task])
    @task.task_status_id = TaskStatus.find(:first, :conditions => {:bname => 'open'}).id
    if @task.save
      flash[:notice] = "Successfully created task."
      redirect_to tasks_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Successfully updated task."
      redirect_to @task
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Successfully destroyed task."
    redirect_to tasks_url
  end

  protected
    def task_extras
      @task_types = TaskType.find(:all).map{ |t| [t.name, t.id] }
      @task_statuses = TaskStatus.find(:all).map{ |t| [t.name, t.id] }
    end
end