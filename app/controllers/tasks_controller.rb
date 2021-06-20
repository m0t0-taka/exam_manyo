class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    #@tasks = Task.all.order(created_at: :desc)
    if params[:sort_expired]
      @tasks = Task.all.order(deadline: :asc)
    else
      @tasks = Task.all.order(created_at: :desc)
    end
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path, notice: "Taskを作成しました"
      else
        render :new
      end
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Taskを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"Taskを削除しました"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name, :details, :deadline)
  end
end
