class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'タスクを追加しました。'
      redirect_to root_url
    else
      flash[:danger] = 'タスクの追加に失敗しました。'
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = 'タスクが更新されました。'
      redirect_to @task
    else
      render 'edit'
    end
  end

  private

    def task_params
      params.require(:task).permit(:name, :content)
    end
end
