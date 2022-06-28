class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :DESC)
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
      flash[:success] = I18n.t('task.create_success')
      redirect_to root_url
    else
      flash[:danger] = I18n.t('task.create_failure')
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = I18n.t('task.update_success')
      redirect_to @task
    else
      flash[:danger] = I18n.t('task.update_failure')
      render 'edit'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = I18n.t('task.delete_success')
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :content)
  end
end
