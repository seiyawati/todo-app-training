class TasksController < ApplicationController
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
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = t('create_task_success')
      redirect_to root_url
    else
      flash[:danger] = t('create_task_failure')
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = t('update_task_success')
      redirect_to @task
    else
      flash[:danger] = t('update_task_failure')
      render 'edit'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = t('delete_task_success')
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :content)
  end
end
