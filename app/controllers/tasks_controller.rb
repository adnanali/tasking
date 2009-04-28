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
      respond_to do |respond|
        respond.html do 
          flash[:notice] = "Successfully updated task."
          redirect_to @task
        end
        respond.js do
          resp = {}
          params[:task].each do |i|
            name = i[0]
            value = @task[i[0]]
            if name == 'task_type_id'
              value = @task.task_type.name
            elsif name == 'task_status_id'
              value = @task.task_status.name
            elsif name == 'description'
              value = help.textilize(@task.description)
            end
            resp["task[#{name}]"] = value
          end
          render :json => {:result => true, :response =>  resp}
        end
      end
    else
      respond_to do |respond|
        respond.html do 
          render :action => 'edit'
        end
        respond.js do 
          render :json => {:result => false, :response =>  ""}
        end
      end
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
