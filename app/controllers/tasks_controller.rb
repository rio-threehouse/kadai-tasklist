class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  before_action :corrent_user, only: [:update, :destroy]
  
  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end 
  end

  def destroy
    @task.destroy
    
    redirect_to root_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def corrent_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
